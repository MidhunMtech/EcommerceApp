$(document).ready(function() {    
    function loadProducts(filterValue = 3, sortValue = "A", pageNo = 0, searchValue = "") {
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
                try {
                    let data = JSON.parse(response);
                    let $container = $('#productsContainer');
                    $container.empty(); // Clear any existing content
                    
                    // Loop through each product and create the HTML
                    for (let i = 0; i < data[1].length; i++) {
                        let product = data[1][i];
                        let productHtml = `
                            <div class="col-md-4">
                                <div class="card product-card">
                                    <a href="product-details/${product.productId}" class="productLink">
                                        <img class="card-img-top productImage" src="/images/thumbnail/${product.thumbnail}" alt="${product.productName}" height="150">
                                        <div class="card-body">
                                            <h5 class="card-title productName">${product.productName}</h5>
                                            <p class="card-text text-danger productPrice">${product.productPrice}</p>
                                            <a href="product-details/${product.productId}" class="btn btn-primary">Buy Now</a>
                                        </div>
                                    </a>
                                </div>
                            </div>`;
                        $container.append(productHtml);
                    }
                } catch (e) {
                    console.error("Error parsing response:", e);
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX request failed:", status, error);
            }
        });
    }

    // Load products initially without any filter
    loadProducts();

    // Handle filter change
    $("#filter").change(function() {
        var filterVal = $(this).val();
        var sortVal = $("#sort").val();
        loadProducts(filterVal, sortVal); // Load products with the selected filter value
    });

    // Handle sort change
    $("#sort").change(function() {
        var sortVal = $(this).val();
        var filterVal = $("#filter").val();
        loadProducts(filterVal, sortVal); // Load products with the selected sort value
    });

    // Handle page number click
    $(".pageNo").click(function() {
        var filterVal = $("#filter").val();
        var sortVal = $("#sort").val();
        var pageNo = $(this).val();
        loadProducts(filterVal, sortVal, pageNo); // Load products with the selected filter, sort, and page number
    });

    // Handle search submit
    $("#searchSubmit").click(function() {
        var filterVal = $("#filter").val();
        var sortVal = $("#sort").val();
        var searchValue = $("#searchValue").val();
        loadProducts(filterVal, sortVal, 0, searchValue); // Load products with the selected filter, sort, and search values
    });
});
