<?php include("mysqli_connect.php"); ?>

<form action="actions/add_product.php" method="post" enctype="multipart/form-data">
    
    <!-- Category First -->
    <label>Category: 
        <select name="category" id="category_select" required>
            <option value="">-- Select Category --</option>
            <option value="base_foods">Base Food</option>
            <option value="beverages">Beverage</option>
            <option value="addons">Add-on</option>
        </select>
    </label><br>

    <label>Name: <input type="text" name="name" required></label><br>

    <!-- Description only for base food -->
    <div id="description_wrapper" style="display:none;">
        <label>Description: 
            <textarea name="description" id="description_field"></textarea>
        </label><br>
    </div>

    <label>Price: <input type="number" step="0.01" name="price" required></label><br>

    <label>Image: <input type="file" name="image"></label><br>

    <!-- Add-on base food selection -->
    <div id="addon_type_wrapper" style="display:none;">
        <label>Add-on for:
            <select name="basefood_type">
                <option value="">-- Select Base Food --</option>
                <option value="lugaw">Lugaw</option>
                <option value="mami">Mami</option>
                <option value="pares">Pares</option>
                <option value="lomi">Lomi</option>
            </select>
        </label><br>
    </div>

    <button type="submit">Add Product</button>
</form>

<script>
const categorySelect = document.getElementById("category_select");
const descriptionWrapper = document.getElementById("description_wrapper");
const addonWrapper = document.getElementById("addon_type_wrapper");

categorySelect.addEventListener("change", function () {
    const category = this.value;

    // Show description only for base_foods
    descriptionWrapper.style.display = category === "base_foods" ? "block" : "none";

    // Show basefood_type selector only for addons
    addonWrapper.style.display = category === "addons" ? "block" : "none";
});
</script>
