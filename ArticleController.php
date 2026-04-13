<?php

require_once __DIR__ . "/../models/article.php";
require_once __DIR__ . "/../models/comment.php";
require_once __DIR__ . "/../models/user.php";

class ArticleController
{

    public function home()
{
    require_once __DIR__ . "/../models/category.php";

    $articleModel = new Article();
    $categoryModel = new Category();

    $categories = $categoryModel->getAll();

    $limit = 9;

    if (isset($_GET['page'])) {
        $page = $_GET['page'];
    } else {
        $page = 1;
    }

    $start = ($page - 1) * $limit;

    $articles = $articleModel
                ->getArticlesPagination(
                    $start,
                    $limit
                );

    $total = $articleModel
             ->countArticles();

    $total_pages = ceil(
        $total / $limit
    );

    

    include __DIR__ .
    "/../views/article/list.php";

    include __DIR__ .
    "/../views/layout/footer.php";
}

    public function detail($id)
{
    $article = new Article();

    $row = $article->getDetail($id);
        
        $relatedArticles =
    $article->getRelatedArticles(
        $row["category_id"],
        $id
    );

    // lưu lịch sử đọc

    if (isset($_SESSION["user"])) {

        $userModel = new UserModel();

        $userModel->saveHistory(
            $_SESSION["user"]["user_id"],
            $id
        );
    }

    $comment = new Comment();

    $comments =
        $comment->getCommentsByArticle($id);

    
    include __DIR__ . "/../views/article/detail.php";
    include __DIR__ . "/../views/layout/footer.php";
}

    public function search($keyword)
{
    require_once "models/article.php";

    $model = new Article();

    $data = $model->search($keyword);

    require "views/article/search.php";
}

public function category($id)
{
    require_once "models/category.php";

    $articleModel = new Article();
    $categoryModel = new Category();

    $categories = $categoryModel->getAllAdmin();

    // số bài mỗi trang
    $limit = 9;

    // trang hiện tại
    if (isset($_GET['page'])) {
        $page = $_GET['page'];
    } else {
        $page = 1;
    }

    // vị trí bắt đầu
    $start = ($page - 1) * $limit;

    // lấy bài theo danh mục có phân trang
    $articles =
        $articleModel->getByCategoryPagination(
            $id,
            $start,
            $limit
        );

    // đếm tổng bài theo danh mục
    $total =
        $articleModel->countByCategory(
            $id
        );

    // tổng số trang
    $total_pages =
        ceil($total / $limit);

    

    include __DIR__ .
    "/../views/article/list.php";

    include __DIR__ .
    "/../views/layout/footer.php";
}
    
    public function editArticle()
{
    $id = $_GET["id"];

    require_once
    "models/article.php";

    $articleModel =
    new Article();

    $article =
    $articleModel->getArticleById($id);

    require_once
    "views/admin/edit_article.php";
}
    
    public function updateArticle()
{
    $id = $_POST["id"];

    $title = $_POST["title"];

    $content = $_POST["content"];
        
    $status = $_POST["status"];

    require_once "models/article.php";

    $articleModel = new Article();

    $articleModel->updateArticle(
        $id,
        $title,
        $content,
        $status
    );

    header(
    "Location: index.php?action=listArticle"
    );
}
}