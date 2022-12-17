function add_to_cart(pid, pname, pprice) {
    let cart = localStorage.getItem("cart");
    if (cart == null)
    {
        //no cart yet
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: pprice};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("product quantity is added for the first time")


    } else {
        //cart is already present
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid)
        if (oldProduct) {
            //increase quantity
            oldProduct.productQuantity = oldProduct.productQuantity + 1
            pcart.map((item) => {
                if (item.productId == oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }
            })
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product quantity is increased")
        } else {
            // we have add product
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: pprice};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product quantity is added")
        }
    }
    updateCart();
}

//update card

function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0)
    {
        console.log("Cart is Empty")
        $(".cart-items").html("( 0 )");
        $(".checkout-btn").attr('disabled', true);
        $(".cart-body").html("<h3> Cart has no item </h3>");

    } else {
        console.log(cart)
        $(".cart-items").html(`( ${cart.length} )`);
        let table = `
<table class='table'>
        <thead class = 'thread-light'>
<tr>
        <th>Products</th>
        <th>Price </th>
        <th>Quantity </th>
        <th>Total Price</th>
        <th>Action</th>
</tr>
</thead>



`;

        let totalPrice = 0;

        cart.map((item) => {
            table += `
<tr>

            <td>${ item.productName}</td>
            <td>${ item.productPrice}</td>
            <td>${ item.productQuantity}</td>
            <td>${ item.productQuantity * item.productPrice}</td>
            <td><button onclick='deleteItemOneByOne(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
          
            
            
            
</tr>

`
            totalPrice += item.productPrice * item.productQuantity;
        })
        table = table + `
        <tr><td colspan='5' class='text-center font-weight-bold'> Total Price : ${totalPrice} </td></tr>
</table>`
        $(".cart-body").html(table);

        $(".checkout-btn").attr('disabled', false);

    }
}
//function deleteItemFromCart(pid) {
//    let cString = localStorage.getItem('cart');
//    let cart = JSON.parse(cString);
//    let newCart = cart.filter((item) => item.productId !== pid);
//    localStorage.setItem('cart', JSON.stringify(newCart));
//    updateCart();
//
//}


function goToCheckout() {
    window.location = "checkout.jsp";
}
function deleteItemOneByOne(pid) {
    let pcart = JSON.parse(localStorage.getItem('cart'));
    let oldProduct = pcart.find((item) => item.productId == pid)
    if (oldProduct.productQuantity > 1) {
        //increase quantity
        oldProduct.productQuantity = oldProduct.productQuantity - 1
        pcart.map((item) => {
            if (item.productId == oldProduct.productId) {
                item.productQuantity = oldProduct.productQuantity;
            }
        })
        localStorage.setItem('cart', JSON.stringify(pcart));
        //console.log("product quantity is creased")
    } else {
        let newCart = pcart.filter((item) => item.productId !== pid);
        localStorage.setItem('cart', JSON.stringify(newCart));
    }
    updateCart();
}
$(document).ready(function () {
    updateCart();
})