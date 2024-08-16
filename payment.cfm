<cfif NOT structKeyExists(session, "userId")>
    <cflocation  url="/login.cfm">
</cfif>
<cfif session.totalsum EQ 0>
    <cflocation  url="/cart.cfm">
</cfif>
<cfinvoke  method="userProfile" component="component.component" returnvariable="profile">
<cfinvoke  method="addAndGetAddress" component="component.component" returnVariable="getAddress">

<cfparam name = "addressName" default = "#profile.Address#">
<cfparam name = "addressId" default = "#profile.idAddress#">
<cfloop array="#getAddress#" index="address">
    <cfif address.selected EQ 1>
        <cfset addressName = address.Address>
        <cfset addressId = address.id>
    </cfif>
</cfloop>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/payment.css" rel="stylesheet">
</head>
<body>
    <cfinclude  template="navbar.cfm">
    <div class="container">
        <div class="payment-container">
            <div class="payment-header">
                <h3>Payment Information</h3>
            </div> 
            <cfif structKeyExists(session, "cardError")>
                <p class="text-danger text-center"><b><cfoutput>#session.cardError#</cfoutput></b></p>
                <cfset structDelete(session, "cardError")>
            </cfif>
            <form action="paymentAction.cfm" method="post">
                <div class="mb-3">
                    <label for="cardName" class="form-label">Name on Card</label>
                    <input type="text" class="form-control" id="cardName" placeholder="" name="NameOnCard">
                </div>
                <div class="mb-3">
                    <label for="cardNumber" class="form-label">Card Number</label>
                    <input type="text" class="form-control" id="cardNumber" placeholder="XXXX XXXX XXXX XXXX" name="cardNumber">
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="expiryDate" class="form-label">Expiry Date</label>
                        <input type="text" class="form-control" id="expiryDate" placeholder="MM/YY" name="expiryDate">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="cvv" class="form-label">CVV</label>
                        <input type="text" class="form-control" id="cvv" placeholder="" name="cvv">
                    </div>
                </div>
                <cfoutput>
                    <div class="d-flex my-3">
                        <p class="mr-2">Address : <b>#addressName#</b></p>
                        <input type="hidden" name='addressName' value="#addressName#">
                        <input type="hidden" name='addressId' value="#addressId#">
                        <a href="/address.cfm?payment" class="btn btn-primary btn-sm">Add/Edit</a>
                    </div>
                    
                    <div class="d-grid mb-3">
                        <p><b>Total Amount : &##8377; #session.totalsum#</b></p>
                        <input type="submit" class="btn btn-primary btn-lg" value="Pay Now" name="paynow"></input>
                    </div>
                </cfoutput>
            </form>
        </div>
    </div>
    <cfinclude  template="/footer.cfm">
</body>
</html>