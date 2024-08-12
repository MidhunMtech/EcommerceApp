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
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid">
        <a class="navbar-brand" href="?logout=true">Logout</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="">Add Image</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container">
      <div class="row">
        <!-- Column 1 -->
        <cfoutput>
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
                  <button class="btn btn-danger btn-sm mx-2 float-right deleteCategory">Delete</button>
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
                  <cfif len(subCategory.Name)>
                    <div class="list-group-item align-items-center">
                      <span>#subCategory.Name#</span>
                      <!--- <a href="" class="btn btn-light btn-sm float-right">Sortby</a> --->
                      <button class="btn btn-danger btn-sm mx-2 float-right deleteSubCategory">Delete</button>
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
              <button class="btn btn-primary btn-sm" id="addProducts">Add</button>
            </div>
            <div class="scrollable-column list-group">
              <cfloop array="#getCat[2]#" index="product">
                <div class="list-group-item align-items-center">
                  <span>#product.productName#</span>
                  <button class="btn btn-danger btn-sm ml-2 float-right deleteProduct">Delete</button>
                  <button class="btn btn-secondary btn-sm float-right editProduct">Edit</button>
                </div>
              </cfloop>
            </div>
          </div>
        </div>
      </div>

    <!-- Modal -->
      <div id="modal">
        <div id="addCategoryModal" class="modal"> <!-- Add Category -->
          <div class="modal-content">
            <span class="close">&times;</span>
            <form action="" method="post" id="editForm">
              <div class="form-group">
                <label for="nameInput">Category:</label>
                <input type="text" class="form-control" id="nameInput" name="categoryName">
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary categoryClose">Close</button>
                <button type="submit" class="btn btn-success" name="products">Add</button>
              </div>
            </form>
          </div>
        </div>

        <div id="addSubCategoryModal" class="modal">   <!-- Add SubCatergory -->
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
                <button type="submit" class="btn btn-success" name="products">Add</button>
              </div>
            </form>
          </div>
        </div>

        <div id="addProductModal" class="modal">   <!-- Add Products -->
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

              <!--- <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" class="form-control-file" id="image" name="image" accept="image/*" required>
              </div> --->
              
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary categoryClose">Close</button>
                <button type="submit" class="btn btn-success" name="products">Add</button>
              </div>
          </form>
          </div>
        </div>

        <div id="editCategoryModal" class="modal"> <!-- Edit Category -->
          <div class="modal-content">
            <span class="close">&times;</span>
            <form id="editForm">
              <div class="form-group">
                <label for="nameInput">Category</label>
                <input type="text" class="form-control cat_categoryName" value="">
              </div>

              <input type="hidden" class="form-control cat_categoryId" name="cat_categoryId">

              <div class="modal-footer">
                <button type="button" class="btn btn-secondary categoryClose">Close</button>
                <button type="button" class="btn btn-success">Save changes</button>
              </div>
            </form>
          </div>
        </div>

        <div id="editSubCategoryModal" class="modal"> <!-- Edit Sub Category -->
          <div class="modal-content">
            <span class="close">&times;</span>
            <form id="editForm">
              <div class="form-group">
                <label for="category">Category:</label>
                <select class="form-control" id="category" name="category">
                  <option value="" class="sub_category"></option>
                  <cfloop array="#getCat[1]#" index="getcategory">
                    <option value="#getcategory.categoryId#">#getcategory.categoryName#</option>
                  </cfloop>
                </select>
              </div>

              <div class="form-group">
                <label for="nameInput">Sub-Category:</label>
                <input type="text" class="form-control sub_subCategoryName" value="" >
              </div>

              <input type="hidden" class="form-control sub_subCategoryId" name="sub_subCategoryId">

              <div class="modal-footer">
                <button type="button" class="btn btn-secondary categoryClose">Close</button>
                <button type="button" class="btn btn-success">Save changes</button>
              </div>
            </form>
          </div>
        </div>

        <div id="editProductModal" class="modal">   <!-- Add Products -->
          <div class="modal-content">
            <span class="close">&times;</span>
            <form action="your-action-url" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label for="category">Category:</label>
                <select class="form-control" id="category" name="category">
                  <option value="">Select a category</option>
                  <option value="electronics">Electronics</option>
                  <option value="clothing">Clothing</option>
                  <option value="home_appliances">Home Appliances</option>
                  <option value="books">Books</option>
                  <option value="other">Other</option>
                </select>
              </div>

              <div class="form-group">
                <label for="nameProduct">Product Name:</label>
                <input type="text" class="form-control" name="nameProduct" >
              </div>

              <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" name="description" rows="4" ></textarea>
              </div>
              <div class="form-group">
                <label for="rate">Rate:</label>
                <input type="number" class="form-control" name="rate" min="0" step="0.01" >
              </div>

              <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" class="form-control-file" name="image" accept="image/*" >
              </div>

              <input type="hidden" class="form-control" name="productId" >

              <div class="modal-footer">
                <button type="button" class="btn btn-secondary categoryClose">Close</button>
                <button type="button" class="btn btn-success">Save Changes</button>
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
