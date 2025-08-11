#include "ProductDBManager.h"
#include <algorithm>
#include <cstring>
#include <cstdlib>
#include <sstream>

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
    if (!BeginTransaction()) return false;

    try {
        ProductFields product;
        if (!GetProduct(productId, product)) {
            RollbackTransaction();
            return false;
        }

        product.stock += quantityChange;

        std::map<std::string, std::string> update = {
            {"STOCK", std::to_string(product.stock)}
        };

        if (!UpdateRecord("ID", productId, update)) {
            RollbackTransaction();
            return false;
        }

        if (!CommitTransaction()) {
            RollbackTransaction();
            return false;
        }

        return true;
    }
    catch (...) {
        RollbackTransaction();
        return false;
    }
}

Product::Product() : DBFTableManager("products.dbf"), movementsDB("inventory_movements.dbf") {

    fieldDescriptors = {
        {"ID",        'C', 0, 10, 0},
        {"NAME",      'C', 0, 30, 0},
        {"COST",      'N', 0, 12, 2},
        {"PRICE",     'N', 0, 12, 2},
        {"STOCK",     'N', 0, 8, 0},
        {"SUPPLIERID",'C', 0, 10, 0}
    };

    movementFields = {
        {"DATE",      'D', 0, 8, 0},
        {"PRODUCTID", 'C', 0, 10, 0},
        {"QUANTITY",  'N', 0, 8, 0},
        {"UNITCOST",  'N', 0, 12, 2},
        {"TYPE",      'C', 0, 10, 0},
        {"REFERENCE", 'C', 0, 20, 0}
    };
}

bool Product::AddProduct(const ProductFields& product) {
    std::map<std::string, std::string> record = {
        {"ID", product.id},
        {"NAME", product.name},
        {"COST", std::to_string(product.cost)},
        {"PRICE", std::to_string(product.price)},
        {"STOCK", std::to_string(product.stock)},
        {"SUPPLIERID", product.supplierId}
    };
    return AddRecord(record);
}

bool Product::DeleteProduct(const std::string& id) {
    return DeleteRecord("ID", id);
}

bool Product::UpdateProduct(const std::string& id, const ProductFields& updates) {
    std::map<std::string, std::string> recordUpdates = {
        {"NAME", updates.name},
        {"COST", std::to_string(updates.cost)},
        {"PRICE", std::to_string(updates.price)},
        {"STOCK", std::to_string(updates.stock)},
        {"SUPPLIERID", updates.supplierId}
    };
    return UpdateRecord("ID", id, recordUpdates);
}

bool Product::RecordMovement(const InventoryMovement& movement) {
    std::map<std::string, std::string> record = {
        {"DATE", movement.date},
        {"PRODUCTID", movement.productId},
        {"QUANTITY", std::to_string(movement.quantity)},
        {"UNITCOST", std::to_string(movement.unitCost)},
        {"TYPE", movement.type},
        {"REFERENCE", movement.reference}
    };
    return movementsDB.AddRecord(record);
}

bool Product::RecordPurchase(const std::string& productId,
    const std::string& date,
    int quantity,
    double unitCost,
    const std::string& reference) {
    if (!BeginTransaction() || !movementsDB.BeginTransaction()) {
        return false;
    }

    try {
        InventoryMovement movement;
        movement.date = date;
        movement.productId = productId;
        movement.quantity = quantity;
        movement.unitCost = unitCost;
        movement.type = "PURCHASE";
        movement.reference = reference;

        if (!RecordMovement(movement)) {
            RollbackTransaction();
            movementsDB.RollbackTransaction();
            return false;
        }

        if (!UpdateProductStock(productId, quantity)) {
            RollbackTransaction();
            movementsDB.RollbackTransaction();
            return false;
        }

        if (!CommitTransaction() || !movementsDB.CommitTransaction()) {
            RollbackTransaction();
            movementsDB.RollbackTransaction();
            return false;
        }

        return true;
    }
    catch (...) {
        RollbackTransaction();
        movementsDB.RollbackTransaction();
        return false;
    }
}


bool Product::RecordSale(const std::string& productId,
    const std::string& date,
    int quantity,
    const std::string& reference) {
    if (!BeginTransaction() || !movementsDB.BeginTransaction()) {
        return false;
    }

    try {
        ProductFields product;
        if (!GetProduct(productId, product) || product.stock < quantity) {
            RollbackTransaction();
            movementsDB.RollbackTransaction();
            return false;
        }

        InventoryMovement movement;
        movement.date = date;
        movement.productId = productId;
        movement.quantity = -quantity;
        movement.unitCost = product.cost;
        movement.type = "SALE";
        movement.reference = reference;

        if (!RecordMovement(movement)) {
            RollbackTransaction();
            movementsDB.RollbackTransaction();
            return false;
        }

        if (!UpdateProductStock(productId, -quantity)) {
            RollbackTransaction();
            movementsDB.RollbackTransaction();
            return false;
        }

        if (!CommitTransaction() || !movementsDB.CommitTransaction()) {
            RollbackTransaction();
            movementsDB.RollbackTransaction();
            return false;
        }

        return true;
    }
    catch (...) {
        RollbackTransaction();
        movementsDB.RollbackTransaction();
        return false;
    }
}

double Product::CalculateCOGS_FIFO(const std::string& productId,
    const std::string& startDate,
    const std::string& endDate) {
    std::vector<std::map<std::string, std::string>> records;
    if (!movementsDB.GetAllRecords(records)) return -1;

    std::vector<InventoryMovement> movements;
    for (const auto& record : records) {
        InventoryMovement mov = {
            record.at("DATE"),
            record.at("PRODUCTID"),
            std::stoi(record.at("QUANTITY")),
            std::stod(record.at("UNITCOST")),
            record.at("TYPE"),
            record.at("REFERENCE")
        };

        if (mov.productId == productId &&
            mov.date >= startDate &&
            mov.date <= endDate) {
            movements.push_back(mov);
        }
    }

    //Sort by date (FIFO)
    std::sort(movements.begin(), movements.end(),
        [](const InventoryMovement& a, const InventoryMovement& b) {
            return a.date < b.date;
        });

    //Create a separate list of available purchases
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

double Product::CalculateCOGS_Average(const std::string& productId,
    const std::string& startDate,
    const std::string& endDate) {
    std::vector<std::map<std::string, std::string>> records;
    if (!movementsDB.GetAllRecords(records)) return -1;

    double totalCost = 0;
    int totalUnits = 0;
    int soldUnits = 0;

    for (const auto& record : records) {
        InventoryMovement mov = {
            record.at("DATE"),
            record.at("PRODUCTID"),
            std::stoi(record.at("QUANTITY")),
            std::stod(record.at("UNITCOST")),
            record.at("TYPE"),
            record.at("REFERENCE")
        };

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