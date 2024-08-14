<cftry>
<cfif NOT structKeyExists(session, "userId")>
    <cflocation  url="/login.cfm">
</cfif>
<cfinvoke  method="addAndGetAddress" component="component.component" returnVariable="getAddress">
<cfinvoke  method="userProfile" component="component.component" returnvariable="profile">

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Address</title>
        <link rel="stylesheet" href="/css/bootstrap.min.css">
        <link rel="stylesheet" href="/css/stylesheets.css">
        <script src="/js/jquery.min.js"></script>
        <script src="/js/address.js" defer></script>
    </head>
    <body>
        <cfinclude  template="navbar.cfm">
        <cfoutput>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="column-heading">
                            <h5>Address</h5><span class="sort-by"></span>
                            <button class="btn btn-primary btn-sm" id="addAddress">Add Address</button>
                        </div>
                        <div class="scrollable-column list-group"> 
                            <div class="list-group-item align-items-center">
                                <span value="">#profile.Address#</span>
                                <button class="btn btn-danger btn-sm float-right deleteAddress" data-userid="#profile.idAddress#">Delete</button>
                                <button class="btn btn-secondary btn-sm mx-2 float-right editAddress" data-userid="#profile.idAddress#">Edit</button>
                                <button class="btn btn-success btn-sm float-right selectAddress" data-userid="#profile.idAddress#">Select</button>
                            </div>
                            <cfloop array="#getAddress#" index="getAdd">
                                <div class="list-group-item align-items-center">
                                    <span value="">#getAdd.Address#</span>
                                    <button class="btn btn-danger btn-sm float-right deleteAddress" data-userid="#getAdd.id#">Delete</button>
                                    <button class="btn btn-secondary btn-sm mx-2 float-right editAddress" data-userid="#getAdd.id#">Edit</button>
                                    <button class="btn btn-success btn-sm float-right selectAddress" data-userid="#getAdd.id#">Select</button>
                                </div>
                            </cfloop>
                        </div>
                    </div>
                </div>
            </div>

            <div id="modal">
                <div id="addAddressModal" class="modal"> <!-- Add Address -->
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <form action="addressAction.cfm" method="post">
                            <div class="form-group">
                                <label for="address">Address<span class="asterisk">*</span></label>
                                <p id="l_address" class="validationError"><i>Invalid Address. Try Again...</i></p>
                                <input type="text" class="form-control" id="address" placeholder="Enter your address" name="addAddress">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary categoryClose">Close</button>
                                <button type="submit" class="btn btn-success" name="submit">Add</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div id="editAddressModal" class="modal"> <!-- Edit Address -->
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <form action="addressAction.cfm" method="post" id="editForm">
                            <div class="form-group">
                                <label for="address">Address<span class="asterisk">*</span></label>
                                <p id="l_address" class="validationError"><i>Invalid Address. Try Again...</i></p>
                                <input type="text" class="form-control oldAddress" placeholder="Enter your address" name="newAddress">
                            </div>

                            <input type="hidden" class="form-control oldAddresId" name="oldAddresId">

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary categoryClose">Close</button>
                                <button type="submit" class="btn btn-success" name="submit">Save changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </cfoutput>
    </body>
</html>
<cfcatch type="any">
    <cfdump  var="#cfcatch#">
</cfcatch>
</cftry>
