$(document).ready(function() {
    $(".removeCart").click(function() { 
        var cartid = $(this).data('userid');
        if (confirm("Are you sure you want to delete this product from cart?")) {
            $.ajax({
                url: '../component/component.cfc?method=addToCart',
                method: 'POST',
                data: {
                    cartid : cartid  
                },
                success: function(response) {
                    window.location.href = '/cart';
                }
            });
        }
    });

    $(".quantityCart").click(function() { 
        var quantityid = $(this).data('userid'); 
        var quantity = $(".quantityValue" + quantityid).val();
        $.ajax({
            url: '../component/component.cfc?method=addToCart',
            method: 'POST',
            data: {
                quantity : quantity,
                quantityid : quantityid
            },
            success: function(response) {
                window.location.href = '/cart';
            }
        });
    });
});