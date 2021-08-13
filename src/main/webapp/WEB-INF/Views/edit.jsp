
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Saving App - Edit Record</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container-fluid ">
    <div class="row mt-2 justify-content-center">
        <div class="col-6">
            <form id="fUpd" method="post" action="/SavingsApp_war_exploded/api/upd">
                <div class="card shadow-lg">
                    <div class="card-header text-center bg-dark text-light" style="font-size: 2rem">Savings Investment Record</div>
                    <div class="card-body">
                        <b>Customer No (*)</b>
                        <input type="text" class="form-control mt-2 mb-3 shadow" name="custno" value="${rec.custNo}" readonly required />

                        <b>Customer Name (*)</b>
                        <input type="text" class="form-control mt-2 mb-3 shadow" name="custname" required value="${rec.custName}" />

                        <b>Deposit (*)</b>
                        <input type="number" min="0.00" max="999999.99" step="0.1" class="form-control mt-2 mb-3 shadow" name="cdep" required  value="${rec.cDep}"/>

                        <b>Number Of Years (*)</b>
                        <input type="number" step="1" min="1" max="99" class="form-control mt-2 mb-3 shadow" name="nyears" required  value="${rec.nYears}"/>

                        <b>Savings Type (*)</b>
                        <select class="form-control mt-2 shadow" name="savetype" required>
                            <option ${rec.saveType == "SAVINGS-REGULAR" ? "selected" : ""} value="SAVINGS-REGULAR">SAVINGS-REGULAR</option>
                            <option ${rec.saveType == "SAVINGS-DELUXE" ? "selected" : ""} value="SAVINGS-DELUXE">SAVINGS-DELUXE</option>
                        </select>
                    </div>
                    <div class="card-footer text-right">
                        <button type="submit" class="btn btn-success shadow">Update</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>


</script>
