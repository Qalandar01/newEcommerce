<%@ page import="org.example.demo5.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.demo5.db.DB" %>
<%@ page import="java.util.Objects" %>
<%@ page import="static org.example.demo5.servlets.SelectServlet.adminChoosenCatId" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Add Product</title>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .products-container {
            margin-top: 30px;
        }
        .product-card {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="form-container">
        <h1 class="text-center text-primary mb-4">Add New Product</h1>
        <form action="/product/add" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="productImage" class="form-label">Product Image</label>
                <input type="file" class="form-control" id="productImage" name="productImage" required>
            </div>
            <div class="mb-3">
                <label for="productName" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="productName" name="name" placeholder="Enter product name" required>
            </div>
            <div class="mb-3">
                <label for="productPrice" class="form-label">Product Price</label>
                <input type="number" class="form-control" id="productPrice" name="price" placeholder="Enter product price" min="0" step="0.01" required>
            </div>
            <div class="d-flex justify-content-end">
                <button type="submit" class="btn btn-success">Save Product</button>
            </div>
        </form>
    </div>


    <div class="products-container">
        <h2 class="text-center text-secondary mb-4">Products in Selected Category</h2>
        <div class="row">
            <%

                List<Product> relatedProducts = DB.PRODUCTS.stream()
                        .filter(product -> Objects.equals(product.getCategoryId(), adminChoosenCatId))
                        .toList();

                if (relatedProducts.isEmpty()) {
            %>
            <p class="text-center text-muted">No products found in this category.</p>
            <%
            } else {
                for (Product product : relatedProducts) {
            %>
            <div class="col-md-4">
                <div class="card product-card">
                    <img src="/img/<%=product.getId()%>" class="card-img-top" alt="Product Image">
                    <div class="card-body">
                        <h5 class="card-title"><%=product.getName()%></h5>
                        <p class="card-text">$<%=product.getPrice()%></p>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qyrTcCU6q2XlKuvz19gW/4URGRxJTjBSozZn7f4Md3O9QxkEXZOIEvsR7BxCL8x9" crossorigin="anonymous"></script>
</body>
</html>
