<cftry>
  <cfif NOT structKeyExists(session, "adminid")>
    <cflocation  url="/admin/adminLogin.cfm">
  </cfif>
  <cfinvoke  method="getCategories" component="component.component" returnVariable="getCat">
  <cfinvoke component="component.component" method="logout" returnvariable="logout">
  <cfif logout EQ "1">
    <cflocation  url="/admin/adminLogin.cfm">
  </cfif>
  
  <cfinclude  template="/admin/adminAction.cfm">
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>DashBoard</title>
      <link rel="stylesheet" href="/css/bootstrap.min.css">
      <link rel="stylesheet" href="/css/stylesheets.css">
      <script src="/js/jquery.min.js"></script>
      <script src="/js/dash.js" defer></script>
    </head>
    <body>
      <nav class="navbar navbar-expand-lg bg-body-tertiary mb-3 ">
        <div class="container-fluid">
          <a class="btn btn-secondary btn-sm" href="?logout=Atrue">Logout</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
        </div>
      </nav>
      <div class="container-fluid">
        <div class="row">
          <cfoutput>
            <!-- Column 1 -->
            <div class="col-md-4">
              <div class="column-heading">
                <h5>Category</h5><span class="sort-by"></span>
                <button class="btn btn-primary btn-sm" id="addCategory">Add</button>
              </div>
              <div class="scrollable-column list-group"> 
                <cfloop array="#getCat[1]#" index="getcategory">
                  <div class="list-group-item align-items-center">
                    <span value="">#getcategory.categoryName#</span>
                    <!--- <a href="?id=#getcategory.categoryId#" class="btn btn-light btn-sm float-right">Sortby</a> --->
                    <button class="btn btn-danger btn-sm mx-2 float-right deleteCategory" data-userid="#getcategory.categoryId#">Delete</button>
                    <button class="btn btn-secondary btn-sm float-right editCategory" data-userid="#getcategory.categoryId#">Edit</button>
                  </div>
                </cfloop>
              </div>
            </div>

            <!-- Column 2 -->
            <div class="col-md-4">
              <div class="column-heading">
                <h5>Sub-Category</h5><span class="sort-by"></span>
                <button class="btn btn-primary btn-sm" id="addSubCategory">Add</button>
              </div>
              <div class="scrollable-column list-group">
                <cfloop array="#getCat[1]#" index="sub">
                  <cfloop array="#sub.subCategory#" index="subCategory">
                    <cfif len(subCategory.Name) AND subCategory.is_delete EQ 0>
                      <div class="list-group-item align-items-center">
                        <span>#subCategory.Name#</span>
                        <!--- <a href="" class="btn btn-light btn-sm float-right">Sortby</a> --->
                        <button class="btn btn-danger btn-sm mx-2 float-right deleteSubCategory" data-userid="#subCategory.Id#">Delete</button>
                        <button class="btn btn-secondary btn-sm float-right editSubCategory" data-userid="#subCategory.Id#">Edit</button>
                      </div>
                    </cfif>
                  </cfloop>
                </cfloop>
              </div>
            </div>

            <!-- Column 3 -->
            <div class="col-md-4">
              <div class="column-heading">
                <h5>Products</h5><span class="sort-by"></span>
                <button class="btn btn-primary btn-sm" id="addProducts">Add Products</button>
              </div>
              <div class="scrollable-column list-group">
                <cfloop array="#getCat[2]#" index="product">
                  <cfif product.sub_is_delete EQ 0>
                    <div class="list-group-item align-items-center">
                      <span>#product.productName#</span>
                      <button class="btn btn-danger btn-sm ml-2 float-right deleteProduct" data-userid="#product.productId#">Delete</button>
                      <button class="btn btn-secondary btn-sm float-right editProduct" data-userid="#product.productId#">Edit</button>
                    </div>
                  </cfif>
                </cfloop>
              </div>
            </div>
          </div>
        </div>

      <!-- Modal -->
        <div id="modal">

          <div id="addEditCategoryModal" class="modal"> <!-- Add and Edit Category -->
            <div class="modal-content">
              <span class="close">&times;</span>
              <form action="" method="post" id="editForm">
                <div class="form-group">
                  <label for="nameInput">Category</label>
                  <input type="text" class="form-control cat_categoryName" value="" name="cat_categoryName">
                </div>

                <input type="hidden" class="form-control cat_categoryId" name="cat_categoryId">

                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary categoryClose">Close</button>
                  <button type="submit" class="btn btn-success" name="submit">Save</button>
                </div>
              </form>
            </div>
          </div>

          <div id="addEditSubCategoryModal" class="modal"> <!-- Edit Sub Category -->
            <div class="modal-content">
              <span class="close">&times;</span>
              <form action="" method="post" id="editForm">
                <div class="form-group">
                  <label for="category">Category:</label>
                  <select class="form-control" id="category" name="sub_mainCategory">
                    <option value="" class="sub_category">Select a category</option>
                    <cfloop array="#getCat[1]#" index="getcategory">
                      <option value="#getcategory.categoryId#">#getcategory.categoryName#</option>
                    </cfloop>
                  </select>
                </div>

                <div class="form-group">
                  <label for="nameInput">Sub-Category:</label>
                  <input type="text" class="form-control sub_subCategoryName" value="" name="sub_subCategoryName">
                </div>

                <input type="hidden" class="form-control sub_subCategoryId" name="sub_subCategoryId">

                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary categoryClose">Close</button>
                  <button type="submit" class="btn btn-success" name="submit">Save</button>
                </div>
              </form>
            </div>
          </div>

          <div id="addEditProductModal" class="modal">   <!--Add and Edit Products -->
            <div class="modal-content">
              <span class="close">&times;</span>
              <form class="productForm" action="" method="post" enctype="multipart/form-data">
                <div class="form-group">
                  <label for="category">Category:</label>
                  <select class="form-control" id="category" name="pro_subcategory">
                    <option value="" class="pro_subcat">Select a sub-category</option>
                    <cfloop array="#getCat[1]#" index="sub">
                      <cfloop array="#sub.subCategory#" index="subCategory">
                        <cfif len(subCategory.Name) AND subCategory.is_delete EQ 0>
                          <option value="#subCategory.Id#">#subCategory.Name#</option>
                        </cfif>
                      </cfloop>
                    </cfloop>
                  </select>
                </div>

                <div class="form-group">
                  <label for="nameProduct">Product Name:</label>
                  <input type="text" class="form-control productName" name="pro_productName">
                </div>

                <div class="form-group">
                  <label for="description">Description:</label>
                  <textarea class="form-control productDesc" name="pro_productDesc" rows="4" ></textarea>
                </div>
                <div class="form-group">
                  <label for="rate">Price:</label>
                  <input type="number" class="form-control productPrice" name="pro_productPrice" min="0" step="0.01" >
                </div>

                <div class="form-group">
                  <label for="thumbnail">Thumbnail:</label>
                  <input type="file" class="form-control-file productThumbnail" name="pro_thumbnail" accept="image/*">
                  <b><div class="thumbnail-container text-success"></div></b>
                  <input type="hidden" class="oldThumbnail" name="oldThumbnail">
                </div>

                <div class="form-group">
                  <label for="image">Images:</label>
                  <div class="image-container"></div>
                </div>

                <div class="form-group" id="image-container">
                  <!--- <label for="image">Images:</label> --->
                  <input type="file" class="form-control-file" id="image" name="images" accept="image/*">
                </div>

                <div class="form-group">
                  <button type="button" class="btn btn-primary" id="add-image">Add Another Image</button>
                </div>

                <input type="hidden" class="form-control productId" name="pro_productId" >

                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary categoryClose">Close</button>
                  <button type="submit" class="btn btn-success" name="submit">Save</button>
                </div>
            </form>
            </div>
          </div>

        </div>
      
      </cfoutput>
    
    </body>
  </html>
<cfcatch type="any">
  <cfdump  var="#cfcatch#">
</cfcatch>
</cftry>
