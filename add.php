<h2>Thêm danh mục</h2>

<form method="POST" action="index.php?action=storeCategory">

    <div class="mb-3">
        <label>Tên danh mục</label>

        <input
            type="text"
            name="category_name"
            class="form-control"
            required
        >
    </div>

    <button class="btn btn-success">
        Thêm danh mục
    </button>

    <a href="index.php?action=listCategory"
       class="btn btn-secondary">
       Quay lại
    </a>

</form>