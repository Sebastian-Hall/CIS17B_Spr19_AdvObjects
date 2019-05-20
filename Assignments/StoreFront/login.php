<!DOCTYPE html>
<?php
if(session_status() == PHP_SESSION_NONE) {
    session_start();
}
require_once('phpScripts/loginScript.php');
?>
<html lang="en-US">
    <head>
        <meta charset="UTF-8" />
        <link href="css/sitestyle.css" rel="stylesheet" type="text/css" />
        <script src="js/login.js"></script>
        <title>Rodent Store Login</title>
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
            </ul>
        </nav>
        
        <!--Sign up/ Login area-->
        <div id="loginArea">
            <h3>Login or Sign Up</h3>
            <!--Login or Sign Up Buttons-->
            <div>
                <input type="button" id="login" value="User Login" onclick="showLogin();"/>
                <input type="button" id="signUp" value="Sign Up" onclick="showSignUp();"/>
            </div>

            <!--Login Form-->
            <div id="loginForm">
                <form method="post" target="_self" name="loginForm" onsubmit="return validateLogin()">
                    <label for="loginUsername">Username</label><br/>
                    <input type="text" id="loginUsername" name="loginUsername" title="1-16 char alphanumerical" />
                    <span class="err">&nbsp;</span><br/>
                    <label for="loginPassword">Password</label><br/>
                    <input type="password" id="loginPassword" name="loginPassword" title="4-16 char alphanumerical" />
                    <span class="err">&nbsp;</span><br/>
                    <input type="submit" value="Login" /><br/>
                </form>
            </div>

            <!--Sign Up Form-->
            <div id="signUpForm" >
                <form method="post" target="_self" name="signUpForm" onsubmit="return validateSignUp()">
                    <label for="signUpUsername">Username</label><br/>
                    <input type="text" id="signUpUsername" name="signUpUsername" title="1-16 char alphanumerical" placeholder="1-16 char alphanumerical" />
                    <span class="err">&nbsp;</span><br/>
                    <label for="signUpPassword">Password</label><br/>
                    <input type="password" id="signUpPassword" name="signUpPassword" title="4-16 char alphanumerical" placeholder="4-16 char alphanumerical" />
                    <span class="err">&nbsp;</span><br/>
                    <label for="confirmPassword">Confirm Password</label><br/>
                    <input type="password" id="confirmPassword" name="confirmPassword" title="Same as above" placeholder="Must match above" /><br/><br/>
                    <input type="submit" value="Sign Up" /><br/>
                </form>
            </div>
        </div>
    </body>
</html>