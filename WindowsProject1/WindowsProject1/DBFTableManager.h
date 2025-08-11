#ifndef DBFTABLEMANAGER_H
#define DBFTABLEMANAGER_H

#include "DBFManager.h"
#include <algorithm>
#include <cstring>
#include <map>
#include <vector>
#include <string>

class DBFTableManager {
public:
    enum TransactionState {
        TRANSACTION_NONE,
        TRANSACTION_ACTIVE,
        TRANSACTION_COMMITTED,
        TRANSACTION_FAILED
    };
protected:
    DBFManager dbf;
    std::string filename;
    std::vector<FIELD_DESCRIPTOR> fieldDescriptors;
    TransactionState transactionState;
    std::string tempTransactionFile;

    std::string FormatFieldValue(const FIELD_DESCRIPTOR& desc, const std::string& value);

    const FIELD_DESCRIPTOR* GetFieldDescriptor(const std::string& fieldName) const {
        for (const auto& desc : fieldDescriptors) {
            if (strncmp(desc.name, fieldName.c_str(), 11) == 0) {
                return &desc;
            }
        }
        return nullptr;
    }

public:
    DBFTableManager(const std::string& file)
        : filename(file),
        transactionState(TRANSACTION_NONE) {}

    bool Open() {
        return dbf.Open(filename);
    }

    bool GetAllRecords(std::vector<std::map<std::string, std::string>>& out);

    bool CreateDB();

    bool AddRecord(const std::map<std::string, std::string>& fieldValues, bool inTransaction = false);

    bool DeleteRecord(const std::string& keyField, const std::string& keyValue, bool inTransaction = false);

    bool UpdateRecord(const std::string& keyField, const std::string& keyValue,
        const std::map<std::string, std::string>& updates, bool inTransaction = false);

    bool GetRecord(const std::string& keyField,
        const std::string& keyValue,
        std::map<std::string, std::string>& out);

    bool PackDatabase() {
        return dbf.Pack();
    }

    bool AddFieldDescriptor(const FIELD_DESCRIPTOR& desc) {
        fieldDescriptors.push_back(desc);
        return true;
    }

    bool ValidateField(const std::string& fieldName, const std::string& value) const;

    bool BeginTransaction();
    bool CommitTransaction();
    bool RollbackTransaction();
    TransactionState GetTransactionState() const {
        return transactionState;
    }


private:
    bool CreateBackup();
    bool RestoreBackup();
    bool FinalizeTransaction();
};

#endif