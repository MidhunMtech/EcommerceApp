<cfif structKeyExists(form, "login")>
    <cfif NOT len(form.email) OR NOT len(form.password)>
        <cflocation  url="/login.cfm?error=notFill">
    <cfelse>
        <cftry>
            <cfset variables.result = application.component.logIn(form = form)>
            <cfif structKeyExists(result, "success") AND result.success EQ 1>
                <cflocation  url="/profile.cfm">
            </cfif>
        <cfcatch type="any">
            <cfdump  var="#cfcatch#">
        </cfcatch>
        </cftry>
    </cfif>
</cfif>

<cfif structKeyExists(form, "adminLogin")>
    <cfif NOT len(form.username) OR NOT len(form.password)>
        <cflocation  url="/admin/adminLogin.cfm?error=notFill">
    <cfelse>
        <cftry>
            <cfset variables.result = application.component.logIn(form = form)>
            <cfif structKeyExists(result, "success") AND result.success EQ 1>
                <cflocation  url="/admin/adminDash.cfm">
            </cfif>
        <cfcatch type="any">
            <cfdump  var="#cfcatch#">
        </cfcatch>
        </cftry>
    </cfif>
</cfif>