<%@ page import="org.example.demo5.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Information</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card shadow">
        <div class="card-header bg-primary text-white">
          <h4 class="mb-0">Edit User Information</h4>
        </div>
        <div class="card-body">
          <%
           User user = (User)session.getAttribute("user");
           if (user == null){
             response.sendRedirect("/home.jsp");
             return;
           }
          %>
          <form action="/user/save" method="post">
            <div class="mb-3">
              <label for="firstname" class="form-label">First Name</label>
              <input type="text" class="form-control" id="firstname" name="firstname" value="<%= user.getFirstName() %>" required>
            </div>
            <div class="mb-3">
              <label for="lastname" class="form-label">Last Name</label>
              <input type="text" class="form-control" id="lastname" name="lastname" value="<%= user.getLastName() %>" required>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <input type="password" class="form-control" id="password" name="password" value="<%= user.getPassword() %>" required>
            </div>
            <div class="mb-3">
              <label for="username" class="form-label">Username</label>
              <input type="text" class="form-control" id="username" name="username" value="<%= user.getUserName() %>" required>
            </div>
            <div class="d-flex justify-content-between">
              <button type="submit" class="btn btn-success">Save</button>

            </div>
          </form>
          <form action="/user/logout" method="post">
            <button type="submit" class="btn btn-danger">Log Out</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
