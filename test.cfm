<cftry>
<cfinvoke  method="getCategories" component="component.component" returnVariable="getCat">
<!--- <cfloop array="#getProduct[2]#" index="product">
    <cfoutput>
    <cfloop array="product.image" index="i">#i[1].imageName# </cfloop>
    </cfoutput>
    </cfloop> --->
<cfoutput>
    <cfloop array="#getCat[2]#" index="img">
                <cfloop array="#img.image#" index="image">
                      <span>#image.imageName#</span>
                </cfloop>
              </cfloop>
</cfoutput>

<cfcatch type="any">
    <cfdump  var="#cfcatch#">
</cfcatch>
</cftry>