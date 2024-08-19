<cftry>
    <cfif NOT structKeyExists(session, "userId")>
        <cflocation  url="/login.cfm">
    </cfif>
    <cfinvoke  method="getOrderDetails" component="component.component" returnVariable="order">
    <cfinclude  template="rating.cfm">

    <!DOCTYPE html>
    <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Order Details</title>
            <link href="/css/bootstrap.min.css" rel="stylesheet">
            <link href="/css/order.css" rel="stylesheet">
        </head>

        <body>
            <cfinclude  template="/navbar.cfm">
            <div class="container order-container">
                <h2 class="text-center">Order Details</h2>
                <hr>
                <div class="row">
                    <cfoutput>
                        <cfloop array="#order#" index="order">
                            <div class="col-md-4">
                                <a href="productDetails.cfm?id=#order.productId#">
                                    <img src="/images/thumbnail/#order.thumbnail#" alt="#order.thumbnail#" class="product-img img-thumbnail">
                                </a>
                                <a href="invoice.cfm?ord=#order.orderId#">
                                    <button class="btn btn-primary invoice-btn ml-4">Download Invoice</button>
                                </a>
                            </div>
                            <div class="col-md-8">
                                <h4>Product Name: <span class="text-primary">#order.productName#</span></h4>
                                <p><strong>Quantity:</strong> #order.quantity#</p>
                                <p><strong>Order ID:</strong> ###order.orderId#</p>
                                <p><strong>Order Date:</strong> #order.orderDate#</p>
                                <p><strong>Price:</strong> &##8377; #order.productPrice#</p>
                                <p><strong>Total Price:</strong> &##8377; #order.productQuantityPrice#</p>
                                <p><strong>Delivered Address:</strong> #order.Address#</p>
                                <form action="" method="post" class="d-flex mt-3">
                                    <label for="rateProduct"><b>Rate this product:</b></label>
                                    <select id="rateProduct" class="form-control w-25 mx-3" name="rating">
                                        <option value="1">1 Star</option>
                                        <option value="2">2 Stars</option>
                                        <option value="3">3 Stars</option>
                                        <option value="4">4 Stars</option>
                                        <option value="5">5 Stars</option>
                                    </select>
                                    <input type="hidden" value="#order.productId#" name="productId">
                                    <button type="submit" name="rate" class="btn btn-danger">Rate</button>
                                </form>
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