/* $(document).ready(function() {    
    let urlParams = new URLSearchParams(window.location.search);
    let subid = urlParams.get('subid');
    $.ajax({
        url: '../component/component.cfc?method=getCategories',
        method: 'GET',
        data: {
            subid : subid
        },
        success: function(response) {
            let data = JSON.parse(response);
            console.log(data);
            for(i in data[1]) {
                console.log(data[1][i].productName);
                console.log(data[1][i].productId);
                $('.productLink').attr('href', 'productDetails.cfm?id='  + data[1][i].productId);
                $('.productImage').attr('src', '/images/thumbnail/'  + data[1][i].thumbnail);
                $('.productName').text(data[1][i].productName);
                $('.productPrice').text(+ data[1][i].productPrice);
                
            }
        }
    })
        
}); */
$(document).ready(function() {    
    let urlParams = new URLSearchParams(window.location.search);
    let subid = urlParams.get('subid');
    
    $.ajax({
        url: '../component/component.cfc?method=getCategories',
        method: 'GET',
        data: {
            subid : subid
        },
        success: function(response) {
            let data = JSON.parse(response);
            console.log(data);
            
            // Assuming you want to append the products to a container with id 'productsContainer'
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
});
