<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    HttpSession sessionObj = request.getSession(false);

    // Redirect to login page if session is invalid or admin is not logged in
    if (sessionObj == null || sessionObj.getAttribute("loggedInAdmin") == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }

    // Retrieve admin details
    String adminName = (String) sessionObj.getAttribute("loggedInAdmin");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="CSS/admin_homes.css">
    <script defer src="JS/admin_home.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="sidebar">
        <h2 class="logo"><i class="fas fa-user-shield"></i> Admin Panel</h2>
        <ul>
            <li><a href="adminhome.jsp" class="active"><i class="fas fa-chart-line"></i> Dashboard</a></li>
            <li><a href="managecustomers.jsp"><i class="fas fa-users"></i>Manage Customers</a></li>
            <li><a href="managevehicals.jsp"><i class="fa-solid fa-car"></i> Manage Item</a></li>
            <li><a href="adminviewbooking.jsp"><i class="fas fa-book"></i> All Orders</a></li>
            <li><a href="adminlogin.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>

    <div class="main-content">
        <header>
            <h2><i class="fas fa-chart-line"></i> Dashboard</h2>
            <button id="toggleMenu"><i class="fas fa-bars"></i></button>
        </header>
        
        <div class="cards">
            <div class="card">
                <i class="fas fa-users"></i>
                <h3>Total Customer</h3>
                <p></p>
            </div>
            <div class="card">
                <i class="fas fa-shopping-cart"></i>
                <h3>Total Orders</h3>
                <p></p>
            </div>
            <div class="card">
                <i class="fas fa-dollar-sign"></i>
                <h3>Revenue</h3>
                <p></p>
            </div>
            <div class="card">
                <i class="fas fa-comments"></i>
                <h3>Feedback</h3>
                <p></p>
            </div>
        </div>
    </div>
</body>
</html>
