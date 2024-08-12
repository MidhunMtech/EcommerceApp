<cfif structKeyExists(session, "adminid")>
    <cflocation  url="/admin/adminDash.cfm">
</cfif>
<cfinclude  template="/loginAction.cfm">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Login</title>
        <link rel="stylesheet" href="/css/bootstrap.min.css">
        <link rel="stylesheet" href="/css/stylesheets.css">
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow">
                        <div class="card-header text-center">
                            <h4>Admin Login</h4>
                        </div>
                        <div class="card-body">
                            <form action="" method="post">
                                <div class="form-group">
                                    <label for="email">Username</label>
                                    <input type="text" class="form-control" id="email" placeholder="Enter your Username" name="username">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" placeholder="Enter your password" name="password">
                                </div>
                                <button type="submit" class="btn btn-primary btn-block" name="adminLogin">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
