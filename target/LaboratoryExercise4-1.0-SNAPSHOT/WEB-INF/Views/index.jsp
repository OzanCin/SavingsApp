
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Saving App</title>
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
                    <table class="table table-bordered table-hover table-striped w-100">
                        <thead>
                        <tr>
                            <th>Customer Number</th>
                            <th>Customer Name</th>
                            <th>Customer Deposit</th>
                            <th>Number Of Years</th>
                            <th>Savings Type</th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${records}" var="rec">
                            <tr>
                                <td style="vertical-align: middle">${rec.custNo}</td>
                                <td style="vertical-align: middle">${rec.custName}</td>
                                <td style="vertical-align: middle">${rec.cDep}</td>
                                <td style="vertical-align: middle">${rec.nYears}</td>
                                <td style="vertical-align: middle">${rec.saveType}</td>
                                <td  style="vertical-align: middle" class="text-center">
                                    <a href="editRecord/${rec.custNo}" class="btn btn-primary shadow">Edit</a>
                                    <button rec_id="${rec.custNo}" class="btnDel btn btn-warning shadow">Delete</button></td>
                                <td  style="vertical-align: middle"><a href="viewEarnings/${rec.custNo}" class="btn btn-primary  btn-block shadow">Projected Investment</a></td>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="card-footer text-light">
                    <a href="addRecord" class="btn btn-success shadow">Add</a>
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