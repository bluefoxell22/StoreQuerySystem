#ifndef DBFVALUE_H
#define DBFVALUE_H

#include <string>

class DBFValue {
public:
    virtual ~DBFValue() {}
    virtual std::string toString() const = 0;
    virtual double toDouble() const = 0;
    virtual bool isNumber() const = 0;
};

class DBFStringValue : public DBFValue {
    std::string value;
public:
    DBFStringValue(const std::string& val) : value(val) {}
    std::string toString() const override { return value; }
    double toDouble() const override { return atof(value.c_str()); }
    bool isNumber() const override { return false; }
};

class DBFNumericValue : public DBFValue {
    double value;
public:
    DBFNumericValue(double val) : value(val) {}
    std::string toString() const override { return std::to_string(value); }
    double toDouble() const override { return value; }
    bool isNumber() const override { return true; }
};

#endif