
<cfinvoke  method="getCategories" component="component.component" returnVariable="getCategory">
<script src="/js/jquery.min.js"></script>
<script src="/js/home.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/home">E-Shop</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <cfif structKeyExists(url, "subid")>
        <div class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchValue" id="searchValue">
            <button class="btn btn-outline-secondary my-2 my-sm-0" name="searchSubmit" id="searchSubmit">Search</button>
        </div>
    <cfelse>
        <form action="/searchView.cfm" method="post" class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchValue">
            <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit" name="searchSubmit">Search</button>
        </form>
    </cfif>
    
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto nav_ul">
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" href="" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <b>Categories</b>
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <cfoutput>
                        <cfloop array="#getCategory[1]#" index="cat">
                            <li class="dropdown-submenu dropleft">
                                <a class="dropdown-item dropdown-toggle" href="">#cat.categoryName#</a>
                                <ul class="dropdown-menu">
                                    <cfloop array="#cat.subCategory#" index="sub">
                                        <li><a class="dropdown-item" href="/product.cfm?subid=#sub.Id#">#sub.Name#</a></li>
                                    </cfloop>
                                </ul>
                            </li>
                        </cfloop>
                    </cfoutput>
                </ul>
            </li>
            <li class="nav-item active mx-2">
                <a class="nav-link" href="/cart"><b><i class="bi bi-cart"></i>Cart</b></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/profile.cfm"><i class="bi bi-person-circle"></i></a>
            </li>
        </ul>
    </div>
</nav>