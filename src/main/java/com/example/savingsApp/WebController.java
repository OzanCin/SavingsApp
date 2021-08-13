package com.example.savingsApp;

import com.example.savingsApp.data.SavingRecord;
import com.example.savingsApp.data.SavingRecordDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Web Controllers
 * Ozan Cin - 300320226
 */

@Controller
@RequestMapping
public class WebController
{

    @Autowired
    SavingRecordDAO db;


    // Index Page, Showing All Records
    @GetMapping("/")
    public String getIndex(Model m) throws Exception
    {
        List<SavingRecord> l = db.getAll();
        m.addAttribute("records", l);
        return "index";
    }


    // Add Records Page
    @GetMapping("/addRecord")
    public String getAddPage()
    {

        return "add";
    }


    // Edit Records Page
    @GetMapping("/editRecord/{id}")
    public String getEditPage(@PathVariable(value = "id") String custNo, Model m) throws Exception
    {
        SavingRecord sr = db.getByNo(custNo);
        m.addAttribute("rec", sr);
        return "edit";
    }

    // Delete Record Page (Right After Deletion It's Redirect User To Main)

    @GetMapping("/deleteRecord/{id}")
    public String getDelPage(@PathVariable(value = "id") String custNo) throws Exception
    {
        SavingRecord sr = db.getByNo(custNo);
        if (sr != null)
        {
            db.del(sr);
        }

        return "redirect:/";
    }


    // Update Page
    @PostMapping("/api/upd")
    public String doUpdRecord(
            @RequestParam(value = "custno") String custNo,
            @RequestParam(value = "custname") String custName,
            @RequestParam(value = "cdep") double cDept,
            @RequestParam(value = "nyears") int nYears,
            @RequestParam(value = "savetype") String saveType
    ) throws Exception
    {
        SavingRecord sr = new SavingRecord(custNo, custName, cDept, nYears, saveType);
        db.upd(sr);
        return "redirect:/";
    }



    // View Earnings PAge
    @GetMapping("/viewEarnings/{id}")
    public String getEarningsPage(@PathVariable(value = "id") String custNo, Model m) throws Exception
    {
        SavingRecord sr = db.getByNo(custNo);

        double interest = sr.saveType.equals("SAVINGS-DELUXE") ? 15 : 10;
        int nYear = sr.nYears;

        double startAmount = sr.cDep;

        ArrayList<HashMap<String, String>> hist = new ArrayList<>();

        for (int i = 1; i<= nYear; i++)
        {
            double stepStart = startAmount;
            double stepInterest = (stepStart * interest) / 100.0;
            double stepEnd = stepStart + stepInterest;
            HashMap<String, String> hm = new HashMap<>();

            startAmount = stepEnd;

            hm.put("year", ""+i);
            hm.put("start", String.format("$ %.2f", stepStart));
            hm.put("interest", String.format("$ %.2f", stepInterest));
            hm.put("end", String.format("$ %.2f", stepEnd));

            hist.add(hm);
        }

        m.addAttribute("custno", sr.custNo);
        m.addAttribute("custname", sr.custName);
        m.addAttribute("hist",hist);
        return "earnings";
    }





}
