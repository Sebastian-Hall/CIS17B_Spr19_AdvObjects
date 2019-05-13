<DOCTYPE html>
<html lang="en-US">
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
            position: sticky;
            top: 0;
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
        require_once('inventoryScript.php');
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
                createTable();
            ?>
        </section>
    </div>
</body>
</html>