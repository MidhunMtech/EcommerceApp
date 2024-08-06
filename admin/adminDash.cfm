<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Three Columns with Add and Edit Buttons</title>
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/stylesheets.css">
</head>
<body>
  <div class="container">
    <div class="row">
      <!-- Column 1 -->
      <div class="col-md-4">
        <div class="column-heading">
          <h5>Category</h5><span class="sort-by"></span>
          <a href="#" class="btn btn-primary btn-sm">Add</a>
        </div>
        <div class="scrollable-column list-group">
          <div class="list-group-item align-items-center">
            <span>Name 1</span>
            <a href="#" class="btn btn-light btn-sm mx-2 float-right">Sortby</a>
            <a href="#" class="btn btn-secondary btn-sm float-right">Edit</a>
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
          <a href="#" class="btn btn-primary btn-sm">Add</a>
        </div>
        <div class="scrollable-column list-group">
          <div class="list-group-item align-items-center">
            <span>Name 1</span>
            <a href="#" class="btn btn-light btn-sm mx-2 float-right">Sortby</a>
            <a href="#" class="btn btn-secondary btn-sm float-right">Edit</a>
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
          <a href="#" class="btn btn-primary btn-sm">Add</a>
        </div>
        <div class="scrollable-column list-group">
          <div class="list-group-item align-items-center">
            <span>Name 1</span>
            <a href="#" class="btn btn-secondary btn-sm float-right">Edit</a>
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

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
