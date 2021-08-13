
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Saving App - Projected Investment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container-fluid ">
    <div class="row mt-2 justify-content-center">
        <div class="col-10">
            <div class="card shadow-lg">
                <div class="card-header text-center bg-dark text-light" style="font-size: 2rem">Savings Investment Record</div>
                <div class="card-body">
                    <h3>Projected Table Of Customer # ${custno}</h3>
                    <h3>Name : ${custname}</h3>
                    <table class="table table-bordered table-hover table-striped w-100">
                        <thead>
                        <tr>
                            <th>Year</th>
                            <th>Starting Amound</th>
                            <th>Interest</th>
                            <th>Ending Balance</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${hist}" var="rec">
                            <tr>
                                <td style="vertical-align: middle">${rec.get("year")}</td>
                                <td style="vertical-align: middle">${rec.get("start")}</td>
                                <td style="vertical-align: middle">${rec.get("interest")}</td>
                                <td style="vertical-align: middle">${rec.get("end")}</td>

                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="card-footer text-light">
                    <a href="/SavingsApp_war_exploded" class="btn btn-light shadow">Submit</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>
    $(".btnDel").click(function()
    {
        var id = $(this).attr('rec_id');
        var getConfirm = confirm("Are You Sure To Delete Selected Record ?");
        if (getConfirm)
        {
            location.href="deleteRecord/"+id;
        }
    })
</script>