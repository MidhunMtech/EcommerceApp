<cftry>
    <cfif structKeyExists(form, "submit")>
        <cfdump  var="#form#">
        <!--- Check if the form.images array exists --->
        <cfif structKeyExists(form, "images")>
            <cfdump  var="#form#">
            <cfset filePath = expandpath('/uploads/new')>
            <cffile action="uploadAll" filefield="form.images" destination="#filePath#" nameconflict="makeunique">
            <cfdump  var="#cffile#">
            <cfloop array="#cffile.UPLOADALLRESULTS#" index="index">
                    <cfoutput>
                        #index.SERVERFILE# <br>
                    </cfoutput>
            </cfloop>
            <!--- <cfoutput>#form.images# uploaded successfully.<br></cfoutput> --->
        <cfelse>
            <cfoutput>No files were selected for upload.<br></cfoutput>
        </cfif>
    </cfif>

<cfcatch type="any">
    <cfdump  var="#cfcatch#">
</cfcatch>
</cftry>
