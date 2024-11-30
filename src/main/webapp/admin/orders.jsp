<%@ page import="org.example.demo5.db.DB" %>
<%@ page import="org.example.demo5.entity.Order" %>
<%@ page import="java.util.Objects" %>
<%@ page import="org.example.demo5.entity.OrderItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <% if (DB.ORDERS.isEmpty()) { %>
    <script>
        window.location.href = "adminChooseCat.jsp";
    </script>
    <% } else { %>
    <h1 class="text-center mb-4">Orders</h1>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>Order ID</th>
            <th>Order Time</th>
            <th>Order Status</th>
            <th>Order Item</th>
            <th>Amount</th>
        </tr>
        </thead>
        <tbody>
        <% for (Order order : DB.ORDERS) {
            for (OrderItem orderItem : DB.ORDER_ITEMS) { %>
        <tr>
            <td><%= order.getId() %></td>
            <td><%= order.getDateTime() %></td>
            <td><%= order.getStatus() %></td>
            <td>
                <%= Objects.requireNonNull(DB.PRODUCTS.stream()
                        .filter(product -> product.getId().equals(orderItem.getProductId()))
                        .findFirst()
                        .orElse(null)).getName()
                %>
            </td>
            <td><%= orderItem.getAmount() %></td>
        </tr>
        <% } } %>
        </tbody>
    </table>
    <% } %>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
