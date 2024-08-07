<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-commerce Homepage</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/home.css">
</head>
<body>

    <!-- Navbar -->
    <cfinclude  template="/navbar.cfm">

    <!-- Hero Section -->
    <div class="hero">
        <div>
            <h1>Welcome to E-Shop</h1>
            <p>Your one-stop shop for everything!</p>
            <a href="#featuredProducts" class="btn btn-primary btn-lg">Shop Now</a>
        </div>
    </div>

    <!-- Products Section -->
    <div class="container mt-5">
        <h2 class="text-center mb-4" id="featuredProducts">Featured Products</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="card product-card">
                    <img class="card-img-top" src="https://via.placeholder.com/350x200" alt="Product 1">
                    <div class="card-body">
                        <h5 class="card-title">Product 1</h5>
                        <p class="card-text">$19.99</p>
                        <a href="#" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card product-card">
                    <img class="card-img-top" src="https://via.placeholder.com/350x200" alt="Product 2">
                    <div class="card-body">
                        <h5 class="card-title">Product 2</h5>
                        <p class="card-text">$29.99</p>
                        <a href="#" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card product-card">
                    <img class="card-img-top" src="https://via.placeholder.com/350x200" alt="Product 3">
                    <div class="card-body">
                        <h5 class="card-title">Product 3</h5>
                        <p class="card-text">$39.99</p>
                        <a href="#" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <cfinclude  template="/footer.cfm">

    <!--- <cfset session.userid = 1>
    <cfset structClear(session)> --->
</body>
</html>
