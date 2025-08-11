#ifndef PRODUCT_H
#define PRODUCT_H

#include "DBFTableManager.h"
#include <vector>
#include <string>

class Product : public DBFTableManager {
public:
    struct ProductFields {
        std::string id;         // Primary key
        std::string name;
        double cost;
        double price;
        int stock;
        std::string supplierId;
    };

    struct InventoryMovement {
        std::string date;
        std::string productId;
        int quantity;
        double unitCost;
        std::string type;
        std::string reference;
    };

    Product();

    // Product CRUD operations
    bool AddProduct(const ProductFields& product);
    bool UpdateProduct(const std::string& id, const ProductFields& updates);
    bool DeleteProduct(const std::string& id);
    bool GetProduct(const std::string& id, ProductFields& out);

    // Inventory operations
    bool RecordMovement(const InventoryMovement& movement);
    bool RecordPurchase(const std::string& productId, const std::string& date,
        int quantity, double unitCost, const std::string& reference = "");
    bool RecordSale(const std::string& productId, const std::string& date,
        int quantity, const std::string& reference = "");

    // Reporting
    double CalculateCOGS_FIFO(const std::string& productId,
        const std::string& startDate,
        const std::string& endDate);
    double CalculateCOGS_Average(const std::string& productId,
        const std::string& startDate,
        const std::string& endDate);

private:
    DBFTableManager movementsDB;
    std::vector<FIELD_DESCRIPTOR> movementFields;
    bool UpdateProductStock(const std::string& productId, int quantityChange);

    InventoryMovement ParseMovementRecord(const std::vector<std::string>& record);
};

#endif