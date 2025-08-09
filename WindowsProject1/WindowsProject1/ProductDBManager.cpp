#include "ProductDBManager.h"
#include <algorithm>
#include <cstring>
#include <cstdlib>
#include <sstream>

// Helper function to parse movement records
Product::InventoryMovement Product::ParseMovementRecord(const std::vector<std::string>&record) {
    InventoryMovement mov;
    if (record.size() >= 6) {
        mov.date = record[0];
        mov.productId = record[1];
        mov.quantity = std::stoi(record[2]);
        mov.unitCost = std::stod(record[3]);
        mov.type = record[4];
        mov.reference = record[5];
    }
    return mov;
}

bool Product::UpdateProductStock(const std::string& productId, int quantityChange) {
    ProductFields product;
    if (!GetProduct(productId, product)) return false;

    product.stock += quantityChange;
    return EditProduct(productId, product);
}

Product::Product() {
    // Initialize product fields
    productFields = {
        {"ID",       'C', 0, 10, 0},  // Character field, length 10
        {"NAME",     'C', 0, 30, 0},  // Character field, length 30
        {"COST",     'N', 0, 12, 2},  // Numeric field, length 12, 2 decimals
        {"PRICE",    'N', 0, 12, 2},  // Numeric field, length 12, 2 decimals
        {"STOCK",    'N', 0, 8, 0},   // Numeric field, length 8, 0 decimals
        {"SUPPLIER", 'C', 0, 30, 0}   // Character field, length 30
    };

    // Initialize movement fields
    movementFields = {
        {"DATE",      'D', 0, 8, 0},    // Date field (YYYYMMDD)
        {"PRODUCTID", 'C', 0, 10, 0},   // Reference to product
        {"QUANTITY",  'N', 0, 8, 0},    // Positive/Negative
        {"UNITCOST",  'N', 0, 12, 2},   // Cost at time of transaction
        {"TYPE",      'C', 0, 10, 0},   // Movement type
        {"REFERENCE", 'C', 0, 20, 0}    // Reference number
    };
}

bool Product::CreateNewDB() {
    if (!productsDB.CreateNew(PRODUCTS_DB, productFields)) {
        return false;
    }
    if (!movementsDB.CreateNew(MOVEMENTS_DB, movementFields)) {
        return false;
    }
    return productsDB.Open(PRODUCTS_DB) && movementsDB.Open(MOVEMENTS_DB);
}

bool Product::AddProduct(const ProductFields& product) {
    if (!productsDB.Open(PRODUCTS_DB) && !CreateNewDB()) {
        return false;
    }

    std::vector<std::string> record = {
        product.id,
        product.name,
        std::to_string(product.cost),
        std::to_string(product.price),
        std::to_string(product.stock),
        product.supplier
    };

    return productsDB.AddRecord(record);
}

bool Product::DeleteProduct(const std::string& id) {
    if (!productsDB.Open(PRODUCTS_DB)) {
        return false;
    }
    return productsDB.DeleteRecordByTextKey(id);
}

bool Product::EditProduct(const std::string& id, const ProductFields& updatedFields) {
    if (!DeleteProduct(id)) {
        return false;
    }
    return AddProduct(updatedFields);
}

bool Product::DeleteDB() {
    bool success = true;
    if (productsDB.isOpen()) productsDB.close();
    if (movementsDB.isOpen()) movementsDB.close();

    if (remove(PRODUCTS_DB.c_str()) != 0) success = false;
    if (remove(MOVEMENTS_DB.c_str()) != 0) success = false;

    return success;
}

bool Product::GetProduct(const std::string& id, ProductFields& out) {
    if (!productsDB.Open(PRODUCTS_DB)) {
        return false;
    }

    std::vector<std::string> record;
    if (!productsDB.GetByTextKey(id, record) || record.size() != 6) {
        return false;
    }

    out.id = record[0];
    out.name = record[1];
    out.cost = std::stod(record[2]);
    out.price = std::stod(record[3]);
    out.stock = std::stoi(record[4]);
    out.supplier = record[5];

    return true;
}

bool Product::PackDatabase() {
    return productsDB.Pack() && movementsDB.Pack();
}

