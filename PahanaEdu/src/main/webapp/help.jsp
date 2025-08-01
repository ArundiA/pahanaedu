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
    <title>Help</title>
    <link rel="stylesheet" href="CSS/help.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="sidebar">
        <h2 class="logo"><i class="fas fa-book-open"></i> Pahana Edu</h2>
        <ul>
            <li><a href="adminhome.jsp"><i class="fas fa-chart-line"></i> Dashboard</a></li>
            <li><a href="managecustomers.jsp"><i class="fas fa-users"></i> Manage Customers</a></li>
            <li><a href="manageitem.jsp"><i class="fas fa-box"></i> Manage Items</a></li>
            <li><a href="manageorders.jsp"><i class="fas fa-receipt"></i> Manage Orders</a></li>
            <li><a href="help.jsp" class="active"><i class="fas fa-question-circle"></i> Help</a></li>
            <li><a href="adminlogout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>

    <div class="main-content">
        <header>
            <h2><i class="fas fa-question-circle"></i> Help & User Guide</h2>
        </header>

        <div class="help-container">
            <section class="help-section">
                <h3><i class="fas fa-sign-in-alt"></i> Logging In</h3>
                <p>Use your admin credentials on the login page to access the system dashboard. If you forget your password, contact the system administrator.</p>
            </section>

            <section class="help-section">
                <h3><i class="fas fa-user-plus"></i> Managing Customers</h3>
                <p>Go to "Manage Customers" to add, edit, or delete customer records. Fill in all required fields carefully when adding new customers.</p>
            </section>

            <section class="help-section">
                <h3><i class="fas fa-box"></i> Managing Items</h3>
                <p>Navigate to "Manage Items" to view all products. Use the “Add Item” button to include new items with name, type, quantity, and price. You can update or delete items anytime.</p>
            </section>

            <section class="help-section">
                <h3><i class="fas fa-receipt"></i> Managing Orders</h3>
                <p>Visit the "Manage Orders" page to monitor customer orders. You can view, print bills, or mark them as completed.</p>
            </section>

            <section class="help-section">
                <h3><i class="fas fa-question"></i> Need More Help?</h3>
                <p>If you face any issues using the system, please contact support@it.com or reach the admin panel's support section.</p>
            </section>
        </div>
    </div>
</body>
</html>
