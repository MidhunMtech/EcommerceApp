<cfset structDelete(session, "totalsum")>
<cfif NOT structKeyExists(session, "userId")>
    <cflocation  url="/login.cfm">
</cfif>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/payment.css" rel="stylesheet">
</head>
<body>
    <cfinclude  template="navbar.cfm">
    <div class="container">
        <div class="confirmation-box text-center">
            <div class="confirmation-icon">
                <i class="bi bi-check-circle"></i>
            </div>
            <h1 class="mb-3">Order Confirmed!</h1>
            <p>Thank you for your purchase. Your order id number is <strong>#<cfoutput>#session.orderId#</cfoutput></strong>.</p>

            <a href="/home.cfm" class="btn btn-primary mt-4">Continue Shopping</a>
        </div>
    </div>
    
    <cfset structDelete(session, "orderId")>
    <cfinclude  template="/footer.cfm">
</body>
</html>
