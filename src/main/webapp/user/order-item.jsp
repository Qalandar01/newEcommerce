

<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Stream" %>
<%@ page import="org.example.demo5.entity.User" %>
<%@ page import="org.example.demo5.entity.OrderItem" %>
<%@ page import="org.example.demo5.db.DB" %>
<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>Order Items</title>
    <style>
        .total-sum {
            font-weight: bold;
            font-size: 1.2rem;
            margin-top: 1rem;
            text-align: right;
        }
    </style>
</head>
<body>
<div class="container mt-4">

    <div class="row mb-4">
        <div class="col">
            <h1 class="text-center">Order Items</h1>
        </div>
    </div>
    <%
       User user = (User) session.getAttribute("user");
       if (user == null) {
            response.sendRedirect("/home.jsp");
            return;
        }
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        List<OrderItem> orderItems = DB.ORDER_ITEMS.stream().filter(orderItem -> orderItem.getOrderId().equals(orderId)).toList();
    %>

    <table class="table table-striped table-bordered">
        <thead class="table-dark">
        <tr>
            <th>Product Name</th>
            <th>Product Price</th>
            <th>Amount</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (OrderItem orderItem : orderItems) {
        %>
        <tr>
            <td>
                <%= DB.PRODUCTS.stream()
                        .filter(product -> product.getId().equals(orderItem.getProductId()))
                        .findFirst().orElseThrow().getName() %>
            </td>
            <td>
                $<%= DB.PRODUCTS.stream()
                    .filter(product -> product.getId().equals(orderItem.getProductId()))
                    .findFirst().orElseThrow().getPrice() %>
            </td>
            <td><%= orderItem.getAmount() %></td>
            <td>
                $<%= orderItem.getAmount() * DB.PRODUCTS.stream()
                    .filter(product -> product.getId().equals(orderItem.getProductId()))
                    .findFirst().orElseThrow().getPrice() %>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
        <%
            List<OrderItem> orderItems1 = DB.ORDER_ITEMS.stream().filter(orderItem -> orderItem.getOrderId().equals(orderId)).toList();
            Stream<Integer> integerStream = orderItems1.stream().map((orderItem -> {
                Integer price = DB.PRODUCTS.stream().filter(product -> product.getId().equals(orderItem.getProductId())).findFirst().orElseThrow().getPrice();
                return price * orderItem.getAmount();
            }));
            int sum = integerStream.mapToInt(Integer::intValue).sum();
        %>
    <div class="total-sum">
        Total Sum: $<%= sum %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-vW5v1lKnzrncBLV0D0Kow5B4KiCRRWG0HbJpFwE4+vIdJvhOzh6mVoKt01Y9CCba" crossorigin="anonymous"></script>
</body>
</html>
