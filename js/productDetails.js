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

    /* $("#filter").click(function() {
        let value = $("#filter").val();
        let urlParams = new URLSearchParams(window.location.search);
        let subid = urlParams.get('subid');
        console.log(subid);
        
        
        $.ajax({
            url: '../component/component.cfc?method=getCategories',
            method: 'GET',
            data: {
                value : value,
                subid : subid
            },
            success: function(response) {
                let data = JSON.parse(response);
                console.log(data);
            }
        })
    }) */
        
});