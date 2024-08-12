<cfcomponent>

    <cfset this.name = "ecommerce">
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = createTimeSpan(0, 0, 20, 0)>
    <cfset this.setClientCookies = true>

    <cffunction name="onApplicationStart">
        <cfset application.component = createObject("component", "component.component") />
        <cfset application.db = "ecom" />
    </cffunction>

    <cffunction name="onRequestStart" returntype="void" output="false">
        <cfargument name="targetPage" type="string" required="true">
        <cfif structKeyExists(url, "reload")>
            <cfset onApplicationStart()>
        </cfif>
    </cffunction>

</cfcomponent>