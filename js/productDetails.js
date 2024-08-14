$(document).ready(function() {
    $(".addToCart").click(function() {
        var proid = $(this).data('userid');
        $.ajax({
            url: '../component/component.cfc?method=addToCart',
            method: 'GET',
            data: {
                proid : proid
            },
            success: function(response) {
                window.location.href = '/cart.cfm';  
            }
        });
    });
});