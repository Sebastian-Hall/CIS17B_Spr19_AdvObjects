<!DOCTYPE html>
<?php
if(session_status() == PHP_SESSION_NONE) {
    session_start();
}
?>
<html lang="en-US">
    <head>
        <meta charset="utf-8" />
        <script src="js/Cart.js"></script>
        <script src="js/Product.js"></script>
        <link href="css/sitestyle.css" rel="stylesheet" />
        <title>Checkout</title>
    </head>
    
    <body>
        <script>
            var userCart = (sessionStorage.getItem("userCart")) ? sessionStorage.getItem("userCart") : null;
            if(userCart) {
                userCart = JSON.parse(userCart);
                userCart = new Cart(userCart);
                document.write(userCart.dump());
            } else {
                document.write("No Cart");
            }
        </script>
        <!--Navigation-->
        <nav>
            <ul>
                <li><p><strong>Site Navigation</strong></p></li>
                <li><a href="index.php">Home</a></li>
                <li><a href="login.php">Sign Up or Login</a></li>
                <li><a href="cart.php">Checkout</a></li>
                <?php
                if(isSet($_SESSION["type"])) {
                    if($_SESSION["type"] == "admin") {
                        echo "<li><a href='inventorymanager.php'>Inventory Manager</a></li>";
                    }
                }
                ?>
                <?php
                if(isSet($_SESSION["username"])) {
                    echo "<li><a href='phpScripts/logoutScript.php'>Sign Out</a></li>";
                }
                ?>
            </ul>
        </nav>
    </body>
</html>