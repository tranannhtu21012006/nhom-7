<div class="container mt-4">

<h2>Quản lý bài viết</h2>

<a href="index.php?action=createArticle"
class="btn btn-success mb-3">

Thêm bài viết

</a>

<table class="table table-bordered">

<tr>

<th>ID</th>
<th>Tiêu đề</th>
<th>Trạng thái</th>
<th>Hành động</th>

</tr>

<?php foreach($articles as $a) { ?>

<tr>

<td>

<?php echo $a["article_id"]; ?>

</td>

<td>

<span class="title-text">
<?php echo $a["title"]; ?>
</span>

<input
type="text"
class="form-control title-input d-none"
value="<?php echo htmlspecialchars($a["title"]); ?>"
>

</td>

<td>

<?php if ($a["status"] == 1) { ?>

<span class="badge bg-success">
Hiện
</span>

<?php } else { ?>

<span class="badge bg-secondary">
Ẩn
</span>

<?php } ?>

</td>

<td>

<a href="
index.php?action=editArticle
&id=<?php echo $a['article_id']; ?>
"

class="btn btn-warning">

Chỉnh sửa

</a>

<button
class="btn btn-success btn-save d-none"
data-id="<?php echo $a['article_id']; ?>"
>
Lưu
</button>

<button
class="btn btn-secondary btn-cancel d-none"
>
Hủy
</button>

<a href="
index.php?action=deleteArticle
&id=<?php echo $a["article_id"]; ?>
"

class="btn btn-danger"

onclick="return confirm('Xóa bài viết?')">

Xóa

</a>

</td>

</td>

</tr>

<?php } ?>

</table>

</div>