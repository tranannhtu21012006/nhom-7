<?php require_once __DIR__ ."/../../helpers/time_helper.php"; ?>
<div class="main-layout">

    <!-- quảng cáo trái -->
    <div class="ads-left">

    <a href="#">
        <img src="public/images/ads1.jpg" class="ads-img">
    </a>

    <a href="#">
        <img src="public/images/ads3.jpg" class="ads-img">
    </a>

</div>

    <!-- nội dung chính -->
    <div class="content">

        <div class="news-container">

            <div class="row">

                <?php foreach($articles as $row): ?>

                <div class="col-md-4 mb-4">

                    <div class="card h-100">

                        <img
                        src="public/images/<?= $row['image'] ?>"
                        class="card-img-top"
                        >

                        <div class="card-body">

                            <h5 class="card-title">
                                <?= $row['title'] ?>
                            </h5>

                            <p class="text-muted">
                                Đăng:
                                <?= date("d/m/Y", strtotime($row["created_at"])) ?>
                            </p>

                            <div class="button-group">

                              <a
                              href="index.php?action=article&id=<?= $row['article_id'] ?>"
                              class="btn btn-primary"
                              >
                                 Xem chi tiết
                              </a>

                              <a
                              href="index.php?action=addFavorite&id=<?= $row['article_id'] ?>"
                              class="btn btn-warning"
                              >
                                 ★ Lưu bài
                              </a>

                              </div>

                        </div>

                    </div>

                </div>

                <?php endforeach; ?>

            </div>

        </div>

    </div>

    <!-- quảng cáo phải -->
    <div class="ads-right">

    <a href="#">
        <img 
        src="public/images/ads2.jpg"
        alt="Quảng cáo"
        class="ads-img"
        >
    </a>

    </div>

</div>


<nav>

<ul class="pagination justify-content-center">

<?php for($i = 1; $i <= $total_pages; $i++): ?>

<li class="page-item
<?= ($i == $page) ? 'active' : '' ?>">

<a
class="page-link"
href="
index.php
?action=<?= $_GET['action'] ?? 'home' ?>
<?php if(isset($_GET['id'])): ?>
&id=<?= $_GET['id'] ?>
<?php endif; ?>
&page=<?= $i ?>
">

<?= $i ?>

</a>

</li>

<?php endfor; ?>

</ul>

</nav>

</div>