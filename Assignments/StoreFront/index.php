<!DOCTYPE html>
<html lang="en-US">
    <head>
        <script src="Product.js"></script>
        <script src="Cart.js"></script>
        <meta charset="utf-8" />
        <title>Store Front</title>
    </head>
    
    <body>
        <script>
            var prod1 = new Product(1, 10, "Product 1", "image 1", 10);
            var prod2 = new Product(2, 20, "Product 2", "image 2", 20);
            var prod3 = new Product(3, 30, "Product 3", "image 3", 30);
            var prod4 = new Product(4, 40, "Product 4", "image 4", 40);
            
            
            
            document.write("Ordered quantity of 20<br/><br/>");
            prod1.setOrdered(20);
            prod2.setOrdered(20);
            prod3.setOrdered(20);
            prod4.setOrdered(20);
            
            var cart = new Cart();
            cart.addProduct(prod1);
            cart.addProduct(prod2);
            cart.addProduct(prod3);
            cart.addProduct(prod4);
            
            
            document.write(cart.dump());
            
            
            
        </script>
    </body>
</html>