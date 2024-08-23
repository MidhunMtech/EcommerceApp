<!--- <cfinclude  template="addressAction.cfm"> --->
<cfinvoke  method="getCategories" component="component.component" returnVariable="getCat">
    <cfinvokeargument  name="subCatId"  value="#url.subid#">
</cfinvoke>
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
        <cfset totalPages = Ceiling(getCat[4] / 6) - 1>
        <nav aria-label="Page navigation" class="mt-auto">
            <ul class="pagination justify-content-center">
            <cfoutput>
                <!--- <li class="page-item classPreviuos"><button type="button" class="page-link pageNo" value="<cfif structKeyExists(url,"page") AND url.page GT 0>#url.page-1#<cfelse>0</cfif>">Previous</button></li> --->
                <cfloop from="0" to="#totalPages#" index="i">
                    <li class="page-item classPages"><button type="button" class="page-link pageNo" value="#i#">#i#</button></li>
                </cfloop>
                <!--- <li class="page-item classNext"><button type='button' class="page-link pageNo" value="<cfif structKeyExists(url,"page") AND url.page LT totalPages>#url.page+1#<cfelseif structKeyExists(url,"page") AND url.page EQ totalPages>#i-1#<cfelse>#i-totalPages#</cfif>">Next</button></li> --->
            </cfoutput>
            </ul>
        </nav>
        <cfinclude  template="/footer.cfm">
        <script src="/js/jquery.min.js"></script>
        <script src="/js/product.js"></script>
    </body>
</html>
