<DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="utf-8" />
    <script src="../js/Product.js"></script>
    <script src="../js/Cart.js"></script>
    <title>Admin Product Adder</title>
    <style>.err {color: red; font-size: 0.75em;}</style>
    <?php
    //Include Scripts
    require_once('config.php');
    
    //Declare variables
    $nameErr = $img_pathErr = $quantityErr = $priceErr = $sqlMsg = "";//Error messages
    $name = $img_path = "";//Product name and image path
    $quantity = $price = 0;//Product quantity and price
    $isValid = true;//If all form input is valid
    $server = "localhost";
    $username = "root";
    $password = "";
    $db = "storefront";
    $conn = connect($server, $username, $password, $db);
    
    //Check if sent with post
    if($_SERVER["REQUEST_METHOD"] == "POST") {
        //Fill all variables with post data
        if(empty($_POST["product_name"])) {
            $nameErr = "Product Name Required";
            $isValid = false;
        } else {
            $name = testInput($_POST["product_name"]);
            if(!preg_match("/^[\w ]+$/", $name)) {
                $nameErr = "Only alphanumerical characters and whitespace";
            }
        }
        if(empty($_POST["product_img_path"])) {
            $img_pathErr = "Image Path Required";
            $isValid = false;
        } else {
            $img_path = testInput($_POST["product_img_path"]);
            if(!preg_match("/^[\S]+$/", $img_path)) {
                $img_pathErr = "No Whitespace in image path";
            }
        }
        if(empty($_POST["product_quantity"])) {
            $quantityErr = "Quantity Required";
            $isValid = false;
        } else {
            $quantity = testInput($_POST["product_quantity"]);
        }
        if(empty($_POST["product_price"])) {
            $priceErr = "Product Price Required";
            $isValid = false;
        } else {
            $price = testInput($_POST["product_price"]);
        }
        
        //If form is valid then store product in database
        if($isValid) {
            $sql = "INSERT INTO entity_product (product_quantity, product_name," .
                "product_img_path, product_price) VALUES ($quantity, '$name', '$img_path', $price);";
            if($conn->query($sql)) {
                $sqlMsg = "<h3>Record Successfully Created</h3>";
                $quantity = $price = 0;//Reset to default
                $name = $img_path = "";//Reset to default
            } else {
                $sqlMsg = "<h3>SQL Error: " . $sql . "</h3><h4>Error Message: " . $conn->error . "</h4>";
            }
        }
        //Close connection
        $conn->close();
    }
    
    function testInput($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
    ?>
</head>

<body>
    <form method="post" action=<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>>
        <label>Product Quantity</label><br/>
        <input type="number" min="0" name="product_quantity" value="<?php echo $quantity;?>" /><span class="err"> *<?php echo $quantityErr?></span><br/>
        <label>Product Name</label><br/>
        <input type="text" name="product_name" value="<?php echo $name;?>" /><span class="err"> *<?php echo $nameErr?></span><br/>
        <label>Product Image Path</label><br/>
        <input type="text" name="product_img_path" value="<?php echo $img_path;?>" /><span class="err"> *<?php echo $img_pathErr?></span><br/>
        <label>Product Price</label><br/>
        <input type="number" step="0.01" min="0" name="product_price" value="<?php echo $price;?>" /><span class="err"> *<?php echo $priceErr?></span><br/>
        <input type="submit" value="Add Product to Database" />
        <?php echo $sqlMsg;?>
    </form>
</body>
</html>