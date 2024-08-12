<cfif structKeyExists(form, "products")>
    <cfset result = application.component.addProducts(form = form)>
    <cflocation  url="adminDash.cfm">
</cfif>