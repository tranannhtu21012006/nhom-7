
<div class="container mt-4">

<h3>
Kết quả tìm kiếm:
<?= htmlspecialchars($_GET["keyword"] ?? "") ?>
</h3>

<div class="row">

<?php if($data->rowCount() > 0): ?>

<?php while($row = $data->fetch(PDO::FETCH_ASSOC)): ?>

<div class="col-md-4">

<div class="card mb-3">

<img src="public/images/<?= $row['image'] ?>"
class="card-img-top">

<div class="card-body">

<h5 class="card-title">
<?= $row['title'] ?>
</h5>
<p class="text-muted">

Đăng:
<?php
echo date(
    "d/m/Y",
    strtotime(
        $row["created_at"]
    )
);
?>

</p>
<p class="card-text">
<?= substr($row['content'], 0, 100) ?>...
</p>

<a href="index.php?action=article&id=<?= $row['article_id'] ?>"
class="btn btn-primary">

Xem chi tiết

</a>

</div>

</div>

</div>

<?php endwhile; ?>

<?php else: ?>

<p>Không tìm thấy bài viết.</p>

<?php endif; ?>

</div>

</div>

<?php include "views/layout/footer.php"; ?>