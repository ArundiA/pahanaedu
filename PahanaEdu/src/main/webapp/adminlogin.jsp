<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login | Pahana Edu</title>
  <link rel="stylesheet" href="CSS/adminlogin_styles.css">
</head>
<body>
  <div class="container">
    <!-- Title section -->
    <div class="title">Admin Login</div>
    
    <div class="content">
      <form action="adminlogin" method="post">
        <div class="user-details">

          <div class="input-box">
            <span class="details">Username</span>
            <input type="email" name="aemail" placeholder="Enter your email or username" required>
          </div>

          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" name="apassword" placeholder="Enter your password" required>
          </div>
        </div>

        
        <!-- Submit button -->
        <div class="button">
          <input type="submit" value="Login">
        </div>
      </form>
    </div>
  </div>
</body>
</html>