<%@ page import="org.example.demo5.entity.User" %>
<%@ page import="org.example.demo5.entity.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.demo5.db.DB" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("/home.jsp");
        return;
    }
    Integer userId = user.getId();
    List<Order> orders = DB.ORDERS.stream().filter(order -> order.getUserId().equals(userId)).toList();
    if (orders.isEmpty()) {
        response.sendRedirect("/home.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .orders-container {
            margin-top: 2rem;
        }

        .table th, .table td {
            vertical-align: middle;
            text-align: center;
        }

        .btn-primary {
            width: 100px;
        }

        .page-title {
            text-align: center;
            margin-bottom: 2rem;
        }
    </style>
</head>
<body>
<div class="container orders-container">
    <h1 class="page-title">Your Orders</h1>

    <table class="table table-hover table-striped table-bordered align-middle">
        <thead class="table-dark">
        <tr>
            <th>Order ID</th>
            <th>Order Time</th>
            <th>Order Status</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Order order : orders) {
        %>
        <tr>
            <td><%= order.getId() %>
            </td>
            <td><%= order.getDateTime() %>
            </td>
            <td><%= order.getStatus() %>
            </td>
            <td>
                <form action="/order-item.jsp?orderId=<%= order.getId() %>" method="post">
                    <button class="btn btn-primary">Show</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-vW5v1lKnzrncBLV0D0Kow5B4KiCRRWG0HbJpFwE4+vIdJvhOzh6mVoKt01Y9CCba"
        crossorigin="anonymous"></script>
</body>
</html>
