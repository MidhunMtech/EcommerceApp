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
    <!--- <cfif structKeyExists(form, "searchSubmit")>
        <cfset getCat = application.component.getCategories(searchValue = form.searchValue)>
        <!--- <cfdump  var="#result#"> --->
    </cfif> --->

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
            <cfloop array="#getCat[2]#" index="product">
                <cfoutput>
                    <cfif product.sub_is_delete EQ 0>
                        <div class="col-md-4">
                            <div class="card product-card">
                                <cftry>
                                    <a href="productDetails.cfm?id=#product.productId#" class="productLink">
                                        <img class="card-img-top" src="/images/thumbnail/#product.thumbnail#" alt="#product.thumbnail#" height="200">
                                        <div class="card-body">
                                            <h5 class="card-title">#product.productName#</h5>
                                            <p class="card-text text-danger">&##8377; #product.productPrice#</p>
                                            <a href="productDetails.cfm?id=#product.productId#" class="btn btn-primary">Buy Now</a>
                                        </div>
                                    </a>
                                <cfcatch type="any">
                                    <cfdump  var="#cfcatch#">
                                </cfcatch>
                                </cftry>
                            </div>
                        </div>
                    </cfif>
                </cfoutput>
            </cfloop>
        </div>
    </div>

    <!-- Footer -->
    <cfinclude  template="/footer.cfm">

    <!--- <cfset session.userid = 1>
    <cfset structClear(session)> --->
</body>
</html>
