<!DOCTYPE html>
<?php
    if(session_status() == PHP_SESSION_NONE) {
        session_start();
    }
    if(!isSet($_SESSION["type"]) || $_SESSION["type"] == "user") {
        header("location:index.php");
    }
?>
<html lang="">
<head>
    <meta charset="utf-8">
    <link href="css/sitestyle.css" rel="stylesheet" type="text/css" />
    <title>User Manager</title>
</head>

<body>
    <!--Header-->
    <header>
        <img src="images/ratbanner.png" alt="Rodent Store Banner" />
    </header>
    
    <!--Navigation-->
    <nav>
        <ul>
            <li><p><strong>Admin Navigation</strong></p></li>
            <li><a href="index.php">Back To Store</a></li>
            <li><a href="administration.php">Admin Page</a></li>
            <li><a href="inventorymanager.php">Inventory Management</a></li>
            <li><a href="usermanager.php">User Management</a></li>
        </ul>
    </nav>
    
    <div class="main">
        
    </div>
</body>
</html>
