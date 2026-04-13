<div class="container mt-4">
<div class="article-box">
<?php if ($row) { ?>

    <!-- Tiêu đề -->
    <h2 class="article-title">
        <?php echo $row['title']; ?>
    </h2>

    <p class="article-content">
        <?php echo nl2br($row['content']); ?>
    </p>

    <hr class="article-divider">

    <!-- Danh sách bình luận -->
    <h4>Bình luận</h4>

    <div id="comment-list">

        <?php foreach($comments as $c) { ?>

            <div class="comment-box">

                <div style="display:flex; align-items:center; gap:10px;">

                   <span class="comment-user">

                     <i class="fa-solid fa-user"></i>

                       <?php echo $c['username']; ?>

                   </span>
                    
                   <strong>

                   <?php echo $c['username']; ?>

                   </strong>

                    </div>

                :

                <?php echo $c['content']; ?>
                
                <button
                 onclick="deleteComment(<?= $c['comment_id']; ?>)"
                  class="btn btn-outline-danger btn-sm">

                    Xóa

                </button>
                
                <br>

                <button
                  onclick="reportComment(<?= $c['comment_id']; ?>)"
                  class="btn btn-danger btn-sm">

                   ⚠️

                </button>

            </div>

        <?php } ?>

    </div>

    <hr>

    <!-- Nhập bình luận -->
    <textarea
        id="content"
        class="form-control"
        rows="3"
        placeholder="Nhập bình luận"
    ></textarea>

    <br>

    <button
       onclick="addComment()"
       class="btn btn-primary px-4 py-2 shadow-sm"
       style="font-weight:600; border-radius:8px;">

     <i class="fa-solid fa-paper-plane"></i>

       Gửi bình luận

    </button>

    <hr>

     <a
       href="index.php?action=addFavorite&id=<?= $row['article_id'] ?>"
       class="btn btn-warning"
       >
       ★ Lưu bài
     </a>
<hr>

<h4 class="mt-4">
➢Bài viết liên quan
</h4>

<div class="row">

<?php if (!empty($relatedArticles)) { ?>

<?php foreach ($relatedArticles as $r) { ?>

<div class="col-md-3 mb-3">

<div class="card h-100">

<img
    src="public/images/<?php echo $r['image']; ?>"
    class="card-img-top"
    style="height:150px; object-fit:cover;"
>

<div class="card-body">

<h6 class="card-title">

<a href="
index.php?action=article
&id=<?php echo $r['article_id']; ?>
">

<?php echo $r['title']; ?>

</a>

</h6>

</div>

</div>

</div>

<?php } ?>

<?php } else { ?>

<p>Không có bài viết liên quan</p>

<?php } ?>

</div>

<?php } else { ?>

    <p>Bài viết không tồn tại.</p>

<?php } ?>

</div>
</div>
<script>

function addComment()
{
    let content = document.getElementById("content").value;

    let article_id = <?php echo $row['article_id']; ?>;

    if(content.trim() === "")
    {
        alert("Vui lòng nhập bình luận");
        return;
    }

    fetch("ajax/addcomment.php", {

    method: "POST",

    credentials: "same-origin",

    headers: {
        "Content-Type": "application/x-www-form-urlencoded"
    },

    body:
        "content=" + encodeURIComponent(content)
        + "&article_id=" + article_id

})
    .then(response => response.text())
    .then(data => {

        console.log(data);

        document.getElementById("content").value = "";

        loadComments();

    });
}

function reportComment(comment_id)
{
    if(confirm("Bạn có chắc muốn báo cáo bình luận này không?"))
    {

        fetch("ajax/report_comment.php",
            {
                method: "POST",

                headers: {
                    "Content-Type":
                    "application/x-www-form-urlencoded"
                },

                body:
                    "comment_id=" + comment_id
            }
        )
        .then(response => response.text())
        .then(data => {

            alert("Đã báo cáo bình luận");

        });

    }
}

function loadComments()
{
    let article_id = <?php echo $row['article_id']; ?>;

    fetch(
        "ajax/getcomment.php?article_id=" + article_id
    )
    .then(response => response.text())
    .then(data => {

        document.getElementById("comment-list").innerHTML = data;

    });
}

function deleteComment(comment_id)
{
    if(confirm("Bạn có chắc muốn xóa bình luận?"))
    {
        fetch("ajax/delete_comment_user.php", {

            method: "POST",

            credentials: "same-origin",

            headers: {
                "Content-Type":
                "application/x-www-form-urlencoded"
            },

            body:
                "comment_id=" + comment_id

        })
        .then(response => response.text())
        .then(data => {

            loadComments();

        });
    }
}
</script>



