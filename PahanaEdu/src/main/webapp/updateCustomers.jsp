<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Customer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- External Styles & Icons -->
    <link rel="stylesheet" href="CSS/add_customer.css">
    <script defer src="JS/add_customer.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

    <div class="form-container">
        <!-- Left Image -->
        <div class="form-image">
            <img src="image/addcus.png" alt="Customer Image">
        </div>

        <!-- Right Form -->
        <div class="form-content">
            <h2><i class="fas fa-user-edit"></i> Update Customer</h2>
            <br>

            <form method="post" action="updateCustomer">
                <!-- Hidden ID Field -->
                <input type="hidden" name="cid" value="${cus.c_id}" />

                <div class="input-group">
                    <label for="cname"><i class="fas fa-user"></i> Full Name</label>
                    <input type="text" name="cname" id="cname" value="${cus.c_name}" required />
                </div>

                <div class="input-group">
                    <label for="caddress"><i class="fas fa-map-marker-alt"></i> Address</label>
                    <input type="text" name="caddress" id="caddress" value="${cus.c_address}" required />
                </div>

                <div class="input-group">
                    <label for="cphone"><i class="fas fa-phone"></i> Phone</label>
                    <input type="text" name="cphone" id="cphone" value="${cus.c_phone}" required />
                </div>

                <div class="input-group">
                    <label for="cemail"><i class="fas fa-envelope"></i> Email</label>
                    <input type="email" name="cemail" id="cemail" value="${cus.c_email}" required />
                </div>

                <br>
                <button type="submit" class="submit-btn">
                    <i class="fas fa-save"></i> Update
                </button>
            </form>
        </div>
    </div>

</body>
</html>
