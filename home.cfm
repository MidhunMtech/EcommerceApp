<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-commerce Homepage</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="js/home.js" defer></script>
    <style>
        .hero {
            background: url('https://via.placeholder.com/1920x600') no-repeat center center;
            background-size: cover;
            height: 600px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .hero h1 {
            font-size: 4em;
        }
        .product-card {
            margin-bottom: 30px;
        }
        .product-card img {
            max-height: 200px;
            object-fit: cover;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">E-Shop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Shop</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="#">Electronics</a></li>
                        <li><a class="dropdown-item" href="#">Fashion</a></li>
                        <li class="dropdown-submenu dropleft" >
                            <a class="dropdown-item dropdown-toggle" href="#">Home & Garden</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Furniture</a></li>
                                <li><a class="dropdown-item" href="#">Kitchen</a></li>
                                <li><a class="dropdown-item" href="#">Outdoor</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu dropleft" >
                            <a class="dropdown-item dropdown-toggle" href="#">Home & Garden</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Furniture</a></li>
                                <li><a class="dropdown-item" href="#">Kitchen</a></li>
                                <li><a class="dropdown-item" href="#">Outdoor</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu dropleft" >
                            <a class="dropdown-item dropdown-toggle" href="#">Home & Garden</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Furniture</a></li>
                                <li><a class="dropdown-item" href="#">Kitchen</a></li>
                                <li><a class="dropdown-item" href="#">Outdoor</a></li>
                            </ul>
                        </li>
                        <li><a class="dropdown-item" href="#">Sports</a></li>
                        <li><a class="dropdown-item" href="#">Toys</a></li>
                    </ul>
                    </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero">
        <div>
            <h1>Welcome to E-Shop</h1>
            <p>Your one-stop shop for everything!</p>
            <a href="#" class="btn btn-primary btn-lg">Shop Now</a>
        </div>
    </div>

    <!-- Products Section -->
    <div class="container mt-5">
        <h2 class="text-center mb-4">Featured Products</h2>
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
    <footer class="bg-light py-4">
        <div class="container text-center">
            <p>&copy; 2024 E-Shop. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
