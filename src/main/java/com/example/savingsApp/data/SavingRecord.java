package com.example.savingsApp.data;

/**
 * POJO Class For Saving Records
 * Ozan Cin - 300320226
 */
public class SavingRecord
{
    public String custNo, custName;
    public double cDep;
    public int nYears;
    public String saveType;

    public SavingRecord()
    {

    }

    public SavingRecord(String custNo, String custName, double cDep, int nYears, String saveType) {
        this.custNo = custNo;
        this.custName = custName;
        this.cDep = cDep;
        this.nYears = nYears;
        this.saveType = saveType;
    }

    public String getCustNo() {
        return custNo;
    }

    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public double getcDep() {
        return cDep;
    }

    public void setcDep(double cDep) {
        this.cDep = cDep;
    }

    public int getnYears() {
        return nYears;
    }

    public void setnYears(int nYears) {
        this.nYears = nYears;
    }

    public String getSaveType() {
        return saveType;
    }

    public void setSaveType(String saveType) {
        this.saveType = saveType;
    }

    @Override
    public String toString() {
        return "SavingRecord{" +
                "custNo='" + custNo + '\'' +
                ", custName='" + custName + '\'' +
                ", cDep=" + cDep +
                ", nYears=" + nYears +
                ", saveType='" + saveType + '\'' +
                '}';
    }
}
