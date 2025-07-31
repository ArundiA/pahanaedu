<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link rel="stylesheet" href="CSS/managecustomers.css">
    <script defer src="JS/managecustomers.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

    <div class="sidebar">
        <h2 class="logo"><i class="fas fa-user-shield"></i> Admin Panel</h2>
        <ul>
            <li><a href="adminhome.jsp"><i class="fas fa-chart-line"></i> Dashboard</a></li>
            <li><a href="manageusers.jsp" class="active"><i class="fas fa-users"></i> Manage Users</a></li>
            <li><a href="managedrivers.jsp"><i class="fa-solid fa-user-plus"></i> Manage Drivers</a></li>
            <li><a href="managevehicals.jsp"><i class="fa-solid fa-car"></i> Manage Vehicals</a></li>
            <li><a href="adminviewbooking.jsp" ><i class="fas fa-book"></i> All Bookings</a></li>
            <li><a href="adminlogout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>

    <div class="main-content">
        <header>
            <h2><i class="fas fa-users"></i> Manage Users</h2>
            <button id="toggleMenu"><i class="fas fa-bars"></i></button>
        </header>

        <div class="user-container">
            <div class="header-row">
                <h3>User Management</h3>
                <form action="manageUsers" method="post">
                <button type="submit" class="add-user-btn">View</button>
                </form>
                
            </div>
            
            

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>NIC</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                
                <tbody>
				    <c:choose>
				        <c:when test="${not empty customer}">
				            <c:forEach var="cus" items="${customer}">
				                <tr>
				                    <td>${cus.c_id}</td>
				                    <td>${cus.c_name}</td>
				                    <td>${cus.c_address}</td>
				                    <td>${cus.c_nic}</td>
				                    <td>${cus.c_phone}</td>
				                    <td>${cus.c_email}</td>
				                    <td>
				                        <form action="deleteUsers" method="post">
				                            <input type="hidden" name="email" value="${cus.c_email}">
				                            <button type="submit" class="delete-btn"><i class="fas fa-trash"></i> Delete</button>
				                        </form>
				                    </td>
				                </tr>
				            </c:forEach>
				        </c:when>
				    </c:choose>
				</tbody>
            </table>
        </div>
    </div>

</body>
</html>
