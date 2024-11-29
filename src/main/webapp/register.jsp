<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register Page</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(to right, #4facfe, #00f2fe);
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      font-family: Arial, sans-serif;
      margin: 0;
    }
    .register-card {
      background-color: white;
      border-radius: 15px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      padding: 30px;
      width: 100%;
      max-width: 500px;
    }
    .btn-primary {
      background-color: #4facfe;
      border: none;
    }
    .btn-primary:hover {
      background-color: #3a9de0;
    }
    .form-control {
      border-radius: 10px;
    }
  </style>
</head>
<body>

<div class="register-card">
  <h2 class="text-center fw-bold mb-4">Register</h2>
  <form action="/user/register" method="post" enctype="multipart/form-data">
    <div class="mb-3">
      <label for="firstName" class="form-label">First Name</label>
      <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter your first name" required>
    </div>
    <div class="mb-3">
      <label for="lastName" class="form-label">Last Name</label>
      <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter your last name" required>
    </div>
    <div class="mb-3">
      <label for="username" class="form-label">Username</label>
      <input type="text" class="form-control" id="username" name="username" placeholder="Create a username" required>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control" id="password" name="password" placeholder="Create a password" required>
    </div>
    <div class="mb-3">
      <label for="confirmPassword" class="form-label">Confirm Password</label>
      <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
    </div>
    <div class="mb-3">
      <label for="profilePicture" class="form-label">Profile Picture</label>
      <input type="file" class="form-control" id="profilePicture" name="profilePicture">
    </div>
    <button type="submit" class="btn btn-primary w-100">Sign Up</button>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
