<cfif structKeyExists(session, "userid")>
    <cflocation  url="/profile.cfm">
</cfif>
<cfinclude  template="/loginAction.cfm">

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheets.css">
        <script src="js/login.js" defer></script>
    </head>
    <body>
        <cfinclude  template="/navbar.cfm">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow">
                        <div class="card-header text-center">
                            <h4>Login</h4>
                        </div>
                        <div class="card-body">
                            <div class="text-center error">
                                <cfif structKeyExists(variables, "result") AND result.success EQ 0>
                                    <cfoutput><p class="errorMessage"><b>#result.message#</b></p></cfoutput>
                                <cfelseif structKeyExists(url, "error") AND url.error EQ "notFill">
                                    <p class="errorMessage"><b>Fill All The Inputs...</b></p>
                                <cfelseif structKeyExists(url, "signup") AND url.signup EQ "success">
                                    <p class="successMessage">
                                        <b>SignUp Completed. Login here...</b>
                                    </p> 
                                </cfif>
                            </div>
                            <form action="" method="post">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <p id="l_email" class="validationError"><i>Invalid Email. Try Again...</i></p>
                                    <input type="email" class="form-control" id="email" placeholder="Enter your Username" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <p id="l_passowrd" class="validationError"><i>Invalid Password. Try Again...</i></p>
                                    <input type="password" class="form-control" id="password" placeholder="Enter your password" name="password">
                                </div>
                                <button type="submit" class="btn btn-primary btn-block" name="login" id="login">Login</button>
                            </form>
                        </div>
                        <div class="card-footer text-center">
                            <small>Don't have an account? <a href="/signup.cfm">Sign up here</a></small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <cfinclude  template="/footer.cfm">
    </body>
</html>
