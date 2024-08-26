

<!-- Column 4 -->
<!--- <div class="col-md-3">
    <div class="column-heading">
    <h5>Images</h5><span class="sort-by"></span>
    <button class="btn btn-primary btn-sm" id="addImages">Add</button>
    </div>
    <div class="scrollable-column list-group">
    <cfloop array="#getCat[3]#" index="image">
        <!--- <cfloop array="#img.image#" index="image"> --->
        <cfif len(image.imageName) AND image.is_delete EQ 0>
            <!--- <div class="list-group-item align-items-center">
            <span>#image.imageName#</span>
            <!--- <a href="" class="btn btn-light btn-sm float-right">Sortby</a> --->
            <button class="btn btn-danger btn-sm mx-2 float-right deleteImage" data-userid="#image.imageId#">Delete</button>
            <button class="btn btn-secondary btn-sm float-right editImage" data-userid="#image.imageId#">Edit</button>
            </div> --->
        </cfif>
        <!--- </cfloop> --->
    </cfloop>
    </div>
</div> --->


<!--- <div id="addCategoryModal" class="modal"> <!-- Add Category -->
<div class="modal-content">
    <span class="close">&times;</span>
    <form action="" method="post" id="editForm">
    <div class="form-group">
        <label for="nameInput">Category:</label>
        <input type="text" class="form-control" id="nameInput" name="categoryName">
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary categoryClose">Close</button>
        <button type="submit" class="btn btn-success" name="submit">Add</button>
    </div>
    </form>
</div>
</div> --->

<!--- <div id="addSubCategoryModal" class="modal">   <!-- Add SubCatergory -->
<div class="modal-content">
    <span class="close">&times;</span>
    <form action="" method='post'>
    <div class="form-group">
        <label for="category">Category:</label>
        <select class="form-control" id="category" name="categoryId">
        <option value="">Select a category</option>
        <cfloop array="#getCat[1]#" index="getcategory">
            <option value="#getcategory.categoryId#">#getcategory.categoryName#</option>
        </cfloop>
        </select>
    </div>

    <div class="form-group">
        <label for="nameInput">Sub-Category:</label>
        <input type="text" class="form-control" name="subCategoryName">
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary categoryClose">Close</button>
        <button type="submit" class="btn btn-success" name="submit">Add</button>
    </div>
    </form>
</div>
</div> --->

<!--- <div id="addProductModal" class="modal">   <!-- Add Products -->
<div class="modal-content">
    <span class="close">&times;</span>
    <form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="category">Sub-Category:</label>
        <select class="form-control" id="category" name="subcat">
        <option value="">Select a sub-category</option>
        <cfloop array="#getCat[1]#" index="sub">
            <cfloop array="#sub.subCategory#" index="subCategory">
            <cfif len(subCategory.Name)>
                <option value="#subCategory.Id#">#subCategory.Name#</option>
            </cfif>
            </cfloop>
        </cfloop>
        </select>
    </div>

    <div class="form-group">
        <label for="nameProduct">Product Name:</label>
        <input type="text" class="form-control" id="nameProduct" name="productName" required>
    </div>

    <div class="form-group">
        <label for="description">Description:</label>
        <textarea class="form-control" id="description" name="productDesc" rows="4" required></textarea>
    </div>

    <div class="form-group">
        <label for="rate">Price:</label>
        <input type="number" class="form-control" id="rate" name="productPrice" min="0" step="0.01" required>
    </div>

    <div class="form-group">
        <label for="thumbnail">Thumbnail:</label>
        <input type="file" class="form-control-file" id="thumbnail" name="thumbnail" accept="image/*" required>
    </div>
    
    <div class="form-group" id="image-container">
        <label for="image">Images:</label>
        <input type="file" class="form-control-file" id="image" name="images" accept="image/*" required>
    </div>

    <div class="form-group">
        <button type="button" class="btn btn-primary" id="add-image">Add Another Image</button>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary categoryClose">Close</button>
        <button type="submit" class="btn btn-success" name="submit">Add</button>
    </div>
</form>
</div>
</div> --->

