<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Orders</title>
    <link rel="stylesheet" href="CSS/manageorder.css">
    <script defer src="JS/manage_orders.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        
        }
        .pdf-btn {
            background-color: #c82333;
        }
        .pdf-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <h2 class="logo"><i class="fas fa-book-open"></i> Pahana Edu</h2>
        <ul>
            <li><a href="adminhome.jsp"><i class="fas fa-chart-line"></i> Dashboard</a></li>
            <li><a href="managecustomers.jsp"><i class="fas fa-users"></i> Manage Customers</a></li>
            <li><a href="manageitem.jsp"><i class="fa-solid fa-boxes-stacked"></i> Manage Items</a></li>
            <li><a href="manageorders.jsp" class="active"><i class="fas fa-receipt"></i> Manage Orders</a></li>
            <li><a href="help.jsp" ><i class="fas fa-question-circle"></i> Help</a></li>
            <li><a href="adminlogout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>

    <div class="main-content">
        <header>
            <h2><i class="fas fa-receipt"></i> Manage Orders</h2>
            <button id="toggleMenu"><i class="fas fa-bars"></i></button>
        </header>

        <div class="booking-container">
            <div class="header-row">
                <h3>All Orders</h3>
                <div style="display: flex; gap: 10px;">
                	<form action="addOrders" method="post">
                        <button type="submit" class="view-bookings-btn" style="background-color: #28a745;">
                            <i class="fas fa-plus"></i> Add Order
                        </button>
                    </form>
                    <form action="manageOrders" method="post">
                        <button type="submit" class="view-bookings-btn"><i class="fas fa-eye"></i> View Orders</button>
                    </form>
                    
                </div>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th>Email</th>
                        <th>Item Name</th>
                        <th>Quantity</th>
                        <th>Item Price</th>
                        <th>Total</th>
                        <th>Print Bill</th> <!-- ✅ New column -->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ord" items="${orders}">
                        <tr>
                            <td>${ord.o_id}</td>
                            <td>${ord.c_name}</td>
                            <td>${ord.c_email}</td>
                            <td>${ord.i_name}</td>
                            <td>${ord.i_qty}</td>
                            <td>${ord.i_price}</td>
                            <td>${ord.o_total}</td>
                            <td>
                                <form method="post" action="DownloadBillPDF">
                                    <input type="hidden" name="o_id" value="${ord.o_id}" />
                                    <button type="submit" class="view-bookings-btn pdf-btn">
                                        <i class="fas fa-file-pdf"></i> PDF
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
