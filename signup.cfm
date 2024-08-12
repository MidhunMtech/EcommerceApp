<cfif structKeyExists(session, "userid")>
    <cflocation  url="/profile.cfm">
</cfif>
<cfinclude  template="/signupAction.cfm">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheets.css">
        <script src="/js/signup.js" defer></script>
    </head>
    <body>
    <cfinclude  template="navbar.cfm">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow">
                        <div class="card-header text-center">
                            <h4>Sign Up</h4>
                        </div>
                        <div class="card-body">
                            <div class="text-center error">
                                <cfif structKeyExists(variables, "result")>
                                    <p class="errorMessage">
                                        <cfoutput>
                                            <b>#result.message#</b>
                                        </cfoutput>
                                    </p>
                                <cfelseif structKeyExists(url, "error") AND url.error EQ "notFill">
                                    <p class="errorMessage"><b>Fill All The Inputs...</b></p>
                                </cfif>  
                            </div>
                            <form action="" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="name">Name<span class="asterisk">*</span></label>
                                    <p id="l_name" class="validationError"><i>Invalid Name. Try Again...</i></p>
                                    <input type="text" class="form-control" id="name" placeholder="Enter your name" name="fullname">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email<span class="asterisk">*</span></label>
                                    <p id="l_email" class="validationError"><i>Invalid Email. Try Again...</i></p>
                                    <input type="email" class="form-control" id="email" placeholder="Enter your email" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone<span class="asterisk">*</span></label>
                                    <p id="l_phone" class="validationError"><i>Invalid Phone Number. Try Again...</i></p>
                                    <input type="tel" class="form-control" id="phone" placeholder="Enter your phone number" name="phone">
                                </div>
                                <div class="form-group">
                                    <label for="photo">Photo<span class="asterisk">*</span></label>
                                    <p id="l_photo" class="validationError"><i>Invalid Image. Try Again...</i></p>
                                    <input type="file" class="form-control" id="photo" name="profilePicture">
                                </div>
                                <div class="form-group">
                                    <label for="address">Address<span class="asterisk">*</span></label>
                                    <p id="l_address" class="validationError"><i>Invalid Address. Try Again...</i></p>
                                    <input type="text" class="form-control" id="address" placeholder="Enter your address" name="address">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password<span class="asterisk">*</span></label>
                                    <p id="l_passowrd" class="validationError"><i>Minimum 7 characters Needed. Try Again...</i></p>
                                    <input type="password" class="form-control" id="password" placeholder="Enter your password" name="password">
                                </div>
                                <div class="form-group">
                                    <label for="confirmPassword">Confirm Password<span class="asterisk">*</span></label>
                                    <p id="l_cpassword" class="validationError"><i>Minimum 7 characters Needed. Try Again...</i></p>
                                    <p id="l_cpassword2" class="validationError"><i>Password and Confirm Password Not Matching. Try Again...</i></p>
                                    <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm your password" name="confirmPassword">
                                </div>
                                <button type="submit" class="btn btn-primary btn-block" name="signup" id="signup">Sign Up</button>
                            </form>
                        </div>
                        <div class="card-footer text-center">
                            <small>Already have an account? <a href="./login.cfm">Login here</a></small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <cfinclude  template="/footer.cfm">
    </body>
</html>
