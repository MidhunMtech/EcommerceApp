<cfif NOT structKeyExists(session, "userId")>
    <cflocation  url="/login.cfm">
</cfif>
<cfinvoke component="component.component" method="logout" returnvariable="logout">
<cfif logout EQ "1">
    <cflocation  url="/login.cfm">
</cfif>
<cftry>
    <cfinvoke  method="userProfile" component="component.component" returnvariable="profile">
    <cfinvoke  method="addAndGetAddress" component="component.component" returnVariable="getAddress">

    <cfparam name = "addressName" default = "#profile.Address#">
    <cfloop array="#getAddress#" index="address">
        <cfif address.selected EQ 1>
            <cfset addressName = address.Address>
        </cfif>
    </cfloop>
    
<cfcatch type="any">
    <cfdump  var="#cfcatch#">
</cfcatch>
</cftry>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/profile.css">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="content">
        <cfinclude  template="navbar.cfm">
        <div class="container mt-5">
            <div class="card">
                <div class="card-body text-center">
                    <cfoutput>
                        <img src="/uploads/#profile.imageName#" alt="Profile Picture" class="rounded" width="150">
                        <h2 class="mt-3">#profile.Name#</h2>
                        <p class="text-muted">Email: #profile.Email#</p>
                        <p class="text-muted">Phone: #profile.Phone#</p>
                        <div class="d-flex justify-content-center">
                            <p class="mr-2">Address: #addressName#</p>
                            <a href="address.cfm"><button class="btn btn-primary btn-sm">Add/Edit</button></a>
                        </div>
                    </cfoutput>
                    <hr>
                    <div class="d-flex justify-content-around mt-4 profileBtn">
                        <a href="orderList.cfm"><button class="btn btn-info">Order Details</button></a>
                        <a href="profile.cfm?logout=true"><button class="btn btn-danger">Logout</button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <cfinclude  template="/footer.cfm">
</body>
</html>
