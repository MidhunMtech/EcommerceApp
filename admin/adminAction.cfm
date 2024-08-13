<cfif structKeyExists(form, "submit")>
    <!--- <cfdump  var="#form#" abort> --->
    <cfset result = application.component.addAndEditProducts(form = form)>
    <cflocation  url="adminDash.cfm">
</cfif>