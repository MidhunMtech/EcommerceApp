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
        $('.cat_categoryName').val('');
        $('.cat_categoryId').val('');
        showModal("#addEditCategoryModal");
    });

    $("#addSubCategory").click(function() {
        $('.sub_category').val('');
        $('.sub_category').text('Select a category');
        $('.sub_subCategoryName').val('');
        $('.sub_subCategoryId').val('');

        showModal("#addEditSubCategoryModal");
    });

    $("#addProducts").click(function() {
        // Clear input fields
        $('.productName').val('');
        $('.productDesc').val('');
        $('.productPrice').val('');
        $('.productId').val('');
        $('.pro_subcat').text('Select a sub-category');
        $('.pro_subcat').val('');
        $('.thumbnail-container').text('');
        $('.oldThumbnail').val('');
        
        $('.image-container').empty();
        
        showModal("#addEditProductModal");
    });

    

    $(".close, .categoryClose").click(function() {
        hideModal("#addCategoryModal");
        hideModal("#addSubCategoryModal");
        hideModal("#addProductModal");
        hideModal("#addImageModal");
        hideModal("#addEditCategoryModal");
        hideModal("#addEditSubCategoryModal");
        hideModal("#addEditProductModal");
        hideModal("#EditImageModal");
    });

    $(window).click(function(event) {
        handleWindowClick(event, "#addCategoryModal");
        handleWindowClick(event, "#addSubCategoryModal");
        handleWindowClick(event, "#addProductModal");
        handleWindowClick(event, "#addImageModal");
        handleWindowClick(event, "#addEditCategoryModal");
        handleWindowClick(event, "#addEditSubCategoryModal");
        handleWindowClick(event, "#addEditProductModal");
        handleWindowClick(event, "#EditImageModal");
    });


    $('#add-image').on('click', function() {  //for adding images for product..
        const newImageInput = $('<input>', {
            type: 'file',
            class: 'form-control-file',
            name: 'images',  // Use the array syntax for multiple files
            accept: 'image/*',
            required: true
        });

        const newLabel = $('<label>', {
            text: 'Images:'
        });

        $('#image-container').append(newLabel).append(newImageInput);
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
                $('#addEditCategoryModal').show(); 
                
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
                $('#addEditSubCategoryModal').show(); 
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
                proid: proid
            },
            success: function(response) {
                var proData = JSON.parse(response);
                $('#addEditProductModal').show(); 
                console.log(proData);
                console.log(proData[1][0].thumbnail);
    
                // Populate product details
                $('.pro_subcat').text(proData[1][0].subCategoryName);
                $('.pro_subcat').val(proData[1][0].subCategoryId);
                $('.productName').val(proData[1][0].productName);
                $('.productDesc').val(proData[1][0].productDescription);
                $('.productPrice').val(proData[1][0].productPrice);
                $('.productId').val(proData[1][0].productId);
                $('.thumbnail-container').text(proData[1][0].thumbnail);
                // $('.productThumbnail').val(proData[1][0].thumbnail);
                $('.oldThumbnail').val(proData[1][0].thumbnail);
    
                // Clear the image container before appending new data
                $('.image-container').empty();
    
                for (var i in proData[2]) {
                    let imageNameHtml = `
                        <div class="list-group-item align-items-center">
                            <span class="imageName">${proData[2][i].imageName}</span>
                            <button class="btn btn-danger btn-sm mx-2 float-right deleteImage" data-userid="${proData[2][i].imageId}">Delete</button>
                            <!--- <button class="btn btn-secondary btn-sm float-right editImage" data-userid="${proData[2][i].imageId}">Edit</button> --->
                        </div>
                    `;
                    $('.image-container').append(imageNameHtml);
                }
            }
        });
    });


    $("#addImages").click(function(event) {
        event.preventDefault();
    
        // Hide the product modal
        $('#addEditProductModal').hide();
        
        showModal("#addImageModal");
    });
    
    // Event delegation for dynamically generated editImage buttons
    $('.image-container').on('click', '.editImage', function(event) {
        // Prevent the default behavior (page reload)
        event.preventDefault();
    
        // Hide the product modal
        $('#addEditProductModal').hide();
    
        // Get the image ID
        var imgid = $(this).data('userid');
    
        // Make the AJAX request to fetch image data
        $.ajax({
            url: '../component/component.cfc?method=getCategories',
            method: 'GET',
            data: {
                imgid: imgid
            },
            success: function(response) {
                var imgData = JSON.parse(response);
                console.log(imgData);
    
                // Show the image edit modal
                $('#EditImageModal').show();
    
                // Populate the modal with the image data
                $(".imgProductId").text(imgData[2][0].productName);
                $(".imgProductId").val(imgData[2][0].productId);
                $(".oldImg").text(imgData[2][0].imageName);
                $(".oldImgName").val(imgData[2][0].imageName);
                $(".imgId").val(imgData[2][0].imageId);
            }
        });
    });
    
    $('.image-container').on('click', '.deleteImage', function(event) {
        // Prevent the default behavior (page reload)
        event.preventDefault();
    
        // Hide the product modal
        // $('#editProductModal').hide();

        var imgid = $(this).data('userid');
        if (confirm("Are you sure you want to delete this?")) {
            $.ajax({
                url: '../component/component.cfc?method=deleteProduct',
                method: 'POST',
                data: {
                    imgid: imgid
                },
                success: function(response) {
                    window.location.href = 'adminDash.cfm';
                }
            });
        }
    });
    

    function deleteItem(itemType, itemId) {
        if (confirm("Are you sure you want to delete this?")) {
            $.ajax({
                url: '../component/component.cfc?method=deleteProduct',
                method: 'POST',
                data: {
                    [itemType]: itemId
                },
                success: function(response) {
                    window.location.href = 'adminDash.cfm';
                }
            });
        }
    }
    
    $(".deleteProduct").click(function() { 
        var proid = $(this).data('userid');
        deleteItem('proid', proid);
    });
    
    $(".deleteSubCategory").click(function() { 
        var subid = $(this).data('userid');
        deleteItem('subid', subid);
    });
    
    $(".deleteCategory").click(function() { 
        var catid = $(this).data('userid');
        deleteItem('catid', catid);
    });

    /* $(".deleteImage").click(function() { 
        var imgid = $(this).data('userid');
        deleteItem('imgid', imgid);
    }); */
    

    /* $(".deleteImage").click(function() { 
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
    }); */

    /* $(".editImage").click(function() { 
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
                $(".imgProductId").text(imgData[2][0].productName);
                $(".imgProductId").val(imgData[2][0].productId);
                $(".oldImg").text(imgData[2][0].imageName);
                $(".oldImgName").val(imgData[2][0].imageName);
                $(".imgId").val(imgData[2][0].imageId);
            }
        });
    }); */
});
