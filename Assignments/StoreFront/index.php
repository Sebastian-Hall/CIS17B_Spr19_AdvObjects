<!DOCTYPE html>
<html lang="en-US">
    <head>
        <script src="js/Product.js"></script>
        <script src="js/Cart.js"></script>
        <script>
            function setLogin() {
                document.getElementById("action").value = "login";
                document.forms.buttonForm.submit();
            }
            function setSignup() {
                document.getElementById("action").value = "signup";
                document.forms.buttonForm.submit();
            }
        </script>
        <?php
        //Include files
        require_once('php/config.php');
        
        //Declare variables
        $username = $password = $confirmPassword = "";//Username and password
        $usernameErr = $passwordErr = "";//Error message for username and password
        $pattern = "/^\w{4,20}$/";//Regex pattern for username/password
        $isValid = true;//Flag for valid form submission
        $conn = connect("localhost", "root", "", "storefront");//Connection to db
        
        //Check if page loaded with post
        if($_SERVER["REQUEST_METHOD"] == "POST") {
            //Get data from post
            if(isSet($_POST["username"])) {//Set username
                $username = $_POST["username"];
            } else { $username = ""; }
            if(isSet($_POST["password"])) {//Set password
                $password = $_POST["password"];
            } else { $password = ""; }
            
            //Check if username is invalid
            if(!preg_match($pattern, $username)) {
                $isValid = false;
                $usernameErr = "4-20 Alphanumerical Characters";
            } else {
                $usernameErr = "";
            }
            
            //Check if password is invalid
            if(!preg_match($pattern, $password)) {
                $isValid = false;
                $passwordErr = "4-20 Alphanumerical Characters";
            }
            
            //If signup option chosen check if passwords match
            if($_GET["action"] == "signup") {
                if(isSet($_POST["confirmPassword"])) {
                    $confirmPassword = $_POST["confirmPassword"];
                } else { $confirmPassword = ""; }
                if($confirmPassword != $password) {
                    $isValid = false;
                    $passwordErr = "Passwords Do Not Match";
                }
            }
            
            //If form info is valid do sql else nothing
            if($isValid) {
                echo "valid info. taking you somewhere special. checking if sign up and create or login and validate";
            }
            
            //Close database connection
            $conn->close();
        }
        ?>
        <meta charset="utf-8" />
        <title>Rodent Store Login</title>
        <style>
            .center {
                text-align: center;
            }
        </style>
    </head>
    
    <body>
        <!--Page Header-->
        <header>
            <h1 class="center">The Rodent Store</h1>
        </header>
        
        <!--Login or Sign Up Buttons-->
        <form id="buttonForm" method="get" target="_self" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <input type="button" id="loginButton" onclick="setLogin();" value="Returning Customer" />
            <input type="button" id="signupButton" onclick="setSignup();" value="New Customer" />
            <input id="action" type="hidden" name="action" />
        </form>
        
        <!--Login or signup form-->
        <div id="accessForm">
        <form method='post' target='_self' action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" >
            <label for='username'>Username</label><br/>
            <input id='username' type='text' name='username' value='<?php echo $username; ?>' />
            <span class='error'> * <?php echo $usernameErr;?></span><br/>
            <label for='password'>Password</label><br/>
            <input id='password' type='password' name='password' />
            <span class='error'> * <?php echo $passwordErr;?></span><br/>
            <?php
            if(isSet($_GET["action"])) {
                if($_GET["action"] == "signup") {
                    echo "<label for='confirmPassword'>Confirm Password</label><br/>";
                    echo "<input id='confirmPassword' type='password' name='confirmPassword' /><br/>";
                }
            }
            ?>
            <input type="submit" value="<?php echo ucfirst($_POST["action"]);?>" >
            </form>
            
        </div>
    </body>
    
</html>
