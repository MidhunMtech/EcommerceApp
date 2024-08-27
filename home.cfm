<cfinvoke  method="getCategories" component="component.component" returnVariable="getCat">
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
            <cfoutput>
                <cfloop array="#getCat[2]#" index="product">
                    <cfif product.sub_is_delete EQ 0>
                        <div class="col-md-4">
                            <div class="card product-card">
                                <cftry>
                                    <a href="product-details/#product.productId#" class="productLink">
                                        <img class="card-img-top" src="/images/thumbnail/#product.thumbnail#" alt="#product.thumbnail#" height="200">
                                        <div class="card-body">
                                            <h5 class="card-title">#product.productName#</h5>
                                            <p class="card-text text-danger">&##8377; #product.productPrice#</p>
                                            <a href="productDetails.cfm?id=#product.productId#&#product.productName#" class="btn btn-primary">Buy Now</a>
                                        </div>
                                    </a>
                                <cfcatch type="any">
                                    <cfdump  var="#cfcatch#">
                                </cfcatch>
                                </cftry>
                            </div>
                        </div>
                    </cfif>
                </cfloop>                                               
            </cfoutput>
        </div>
    </div>

    <cfset totalPages = Ceiling(getCat[4] / 6) - 1>
    <nav aria-label="Page navigation" class="mt-auto">
        <ul class="pagination justify-content-center">
        <cfoutput>
            <li class="page-item <cfif structKeyExists(url,"page") AND url.page GT 0><cfelse>disabled</cfif>"><a class="page-link" href="home.cfm?page=<cfif structKeyExists(url,"page") AND url.page GT 0>#url.page-1#<cfelse>0</cfif>">Previous</a></li>
            <cfloop from="0" to="#totalPages#" index="i">
                <li class="page-item"><a class="page-link" href="home.cfm?page=#i#">#i#</a></li>
            </cfloop>
            <li class="page-item <cfif structKeyExists(url,"page") AND url.page EQ totalPages>disabled</cfif>"><a class="page-link" href="home.cfm?page=<cfif structKeyExists(url,"page") AND url.page LT totalPages>#url.page+1#<cfelseif structKeyExists(url,"page") AND url.page EQ totalPages>#i-1#<cfelse>#i-totalPages#</cfif>">Next</a></li>
        </cfoutput>
        </ul>
    </nav>

    <!-- Footer -->
    <cfinclude  template="/footer.cfm">
</body>
</html>
