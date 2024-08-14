$(document).ready(function() {
    function showModal(modalId) {           //show modal for adding
        $(modalId).show();
    }

    function hideModal(modalId) {            //hide modal using X and CLOSE
        $(modalId).hide();
    }

    function handleWindowClick(event, modalId) {    //hide modal using window
        if (event.target == $(modalId)[0]) {
            hideModal(modalId);
        }
    }

    $("#addAddress").click(function() {
        showModal("#addAddressModal");
    });

    $(".close, .categoryClose").click(function() {
        hideModal("#addAddressModal");
        hideModal("#editAddressModal");
    });

    $(window).click(function(event) {
        handleWindowClick(event, "#addAddressModal");
        handleWindowClick(event, "#editAddressModal");
    });

    $(".editAddress").click(function() {
        var addid = $(this).data('userid');
        $.ajax({
            url: '../component/component.cfc?method=addAndGetAddress',
            method: 'GET',
            data: {
                addid : addid
            },
            success: function(response) {
                var addressData = JSON.parse(response);
                console.log(addressData[0].id);
                $('#editAddressModal').show(); 
                $(".oldAddress").val(addressData[0].Address);
                $(".oldAddresId").val(addressData[0].id);
            }
        });
    });

    $(".selectAddress").click(function() {
        var selectid = $(this).data('userid');
        if (confirm("Are you sure you want to select this address?")) {
            $.ajax({
                url: '../component/component.cfc?method=addAndGetAddress',
                method: 'GET',
                data: {
                    selectid : selectid
                },
                success: function(response) {
                    window.location.href = '/profile.cfm';
                }
            });
        }
    });

    $(".deleteAddress").click(function() { 
        var delid = $(this).data('userid');

        if (confirm("Are you sure you want to delete this address?")) {
            $.ajax({
                url: '../component/component.cfc?method=addAndGetAddress',
                method: 'POST',
                data: {
                    delid : delid  
                },
                success: function(response) {
                    window.location.href = '/address.cfm';
                }
            });
        }
    });

});