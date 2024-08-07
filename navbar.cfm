<script src="js/home.js" defer></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/home.cfm">E-Shop</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto nav_ul">
            <!---<li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Shop</a>
            </li>--->
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" href="" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <b>Categories</b>
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <li><a class="dropdown-item" href="">Electronics</a></li>
                    <li><a class="dropdown-item" href="">Fashion</a></li>
                    <li class="dropdown-submenu dropleft">
                        <a class="dropdown-item dropdown-toggle" href="">Phone</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/product.cfm">Apple</a></li>
                            <li><a class="dropdown-item" href="">Kitchen</a></li>
                            <li><a class="dropdown-item" href="">Outdoor</a></li>
                        </ul>
                    </li>
                    <li class="dropdown-submenu dropleft" >
                        <a class="dropdown-item dropdown-toggle" href="">Home & Garden</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="">Furniture</a></li>
                            <li><a class="dropdown-item" href="">Kitchen</a></li>
                            <li><a class="dropdown-item" href="">Outdoor</a></li>
                        </ul>
                    </li>
                    <li class="dropdown-submenu dropleft" >
                        <a class="dropdown-item dropdown-toggle" href="">Home & Garden</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="">Furniture</a></li>
                            <li><a class="dropdown-item" href="">Kitchen</a></li>
                            <li><a class="dropdown-item" href="">Outdoor</a></li>
                        </ul>
                    </li>
                    <li><a class="dropdown-item" href="">Sports</a></li>
                    <li><a class="dropdown-item" href="">Toys</a></li>
                </ul>
                </li>
            <li class="nav-item active mx-2">
                <a class="nav-link" href="#"><b><i class="bi bi-cart"></i>Cart</b></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/profile.cfm"><i class="bi bi-person-circle"></i></a>
            </li>
        </ul>
    </div>
</nav>