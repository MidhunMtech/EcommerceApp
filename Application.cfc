<cfcomponent>

    <cfset this.name = "ecommerce">
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = createTimeSpan(0, 0, 20, 0)>
    <cfset this.setClientCookies = true>

</cfcomponent>