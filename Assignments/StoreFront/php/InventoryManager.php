<DOCTYPE html>
<html lang="en-US">
    <?php
    //Include Scripts
    require_once('config.php');
    ?>
<head>
    <meta charset="utf-8" />
    <script src="../js/Product.js"></script>
    <script src="../js/Cart.js"></script>
    <script>
        function edit(id) {
            document.getElementById("product_id").value = id;
            document.forms.updateForm.submit();
        }
    </script>
    <title>Admin Product Adder</title>
    <style>
        #main {
            width: 70%;
            margin: 0 auto;
        }
        #updateProd {
            float: right;
        }
        .err {
            color: red; font-size: 0.75em;
        }
        .edit {
            border: none;
        }
        .center {
            text-align: center;
        }
        td,
        th {
            border: 3px solid black;
            padding: 8px;
        }
        table {
            border-collapse: collapse;
        }
        iframe {
            height: 400px;
            width: 300px;
        }
        legend {
            font-size: 1.5em;
            font-weight: bold;
        }
        caption {
            font-size: 1.5em;
            font-weight: bold;
        }
        h1 {
            font-size: 2.5em;
        }
        h2 {
            font-size: 2em;
        }
    </style>
    <?php
    //Declare variables
    $nameErr = $img_pathErr = $quantityErr = $priceErr = $catErr = $sqlMsg = "";//Error messages
    $name = $img_path = $cat = "";//Product name and image path
    $quantity = $price = 0;//Product quantity and price
    $isValid = true;//If all form input is valid
    $server = "localhost";
    $username = "root";
    $password = "";
    $db = "storefront";
    $conn = connect($server, $username, $password, $db);
    
    //Check if sent with post
    if($_SERVER["REQUEST_METHOD"] == "POST") {
        //Fill all variables with post data or set error messages is empty fields
        if(empty($_POST["product_name"])) {
            $nameErr = "Product Name Required";
            $isValid = false;
        } else {
            $name = testInput($_POST["product_name"]);
            if(!preg_match("/^[\w ]+$/", $name)) {
                $nameErr = "Only alphanumerical characters and whitespace";
                $isValid = false;
            }
        }
        if(empty($_POST["product_img_path"])) {
            $img_pathErr = "Image Path Required";
            $isValid = false;
        } else {
            $img_path = testInput($_POST["product_img_path"]);
            if(!preg_match("/^[\S]+$/", $img_path)) {
                $img_pathErr = "No Whitespace in image path";
                $isValid = false;
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
        if(empty($_POST["product_category"])) {
            $catErr = "Category Required";
            $isValid = false;
        } else {
            $cat = testInput($_POST["product_category"]);
        }

        //If form is valid then store product in database, else output err message
        if($isValid) {
            $sql = "INSERT INTO entity_product (product_quantity, product_name," .
                "product_img_path, product_price, product_category) VALUES ($quantity, '$name', '$img_path', $price, '$cat');";
            if($conn->query($sql)) {
                $sqlMsg = "<h3>Record Successfully Created</h3>";
                $quantity = $price = 0;//Reset to default
                $name = $img_path = $cat = "";//Reset to default
            } else {
                $sqlMsg = "<h3>SQL Error: " . $sql . "</h3><h4>Error Message: " . $conn->error . "</h4>";
            }
        }
    }
    //Close connection
    $conn->close();
    ?>
</head>

<body>
    <header>
        <h1 class="center">Inventory Manager</h1>
    </header>
    <!--Navigation-->
    <nav>
        <a href="../index.php">Home</a>
    </nav>
    
    <!--Main Page div-->
    <div id="main">
        <!--Form for creating a new record-->
        <section>
            <fieldset><legend>Add Product</legend>
                <form method="post" action=<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>>
                    <label>Product Quantity</label><br/>
                    <input type="number" min="0" name="product_quantity" value="<?php echo $quantity;?>" /><span class="err"> *<?php echo $quantityErr?></span><br/>
                    <label>Product Name</label><br/>
                    <input type="text" name="product_name" value="<?php echo $name;?>" /><span class="err"> *<?php echo $nameErr?></span><br/>
                    <label>Product Category</label><br/>
                    <input type="text" name="product_category" value="<?php echo $cat;?>" /><span class="err"> *<?php echo $catErr?></span><br/>
                    <label>Product Image Path</label><br/>
                    <input type="text" name="product_img_path" value="<?php echo $img_path;?>" /><span class="err"> *<?php echo $img_pathErr?></span><br/>
                    <label>Product Price</label><br/>
                    <input type="number" step="0.01" min="0" name="product_price" value="<?php echo $price;?>" /><span class="err"> *<?php echo $priceErr?></span><br/>
                    <input type="submit" value="Add Product to Database" />
                    <?php echo $sqlMsg;?>
                </form>
            </fieldset>
        </section>
        
        <!--iframe for editing products-->
        <section>
            <div id="updateProd">
                <h2 class="center">Update Products</h2>
                <iframe name="editFrame" src="about:blank"></iframe>
            </div>

            <!--Current table of products-->
            <?php
            $conn = connect("localhost", "root", "", "storefront");
            $sql = "SELECT * FROM entity_product;";
            $result = $conn->query($sql);
            echo "<form action='UpdateProduct.php' method='post' target='editFrame' id='updateForm'>";
            echo "<table><tr><th>Id</th><th>Quantity</th><th>Name</th><th>Path</th><th>price</th><th>Category</th></tr>";
            echo "<caption>Current Products</caption>";
            while($row = $result->fetch_assoc()) {
                $id = $row["product_id"];
                echo "<tr>";
                echo "<td>" . $id . "</td><td>" . $row["product_quantity"]. "</td><td>" . $row["product_name"]. "</td><td>" . $row["product_img_path"] . "</td><td>" . $row["product_price"]. "</td><td>" . $row["product_category"] . "</td>";
                echo "<td class='edit'><input type='button' value='Update' onclick='(function() {edit($id);})()' /></td>";
                echo "</tr>";
            }
            echo "</table>";
            echo "<input id='product_id' type='hidden' name='product_id' />";
            echo "</form>";
            $conn->close();
            ?>
        </section>
    </div>
</body>
</html>