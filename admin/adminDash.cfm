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
    <div class="container">
      <div class="row">
        <!-- Column 1 -->
        <div class="col-md-4">
          <div class="column-heading">
            <h5>Category</h5><span class="sort-by"></span>
            <a href="#" class="btn btn-primary btn-sm" id="addCategory">Add</a>
          </div>
          <div class="scrollable-column list-group">
            <div class="list-group-item align-items-center">
              <span>Name 1</span>
              <a href="?id=4" class="btn btn-light btn-sm float-right">Sortby</a>
              <a href="#" class="btn btn-danger btn-sm mx-2 float-right deleteCategory">Delete</a>
              <a href="#" class="btn btn-secondary btn-sm float-right editCategory">Edit</a>
            </div>
            <div class="list-group-item align-items-center">
              <span>Name 1</span>
              <a href="#" class="btn btn-light btn-sm mx-2 float-right">Sortby</a>
              <a href="#" class="btn btn-secondary btn-sm float-right">Edit</a>
            </div>
          </div>
        </div>

        <!-- Column 2 -->
        <div class="col-md-4">
          <div class="column-heading">
            <h5>Sub-Category</h5><span class="sort-by"></span>
            <a href="#" class="btn btn-primary btn-sm" id="addSubCategory">Add</a>
          </div>
          <div class="scrollable-column list-group">
            <div class="list-group-item align-items-center">
              <span>Name 1</span>
              <a href="#" class="btn btn-light btn-sm float-right">Sortby</a>
              <a href="#" class="btn btn-danger btn-sm mx-2 float-right deleteSubCategory">Delete</a>
              <a href="#" class="btn btn-secondary btn-sm float-right editSubCategory">Edit</a>
            </div>
            <div class="list-group-item align-items-center">
              <span>Name 1</span>
              <a href="#" class="btn btn-light btn-sm mx-2 float-right">Sortby</a>
              <a href="#" class="btn btn-secondary btn-sm float-right">Edit</a>
            </div>
          </div>
        </div>

        <!-- Column 3 -->
        <div class="col-md-4">
          <div class="column-heading">
            <h5>Products</h5><span class="sort-by"></span>
            <a href="#" class="btn btn-primary btn-sm" id="addProducts">Add</a>
          </div>
          <div class="scrollable-column list-group">
            <div class="list-group-item align-items-center">
              <span>Name 1</span>
              <a href="#" class="btn btn-danger btn-sm ml-2 float-right deleteProduct">Delete</a>
              <a href="#" class="btn btn-secondary btn-sm float-right editProduct">Edit</a>
            </div>
            <div class="list-group-item align-items-center">
              <span>Name 1</span>
              <a href="#" class="btn btn-secondary btn-sm float-right">Edit</a>
            </div>
            <div class="list-group-item align-items-center">
              <span>Name 1</span>
              <a href="#" class="btn btn-secondary btn-sm float-right">Edit</a>
            </div>
          </div>
        </div>
      </div>
    </div>

  <!-- Modal -->
    <div id="modal">
      <div id="addCategoryModal" class="modal"> <!-- Add Category -->
        <div class="modal-content">
          <span class="close">&times;</span>
          <form id="editForm">
            <div class="form-group">
              <label for="nameInput">Category:</label>
              <input type="text" class="form-control" id="nameInput">
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-secondary categoryClose">Close</button>
              <button type="button" class="btn btn-success">Add</button>
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
              <label for="nameInput">Sub-Category:</label>
              <input type="text" class="form-control">
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-secondary categoryClose">Close</button>
              <button type="button" class="btn btn-success">Add</button>
            </div>
          </form>
        </div>
      </div>

      <div id="addProductModal" class="modal">   <!-- Add Products -->
        <div class="modal-content">
          <span class="close">&times;</span>
          <form action="your-action-url" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label for="category">Sub-Category:</label>
              <select class="form-control" id="category" name="category">
                <option value="">Select a sub-category</option>
                <option value="electronics">Electronics</option>
                <option value="clothing">Clothing</option>
                <option value="home_appliances">Home Appliances</option>
                <option value="books">Books</option>
                <option value="other">Other</option>
              </select>
            </div>

            <div class="form-group">
              <label for="nameProduct">Product Name:</label>
              <input type="text" class="form-control" id="nameProduct" name="nameProduct" required>
            </div>

            <div class="form-group">
              <label for="description">Description:</label>
              <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
            </div>

            <div class="form-group">
              <label for="rate">Rate:</label>
              <input type="number" class="form-control" id="rate" name="rate" min="0" step="0.01" required>
            </div>

            <div class="form-group">
              <label for="image">Image:</label>
              <input type="file" class="form-control-file" id="image" name="image" accept="image/*" required>
            </div>
            
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary categoryClose">Close</button>
              <button type="button" class="btn btn-success">Add</button>
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
              <input type="text" class="form-control" value="Name1">
            </div>

            <input type="hidden" class="form-control" name="categoryId">

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
                <option value="">Select a category</option>
                <option value="electronics">Electronics</option>
                <option value="clothing">Clothing</option>
                <option value="home_appliances">Home Appliances</option>
                <option value="books">Books</option>
                <option value="other">Other</option>
              </select>
            </div>

            <div class="form-group">
              <label for="nameInput">Sub-Category:</label>
              <input type="text" class="form-control" value="subcat123">
            </div>

            <input type="hidden" class="form-control" name="subcatId">

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
  
  </body>
</html>
