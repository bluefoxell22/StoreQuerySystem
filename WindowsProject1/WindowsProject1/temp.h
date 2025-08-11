

bool Product::GetProduct(const std::string& id, ProductFields& out) {
    std::map<std::string, std::string> record;
    if (!GetRecord("ID", id, record)) return false;

    out.id = record["ID"];
    out.name = record["NAME"];
    out.cost = std::stod(record["COST"]);
    out.price = std::stod(record["PRICE"]);
    out.stock = std::stoi(record["STOCK"]);
    out.supplierId = record["SUPPLIERID"];

    return true;
}