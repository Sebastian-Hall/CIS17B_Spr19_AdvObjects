/*
 * Cart to hold products in online store
 */
function Cart(cart) {
    "use strict";
    this.products = [];//Create products array
    if (arguments.length > 0) {//Copy constructor
        for(var i = 0; i < cart.products.length; ++i) {//Populate products array
            this.products.push(new Product(cart.products[i]))
        }
        this.total = cart.total;//Copy total
    } else {//Default constructor
        this.total = 0.0;//Set total to default 0
    }
}

//Update total
Cart.prototype.updateTotal = function () {
    "use strict";
    var ttl = 0.0;
    for(var i = 0; i < this.products.length; ++i) {
        ttl += this.products[i].getSub();
    }
    this.total = ttl;
};

//Get total
Cart.prototype.getTotal = function () {
    "use strict";
    return this.total;
};

//Set products
Cart.prototype.setProducts = function (prodArr) {
    "use strict";
    this.products = prodArr;//Assign array
    this.updateTotal();
};

//Add product to cart
Cart.prototype.addProduct = function (prod) {
    "use strict";
    //Check if item already in cart
    for(var i = 0; i < this.products.length; ++i) {
        if(this.products[i].getId() === prod.getId()) {//If item is already in cart
            this.products[i].addOrdered(prod.getOrdered());//Just increase quantity
            this.updateTotal();//Update total
            return;
        }
    }
    //If not add item to cart
    this.products.push(prod);//Add item to cart
    this.updateTotal();//Update total
};

//Get products
Cart.prototype.getProducts = function () {
    "use strict";
    return this.products;
};

//Remove product based on product id
Cart.prototype.rmvProd = function (id) {
    "use strict";
    //Remove product if it exists
    for(var i = 0; i < this.products.length; ++i) {//Iterate through products
        if(this.products[i].getId() == id) {//If product id matches id to delete
            this.products.splice(i, 1);//Splice product from array
        }
    }
    //Update total
    this.updateTotal();
};

//Display all product info
Cart.prototype.dump = function () {
    "use strict";
    var output = "";
    for (var i = 0; i < this.products.length; ++i) {
        output += "Product " + this.products[i].getId() + "<br/>";
        output += this.products[i].dump();
    }
    output += "Total: $" + this.total + "<br/><br/>";
    return output;
};