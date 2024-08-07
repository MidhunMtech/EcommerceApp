<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Listing Page</title>
        <link href="/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="/css/product.css">
    </head>
    <body>
        <cfinclude  template="/navbar.cfm">
        <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>Product Listing</h1>
            <div>
            <select class="form-control d-inline-block w-auto mr-2" id="filter">
                <option>Filter by</option>
                <option>Category 1</option>
                <option>Category 2</option>
            </select>
            <select class="form-control d-inline-block w-auto" id="sort">
                <option>Sort by</option>
                <option>Price: Low to High</option>
                <option>Price: High to Low</option>
            </select>
            </div>
        </div>

        <div class="row" id="product-list">
            <!-- Example Product Card -->
            <div class="col-md-4 mb-4">
                <div class="card">
                    <a href="/productDetails.cfm">
                        <img src="images/image.png" class="card-img-top" alt="Product 1">
                        <div class="card-body">
                        <h5 class="card-title">Product 1</h5>
                        <p class="card-text">$10.00</p>
                    </a>
                </div>
            </div>
            </div>
            <!-- Add more product cards as needed -->
        </div>

        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </nav>
        </div>
        <cfinclude  template="/footer.cfm">
    </body>
</html>
