<cfif NOT structKeyExists(session, "userid")>
    <cflocation  url="/login.cfm">
</cfif>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="profile.css">
    <link rel="stylesheet" href="/css/home.css">
</head>
<body>
    <cfinclude  template="navbar.cfm">
    <div class="container mt-5">
        <div class="card">
            <div class="card-body text-center">
                <img src="images/Midhun.jpg" alt="Profile Picture" class="rounded" width="150">
                <h2 class="mt-3">John Doe</h2>
                <p class="text-muted">Email: johndoe@example.com</p>
                <p class="text-muted">Phone: +1234567890</p>
                <div class="d-flex justify-content-center">
                    <p class="mr-2">Address: 123 Main St, City, Country</p>
                    <button class="btn btn-primary btn-sm">Add/Edit</button>
                </div>
                <hr>
                <div class="d-flex justify-content-around mt-4">
                    <button class="btn btn-info">Order Details</button>
                    <button class="btn btn-danger">Logout</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>
