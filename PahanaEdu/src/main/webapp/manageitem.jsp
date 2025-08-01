<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Items</title>
    <link rel="stylesheet" href="CSS/manageitem.css">
    <script defer src="JS/manageitems.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

    <div class="sidebar">
        <h2 class="logo"><i class="fas fa-user-shield"></i> Admin Panel</h2>
        <ul>
            <li><a href="adminhome.jsp"><i class="fas fa-chart-line"></i> Dashboard</a></li>
            <li><a href="managecustomers.jsp"><i class="fas fa-users"></i> Manage Customers</a></li>
            <li><a href="manageitems.jsp" class="active"><i class="fa-solid fa-boxes-stacked"></i> Manage Items</a></li>
            <li><a href="manageorders.jsp"><i class="fas fa-receipt"></i> Manage Orders</a></li>
            <li><a href="adminlogout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>

    <div class="main-content">
        <header>
            <h2><i class="fa-solid fa-boxes-stacked"></i> Manage Items</h2>
            <button id="toggleMenu"><i class="fas fa-bars"></i></button>
        </header>

        <div class="user-container">
            <div class="header-row">
                <h3>Item Management</h3>
                <button class="add-user-btn" onclick="location.href='additem.jsp'">
                    <i class="fa-solid fa-plus"></i> Add Item
                </button>
                <form action="manageItems" method="post">
                    <button type="submit" class="add-user-btn">View</button>
                </form>
            </div>
            
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Image</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                
                <tbody>
                    <c:choose>
                        <c:when test="${not empty itemList}">
                            <c:forEach var="item" items="${itemList}">
                                <tr>
                                    <td>${item.i_id}</td>
                                    <td>${item.i_name}</td>
                                    <td>${item.i_type}</td>
                                    <td>
                                        <c:if test="${not empty item.i_image}">
                                            <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(item.i_image)}" width="100" height="100">
                                        </c:if>
                                        <c:if test="${empty item.i_image}">
                                            No Image
                                        </c:if>
                                    </td>
                                    <td>${item.i_qty}</td>
                                    <td>${item.i_price}</td>
                                    <td class="button-container">
                                        <form action="updateItem" method="post">
                                            <input type="hidden" name="id" value="${item.i_id}">
                                            <input type="hidden" name="name" value="${item.i_name}">
                                            <input type="hidden" name="type" value="${item.i_type}">
                                            <input type="hidden" name="qty" value="${item.i_qty}">
                                            <input type="hidden" name="price" value="${item.i_price}">
                                            <button class="edit-btn"><i class="fas fa-edit"></i> Update</button>
                                        </form>
                                        <form action="deleteItem" method="post" onsubmit="return confirm('Are you sure you want to delete this item?');">
                                            <input type="hidden" name="id" value="${item.i_id}">
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
