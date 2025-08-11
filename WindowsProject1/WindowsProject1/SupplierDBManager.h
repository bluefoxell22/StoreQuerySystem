#ifndef PRODUCT_H
#define PRODUCT_H

#include "DBFManager.h"
#include <vector>
#include <string>

class Product {
public:
    struct SupplierFields {
        std::string id;         // Unique identifier
        std::string name;       // Supplier name
        double cost;            // Current cost per unit
        double price;           // Selling price
        int stock;              // Current stock level
        std::string supplier;   // Supplier information
    };

    struct InventoryMovement {
        std::string date;       // Date of transaction (YYYYMMDD)
        std::string productId;  // Reference to product
        int quantity;           // Positive for purchases, negative for sales
        double unitCost;        // Cost per unit at time of transaction
        std::string type;       // "PURCHASE", "SALE", "ADJUSTMENT", etc.
        std::string reference;  // PO number, invoice number, etc.
    };

    Product();

    bool CreateNewDB();
    bool AddProduct(const ProductFields& product);
    bool DeleteProduct(const std::string& id);
    bool UpdateProduct(const std::string& id, const ProductFields& updatedFields);
    bool DeleteDB();
    bool GetProduct(const std::string& id, ProductFields& out);
    bool PackDatabase();

    // Inventory movement methods
    bool RecordMovement(const InventoryMovement& movement);
    bool RecordPurchase(const std::string& productId, const std::string& date,
        int quantity, double unitCost, const std::string& reference = "");
    bool RecordSale(const std::string& productId, const std::string& date,
        int quantity, const std::string& reference = "");
    double CalculateCOGS_FIFO(const std::string& productId,
        const std::string& startDate,
        const std::string& endDate);
    double CalculateCOGS_Average(const std::string& productId,
        const std::string& startDate,
        const std::string& endDate);
    InventoryMovement ParseMovementRecord(const std::vector<std::string>& record);

private:
    DBFManager productsDB;
    DBFManager movementsDB;
    const std::string PRODUCTS_DB = "products.dbf";
    const std::string MOVEMENTS_DB = "inventory_movements.dbf";

    std::vector<FIELD_DESCRIPTOR> productFields;
    std::vector<FIELD_DESCRIPTOR> movementFields;

    void InitializeFieldDescriptors();
    bool UpdateProductStock(const std::string& productId, int quantityChange);
};

#endif