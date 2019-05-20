<!DOCTYPE html>
<?php
    //Start session
    if(session_status() == PHP_SESSION_NONE) {
        session_start();
    }
    //Include scripts
    require_once('phpScripts/prodTableScript.php');
?>
<html lang="en-US">
    <head>
        <script src="js/Cart.js"></script>
        <script src="js/Product.js"></script>
        <script>
            function addToCart(id, quantity, name, img_path, price) {
                //Declare variables
                var callingInput = document.getElementById(id);//Input element that calls holds quantity ordered
                var numOrdered = callingInput.value;//Quantity ordered
                var txt = (window.sessionStorage.getItem("userCart")) ? window.sessionStorage.getItem("userCart") : "";//Holds the json text for sessionStorage
                var prod = new Product(id, quantity, name, img_path, price);//Product to be added
                var userCart;//Users cart
                
                //Exit function if value is empty
                if(numOrdered === "") {
                    return;//Exit function
                }
                
                //Create cart from json or new object
                if(txt != "") {//If string create object from json format
                    userCart = JSON.parse(txt);
                    userCart = new Cart(userCart);
                } else {//Else create a new cart
                    userCart = new Cart();
                }
                
                //Set product ordered and remove item from cart if previously added
                prod.setOrdered(numOrdered);//Set ordered
                userCart.removeProduct(id);//Remove chosen product from cart
                
                //If number ordered is not 0 then add item to cart
                if(numOrdered != "0") {
                    userCart.addProduct(prod);//Add product to cart
                }
                
                //Store cart in session storage
                txt = JSON.stringify(userCart);
                window.sessionStorage.setItem("userCart", txt);
                
                //Update calling input
                callingInput.value = "";
                callingInput.setAttribute("placeholder", "In Cart: " + numOrdered);
            }
            function limitOrdered(id) {
                var elem = document.getElementById(id);
                var max = parseInt(elem.getAttribute("max"));
                var min = parseInt(elem.getAttribute("min"));
                if(parseInt(elem.value) > max) {
                    elem.value = max;
                }
                if(parseInt(elem.value) < min) {
                    elem.value = min;
                }
            }
        </script>
        <link href="css/sitestyle.css" rel="stylesheet" type="text/css" />
        <meta charset="utf-8" />
        <title>Rodent Store</title>
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
        
        <!--User info div-->
        <?php
        echo "<div class='userInfo'>";
        if(isSet($_SESSION["username"])) {
            echo "<h5>Welcome Back " . $_SESSION['username'] . "!</h5>";
            echo "<input type='button' value='Sign Out' onclick='location.href=\"phpScripts/logoutScript.php\";' />";
        } else {
            echo "<h5>Welcome Guest</h5>";
            echo "<input type='button' value='Login or Sign Up' onclick='location.href=\"login.php\";' />";
        }
        echo "</div>";
        ?>
        
        <!--Main document area-->
        <div class="main">
            <!--Category selector-->
            <div id="catSelector">
                <h1 class="center white">Shop By Category</h1>
                <ul>
                    <li><a class="center" href="index.php?cat=rat"><h3>Rat</h3></a></li>
                    <li><a class="center" href="index.php?cat=mouse"><h3>Mouse</h3></a></li>
                    <li><a class="center" href="index.php?cat=squirrel"><h3>Squirrel</h3></a></li>
                    <li><a class="center" href="index.php"><h3>All</h3></a></li>
                </ul>
            </div>
            
            <!--Product Area-->
            <?php
            displayProducts();
            ?>
            
            <!--Checkout button-->
            <input type="button" value="Checkout" onclick="window.location.href='cart.php';" id="checkout" />
        </div>
    </body>
</html>