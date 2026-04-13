<div class="container mt-4">

<h2>Sửa bài viết</h2>

<form method="POST"
      action="index.php?action=updateArticle"
      enctype="multipart/form-data">

<input
type="hidden"
name="id"
value="<?php echo $article['article_id']; ?>"
>

<div class="mb-3">

<label>Tiêu đề</label>

<input
type="text"
name="title"
class="form-control"
value="<?php echo htmlspecialchars($article['title']); ?>"
>

</div>

<div class="mb-3">

<label>Nội dung</label>

<textarea
name="content"
class="form-control"
rows="10"
>

<?php echo htmlspecialchars($article['content']); ?>

</textarea>

</div>

<div class="mb-3">

<label>Danh mục</label>

<select name="category_id"
        class="form-control">

<?php foreach($categories as $cat): ?>

<option value="<?= $cat['category_id'] ?>"
<?php if($cat['category_id'] == $row['category_id']) echo "selected"; ?>>

<?= $cat['category_name'] ?>

</option>

<?php endforeach; ?>

</select>

</div>

<div class="mb-3">

<label>Ảnh hiện tại</label><br>

<img src="public/images/<?= $row['image'] ?>"
     width="150">

<input type="hidden"
       name="old_image"
       value="<?= $row['image'] ?>">

</div>

<div class="mb-3">

<label>Đổi ảnh</label>

<input type="file"
       name="image"
       class="form-control">

</div>

<div class="mb-3">

<label>Trạng thái</label>

<select name="status" class="form-control">

<option value="1"
<?= $article['status'] == 1 ? 'selected' : '' ?>
>
Hiện
</option>

<option value="0"
<?= $article['status'] == 0 ? 'selected' : '' ?>
>
Ẩn
</option>

</select>

</div>

<button class="btn btn-success">

Cập nhật

</button>

<a href="index.php?action=listArticle"
   class="btn btn-secondary">

Quay lại

</a>

</form>

</div>