<cfif structKeyExists(form, "submit")>
    <cfset result = application.component.addAndEditProducts(form = form)>
    <cfif result.success EQ 0>
        <cfoutput>
            <p class="text-center text-danger">#result.message#</p>
        </cfoutput>
    <cfelse>
        <cflocation  url="adminDash.cfm">
    </cfif>
</cfif>