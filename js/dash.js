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

    $("#addCategory").click(function() {
        showModal("#addCategoryModal");
    });

    $("#addSubCategory").click(function() {
        showModal("#addSubCategoryModal");
    });

    $("#addProducts").click(function() {
        showModal("#addProductModal");
    });

    $(".editCategory").click(function() {
        showModal("#editCategoryModal");
    });

    $(".editSubCategory").click(function() {
        showModal("#editSubCategoryModal");
    });

    $(".editProduct").click(function() {
        showModal("#editProductModal");
    });

    $(".close, .categoryClose").click(function() {
        hideModal("#addCategoryModal");
        hideModal("#addSubCategoryModal");
        hideModal("#addProductModal");
        hideModal("#editCategoryModal");
        hideModal("#editSubCategoryModal");
        hideModal("#editProductModal");
    });

    $(window).click(function(event) {
        handleWindowClick(event, "#addCategoryModal");
        handleWindowClick(event, "#addSubCategoryModal");
        handleWindowClick(event, "#addProductModal");
        handleWindowClick(event, "#editCategoryModal");
        handleWindowClick(event, "#editSubCategoryModal");
        handleWindowClick(event, "#editProductModal");
    });
});
