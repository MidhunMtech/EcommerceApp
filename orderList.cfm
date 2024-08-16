<cftry>
    <cfif NOT structKeyExists(session, "userId")>
        <cflocation  url="/login.cfm">
    </cfif>
    <cfinvoke  method="getOrderDetails" component="component.component" returnVariable="order">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order List</title>
        <link href="/css/bootstrap.min.css" rel="stylesheet">
        <link href="/css/order.css" rel="stylesheet">
    </head>
    <body>
        <cfinclude  template="/navbar.cfm">
        <div class="container mt-5">
            <h1 class="mb-4">Order List</h1>
            <div class="row">
                <cfoutput>
                    <cfloop array="#order#" index="order">
                        <div class="col-md-12">
                            <div class="card order-card">
                                <div class="card-body d-flex">
                                    <img src="/images/thumbnail/#order.thumbnail#" alt="#order.thumbnail#" class="order-img me-3" width="100">
                                    <div class="order-info ms-5 mt-2">
                                        <h5 class="card-title">#order.productName#</h5>
                                        <p class="order-date">Order Date: #order.orderDate#</p>
                                    </div>
                                    <a href="orderDetails.cfm?oid=#order.orderDetailsId#" class="btn btn-primary btnclass px-5 mt-4">View</a>
                                </div>
                            </div>
                        </div>
                    </cfloop>
                </cfoutput>            
            </div>
        </div>

        <cfinclude  template="/footer.cfm">
    </body>
    </html>
<cfcatch type="any">
    <cfdump  var="#cfcatch#">
</cfcatch>
</cftry>
