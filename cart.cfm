<cfinvoke  method="addToCart" component="component.component" returnvariable="cart">
<!--- <cfdump  var="#cart#"> --->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-commerce Cart</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/cart.css">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/cart.js"></script>
</head>
<body>
<cfinclude  template="/navbar.cfm">
<div class="container cart-container mb-4">
    <h2 class="cart-title">Shopping Cart</h2>
    <table class="table table-bordered cart-table">
        <thead>
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Remove</th>
            </tr>
        </thead>
        <tbody>
            <cfset totalPriceArray = []>
            <cfoutput query="cart">
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <img src="/images/thumbnail/#cart.thumbnail#" alt="Product Image" class="product-image">
                            <span class="ml-3">#cart.productName#</span>
                        </div>
                    </td>
                    <td>&##8377; #cart.productPrice#</td>
                    <td class="w-2">
                        <div class="d-flex align-items-center">
                            <input type="number" class="form-control quantity-input quantityValue#cart.cartid#" value="#cart.quantity#" min="1">
                            <button type="submit" class="btn btn-secondary btn-sm ml-3 quantityCart" data-userid="#cart.cartid#">Done</button>
                        </div>
                    </td>
                    <cfset totalPrice = cart.productPrice * cart.quantity>
                    <cfset arrayAppend(totalPriceArray, totalPrice)>
                    <td>&##8377; #totalPrice#</td>
                    <td>
                        <button class="btn btn-danger btn-sm removeCart" data-userid="#cart.cartid#">Remove</button>
                    </td>
                </tr>
            </cfoutput>
        </tbody>
    </table>
    <cfset totalSum = ArraySum(totalPriceArray)>
    <div class="text-right total-price">
        <p>Total: &#8377; <cfoutput>#totalsum#</cfoutput></p>
        <button class="btn btn-primary">Proceed to Checkout</button>
    </div>
</div>

<cfinclude  template="/footer.cfm">
<script src="/js/jquery.min.js"></script>
<!--- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> --->
</body>
</html>
