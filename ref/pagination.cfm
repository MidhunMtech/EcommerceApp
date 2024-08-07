<cftry>

<cfset pageSize = 10>
<cfset currentPage = Iif(IsNumeric(url.page), url.page, 1)>
<cfset offset = (currentPage - 1) * pageSize>

<cfquery name="getItems" datasource="cfTask2">
    SELECT * 
    FROM contacts 
    ORDER BY userId 
    LIMIT <cfqueryparam value="#pageSize#" cfsqltype="cf_sql_integer"> 
    OFFSET <cfqueryparam value="#offset#" cfsqltype="cf_sql_integer">
</cfquery>

<cfquery name="countItems" datasource="cfTask2">
    SELECT COUNT(*) as totalCount 
    FROM contacts
</cfquery>

<cfset totalPages = Ceiling(countItems.totalCount / pageSize)>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Pagination Example</title>
</head>
<body>
<div class="container">
    <h1>Items List</h1>
    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <cfoutput query="getItems">
                <tr>
                    <td>#userId#</td>
                    <td>#fname#</td>
                    <td>#lname#</td>
                </tr>
            </cfoutput>
        </tbody>
    </table>

    <nav aria-label="Page navigation">
        <ul class="pagination">
            <cfif currentPage gt 1>
                <li class="page-item">
                    <a class="page-link" href="?page=<cfoutput>#currentPage - 1#</cfoutput>">Previous</a>
                </li>
            </cfif>
            <cfloop from="1" to="#totalPages#" index="i">
                <li class="page-item #Iif(i eq currentPage, 'active', '')#">
                    <cfoutput><a class="page-link" href="?page=#i#">#i#</a></cfoutput>
                </li>
            </cfloop>
            <cfif currentPage lt totalPages>
                <li class="page-item">
                    <cfoutput><a class="page-link" href="?page=#currentPage + 1#">Next</a></cfoutput>
                </li>
            </cfif>
        </ul>
    </nav>
    
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
<cfcatch type="any">
  <cfdump  var="#cfcatch#">
</cfcatch>
</cftry>