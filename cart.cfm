<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-commerce Cart</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/cart.css">
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
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <img src="https://via.placeholder.com/100" alt="Product Image" class="product-image">
                    <span class="ml-3">Product 1</span>
                </div>
            </td>
            <td>$25.00</td>
            <td>
                <input type="number" class="form-control quantity-input" value="1" min="1">
            </td>
            <td>$25.00</td>
            <td>
                <button class="btn btn-danger btn-sm">Remove</button>
            </td>
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <img src="https://via.placeholder.com/100" alt="Product Image" class="product-image">
                    <span class="ml-3">Product 2</span>
                </div>
            </td>
            <td>$15.00</td>
            <td>
                <input type="number" class="form-control quantity-input" value="2" min="1">
            </td>
            <td>$30.00</td>
            <td>
                <button class="btn btn-danger btn-sm">Remove</button>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="text-right total-price">
        <p>Total: $55.00</p>
        <button class="btn btn-primary">Proceed to Checkout</button>
    </div>
</div>

<cfinclude  template="/footer.cfm">
<!--- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> --->
</body>
</html>
