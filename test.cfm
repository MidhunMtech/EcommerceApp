<form action="testAction.cfm" method="post" enctype="multipart/form-data">
    <div id="image-container" class="form-group">
        <label for="image1">Images:</label>
        <input type="file" class="form-control-file" id="image1" name="images" accept="image/*" required>
    </div>
    <button type="button" class="btn btn-primary" id="add-image">Add Another Image</button>
    
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary categoryClose">Close</button>
        <button type="submit" class="btn btn-success" name="submit">Add</button>
    </div>
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    let imageCount = 1;

    $('#add-image').on('click', function() {
        imageCount++;
        const newImageInput = $('<input>', {
            type: 'file',
            class: 'form-control-file',
            id: 'image' + imageCount,
            name: 'images',  // Use the array syntax for multiple files
            accept: 'image/*',
            required: true
        });

        const newLabel = $('<label>', {
            for: 'image' + imageCount,
            text: 'Images:'
        });

        $('#image-container').append(newLabel).append(newImageInput);
    });
</script>
