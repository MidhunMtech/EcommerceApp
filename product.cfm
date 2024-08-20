<!--- <cfinclude  template="addressAction.cfm"> --->
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
                <div class="d-flex">
                               
                <!--- <cfif structKeyExits(form, 'filterValue')>
                    <cfset val = form.filterValue>
                <cfelse>
                    <cfset val = 0>
                </ciff>

                <cfset val = structKeyExits(form, 'filterValue') ? form.filterValue : 0>

                <cfset val = val(form?.filterValue)> --->

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
                </div>
            </div>

                <!-- Product Card -->
            <div id="productsContainer" class="row my-3">
                <!-- Products will be appended here -->
            </div>
        </div>      
        <nav aria-label="Page navigation" class="mt-auto">
            <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </nav>
        <cfinclude  template="/footer.cfm">
        <script src="/js/jquery.min.js"></script>
        <script src="/js/product.js"></script>
    </body>
</html>
