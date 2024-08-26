<cfif structKeyExists(form, "submit")>
    <cfset result = application.component.addAndEditProducts(form = form)>
    <cflocation  url="adminDash.cfm">
</cfif>