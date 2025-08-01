<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Order</title>
    <link rel="stylesheet" href="CSS/add_customer.css">
    <script defer src="JS/add_order.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script>
        function updateTotal() {
            const unitPrice = parseFloat(document.getElementById("price").value) || 0;
            const quantity = parseInt(document.getElementById("quantity").value) || 0;
            document.getElementById("total").value = (unitPrice * quantity).toFixed(2);
        }
    </script>
</head>
<body>

    <div class="form-container">
        <!-- Left Side Image -->
        <div class="form-image">
            <img src="image/addorder.png" alt="Order">
        </div>

        <!-- Right Side Form -->
        <div class="form-content">
            <h2><i class="fas fa-receipt"></i> Add Order</h2>
            <br>

            <form method="post" action="addOrders">

                <!-- Customer Name -->
                <div class="input-group">
                    <label for="cname"><i class="fas fa-user"></i> Customer Name</label>
                    <input type="text" name="cname" id="cname" placeholder="Enter customer name" required>
                </div>

                <!-- Customer Email -->
                <div class="input-group">
                    <label for="cemail"><i class="fas fa-envelope"></i> Email</label>
                    <input type="email" name="cemail" id="cemail" placeholder="Enter email address" required>
                </div>

                <!-- Item Name (Manual Entry) -->
                <div class="input-group">
                    <label for="iname"><i class="fas fa-box"></i> Item Name</label>
                    <input type="text" name="iname" id="iname" placeholder="Enter item name" required>
                </div>

                <!-- Price -->
                <div class="input-group">
                    <label for="price"><i class="fas fa-tag"></i> Unit Price (Rs)</label>
                    <input type="number" name="price" id="price" step="0.01" required oninput="updateTotal()">
                </div>

                <!-- Quantity -->
                <div class="input-group">
                    <label for="quantity"><i class="fas fa-sort-numeric-up"></i> Quantity</label>
                    <input type="number" name="quantity" id="quantity" min="1" value="1" required oninput="updateTotal()">
                </div>

                <!-- Total Price -->
                <div class="input-group">
                    <label for="total"><i class="fas fa-money-bill-wave"></i> Total Price (Rs)</label>
                    <input type="text" name="total" id="total" readonly>
                </div>

                <br>

                <button type="submit" value="Place Order" class="submit-btn">
                    <i class="fas fa-save"></i> Place Order
                </button>
            </form>
        </div>
    </div>

</body>
</html>
