<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/product.css">
<script src="/js/jquery.min.js"></script>
<script src="/js/test.js"></script>
<cfinclude  template="/navbar.cfm">
<div id="productsContainer" class="row">
    <!-- Products will be appended here -->
</div>
<cfinclude  template="/footer.cfm">
<script src="/js/jquery.min.js"></script>

    <!--- <div class="col-md-4">
        <div class="card product-card">
            <cftry>
                <a href="" class="productLink">
                    <img class="card-img-top productImage" src="" alt="#product.thumbnail#" height="150">
                    <div class="card-body">
                        <h5 class="card-title productName"></h5>
                        <p class="card-text text-danger productPrice"></p>
                        <a href="productDetails.cfm?id=#product.productId#" class="btn btn-primary">Buy Now</a>
                    </div>
                </a>
            <cfcatch type="any">
                <cfdump  var="#cfcatch#">
            </cfcatch>
            </cftry>
        </div>
    </div> --->