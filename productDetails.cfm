<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/product.css" rel="stylesheet">
</head>
<body>
<cfinclude  template="/navbar.cfm">
<div class="container mt-5">
    <div class="row">
        <div class="col-md-6">
            <!-- Carousel for Product Images -->
            <div id="productCarousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/images/iphone/image1.png" class="d-block w-100 imgProduct" alt="Product Image 1">
                    </div>
                    <div class="carousel-item">
                        <img src="/images/iphone/image2.png" class="d-block w-100 imgProduct" alt="Product Image 2">
                    </div>
                    <div class="carousel-item">
                        <img src="/images/iphone/image.png" class="d-block w-100 imgProduct" alt="Product Image 3">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#productCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#productCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="col-md-6">
            <!-- Product Details -->
            <h2>Product Name</h2>
            <h4>$99.99</h4>
            <p>Product description goes here. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum.</p>
            <div class="product-rating">
                <span>&#9733;</span>
                <span>&#9733;</span>
                <span>&#9733;</span>
                <span>&#9733;</span>
                <span>&#9734;</span> <!-- 4 out of 5 stars -->
            </div>
            <div class="mt-3">
                <label for="rateProduct">Rate this product:</label>
                <select id="rateProduct" class="form-control w-25">
                    <option>1 Star</option>
                    <option>2 Stars</option>
                    <option>3 Stars</option>
                    <option>4 Stars</option>
                    <option>5 Stars</option>
                </select>
            </div>
            <button class="btn btn-primary mt-3">Add to Cart</button>
        </div>
    </div>
</div>

<!-- jQuery, Popper.js, and Bootstrap JS -->
<cfinclude  template="/footer.cfm">
</body>
</html>
