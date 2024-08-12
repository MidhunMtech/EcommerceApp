<cftry>
<cfinvoke  method="getCategories" component="component.component" returnVariable="getProduct">
<cfdump  var="#getProduct#">

<cfcatch type="any">
    <cfdump  var="#cfcatch#">
</cfcatch>
</cftry>