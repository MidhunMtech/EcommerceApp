<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>eCommerce App Home Page</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .dropdown-submenu {
      position: relative;
    }

    .dropdown-submenu .dropdown-menu {
      top: 0;
      left: 100%;
      margin-top: -1px;
    }

    .navbar-brand {
      font-weight: bold;
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">eCommerce</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Shop</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="#">Electronics</a></li>
            <li><a class="dropdown-item" href="#">Fashion</a></li>
            <li class="dropdown-submenu">
              <a class="dropdown-item dropdown-toggle" href="#">Home & Garden</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Furniture</a></li>
                <li><a class="dropdown-item" href="#">Kitchen</a></li>
                <li><a class="dropdown-item" href="#">Outdoor</a></li>
              </ul>
            </li>
            <li><a class="dropdown-item" href="#">Sports</a></li>
            <li><a class="dropdown-item" href="#">Toys</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contact</a></li>
      </ul>
    </div>
  </nav>

  <!-- Bootstrap JS and dependencies -->
 
</body>
</html>
