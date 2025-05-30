<?php
include("../mysqli_connect.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];

    $stmt = $dbcon->prepare("DELETE FROM users WHERE user_id = ?");
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "success";  // <-- Return plain success message
    } else {
        echo "Error deleting user.";
    }
}
?>
