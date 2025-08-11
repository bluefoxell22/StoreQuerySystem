#include "DBFTableManager.h"

std::string DBFTableManager::FormatFieldValue(const FIELD_DESCRIPTOR& desc, const std::string& value) {
    std::string formatted;

    if (desc.type == 'N' || desc.type == 'F') {
        char buffer[32];
        double num = atof(value.c_str());
        snprintf(buffer, sizeof(buffer), "%-*.*f", desc.length, desc.decimal, num);
        formatted.assign(buffer, desc.length);
    }
    else {
        formatted = value.substr(0, desc.length);
        formatted.resize(desc.length, ' ');
    }
    return formatted;
}

bool DBFTableManager::GetAllRecords(std::vector<std::map<std::string, std::string>>& out) {
    if (!Open()) return false;

    std::vector<std::vector<std::string>> rawRecords;
    if (!dbf.GetAllRecords(rawRecords)) return false;

    for (const auto& rawRecord : rawRecords) {
        std::map<std::string, std::string> record;
        for (size_t i = 0; i < fieldDescriptors.size() && i < rawRecord.size(); ++i) {
            record[fieldDescriptors[i].name] = rawRecord[i];
        }
        out.push_back(record);
    }
    return true;
}

bool DBFTableManager::CreateDB() {
    if (fieldDescriptors.empty()) return false;
    return dbf.CreateNew(filename, fieldDescriptors) && dbf.Open(filename);
}

bool DBFTableManager::AddRecord(const std::map<std::string, std::string>& fieldValues, bool inTransaction = false) {
    if (!inTransaction && transactionState == TRANSACTION_ACTIVE) return false; // Require explicit transaction control
    if (!dbf.isOpen() && !CreateDB()) return false;

    std::vector<std::string> record;
    record.reserve(fieldDescriptors.size());

    for (const auto& desc : fieldDescriptors) {
        std::string value;
        auto it = fieldValues.find(desc.name);
        if (it != fieldValues.end()) {
            value = FormatFieldValue(desc, it->second);
        }
        else {
            value.assign(desc.length, ' ');
        }
        record.push_back(value);
    }

    return dbf.AddRecord(record);
}

bool DBFTableManager::DeleteRecord(const std::string& keyField, const std::string& keyValue, bool inTransaction = false) {
    if (!inTransaction && transactionState == TRANSACTION_ACTIVE) return false; // Require explicit transaction control

    const FIELD_DESCRIPTOR* keyDesc = GetFieldDescriptor(keyField);
    
    if (!keyDesc) return false;

    if (keyDesc->type == 'N' || keyDesc->type == 'F') {
        return dbf.DeleteRecordByNumericKey(atof(keyValue.c_str()));
    }
    return dbf.DeleteRecordByTextKey(keyValue);
}

bool DBFTableManager::UpdateRecord(const std::string& keyField, const std::string& keyValue,
    const std::map<std::string, std::string>& updates, bool inTransaction = false) {
    if (!inTransaction && transactionState == TRANSACTION_ACTIVE) return false;

    if (!DeleteRecord(keyField, keyValue)) return false;

    return AddRecord(updates);
}

bool DBFTableManager::GetRecord(const std::string& keyField,
    const std::string& keyValue,
    std::map<std::string, std::string>& out) {
    std::vector<std::string> record;
    bool success = false;

    const FIELD_DESCRIPTOR* keyDesc = GetFieldDescriptor(keyField);
    if (!keyDesc) return false;

    if (keyDesc->type == 'N' || keyDesc->type == 'F') {
        success = dbf.GetByNumericKey(atof(keyValue.c_str()), record);
    }
    else {
        success = dbf.GetByTextKey(keyValue, record);
    }

    if (success && record.size() == fieldDescriptors.size()) {
        for (size_t i = 0; i < fieldDescriptors.size(); ++i) {
            out[fieldDescriptors[i].name] = record[i];
        }
    }

    return success;
}

bool DBFTableManager::ValidateField(const std::string& fieldName, const std::string& value) const {
    const FIELD_DESCRIPTOR* desc = GetFieldDescriptor(fieldName);
    if (!desc) return false;

    // Add type-specific validation
    if (desc->type == 'N' || desc->type == 'F') {
        char* endptr;
        strtod(value.c_str(), &endptr);
        return *endptr == '\0';
    }
    return true;
}

// Transaction Management
bool DBFTableManager::BeginTransaction() {
    if (transactionState != TRANSACTION_NONE) {
        return false;
    }

    tempTransactionFile = filename + ".tmp";
    if (!CreateBackup()) {
        transactionState = TRANSACTION_FAILED;
        return false;
    }

    transactionState = TRANSACTION_ACTIVE;
    return true;
}

bool DBFTableManager::CommitTransaction() {
    if (transactionState != TRANSACTION_ACTIVE) {
        return false;
    }

    if (!FinalizeTransaction()) {
        transactionState = TRANSACTION_FAILED;
        return false;
    }

    transactionState = TRANSACTION_COMMITTED;
    return true;
}

bool DBFTableManager::RollbackTransaction() {
    if (transactionState != TRANSACTION_ACTIVE) {
        return false;
    }

    if (!RestoreBackup()) {
        transactionState = TRANSACTION_FAILED;
        return false;
    }

    transactionState = TRANSACTION_NONE;
    return true;
}

// Private Helpers
bool DBFTableManager::CreateBackup() {
    std::ifstream src(filename, std::ios::binary);
    if (!src.is_open()) return false;

    std::ofstream dst(tempTransactionFile, std::ios::binary);
    if (!dst.is_open()) return false;

    dst << src.rdbuf();
    return src && dst;
}

bool DBFTableManager::RestoreBackup() {
    dbf.close();

    if (std::remove(filename.c_str()) != 0) {
        return false;
    }

    if (std::rename(tempTransactionFile.c_str(), filename.c_str()) != 0) {
        return false;
    }

    return dbf.Open(filename);
}

bool DBFTableManager::FinalizeTransaction() {
    dbf.close();
    return std::remove(tempTransactionFile.c_str()) == 0;
}