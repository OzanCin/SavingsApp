package com.example.savingsApp;

import com.example.savingsApp.data.SavingRecord;
import com.example.savingsApp.data.SavingRecordDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


/**
 * Record Addition Is Done Via Ajax Thats Why I Wrote This Rest API Class
 * Ozan Cin - 300320226
 */

@RestController
public class APIController
{
    @Autowired
    SavingRecordDAO db;

    @PostMapping("/api/add")
    public String doAddRecord(
            @RequestParam(value = "custno") String custNo,
            @RequestParam(value = "custname") String custName,
            @RequestParam(value = "cdep") double cDept,
            @RequestParam(value = "nyears") int nYears,
            @RequestParam(value = "savetype") String saveType
            ) throws Exception
    {
        SavingRecord sr = db.getByNo(custNo);
        if (sr != null)
        {

            return "0";
        }
        else
        {
            sr = new SavingRecord(custNo, custName, cDept, nYears, saveType);
            db.add(sr);
            return "1";
        }
    }


}
