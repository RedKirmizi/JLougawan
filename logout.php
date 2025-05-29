<?php
session_start();
// Destroy session or logout logic here
session_destroy();

// Start session again to set message
session_start();
$_SESSION['logout_message'] = "You have successfully logged out.";
header("Location: /Kalye-Co/index.php");
exit();
?>
