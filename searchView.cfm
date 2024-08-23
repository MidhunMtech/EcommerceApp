<cfif structKeyExists(form, "searchSubmit")>
    
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Search</title>
            <link href="/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="/css/product.css">
        </head>
        <body>
            <cfinclude  template="/navbar.cfm">
            <cfset product = application.component.getCategories(searchValue = form.searchValue)>
            <cfoutput>
                <div class="container mt-5">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h1>Result For "#form.searchValue#"</h1>
                        <!--- <div class="d-flex">

                        <select class="form-control d-inline-block w-auto mr-2" id="filter" name="filterValue">
                            <option value="3" class="filter"<!---  <cfif val EQ 3>selected</cfif> --->>Filter by</option>
                            <option value="0" class="filter">price < 2000</option>
                            <option value="1" class="filter">price > 2000</option>
                        </select>

                        <select class="form-control d-inline-block w-auto" id="sort" name="sortValue">
                            <option value="">Sort by</option>
                            <option value="ASC">Price: Low to High</option>
                            <option value="DESC">Price: High to Low</option>
                        </select>
                        </div> --->
                    </div>

                        <!-- Product Card -->
                    <div id="productsContainer" class="row my-3">
                        <cfloop array="#product[2]#" index="product">
                            <div class="col-md-4 my-3">
                                <div class="card product-card">
                                    <a href="/product-details/#product.productId#" class="productLink">
                                        <img class="card-img-top productImage" src="/images/thumbnail/#product.thumbnail#" alt="#product.productName#" height="150">
                                        <div class="card-body">
                                            <h5 class="card-title productName">#product.productName#</h5>
                                            <p class="card-text text-danger productPrice">#product.productPrice#</p>
                                            <a href="/product-details/#product.productId#" class="btn btn-primary">Buy Now</a>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </cfloop>
                    </div>
                </div>
            </cfoutput>
                    
            <!--- <nav aria-label="Page navigation" class="mt-auto">
                <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav> --->
            <cfinclude  template="/footer.cfm">
            <script src="/js/jquery.min.js"></script>
            <script src="/js/product.js"></script>
        </body>
    </html>
</cfif>
