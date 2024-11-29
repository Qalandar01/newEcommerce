
<%@ page import="java.util.Objects" %>
<%@ page import="org.example.demo5.entity.Basket" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.example.demo5.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Basket</title>
    <style>
        body {
            background-color: #f8f9fa;
        }

        table img {
            height: 60px;
            width: 60px;
            object-fit: cover;
        }

        .quantity-controls button {
            width: 30px;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 18px;
        }

        .confirm-btn {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }
    </style>
</head>
<body class="container mt-4">
<%
    Object object = session.getAttribute("basket");
    Basket basket = (Basket) Objects.requireNonNullElse(object,new Basket());
    if (basket.getBasket().isEmpty()) {
        response.sendRedirect("/home.jsp");
    } else {
%>
<h1 class="text-center text-primary mb-4">Your Basket</h1>
<table class="table table-striped table-hover">
    <thead class="table-dark">
    <tr>
        <th>Product Image</th>
        <th>Product Name</th>
        <th>Price</th>
        <th>Amount</th>
        <th>Total Price</th>
    </tr>
    </thead>
    <tbody>
    <% for (Map.Entry<Product, Integer> entry : basket.getBasket().entrySet()) {
    %>
    <tr>
        <td>
            <img src="/img/<%= entry.getKey().getId() %>" alt="Photo not found" class="img-fluid rounded">
        </td>
        <td><%= entry.getKey().getName() %>
        </td>
        <td>$<%= entry.getKey().getPrice() %>
        </td>
        <td>
            <div class="d-flex align-items-center quantity-controls">
                <form method="post" action="/update-amount" class="me-2">
                    <input type="hidden" name="productId" value="<%= entry.getKey().getId() %>">
                    <input type="hidden" name="action" value="increase">
                    <button type="submit" class="btn btn-success btn-sm">
                        <i class="bi bi-plus">+</i>
                    </button>
                </form>
                <span class="fw-bold"><%= entry.getValue() %></span>
                <form method="post" action="/update-amount" class="ms-2">
                    <input type="hidden" name="productId" value="<%= entry.getKey().getId() %>">
                    <input type="hidden" name="action" value="decrease">
                    <button type="submit" class="btn btn-danger btn-sm">
                        <i class="bi bi-dash">-</i>
                    </button>
                </form>
            </div>
        </td>
        <td>$<%= entry.getValue() * entry.getKey().getPrice() %>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<div class="confirm-btn">
    <form action="/basket/confirm" method="post">
        <button class="btn btn-primary btn-lg">
            Confirm Total Sum: <span class="badge bg-light text-dark">
                $<%= basket.getBasket().entrySet().stream()
                .mapToInt(item -> item.getValue() * item.getKey().getPrice()).sum() %>
                </span>
        </button>
    </form>
</div>
<%
    }
%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qyrTcCU6q2XlKuvz19gW/4URGRxJTjBSozZn7f4Md3O9QxkEXZOIEvsR7BxCL8x9"
        crossorigin="anonymous"></script>
</body>
</html>