bool Product::RecordMovement(const InventoryMovement& movement) {
    if (!movementsDB.Open(MOVEMENTS_DB) && !CreateNewDB()) {
        return false;
    }

    std::vector<std::string> record = {
        movement.date,
        movement.productId,
        std::to_string(movement.quantity),
        std::to_string(movement.unitCost),
        movement.type,
        movement.reference
    };

    return movementsDB.AddRecord(record);
}

bool Product::RecordPurchase(const std::string& productId, const std::string& date,
    int quantity, double unitCost, const std::string& reference) {
    InventoryMovement movement;
    movement.date = date;
    movement.productId = productId;
    movement.quantity = quantity;
    movement.unitCost = unitCost;
    movement.type = "PURCHASE";
    movement.reference = reference;

    if (!RecordMovement(movement)) return false;

    // Update product stock
    ProductFields product;
    if (!GetProduct(productId, product)) return false;

    product.stock += quantity;
    return EditProduct(productId, product);
}

bool Product::RecordSale(const std::string& productId, const std::string& date,
    int quantity, const std::string& reference) {
    ProductFields product;
    if (!GetProduct(productId, product) || product.stock < quantity) {
        return false;
    }

    InventoryMovement movement;
    movement.date = date;
    movement.productId = productId;
    movement.quantity = -quantity;
    movement.unitCost = product.cost;
    movement.type = "SALE";
    movement.reference = reference;

    if (!RecordMovement(movement)) return false;

    product.stock -= quantity;
    return EditProduct(productId, product);
}

double Product::CalculateCOGS_FIFO(const std::string& productId,
    const std::string& startDate,
    const std::string& endDate) {
    if (!movementsDB.Open(MOVEMENTS_DB)) return -1;

    // Get all movement records
    std::vector<std::vector<std::string>> allRecords;
    if (!movementsDB.GetAllRecords(allRecords)) return -1;

    // Parse and filter relevant movements
    std::vector<InventoryMovement> movements;
    for (const auto& record : allRecords) {
        InventoryMovement mov = ParseMovementRecord(record);
        if (mov.productId == productId &&
            mov.date >= startDate &&
            mov.date <= endDate) {
            movements.push_back(mov);
        }
    }

    // Sort by date (FIFO)
    std::sort(movements.begin(), movements.end(),
        [](const InventoryMovement& a, const InventoryMovement& b) {
            return a.date < b.date;
        });

    // Create a separate list of available purchases
    std::vector<std::pair<double, int>> availablePurchases; // <unitCost, quantity>
    for (const auto& mov : movements) {
        if (mov.type == "PURCHASE") {
            availablePurchases.emplace_back(mov.unitCost, mov.quantity);
        }
    }

    double cogs = 0;
    size_t currentPurchase = 0;

    for (const auto& mov : movements) {
        if (mov.type == "SALE") {
            int remaining = abs(mov.quantity);

            // Consume from available purchases in FIFO order
            while (remaining > 0 && currentPurchase < availablePurchases.size()) {
                int available = availablePurchases[currentPurchase].second;
                int used = (remaining < available) ? remaining : available;

                cogs += used * availablePurchases[currentPurchase].first;
                remaining -= used;
                availablePurchases[currentPurchase].second -= used;

                if (availablePurchases[currentPurchase].second == 0) {
                    currentPurchase++;
                }
            }
        }
    }
    return cogs;
}

// Modified CalculateCOGS_Average to work with DB records
double Product::CalculateCOGS_Average(const std::string& productId,
    const std::string& startDate,
    const std::string& endDate) {
    if (!movementsDB.Open(MOVEMENTS_DB)) return -1;

    // Get all movement records
    std::vector<std::vector<std::string>> allRecords;
    if (!movementsDB.GetAllRecords(allRecords)) return -1;

    double totalCost = 0;
    int totalUnits = 0;
    int soldUnits = 0;

    for (const auto& record : allRecords) {
        InventoryMovement mov = ParseMovementRecord(record);
        if (mov.productId == productId &&
            mov.date >= startDate &&
            mov.date <= endDate) {

            if (mov.type == "PURCHASE") {
                totalCost += mov.quantity * mov.unitCost;
                totalUnits += mov.quantity;
            }
            else if (mov.type == "SALE") {
                soldUnits += abs(mov.quantity);
            }
        }
    }

    if (totalUnits == 0) return 0;
    return soldUnits * (totalCost / totalUnits);
}