<!--- <div id="addImageModal" class="modal"> <!-- Add Image -->
<div class="modal-content">
    <span class="close">&times;</span>
    <form action="" method="post" id="editForm" enctype="multipart/form-data">
    <div class="form-group">
        <label for="product">Product:</label>
        <select class="form-control" id="category" name="productId">
        <option value="">Select a Product</option>
        <cfloop array="#getCat[2]#" index="pro">
            <cfif pro.sub_is_delete EQ 0>
            <option value="#pro.productId#">#pro.productName#</option>
            </cfif>
        </cfloop>
        </select>
    </div>
    <div class="form-group">
        <label for="image">Image:</label>
        <input type="file" class="form-control-file" id="image" name="productImage" accept="image/*" required>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary categoryClose">Close</button>
        <button type="submit" class="btn btn-success" name="submit">Add</button>
    </div>
    </form>
</div>
</div> --->


<!--- <div id="EditImageModal" class="modal"> <!-- Edit Image -->
<div class="modal-content">
    <span class="close">&times;</span>
    <form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="product">Product:</label>
        <select class="form-control" id="category" name="img_productId">
        <option value="" class="imgProductId"></option>
        <cfloop array="#getCat[2]#" index="pro">
            <cfif pro.sub_is_delete EQ 0>
            <option value="#pro.productId#">#pro.productName#</option>
            </cfif>
        </cfloop>
        </select>
    </div>
    <div class="form-group">
        <label for="image">Image:</label>
        <input type="file" class="form-control-file" id="image" name="img_imageName" accept="image/*">
        <b><p class="oldImg text-success"></p></b>
    </div>
    <input type="hidden" class="oldImgName" name="img_oldImage">
    <input type="hidden" class="imgId" name="img_imageId">
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary categoryClose">Close</button>
        <button type="submit" class="btn btn-success" name="submit">Add</button>
    </div>
    </form>
</div>
</div> --->

<!--- <div id="addProductModal" class="modal">   <!-- Add Products -->
<div class="modal-content">
    <span class="close">&times;</span>
    <form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="category">Sub-Category:</label>
        <select class="form-control" id="category" name="subcat">
        <option value="">Select a sub-category</option>
        <cfloop array="#getCat[1]#" index="sub">
            <cfloop array="#sub.subCategory#" index="subCategory">
            <cfif len(subCategory.Name)>
                <option value="#subCategory.Id#">#subCategory.Name#</option>
            </cfif>
            </cfloop>
        </cfloop>
        </select>
    </div>

    <div class="form-group">
        <label for="nameProduct">Product Name:</label>
        <input type="text" class="form-control" id="nameProduct" name="productName" required>
    </div>

    <div class="form-group">
        <label for="description">Description:</label>
        <textarea class="form-control" id="description" name="productDesc" rows="4" required></textarea>
    </div>

    <div class="form-group">
        <label for="rate">Price:</label>
        <input type="number" class="form-control" id="rate" name="productPrice" min="0" step="0.01" required>
    </div>

    <div class="form-group">
        <label for="thumbnail">Thumbnail:</label>
        <input type="file" class="form-control-file" id="thumbnail" name="thumbnail" accept="image/*" required>
    </div>
    
    <div class="form-group" id="image-container">
        <label for="image">Images:</label>
        <input type="file" class="form-control-file" id="image" name="images" accept="image/*" required>
    </div>

    <div class="form-group">
        <button type="button" class="btn btn-primary" id="add-image">Add Another Image</button>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary categoryClose">Close</button>
        <button type="submit" class="btn btn-success" name="submit">Add</button>
    </div>
</form>
</div>
</div> --->



COMPONENT

<!--- <cfif structKeyExists(form, "productImage")>            <!-- Adding Image for products -->
    <cfset uploadDirectory = expandpath('/images/products')>
    <cffile  action="upload"
        destination="#uploadDirectory#" 
        fileField="form.productImage" 
        nameConflict="makeunique">
    <cfset local.proImage = cffile.serverfile>

    <cfquery name="local.addImages" datasource="#application.db#">
        INSERT INTO 
            productImage (
                imageName,
                Products_idProducts
            )
        VALUES (
            <cfqueryparam value="#local.proImage#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#arguments.form.productId#" cfsqltype="cf_sql_integer">
        )
    </cfquery>
