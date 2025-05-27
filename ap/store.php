<?php include("mysqli_connect.php"); ?>

<main id="store-section" class="main-section" style="display: none;">
    <div class="head-title">
        <div class="left" style="width: 100%;">
            <h1 style="text-align: center;">My Store</h1>
            <div class="store-nav">
                <button class="store-tab active" onclick="showCategory('base')">Base Foods</button>
                <button class="store-tab" onclick="showCategory('beverage')">Beverages</button>
                <button class="store-tab" onclick="showCategory('addon')">Add Ons</button>
                <button class="store-tab" onclick="showCategory('add')">Add Product</button>

            </div>

        </div>
        <!-- <button onclick="location.href='add_product_form.php'" class="btn-download">
            <i class='bx bx-plus'></i> Add Product
        </button> -->
    </div>

    <div id="base" class="table-data category-section" style="margin-top: 0;">
        <div class="table-data" style="padding-top:0;">
            <div class="order">
                <h2 style="text-align: center; margin-bottom: 24px; color: #fc921b;">Base Foods</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th><th>Price</th><th>Available</th><th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                    $query = "SELECT * FROM base_foods";
                    $result = $dbcon->query($query);
                    while($row = $result->fetch_assoc()):
                    ?>
                    <tr>
                        <td><?= htmlspecialchars($row['name']) ?></td>
                        <td>₱<?= number_format($row['price'], 2) ?></td>
                        <td><?= $row['is_available'] ? 'Yes' : 'No' ?></td>
                        <td>
                            <a href="edit_product_form.php?id=<?= $row['basefood_id'] ?>">Edit</a> |
                            <a href="#" onclick="event.preventDefault(); openDeleteModal('<?= $row['basefood_id'] ?>', 'base_foods')">Delete</a>
                        </td>
                    </tr>
                    <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div id="beverage" class="table-data category-section" style="display: none;">
        <div class="table-data" style="padding-top:0;">
            <div class="order">
                <h2 style="text-align: center; margin-bottom: 24px; color: #fc921b;">Beverages</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th><th>Price</th><th>Available</th><th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                    $query = "SELECT * FROM beverages";
                    $result = $dbcon->query($query);
                    while($row = $result->fetch_assoc()):
                    ?>
                    <tr>
                        <td><?= htmlspecialchars($row['name']) ?></td>
                        <td>₱<?= number_format($row['price'], 2) ?></td>
                        <td><?= $row['is_available'] ? 'Yes' : 'No' ?></td>
                        <td>
                            <a href="edit_product_form.php?id=<?= $row['beverage_id'] ?>">Edit</a> |
                            <a href="#" onclick="event.preventDefault(); openDeleteModal('<?= $row['beverage_id'] ?>', 'beverages')">Delete</a>
                        </td>
                    </tr>
                    <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
                    
    <div id="addon" class="table-data category-section" style="display: none;">
        <div class="table-data" style="padding-top:0;">
            <div class="order">
                <h2 style="text-align: center; margin-bottom: 24px; color: #fc921b;">Add Ons</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th><th>Price</th><th>Available</th><th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                    $query = "SELECT * FROM addons";
                    $result = $dbcon->query($query);
                    while($row = $result->fetch_assoc()):
                    ?>
                    <tr>
                        <td><?= htmlspecialchars($row['name']) ?></td>
                        <td>₱<?= number_format($row['price'], 2) ?></td>
                        <td><?= $row['is_available'] ? 'Yes' : 'No' ?></td>
                        <td>
                            <a href="edit_product_form.php?id=<?= $row['addon_id'] ?>">Edit</a> |
                            <a href="#" onclick="event.preventDefault(); openDeleteModal('<?= $row['addon_id'] ?>', 'addons')">Delete</a>
                        </td>
                    </tr>
                    <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div id="add" class="table-data category-section" style="display: none;">
        <div class="table-data" style="padding-top:0;">
            <div class="order">
                <h2 style="text-align: center; margin-bottom: 24px; color: #fc921b;">Add Product</h2>
            </div>
        </div>
        <!-- ADD PRODUCT -->
    </div>

</main>

<!-- Delete Confirmation Modal -->
<div id="deleteModal" class="modal">
    <div style="background:#fff; padding:20px; text-align:center; min-width: 300px;">
        <h3>Are you sure you want to delete this item?</h3>
        <form method="POST" action="actions/delete_product.php">
            <input type="hidden" name="id" id="deleteId">
            <input type="hidden" name="table" id="deleteTable">
            <button type="submit">Yes, Delete</button>
            <button type="button" onclick="closeDeleteModal()">Cancel</button>
        </form>
    </div>
</div>

<script src="/Kalye-Co/js/admin.js"></script>