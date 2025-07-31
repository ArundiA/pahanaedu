<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <li><a href="manageitem.jsp"><i class="fa-solid fa-car"></i> Manage Vehicals</a></li>
            <li><a href="adminviewbooking.jsp"><i class="fas fa-book"></i> All Bookings</a></li>
            <li><a href="adminlogout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>

    <div class="main-content">
    <header>
        <h2><i class="fas fa-users"></i> Manage Customers</h2>
    </header>

    <div class="user-container">
        <div class="header-row">
            <h3>Customer Management</h3>
            <div style="display: flex; gap: 10px;">
                <form action="addcustomers.jsp" method="get">
                    <button type="submit" class="add-user-btn"><i class="fas fa-user-plus"></i> Add Customer</button>
                </form>
                <form action="manageCustomers" method="post">
                    <button type="submit" class="add-user-btn"><i class="fas fa-eye"></i> View All</button>
                </form>
            </div>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Unit</th>
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
                                <td>${cus.c_phone}</td>
                                <td>${cus.c_email}</td>
                                <td>${cus.c_unit}</td>
                                <td class="action-btns">
                                    <form action="deleteCustomer" method="post" style="display:inline;">
									    <input type="hidden" name="cid" value="${cus.c_id}">
									    <button type="submit" class="delete-btn"><i class="fas fa-trash"></i> Delete</button>
									</form>

                                    <form action="updateCustomers.jsp" method="get" style="display:inline;">
                                        <input type="hidden" name="cid" value="${cus.c_id}">
                                        <button type="submit" class="edit-btn"><i class="fas fa-edit"></i> Update</button>
                                    </form>

                                   
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr><td colspan="7">No customers found.</td></tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