</cfif> --->

<!--- <cfif structKeyExists(form, "img_imageName") AND structKeyExists(form, "img_imageId")>      <!-- Edit Images -->
    <cfif len(arguments.form.img_imageName)>
        <cfset uploadDirectory = expandpath('/images/products')>
        <cffile  action="upload"
            destination="#uploadDirectory#" 
            fileField="form.img_imageName" 
            nameConflict="makeunique">
        <cfset local.proImage = cffile.serverfile>
    <cfelse>
        <cfset local.proImage = arguments.form.img_oldImage>
    </cfif>
    
    <cfquery name="local.editImages" datasource="#application.db#">
        UPDATE 
            productImage
        SET 
            imageName = <cfqueryparam value="#local.proImage#" cfsqltype="cf_sql_varchar">,
            Products_idProducts = <cfqueryparam value="#arguments.form.img_productId#" cfsqltype="cf_sql_integer">
        WHERE
            idproductImage = <cfqueryparam value="#arguments.form.img_imageId#" cfsqltype="cf_sql_integer">
    </cfquery>

</cfif> --->

<!--- <cfif structKeyExists(form, "categoryName")>            <!-- Adding category Name -->
    <cfquery name="local.addCategory" datasource="#application.db#">
        INSERT INTO
            Category(
                nameCategory,
                Admin_created,
                createdDate
            )
        VALUES (
            <cfqueryparam value="#arguments.form.categoryName#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#session.adminid#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
        )
    </cfquery>
</cfif> --->



<!--- <cfif structKeyExists(form, "subCategoryName")>             <!-- Adding subcategory -->
    <cfquery name="local.addsubCategory" datasource="#application.db#">
        INSERT INTO 
            Sub_Category (
                nameSubCategory,
                Category_idCategory,
                Admin_isCreated,
                createdDate
            )
        VALUES (
            <cfqueryparam value="#arguments.form.subCategoryName#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#arguments.form.categoryId#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#session.adminid#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
        )
    </cfquery>
</cfif> --->



<!--- <cfif structKeyExists(form, "productName")>             <!-- Adding Products -->
    <cfset thumbnailDirectory = expandpath('/images/thumbnail')>
    <cffile  action="upload"
        destination="#thumbnailDirectory#" 
        fileField="form.thumbnail" 
        nameConflict="makeunique">
    <cfset local.thumbnail = cffile.serverfile>

    <cfquery name="local.addProducts" datasource="#application.db#" result="local.getProductId">
        INSERT INTO 
            Products (
                nameProduct,
                Description,
                Price,
                Sub_Category_idSubcategory,
                admin_Created,
                thumbnail

            )
        VALUES (
            <cfqueryparam value="#arguments.form.productName#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#arguments.form.productDesc#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#arguments.form.productPrice#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#arguments.form.subcat#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#session.adminid#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#local.thumbnail#" cfsqltype="cf_sql_varchar">
        )
    </cfquery>

    <cfset local.productId = local.getProductId.GENERATEDKEY>

    <cfif structKeyExists(form, "images")>            <!--- Adding Image for products --->
        <cfset imageDirectory = expandpath('/images/products')>
        <cffile  action="uploadAll"
            destination="#imageDirectory#" 
            fileField="form.images" 
            nameConflict="makeunique">
        <cfset local.productImg = []>
        <cfloop array="#cffile.UPLOADALLRESULTS#" index="img">
            <cfset arrayAppend(local.productImg, img.serverfile)>
        </cfloop>
        <!--- <cfset local.proImage = cffile.serverfile> --->

        <cfquery name="local.addImages" datasource="#application.db#">
            INSERT INTO 
                productImage (
                    imageName,
                    Products_idProducts
                )
            VALUES 
            <cfloop from="1" to="#arrayLen(local.productImg)#" index="i">
                (
                    <cfqueryparam value="#local.productImg[i]#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#local.productId#" cfsqltype="cf_sql_integer">
                )<cfif i EQ arrayLen(local.productImg)><cfelse>,</cfif>
            </cfloop>
        </cfquery>
    </cfif>
</cfif> --->