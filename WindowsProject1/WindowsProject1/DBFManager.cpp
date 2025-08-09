#include "DBFManager.h"

bool DBFManager::Open(const std::string& filepath) {
	filename = filepath;
	dbf_file.open(filename, std::ios::binary | std::ios::in | std::ios::out);
	if (!dbf_file) return false;

    //read header
	dbf_file.read(reinterpret_cast<char*>(&header), sizeof(header));

    //read fields
	int field_count = (header.header_size - sizeof(header) - 1) / sizeof(FIELD_DESCRIPTOR);
	fields.resize(field_count);
	dbf_file.read(reinterpret_cast<char*>(fields.data()), field_count * sizeof(FIELD_DESCRIPTOR));

	UpdateFieldAddresses();
	BuildIndices();
	return true;
}

void DBFManager::BuildIndices() {
    field_indices.clear();
    position_to_fields.clear();

    if (!dbf_file.is_open()) return;

    // Initialize indices for all fields
    for (const auto& field : fields) {
        field_indices[field.name] = FieldIndex();
    }

    dbf_file.seekg(header.header_size);
    char* record = new char[header.record_size];

    for (unsigned i = 0; i < header.num_records; ++i) {
        long pos = dbf_file.tellg();
        dbf_file.read(record, header.record_size);

        if (record[0] == '*') continue; // Skip deleted

        std::map<std::string, std::shared_ptr<DBFValue>> field_values;

        for (const auto& field : fields) {
            std::string raw_value(record + field.address, field.length);
            raw_value.erase(raw_value.find_last_not_of(" \t") + 1);

            if (field.type == 'N' || field.type == 'F') {
                double num_val = atof(raw_value.c_str());
                field_values[field.name] = std::make_shared<DBFNumericValue>(num_val);
                field_indices[field.name].numeric_index[num_val] = pos;
            }
            else {
                field_values[field.name] = std::make_shared<DBFStringValue>(raw_value);
                field_indices[field.name].text_index[raw_value] = pos;
            }
        }

        position_to_fields[pos] = field_values;
    }

    delete[] record;
}

void DBFManager::UpdateFieldAddresses() {
	uint16_t offset = 1;
	for (auto& field : fields) {
		field.address = offset;
		offset += field.length;
	}
}

// Helper method to get record position by either key type
bool DBFManager::GetRecordPosition(double numeric_key, const std::string& text_key, long& out_pos) {
    // Try numeric index first if provided
    if (!std::isnan(numeric_key)) {
        auto num_it = numeric_index.find(numeric_key);
        if (num_it != numeric_index.end()) {
            out_pos = num_it->second;
            return true;
        }
    }

    // Fall back to text index if provided
    if (!text_key.empty()) {
        auto text_it = text_index.find(text_key);
        if (text_it != text_index.end()) {
            out_pos = text_it->second;
            return true;
        }
    }

    return false;
}

// Public methods using the common helper
bool DBFManager::GetByTextKey(const std::string& key, std::vector<std::string>& out) {
    long pos;
    if (!GetRecordPosition(std::numeric_limits<double>::quiet_NaN(), key, pos))
        return false;

    dbf_file.seekg(pos);
    return ReadCurrentRecord(out);
}

bool DBFManager::GetByNumericKey(double key, std::vector<std::string>& out) {
    long pos;
    if (!GetRecordPosition(key, "", pos))
        return false;

    dbf_file.seekg(pos);
    return ReadCurrentRecord(out);
}

bool DBFManager::DeleteRecordByTextKey(const std::string& key) {
    long pos;
    if (!GetRecordPosition(std::numeric_limits<double>::quiet_NaN(), key, pos))
        return false;

    return DeleteRecordAtPosition(pos, key, atof(key.c_str()));
}

bool DBFManager::DeleteRecordByNumericKey(double key) {
    long pos;
    if (!GetRecordPosition(key, "", pos))
        return false;

    // Need to get text key for full deletion
    auto pos_it = position_to_key_map.find(pos);
    std::string text_key = (pos_it != position_to_key_map.end()) ? pos_it->second.first : "";

    return DeleteRecordAtPosition(pos, text_key, key);
}

// Common deletion method
bool DBFManager::DeleteRecordAtPosition(long pos, const std::string& text_key, double numeric_key) {
    // Mark record as deleted
    dbf_file.seekp(pos);
    const char delete_flag = '*';
    dbf_file.write(&delete_flag, 1);
    dbf_file.flush();

    // Update all indices
    if (!text_key.empty())
        text_index.erase(text_key);

    if (!std::isnan(numeric_key))
        numeric_index.erase(numeric_key);

    position_to_key_map.erase(pos);
    return true;
}

bool DBFManager::AddRecord(const std::vector<std::string>& values) {
    if (values.size() != fields.size()) return false;

    dbf_file.seekp(0, std::ios::end);
    long pos = dbf_file.tellp();

    //write deletion flag
    char flag = ' ';
    dbf_file.write(&flag, 1);

    //write fields
    for (size_t i = 0; i < fields.size(); i++) {
        std::string value = values[i];
        value.resize(fields[i].length, ' ');
        dbf_file.write(value.c_str(), fields[i].length);
    }
    dbf_file.flush();

    //update indices
    text_index[values[0]] = pos;
    numeric_index[atof(values[0].c_str())] = pos;
    position_to_key_map[pos] = { values[0], atof(values[0].c_str()) };

    header.num_records++;
    UpdateHeader();
    return true;
}

