<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="model.item" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Item</title>
    <link rel="stylesheet" href="CSS/add_item.css">
    <script defer src="JS/update_item.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

<div class="form-container">
    <!-- Left: Image -->
    <div class="form-image">
        <%
            item itemData = (item) request.getAttribute("item");
            byte[] imageBytes = (itemData != null) ? itemData.getI_image() : null;
            String base64Image = (imageBytes != null) ? Base64.getEncoder().encodeToString(imageBytes) : null;
            String imageSrc = (base64Image != null) ? "data:image/jpeg;base64," + base64Image : "image/default_item.jpg";
        %>
        <img id="itemPreview" src="<%= imageSrc %>" alt="Item Image">
    </div>

    <!-- Right: Form -->
    <div class="form-content">
        <h2><i class="fas fa-box"></i> Update Item</h2>
        <br>

        <form method="post" action="updateItem" enctype="multipart/form-data">
            <input type="hidden" name="i_id" value="<%= itemData.getI_id() %>">

            <div class="input-group">
                <label for="iname"><i class="fas fa-tag"></i> Item Name</label>
                <input type="text" name="iname" id="iname" value="<%= itemData.getI_name() %>" required>
            </div>

            <div class="input-group">
                <label for="itype"><i class="fas fa-cubes"></i> Item Type</label>
                <input type="text" name="itype" id="itype" value="<%= itemData.getI_type() %>" required>
            </div>

            <div class="input-group">
                <label for="iqty"><i class="fas fa-sort-numeric-up"></i> Quantity</label>
                <input type="number" name="iqty" id="iqty" value="<%= itemData.getI_qty() %>" required>
            </div>

            <div class="input-group">
                <label for="iprice"><i class="fas fa-dollar-sign"></i> Price</label>
                <input type="text" name="iprice" id="iprice" value="<%= itemData.getI_price() %>" required>
            </div>

            <div class="input-group">
                <label for="iimage"><i class="fas fa-image"></i> Upload New Image (Optional)</label>
                <input type="file" name="iimage" id="iimage" accept="image/*" onchange="previewImage(event)">
            </div>

            <br>
            <button type="submit" class="submit-btn"><i class="fas fa-save"></i> Update</button>
        </form>
    </div>
</div>

<script>
    function previewImage(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function () {
                document.getElementById('itemPreview').src = reader.result;
            };
            reader.readAsDataURL(file);
        }
    }
</script>

</body>
</html>
