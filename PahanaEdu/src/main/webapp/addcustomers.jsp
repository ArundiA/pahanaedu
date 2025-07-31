<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Customer</title>
    <link rel="stylesheet" href="CSS/add_customer.css">
    <script defer src="JS/add_customer.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

    <div class="form-container">
        <!-- Left Side Image -->
        <div class="form-image">
            <img src="image/addcus.png" alt="Customer">
        </div>

        <!-- Right Side Form -->
        <div class="form-content">
            <h2><i class="fas fa-user-plus"></i> Add Customer</h2>
            <br>

            <form method="post" action="addCustomer">
                
                <div class="input-group">
                    <label for="cname"><i class="fas fa-user"></i> Full Name</label>
                    <input type="text" name="cname" id="cname" placeholder="Enter full name" required>
                </div>

                <div class="input-group">
                    <label for="caddress"><i class="fas fa-map-marker-alt"></i> Address</label>
                    <input type="text" name="caddress" id="caddress" placeholder="Enter address" required>
                </div>

                <div class="input-group">
                    <label for="cphone"><i class="fas fa-phone"></i> Phone</label>
                    <input type="text" name="cphone" id="cphone" placeholder="Enter phone number" required>
                </div>

                <div class="input-group">
                    <label for="cemail"><i class="fas fa-envelope"></i> Email</label>
                    <input type="email" name="cemail" id="cemail" placeholder="Enter email address" required>
                </div>

                <!-- ✅ Hidden c_unit default -->
                <input type="hidden" name="cunit" value="0">

                <br>

                <button type="submit" value="Register" class="submit-btn"><i class="fas fa-save"></i> ADD</button>
            </form>
        </div>
    </div>

</body>
</html>
