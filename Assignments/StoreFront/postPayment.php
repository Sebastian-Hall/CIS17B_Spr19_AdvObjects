<!DOCTYPE html>
<?php
if(session_status() == PHP_SESSION_NONE) {
    session_start();
}
require_once('phpScripts/dropCartScript.php');
?>
<html lang="en-US">

<head>
    <meta charset="utf-8">
    <link href="css/sitestyle.css" rel="stylesheet" />
    <title>Thank You For Your Purchase</title>
</head>

<body>
    <!--Header-->
    <header>
        <img src="images/ratbanner.png" alt="Rodent Store Banner" />
    </header>

    <!--Navigation-->
    <nav>
        <ul>
            <li><p><strong>Site Navigation</strong></p></li>
            <li><a href="index.php">Shop</a></li>
            <li><a href="cart.php">Cart</a></li>
            <?php
            if(!isSet($_SESSION["username"])) {
                echo "<li><a href='login.php'>Sign Up or Login</a></li>";
            }
            if(isSet($_SESSION["type"])) {
                if($_SESSION["type"] == "admin") {
                    echo "<li><a href='inventorymanager.php'>Inventory Manager</a></li>";
                }
            }
            if(isSet($_SESSION["username"])) {
                echo "<li><a href='phpScripts/logoutScript.php'>Sign Out</a></li>";
            }
            ?>
        </ul>
    </nav>

    <!--User info div-->
    <?php
    echo "<div class='userInfo'>";
    if(isSet($_SESSION["username"])) {
        echo "<h3>Welcome Back<br/>" . $_SESSION['username'] . "!</h3>";
        echo "<input type='button' value='Sign Out' onclick='location.href=\"phpScripts/logoutScript.php\";' />";
    } else {
        echo "<h3>Welcome Guest</h3>";
        echo "<input type='button' value='Login or Sign Up' onclick='location.href=\"login.php\";' />";
    }
    echo "</div>";
    ?>
    
    <div class="main center">
        <div class="cool">
            <h1 style="margin-top:0;">Thank You For Your Purchase</h1>
            <h3>Your High Quality Rodent Order Will Be Processed Shortly</h3>
        </div>
    </div>
</body>
</html>