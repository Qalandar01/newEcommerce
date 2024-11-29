<%@ page import="org.example.demo5.db.DB" %>
<%@ page import="org.example.demo5.entity.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Admin Page</title>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .table-container {
            margin-top: 50px;
        }
        .add-category-btn {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container table-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="text-primary">Admin - Manage Categories</h1>
        <form action="/admin/orders.jsp">
            <button class="btn btn-primary">Orders(
                <%=DB.ORDERS.size()%>
                )
            </button>
        </form>
        <form action="/admin/add-category.jsp" method="post">
            <button type="submit" class="btn btn-success btn-lg add-category-btn">
                Add Category
            </button>
        </form>
    </div>
    <table class="table table-striped table-hover">
        <thead class="table-dark">
        <tr>
            <th>Category Name</th>
            <th>Category ID</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <% for (Category category : DB.CATEGORIES) { %>
        <tr>
            <td><%= category.getName() %></td>
            <td><%= category.getId() %></td>
            <td>
                <form action="/select?categoryId=<%= category.getId() %>" method="post" class="d-inline">
                    <button class="btn btn-primary btn-sm">
                        Select
                    </button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qyrTcCU6q2XlKuvz19gW/4URGRxJTjBSozZn7f4Md3O9QxkEXZOIEvsR7BxCL8x9" crossorigin="anonymous"></script>
</body>
</html>
