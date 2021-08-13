package com.example.savingsApp.data;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

@Service
public class SavingRecordDAO implements DAO
{
    Connection conn;

    public SavingRecordDAO()
    {
        try
        {
            System.out.println("Creating Database Connection");
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/savings", "root", "");
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public List<SavingRecord> getAll() throws Exception
    {
        ResultSet rs = conn.createStatement().executeQuery("select * from savingstable");
        List<SavingRecord> l = new ArrayList<>();
        while (rs.next())
        {
            String custNo = rs.getString("custno");
            String custName = rs.getString("custname");
            double cDept = rs.getDouble("cdep");
            int nYears = rs.getInt("nyears");
            String saveType = rs.getString("savtype");

            SavingRecord sr = new SavingRecord(custNo, custName, cDept, nYears, saveType);
            l.add(sr);
        }

        return l;
    }


    @Override
    public SavingRecord getByNo(String custNo) throws Exception
    {
        ResultSet rs = conn.createStatement().executeQuery("select * from savingstable where custno = '"+custNo+"'");
        if (rs.next())
        {
            String custName = rs.getString("custname");
            double cDept = rs.getDouble("cdep");
            int nYears = rs.getInt("nyears");
            String saveType = rs.getString("savtype");
            SavingRecord sr = new SavingRecord(custNo, custName, cDept, nYears, saveType);
            return sr;
        }
        else
        return null;
    }

    @Override
    public void add(SavingRecord sr) throws Exception
    {
        String q = "insert into savingstable values (?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(q);
        ps.setString(1, sr.custNo);
        ps.setString(2, sr.custName);
        ps.setDouble(3, sr.cDep);
        ps.setInt(4, sr.nYears);
        ps.setString(5, sr.saveType);
        ps.execute();
    }

    @Override
    public void upd(SavingRecord sr) throws Exception
    {
        String q = "update savingstable set custname = ?, cdep = ?, nyears = ?, savtype = ? where custno = ?";
        PreparedStatement ps = conn.prepareStatement(q);
        ps.setString(1, sr.custName);
        ps.setDouble(2, sr.cDep);
        ps.setInt(3, sr.nYears);
        ps.setString(4, sr.saveType);
        ps.setString(5, sr.custNo);
        ps.execute();
    }

    @Override
    public void del(SavingRecord sr) throws Exception
    {
        String q = "delete from savingstable where custno = '"+sr.custNo+"'";
        conn.createStatement().execute(q);
    }
}
