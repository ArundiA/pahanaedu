<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Item</title>
    <link rel="stylesheet" href="CSS/add_customer.css">
    <script defer src="JS/add_customer.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

    <div class="form-container">
        <!-- Left Side Image -->
		<div class="form-image">
		    <img id="itemPreview" src="image/additem.png" alt="Add Item">
		</div>


        <!-- Right Side Form -->
        <div class="form-content">
            <h2><i class="fas fa-boxes-stacked"></i> Add Item</h2>
            <br>

            <form method="post" action="addItem" enctype="multipart/form-data">

                <div class="input-group">
                    <label for="iname"><i class="fas fa-box"></i> Item Name</label>
                    <input type="text" name="iname" id="iname" placeholder="Enter item name" required>
                </div>

                <div class="input-group">
                    <label for="itype"><i class="fas fa-tags"></i> Item Type</label>
                    <input type="text" name="itype" id="itype" placeholder="Enter item type" required>
                </div>

                <div class="input-group">
                    <label for="iqty"><i class="fas fa-sort-numeric-up-alt"></i> Quantity</label>
                    <input type="number" name="iqty" id="iqty" placeholder="Enter quantity" required>
                </div>

                <div class="input-group">
                    <label for="iprice"><i class="fas fa-dollar-sign"></i> Price</label>
                    <input type="text" name="iprice" id="iprice" placeholder="Enter price" required>
                </div>

                <div class="input-group">
				    <label for="iimage"><i class="fas fa-image"></i> Item Image</label>
				    <input type="file" name="iimage" id="iimage" accept="image/*" required onchange="previewImage(event)">
				</div>


                <br>

                <button type="submit" class="submit-btn"><i class="fas fa-save"></i> ADD</button>
            </form>
        </div>
    </div>

</body>
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

</html>

