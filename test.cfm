<cftry>
    <cfinvoke  method="profilePicture" component="component.component" returnVariable="profilePicture">
        <cfif structKeyExists(form, "profilepicUpload")>
            <cfinvokeargument  name="profilePicture"  value="#form.profilePicture#">
        </cfif>
    </cfinvoke>
    <form action="" method="post" enctype="multipart/form-data">
        <input class="form-control rounded" type="file" id="profilePicture" name="profilePicture">
        <button type="submit" class="btn btn-primary" name="profilepicUpload">Upload</button>
    </form>

    <cfdump  var="#form#">
    


    <cfdump  var="#profilePicture#">
<cfcatch type="any">
        <cfdump  var="#cfcatch#">
</cfcatch>
</cftry>