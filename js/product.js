$(document).ready(function() {    
    function loadProducts(filterValue = 3, sortValue = "A", pageNo, searchValue) {
        let urlParams = new URLSearchParams(window.location.search);
        let subid = urlParams.get('subid');
        
        $.ajax({
            url: '../component/component.cfc?method=getCategories',
            method: 'GET',
            data: {
                subid: subid,
                filterVal: filterValue,
                sortVal: sortValue,
                pageNo: pageNo,
                searchValue: searchValue
            },
            success: function(response) {
                let data = JSON.parse(response);
                let $container = $('#productsContainer');
                $container.empty(); // Clear any existing content
                
                // Loop through each product and create the HTML
                for (let i = 0; i < data[1].length; i++) {
                    let product = data[1][i];
                    let productHtml = `
                        <div class="col-md-4">
                            <div class="card product-card">
                                <a href="productDetails.cfm?id=${product.productId}" class="productLink">
                                    <img class="card-img-top productImage" src="/images/thumbnail/${product.thumbnail}" alt="${product.productName}" height="150">
                                    <div class="card-body">
                                        <h5 class="card-title productName">${product.productName}</h5>
                                        <p class="card-text text-danger productPrice">${product.productPrice}</p>
                                        <a href="productDetails.cfm?id=${product.productId}" class="btn btn-primary">Buy Now</a>
                                    </div>
                                </a>
                            </div>
                        </div>`;
                    $container.append(productHtml);
                }
            }
        });
    }

    // Load products initially without any filter
    loadProducts();

    // Handle filter click
    $("#filter").change(function() {
        var filterVal = $("#filter").val();
        var currentSortVal = $("#sort").val();
        loadProducts(filterVal,currentSortVal); // Load products with the selected filter value
    });

    $("#sort").change(function() {
        var sortVal = $("#sort").val();
        var currentFilterVal = $("#filter").val();
        loadProducts(currentFilterVal, sortVal); // Load products with the selected filter value
    });

    $(".pageNo").click(function() {
        var currentFilterVal = $("#filter").val(); // Define currentFilterVal
        var sortVal = $("#sort").val();
        var pageNo = $(this).val();
        console.log(pageNo);
        
        
        loadProducts(currentFilterVal, sortVal, pageNo); // Load products with the selected filter, sort, and search values
    });

    // Handle search submit
    $("#searchSubmit").click(function() {
        var currentFilterVal = $("#filter").val(); // Define currentFilterVal
        var sortVal = $("#sort").val();
        var searchValue = $("#searchValue").val();
        
        loadProducts(currentFilterVal, sortVal, searchValue); // Load products with the selected filter, sort, and search values
    });
});

