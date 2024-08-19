<cfif structKeyExists(form, "submit")>
    <!--- <cfdump  var="#form#" abort> --->
    <cfset result = application.component.addAndGetAddress(form = form)>
    <cflocation  url="/address.cfm">
</cfif>
<cfif structKeyExists(form, "filterValue")>
    <!--- <cfdump  var="#form#" abort> --->
    <cfset result = application.component.getCategories(filter = form)>
    <cfset variables.result = result>
</cfif>
<cfif structKeyExists(form, "sortValue")>
    <!--- <cfdump  var="#form#" abort> --->
    <cfset result = application.component.getCategories(sort = form)>
    <cfset variables.result = result>
</cfif>