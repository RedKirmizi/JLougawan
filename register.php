<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Kalye Co. - Register</title>

    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <!-- My CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/register.css">


</head>
<body>
    <?php include 'header.php'; ?>

    <?php
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            //error array to store all errors
            $errors = array();
            //may nilagay ba na first name?
            if(empty($_POST['fname'])){
                $errors[] = 'Please input your first name.';
            }else{
                $fn = trim($_POST['fname']);
            }
            //check if last name nd email is empty
            if (empty($_POST['lname'])) {
                $errors[] = 'Please input your last name.';
            } else {
                $ln = trim($_POST['lname']);
            }

            // Check if the email is provided
            if (empty($_POST['email'])) {
                $errors[] = 'Please input your email.';
            } else {
                $e = trim($_POST['email']);
            }
            //parehas be ung password at repeat password?
            // Check if passwords are not empty and match
            if (!empty($_POST['psword1']) && !empty($_POST['psword2'])) {
                if ($_POST['psword1'] != $_POST['psword2']) {
                    $errors[] = 'Your passwords do not match.';
                } else {
                    $p = trim($_POST['psword1']);
                }
            } else {
                $errors[] = 'Please input your password.';
            }

            //all fields are successful
            if (empty($errors)) {
                require("mysqli_connect.php");
                $hashed = hash('sha512', $p);
                $q = "insert into users(fname, lname, email, psword, registration_date) values ('$fn', '$ln', '$e', '$hashed', NOW() );";
                $result = @mysqli_query($dbcon, $q);
                if ($result){ // kung true
                    header("location: register-success.php");
                    exit();
                } else { // kung not true, kaw kasi e
                    echo '
                    <h2>System Error</h2> 
                    <p class="error">Your registration failed due to an unexpected error. Sorry for the inconvenience</p>
                    ';
                    echo '<p>'.mysqli_error($dbcon).'</p>';
                }
                include('footer.php');
                exit();

            }else{     //errors occured. must display.
                echo '<h2>Error!</h2>
                <p class="error">The following error(s) occured:<br/>' ;
                foreach($errors as $msg) {
                    echo " - $msg<br/>\n";
                }
                echo '</p><h3>Please Try again.</h3><br/></br>';
            }
        }
    ?>
    <main>
        <div class="content" id="register-page">
            <div class="title">
                <h2> Your Bowl,<br>Your <span style="color: #fc921b">Rules</span>.</h2>
                <p class="description">Make it spicy, extra eggy, or all the toppings! Register now and customize every bowl to match your cravings.</p>
                    
                <p class="description">Already have an account? Login <a href="login.php">Here</a>.</p>
            </div>
            
            
            <div id="reg-form-div">
                <form autocomplete="off" action="Register.php" method="post">
                    <h2>Register</h2>
                    <div class="register-inputs">
                        <label>First Name:</label><br>
                        <input required type="text" id="fname" name="fname" placeholder="Enter your first name" size="30" maxlength="40" value="<?php if(isset($_POST['fname'])) echo $_POST['fname'];?>"><br>

                        <label>Last Name:</label><br>
                        <input required type="text" id="lname" name="lname" placeholder="Enter your last name" size="30" maxlength="40" value="<?php if(isset($_POST['lname'])) echo $_POST['lname'];?>"><br>

                        <label>Email:</label><br>
                        <input required type="text" id="email" name="email" placeholder="Enter your email" size="30" maxlength="50" value="<?php if(isset($_POST['email'])) echo $_POST['email'];?>"><br>

                        <label>Password:</label><br>
                        <input required type="password" id="psword1" name="psword1" placeholder="Enter your password" size="20" maxlength="40" value="<?php if(isset($_POST['psword1'])) echo $_POST['psword1'];?>"><br>

                        <label>Repeat Password:</label><br>
                        <input required type="password" id="psword2" name="psword2" placeholder="Repeat password" size="20" maxlength="40" value="<?php if(isset($_POST['psword2'])) echo $_POST['psword2'];?>">
                    </div>
                    
                    <div class="submit-button">
                        <input type="submit" id="submit" name="submit" value="Register">
                    </div>
                    
                </form>
                <div id="toastBox"></div>
            </div>

        </div>
	    <?php include("footer.php"); ?>
    </main>