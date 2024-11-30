
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <title>Add Category</title>
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
  </style>
</head>
<body>

<div class="container form-container">
  <h1 class="text-center text-primary mb-4">Add New Category</h1>
  <form action="/save-category" method="post">
    <div class="mb-3">
      <label for="categoryName" class="form-label">Category Name</label>
      <input type="text" class="form-control" id="categoryName" name="categoryName"
             placeholder="Enter category name" required>
    </div>
    <div class="d-flex justify-content-end">
      <button type="submit" class="btn btn-success">Add Category</button>
    </div>
  </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qyrTcCU6q2XlKuvz19gW/4URGRxJTjBSozZn7f4Md3O9QxkEXZOIEvsR7BxCL8x9" crossorigin="anonymous"></script>
</body>
</html>
