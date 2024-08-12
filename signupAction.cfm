<cfif structKeyExists(form, "signup")>
    <cfif NOT len(form.fullname)
        OR NOT len(form.email)
        OR NOT len(form.phone)
        OR NOT len(form.address)
        OR NOT len(form.password)
        OR NOT len(form.confirmPassword)>

        <cflocation  url="signup.cfm?error=notFill">
    <cfelse>
        <cftry>
            <cfset variables.result = application.component.signUp(form = form)>
            <cfif structKeyExists(result, "success") AND result.success EQ 1>
                <cflocation  url="/login.cfm?signup=success" addToken="false">
            </cfif>
        <cfcatch type="any">
            <cfdump  var="#cfcatch#">
        </cfcatch>
        </cftry>
    </cfif>
</cfif>