<h2>Bình luận bị báo cáo</h2>

<table border="1" width="100%" cellpadding="10">

<tr>

<th>ID</th>

<th>Nội dung</th>

<th>Hành động</th>

</tr>

<?php foreach($comments as $c): ?>

<tr>

<td>

<?= $c['comment_id'] ?>

</td>

<td>

<?= $c['content'] ?>

</td>

<td>

<a
href="index.php?action=delete_comment&id=<?= $c['comment_id'] ?>"
class="btn btn-danger">

Xóa

</a>

</td>

</tr>

<?php endforeach; ?>

</table>