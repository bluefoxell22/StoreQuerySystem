#ifndef DBF_MANAGER_CLASS_H
#define DBF_MANAGER_CLASS_H

#include <vector>
#include <string>
#include <fstream>
#include <map>
#include <algorithm>
#include <Windows.h> 
#include "DBFValue.h"


#pragma pack(push, 1)
struct DBF_HEADER {
    unsigned char version;
    unsigned char last_update[3]; // YYMMDD
    unsigned int num_records;
    unsigned short header_size;
    unsigned short record_size;
    char reserved[20];
};

struct FIELD_DESCRIPTOR {
    char name[11];
    char type;
    unsigned int address;
    unsigned char length;
    unsigned char decimal;
    char reserved[14];
};
#pragma pack(pop)

class DBFManager {
    std::fstream dbf_file;
    DBF_HEADER header;
    std::vector<FIELD_DESCRIPTOR> fields;
    std::string filename;

    // Index structures
    std::map<std::string, long> text_index;
    std::map<double, long> numeric_index;
    std::map<long, std::pair<std::string, double>> position_to_key_map;

    void UpdateHeader();
    bool ReadCurrentRecord(std::vector<std::string>& out);

    struct FieldIndex {
        std::map<std::string, long> text_index;
        std::map<double, long> numeric_index;
    };

    std::map<std::string, FieldIndex> field_indices;
    std::map<long, std::map<std::string, std::shared_ptr<DBFValue>>> position_to_fields;

    bool DeleteRecordAtPosition(long pos, const std::string& text_key, double numeric_key);
    bool GetRecordPosition(double numeric_key, const std::string& text_key, long& out_pos);

    public:
        //constructor destructor
        DBFManager() = default;
        ~DBFManager() { if (dbf_file.is_open()) dbf_file.close(); }

        //check open
        bool isOpen() const { return dbf_file.is_open(); }

        bool Open(const std::string& filepath);
        void close() { if (dbf_file.is_open()) dbf_file.close(); }

        void BuildIndices();

        //record manipulation
        bool GetByTextKey(const std::string& key, std::vector<std::string>& out);
        bool GetByNumericKey(double key, std::vector<std::string>& out);
        bool DeleteRecordByTextKey(const std::string& key);
        bool DeleteRecordByNumericKey(double key);
        bool AddRecord(const std::vector<std::string>& values);

        bool CreateNew(const std::string& filepath, const std::vector<FIELD_DESCRIPTOR>& new_fields);
        bool DeleteFile();

        void UpdateFieldAddresses();
        bool Pack();
        bool GetAllRecords(std::vector<std::vector<std::string>>& out);
};

#endif