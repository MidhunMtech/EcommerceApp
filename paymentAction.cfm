<cfif structKeyExists(form, "paynow")>
    <cfset monthPart = listFirst(form.expiryDate, "/")>
    <cfset yearPart = 20 & listLast(form.expiryDate, "/")>

    <cfif NOT len(form.NameOnCard)>
        <cfset session.cardError = "Invalid Name. Try Again...">
        <cflocation  url="payment.cfm">
    <cfelseif len(form.cardNumber) NEQ 16>
        <cfset session.cardError = "Invalid Card Number. Try Again...">
        <cflocation  url="payment.cfm">
    <cfelseif (monthPart LT month(now()) AND yearPart EQ year(now())) OR (yearPart LT year(now()))>
        <cfset session.cardError = "Card is Expired. Try Again...">
        <cflocation  url="payment.cfm">
    <cfelse>
        <cfinvoke  method="addToCart" component="component.component" returnvariable="cart">
        <cfset result = application.component.orderItems(form = form, items = cart)>
        <cflocation  url="orderConfirm.cfm">
    </cfif>
</cfif>