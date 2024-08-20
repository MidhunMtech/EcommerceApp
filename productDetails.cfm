<cfinvoke  method="getCategories" component="component.component" returnVariable="getCat">
<cfinvoke  method="rating" component="component.component" returnVariable="rating">
<!--- <cfdump  var="#getCat[2]#" abort> --->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/product.css" rel="stylesheet">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/productDetails.js"></script>
</head>
<body>
<cfinclude  template="/navbar.cfm">
<div class="container my-5">
    <div class="row">
        <cfoutput>
            <cfloop array="#getCat[2]#" index="product">
                <cfparam  name="productRating" default="0">
                <cfloop query="rating">
                    <cfif rating.Products_idProducts EQ product.productId>
                        <cfset productRating = rating.proRating>
                    </cfif>
                    <!--- <cfdump  var="#rating.Products_idProducts#">
                    <cfdump  var="#product.productId#"> --->
                </cfloop>
                <div class="col-md-6">
                <!-- Carousel for Product Images -->
                    <div id="productCarousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <cfset variables.active = "active">
                            <cfloop array="#getCat[3]#" index="image">
                                <cfif image.is_delete EQ 0>
                                    <div class="carousel-item #variables.active#">
                                        <img src="/images/products/#image.imageName#" class="d-block w-100 imgProduct" alt="#image.imageName#">
                                    </div>
                                    <cfset variables.active = "">
                                </cfif>
                            </cfloop>
                        </div>
                        <a class="carousel-control-prev" href="##productCarousel" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="##productCarousel" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- Product Details -->
                    <h2>#product.productName#</h2>
                    <h4>&##8377; #product.productPrice#</h4>
                    <p>#product.productDescription#</p>
                    <div class="product-rating">
                        <span>#productRating# &##9733;</span><!--- 
                        <span>&##9733;</span>
                        <span>&##9733;</span>
                        <span>&##9733;</span>
                        <span>&##9734;</span> <!-- 4 out of 5 stars --> --->
                    </div>
                    <button class="btn btn-primary mt-3 addToCart" data-userid="#product.productId#">Add to Cart</button>
                </div>
            </cfloop>
        </cfoutput>
    </div>
</div>

<!-- jQuery, Popper.js, and Bootstrap JS -->
<cfinclude  template="/footer.cfm">
<script src="/js/jquery.min.js"></script>
</body>
</html>
