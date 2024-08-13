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

    $("#addImages").click(function() {
        showModal("#addImageModal");
    });

    $(".close, .categoryClose").click(function() {
        hideModal("#addCategoryModal");
        hideModal("#addSubCategoryModal");
        hideModal("#addProductModal");
        hideModal("#addImageModal");
        hideModal("#editCategoryModal");
        hideModal("#editSubCategoryModal");
        hideModal("#editProductModal");
        hideModal("#EditImageModal");
    });

    $(window).click(function(event) {
        handleWindowClick(event, "#addCategoryModal");
        handleWindowClick(event, "#addSubCategoryModal");
        handleWindowClick(event, "#addProductModal");
        handleWindowClick(event, "#addImageModal");
        handleWindowClick(event, "#editCategoryModal");
        handleWindowClick(event, "#editSubCategoryModal");
        handleWindowClick(event, "#editProductModal");
        handleWindowClick(event, "#EditImageModal");
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


    $(".editProduct").click(function() {
        var proid = $(this).data('userid');
        $.ajax({
            url: '../component/component.cfc?method=getCategories',
            method: 'GET',
            data: {
                proid : proid
            },
            success: function(response) {
                var proData = JSON.parse(response);
                $('#editProductModal').show(); 
                console.log(proData);
                $('.pro_subcat').text(proData[1][0].subCategoryName);
                $('.pro_subcat').val(proData[1][0].subCategoryId);
                $('.productName').val(proData[1][0].productName);
                $('.productDesc').val(proData[1][0].productDescription);
                $('.productPrice').val(proData[1][0].productPrice);
                $('.productId').val(proData[1][0].productId);
            }
        });
    });

    $(".editImage").click(function() { 
        var imgid = $(this).data('userid');
        $.ajax({
            url: '../component/component.cfc?method=getCategories',
            method: 'GET',
            data: {
                imgid : imgid
            },
            success: function(response) {
                var imgData = JSON.parse(response);
                console.log(imgData);
                $('#EditImageModal').show();
                $(".imgProductId").text(imgData[1][0].productName);
                $(".imgProductId").val(imgData[1][0].productId);
                $(".oldImg").text(imgData[1][0].image[0].imageName);
                $(".oldImgName").val(imgData[1][0].image[0].imageName);
                $(".imgId").val(imgData[1][0].image[0].imageId);
            }
        });
    });

    $(".deleteImage").click(function() { 
        var imgid = $(this).data('userid');

        if (confirm("Are you sure you want to delete this user?")) {
            $.ajax({
                url: '../component/component.cfc?method=deleteProduct',
                method: 'POST',
                data: {
                    imgid : imgid  
                },
                success: function(response) {
                    window.location.href = 'adminDash.cfm';
                }
            });
        }
    });

    $(".deleteProduct").click(function() { 
        var proid = $(this).data('userid');

        if (confirm("Are you sure you want to delete this user?")) {
            $.ajax({
                url: '../component/component.cfc?method=deleteProduct',
                method: 'POST',
                data: {
                    proid : proid  
                },
                success: function(response) {
                    window.location.href = 'adminDash.cfm';
                }
            });
        }
    });

    $(".deleteSubCategory").click(function() { 
        var subid = $(this).data('userid');

        if (confirm("Are you sure you want to delete this user?")) {
            $.ajax({
                url: '../component/component.cfc?method=deleteProduct',
                method: 'POST',
                data: {
                    subid : subid  
                },
                success: function(response) {
                    window.location.href = 'adminDash.cfm';
                }
            });
        }
    });

    $(".deleteCategory").click(function() { 
        var catid = $(this).data('userid');

        if (confirm("Are you sure you want to delete this user?")) {
            $.ajax({
                url: '../component/component.cfc?method=deleteProduct',
                method: 'POST',
                data: {
                    catid : catid  
                },
                success: function(response) {
                    window.location.href = 'adminDash.cfm';
                }
            });
        }
    });
});
