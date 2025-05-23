<?php include("mysqli_connect.php"); ?>

<main id="store-section" class="main-section" style="display: none;">
    <div class="head-title">
        <div class="left">
            <h1>My Store</h1>
        </div>
        <button onclick="location.href='add_product_form.php'" class="btn-download">
            <i class='bx bx-plus'></i> Add Product
        </button>
    </div>

    <div class="table-data">
        <div class="order">
            <h3>Base Foods</h3>
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
                        <a href="actions/delete_product.php?id=<?= $row['basefood_id'] ?>" onclick="return confirm('Delete?')">Delete</a>
                    </td>
                </tr>
                <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    </div>
</main>
