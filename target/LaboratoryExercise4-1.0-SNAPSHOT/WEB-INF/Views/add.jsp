
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Saving App - Add Record</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container-fluid ">
    <div class="row mt-2 justify-content-center">
        <div class="col-6">
            <form id="fAdd" >
            <div class="card shadow-lg">
                <div class="card-header text-center bg-dark text-light" style="font-size: 2rem">Savings Investment Record</div>
                <div class="card-body">
                    <b>Customer No (*)</b>
                    <input type="text" class="form-control mt-2 mb-3 shadow" name="custno" required />

                    <b>Customer Name (*)</b>
                    <input type="text" class="form-control mt-2 mb-3 shadow" name="custname" required />

                    <b>Deposit (*)</b>
                    <input type="number" min="0.00" max="999999.99" step="0.1" class="form-control mt-2 mb-3 shadow" name="cdep" required />

                    <b>Number Of Years (*)</b>
                    <input type="number" step="1" min="1" max="99" class="form-control mt-2 mb-3 shadow" name="nyears" required />

                    <b>Savings Type (*)</b>
                    <select class="form-control mt-2 shadow" name="savetype" required>
                        <option value="SAVINGS-REGULAR">SAVINGS-REGULAR</option>
                        <option value="SAVINGS-DELUXE">SAVINGS-DELUXE</option>
                    </select>

                    ${err}
                </div>
                <div class="card-footer text-right">
                    <button type="submit" class="btn btn-success shadow">Add</button>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $("#fAdd").submit(function(e)
    {
        e.preventDefault();
        var v = $(this).serializeArray();
        console.log(v);
        $.post("api/add", v, function(d)
        {
            if (d.toString() == 0)
            {
                alert("This Customer No Is Already Registered")
            }
            else
            {
                location.href ="/SavingsApp_war_exploded";
            }
        })
    });
</script>
