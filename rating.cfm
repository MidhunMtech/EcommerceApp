<cfif NOT structKeyExists(session, "userId")>
    <cflocation  url="/login.cfm">
</cfif>
<cfif structKeyExists(form, "rate")>
    <cfset rate = application.component.rating(form = form)>
</cfif>