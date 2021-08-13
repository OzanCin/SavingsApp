package com.example.savingsApp.data;

import java.util.List;
import com.example.savingsApp.data.SavingRecord;


/**
 * Data Access Object Interface
 * Ozan Cin - 300320226
 */
public interface DAO
{

    List<SavingRecord> getAll() throws Exception;
    SavingRecord getByNo(String custNo) throws Exception;
    void add(SavingRecord sr) throws Exception;
    void upd(SavingRecord sr) throws Exception;
    void del(SavingRecord sr) throws Exception;
}
