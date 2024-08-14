<cfif structKeyExists(form, "submit")>
    <!--- <cfdump  var="#form#" abort> --->
    <cfset result = application.component.addAndGetAddress(form = form)>
    <cflocation  url="/address.cfm">
</cfif>