bool DBFManager::CreateNew(const std::string& filepath, const std::vector<FIELD_DESCRIPTOR>& new_fields) {
    filename = filepath;
    dbf_file.open(filename, std::ios::binary | std::ios::out);
    if (!dbf_file) return false;

    //initialize header
    memset(&header, 0, sizeof(header));
    header.version = 0x03; //dBASE III+
    header.header_size = sizeof(header) + (new_fields.size() * sizeof(FIELD_DESCRIPTOR)) + 1;

    //calculate header size
    header.record_size = 1;
    for (const auto& field : new_fields) {
        header.record_size += field.length;
    }

    //write header
    dbf_file.write(reinterpret_cast<char*>(&header), sizeof(header));

    //write fields
    for (const auto& field : new_fields) {
        dbf_file.write(reinterpret_cast<const char*>(&field), sizeof(field));
    }

    //write terminator
    char terminator = 0x0D;
    dbf_file.write(&terminator, 1);

    fields = new_fields;
    return true;
}

bool DBFManager::DeleteFile() {
    if (isOpen()) close();

    if (remove(filename.c_str()) != 0) return false;

    filename.clear();
    memset(&header, 0, sizeof(header));
    fields.clear();
    text_index.clear();
    numeric_index.clear();
}

void DBFManager::UpdateHeader() {
    dbf_file.seekp(0);
    dbf_file.write(reinterpret_cast<char*>(&header), sizeof(header));
}

bool DBFManager::ReadCurrentRecord(std::vector<std::string>& out) {
    out.clear();
    char* record = new char[header.record_size];
    dbf_file.read(record, header.record_size);

    if (dbf_file.gcount() != header.record_size) {
        delete[] record;
        return false;
    }

    for (const auto& field : fields) {
        std::string value(record + field.address, field.length);
        value.erase(value.find_last_not_of(" \t") + 1);
        out.push_back(value);
    }

    delete[] record;
    return true;
}

bool DBFManager::Pack() {
    std::string tempfile = filename + ".tmp";
    std::fstream temp(tempfile, std::ios::binary | std::ios::out);
    if (!temp) return false;

    // Write header to new file
    temp.write(reinterpret_cast<char*>(&header), sizeof(header));

    // Write field descriptors
    temp.write(reinterpret_cast<char*>(fields.data()), fields.size() * sizeof(FIELD_DESCRIPTOR));

    // Write terminator
    char terminator = 0x0D;
    temp.write(&terminator, 1);

    // Copy only active records
    dbf_file.seekg(header.header_size);
    char* record = new char[header.record_size];
    unsigned new_count = 0;

    // Map to track old positions to new positions
    std::map<long, long> position_map;

    for (unsigned i = 0; i < header.num_records; ++i) {
        long current_pos = dbf_file.tellg();
        dbf_file.read(record, header.record_size);

        if (record[0] != '*') {
            long new_record_pos = temp.tellp();
            temp.write(record, header.record_size);
            position_map[current_pos] = new_record_pos;
            new_count++;
        }
    }
    delete[] record;

    // Update record count
    header.num_records = new_count;
    temp.seekp(0);
    temp.write(reinterpret_cast<char*>(&header), sizeof(header));
    temp.close();
    dbf_file.close();

    // Replace original file
    if (remove(filename.c_str()) != 0 || rename(tempfile.c_str(), filename.c_str()) != 0) {
        return false;
    }

    // Reopen the file
    dbf_file.open(filename, std::ios::binary | std::ios::in | std::ios::out);
    if (!dbf_file.is_open()) return false;

    // Update indices with new positions
    for (const auto& pos_pair : position_map) {
        long old_pos = pos_pair.first;
        long new_pos = pos_pair.second;

        if (position_to_key_map.count(old_pos)) {
            auto keys = position_to_key_map[old_pos];
            text_index[keys.first] = new_pos;
            numeric_index[keys.second] = new_pos;
            position_to_key_map[new_pos] = keys;
            position_to_key_map.erase(old_pos);
        }
    }

    return true;
}

bool DBFManager::GetAllRecords(std::vector<std::vector<std::string>>& out) {
    if (!dbf_file.is_open()) return false;

    dbf_file.seekg(header.header_size);
    char* record = new char[header.record_size];
    out.clear();

    for (unsigned i = 0; i < header.num_records; ++i) {
        long pos = dbf_file.tellg();  // Save position before reading
        dbf_file.read(record, header.record_size);
        if (record[0] == '*') continue; // Skip deleted records

        std::vector<std::string> current_record;
        for (const auto& desc : this->fields) {  // Use the class member fields
            std::string field(record + desc.address, desc.length);
            field.erase(field.find_last_not_of(" \t") + 1);
            current_record.push_back(field);
        }
        out.push_back(current_record);
    }

    delete[] record;
    return true;
}