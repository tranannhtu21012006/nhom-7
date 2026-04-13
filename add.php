<h3>Thêm bài viết</h3>

<form method="POST"
action="index.php?action=storeArticle"
enctype="multipart/form-data">

Tiêu đề

<input type="text"
name="title"
class="form-control"
required>

<br>

Nội dung

<textarea name="content"
class="form-control"
rows="5"
required></textarea>

<br>

Danh mục

<select name="category_id"
class="form-control"
required>

<?php foreach ($categories as $cat): ?>

<option value="<?= $cat['category_id'] ?>">

<?= $cat['category_name'] ?>

</option>

<?php endforeach; ?>

</select>

<br>

Ảnh

<input type="file"
name="image"
class="form-control">

<br>

Trạng thái

<select name="status"
class="form-control">

<option value="1">
Hiển thị
</option>

<option value="0">
Ẩn
</option>

</select>

<br>

<button class="btn btn-success">
Thêm bài
</button>

</form>