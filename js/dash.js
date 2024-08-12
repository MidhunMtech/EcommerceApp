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


    $(".editCategory").click(function() {
        var catid = $(this).data('userid');
        $.ajax({
            url: '../component/component.cfc?method=getCategories',
            method: 'GET',
            data: {
                catid : catid
            },
            success: function(response) {
                var catData = JSON.parse(response);
                $('#editCategoryModal').show(); 
                
                $('.cat_categoryName').val(catData[0][0].categoryName);
                $('.cat_categoryId').val(catData[0][0].categoryId);
            }
        });
    });

    
    $(".editSubCategory").click(function() {
        var subid = $(this).data('userid');
        $.ajax({
            url: '../component/component.cfc?method=getCategories',
            method: 'GET',
            data: {
                subid : subid
            },
            success: function(response) {
                var subData = JSON.parse(response);
                $('#editSubCategoryModal').show(); 
                // console.log(subData);
                $('.sub_category').val(subData[0][0].categoryId);
                $('.sub_category').text(subData[0][0].categoryName);
                $('.sub_subCategoryName').val(subData[0][0].subCategory[0].Name);
                $('.sub_subCategoryId').val(subData[0][0].subCategory[0].Id);
            }
        });
    });
});
