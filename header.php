<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css">

<header style="padding: 15px 0;">
    <div class="header-div" style="padding-left: 3em;">
        <a href="index.php" class="brand-name" style="display: flex; align-items: center; gap: 10px; text-decoration: none;">
            <img src="media/logo.png" alt="Kalye Comfort Logo" style="height: 55px;">
            <span class="brand-name" style="font-size: 1.5em; font-weight: bold;">Kalye Co.</span>
        </a>
    </div>

    <!-- Hamburger Button (mobile only) -->
    <button id="menu-toggle" style="display: none; background: none; border: none; cursor: pointer;">
        <i class='bx bx-menu-wide' style="font-size: 2rem; color: #000;"></i>
    </button>


    <div class="header-div">
        <nav>
            <?php
                $currentPage = basename($_SERVER['PHP_SELF']);

                if ($currentPage === 'admin.php') {
                    echo '';
                } elseif ($currentPage === 'index.php') {
                    echo '<a href="menu.php">Menu</a>';
                    echo '<a href="#about">About</a>';
                    echo '<a href="contact.php">Contact</a>';
                }
            ?>
        </nav>
    </div>

    <div class="header-div" style="padding-right: 3em;">
        <nav>
            <?php
                if ($currentPage === 'index.php') {
                    echo '<a href="register.php">Register</a>';
                    echo '<button id="header-loginBtn"><a href="login.php" style="color: #fff;">Login</a></button>';
                } elseif ($currentPage === 'admin.php') {
                    echo '<a href="logout.php">Logout</a>';
                } elseif ($currentPage === 'menu.php') {
                    echo '<button id="cartBtn" style="background: none; border: none; cursor: pointer;"><img src="media/icons/bag.png" alt="Cart" style="width: 26px; height: 26px;"></button>';
                }

            ?>
        </nav>
    </div>
</header>
