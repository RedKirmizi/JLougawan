<!-- edit_product_form.php (updated) -->
<?php
include("mysqli_connect.php");

$id = $_GET['id'] ?? null;
$category = $_GET['category'] ?? null;

if (!$id || !$category) {
    die("Missing ID or category.");
}

$allowed = ['base_foods', 'beverages', 'addons'];
if (!in_array($category, $allowed)) {
    die("Invalid category.");
}

$pk = match ($category) {
    'base_foods' => 'basefood_id',
    'beverages' => 'beverage_id',
    'addons' => 'addon_id',
};

$query = "SELECT * FROM $category WHERE $pk = ?";
$stmt = $dbcon->prepare($query);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    die("Product not found.");
}

$product = $result->fetch_assoc();
?>

<div class="modal-wrapper">
    <div class="modal-header">
        <h2>Edit Product</h2>
        <button class="modal-close-btn" onclick="document.getElementById('editProductModal').style.display='none'">&times;</button>
    </div>

    <form class="modal-form" action="actions/update_product.php" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<?= $id ?>">
        <input type="hidden" name="category" value="<?= htmlspecialchars($category) ?>">

        <label for="edit_name">Name:
            <input id="edit_name" type="text" name="name" required value="<?= htmlspecialchars($product['name']) ?>">
        </label>

        <?php if ($category === 'base_foods'): ?>
            <label for="edit_description">Description:
                <textarea id="edit_description" name="description"><?= htmlspecialchars($product['description']) ?></textarea>
            </label>
        <?php endif; ?>

        <label for="edit_price">Price:
            <input id="edit_price" type="number" name="price" step="0.01" required value="<?= $product['price'] ?>">
        </label>

        <?php if ($category === 'addons'): ?>
            <label for="edit_basefood">Add-on for:
                <select id="edit_basefood" name="basefood_id" required>
                    <option value="">-- Select Base Food --</option>
                    <?php
                    $q = "SELECT basefood_id, name FROM base_foods WHERE is_available = 1";
                    $res = $dbcon->query($q);
                    while ($row = $res->fetch_assoc()):
                        $selected = ($product['basefood_id'] == $row['basefood_id']) ? 'selected' : '';
                    ?>
                        <option value="<?= $row['basefood_id'] ?>" <?= $selected ?>>
                            <?= htmlspecialchars($row['name']) ?>
                        </option>
                    <?php endwhile; ?>
                </select>
            </label>
        <?php endif; ?>

        <label for="edit_image">Image:
            <input id="edit_image" type="file" name="image">
        </label>
        <?php if (!empty($product['image_url'])): ?>
            <p>Current image:<br>
                <img src="/Kalye-Co/media/menu/<?= htmlspecialchars(basename($product['image_url'])) ?>" alt="Image" width="100">
            </p>
        <?php endif; ?>

        <button type="submit">Update Product</button>
    </form>
</div>
