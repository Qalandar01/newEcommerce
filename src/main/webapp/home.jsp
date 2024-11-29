
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Optional" %>
<%@ page import="jdk.jshell.spi.ExecutionControl" %>
<%@ page import="org.example.demo5.entity.Basket" %>
<%@ page import="java.util.Objects" %>
<%@ page import="org.example.demo5.entity.User" %>
<%@ page import="org.example.demo5.db.DB" %>
<%@ page import="org.example.demo5.entity.Category" %>
<%@ page import="org.example.demo5.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Categories</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background: #f8f9fa;
        }

        .navbar-brand {
            font-weight: bold;
        }

        .category-list {
            list-style: none;
            padding: 0;
        }

        .category-list li {
            margin-bottom: 10px;
        }

        .product-card img {
            max-height: 200px;
            object-fit: cover;
            border-radius: 10px;
        }

        .product-card {
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            padding: 15px;
            background: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-block {
            width: 100%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">E-Commerce</a>
        <div class="d-flex">
            <%
                Basket basket = (Basket) Objects.requireNonNullElse(session.getAttribute("basket"), new Basket());
                HttpSession currentSession = session;
                User user = (User)currentSession.getAttribute("user");
            %>
            <%
               if (user != null) {
            %>
            <form action="/user/user-orders.jsp" method="post">
                <button class="btn btn-success">
                    Orders(<%=DB.ORDERS.stream().filter(order -> order.getUserId().equals(user.getId())).toList().size()%>
                    )
                </button>
            </form>
            <div class="welcome-section d-flex align-items-center">
                <img src="/user/img" alt="User Image" style="max-width: 50px; border-radius: 50%;">
                <a href="/user/user-info.jsp" class="ms-2"><%= user.getFirstName() %>
                </a>
            </div>
            <%
            } else {
            %>
            <a href="/login.jsp" class="btn btn-primary">Login</a>
            <%
                }
            %>

            <form action="/basket.jsp" method="post" class="ms-3">
                <button class="btn btn-dark">Basket (<%= basket.getBasket().size() %>)</button>
            </form>
            <%
            %>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row mt-4">
        <div class="col-lg-3">
            <h4 class="mb-3">Categories</h4>
            <ul class="category-list">
                <li>
                    <%
                        String catIdStr = (String) session.getAttribute("catId");
                        Integer catId = catIdStr != null ? Integer.parseInt(catIdStr) : 0;
                        if (catId == 0) {
                    %>
                    <a href="/category/choose?catId=<%= catId %>" class="btn btn-primary w-100">All</a>
                    <%
                    } else {
                    %>
                    <a href="/category/choose?catId=0" class="btn btn-outline-primary w-100">All</a>
                    <%
                        }
                    %>
                </li>
                <%
                    for (Category category : DB.CATEGORIES) {
                %>
                <li>
                    <%
                        if (catId.equals(category.getId())) {
                    %>
                    <a href="/category/choose?catId=<%= category.getId() %>" class="btn btn-primary w-100">
                        <%= category.getName() %>
                    </a>
                    <%
                    } else {
                    %>
                    <a href="/category/choose?catId=<%= category.getId() %>" class="btn btn-outline-primary w-100">
                        <%= category.getName() %>
                    </a>
                    <%
                        }
                    %>
                </li>
                <%
                    }
                %>
            </ul>
        </div>

        <div class="col-lg-9">
            <div class="row">
                <%
                    List<Product> products = new ArrayList<>(DB.PRODUCTS);
                    if (catId != 0) {
                        products = DB.PRODUCTS.stream()
                                .filter(product -> product.getCategoryId().equals(catId))
                                .toList();
                    }
                    for (Product product : products) {
                %>
                <div class="col-md-4 mb-4">
                    <div class="product-card">
                        <img src="/img/<%= product.getId() %>" alt="Product Image" class="w-100">
                        <h5 class="mt-2"><%= product.getName() %>
                        </h5>
                        <p>$<%= product.getPrice() %>
                        </p>
                        <%
                            if (basket.getBasket().containsKey(product)) {
                        %>
                        <form action="/basket/add" method="post">
                            <button class="btn btn-success btn-block" name="productId" value="<%=product.getId()%>">
                                Selected
                            </button>
                        </form>
                        <%
                        } else {
                        %>
                        <form action="/basket/add" method="post">
                            <button class="btn btn-primary btn-block" name="productId" value="<%=product.getId()%>">
                                Select
                            </button>
                        </form>
                        <%
                            }
                        %>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
