<?php

require_once "models/article.php";
require_once "models/category.php";
require_once __DIR__ . "/../config/Database.php";

class AdminController
{
    private $db;

    public function __construct()
    {
        $database = new Database();

        $this->db = $database->connect();
    }
    
    private function checkAdmin()
{
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

    // chưa đăng nhập
    if (!isset($_SESSION["user_id"])) {
        header("Location: index.php?action=login");
        exit;
    }

    // không phải admin
    if ($_SESSION["role_id"] != 1) {
        echo "Bạn không có quyền admin";
        exit;
    }
        
        if (!isset($_SESSION["role_id"])
        || $_SESSION["role_id"] != 1)
    {
        header("Location: index.php");
        exit;
    }
}

    /*
    =========================
    DASHBOARD
    =========================
    */

    public function dashboard()
    {
        $this->checkAdmin();

        include "views/admin/dashboard.php";
    }

    /*
    =========================
    ARTICLE
    =========================
    */

    public function listArticle()
{
    $this->checkAdmin();

    $article = new Article();
    $category = new Category();

    $articles = $article->getAll();
    $categories = $category->getAll();

    
    include "views/admin/list_article.php";
    include "views/layout/footer.php";
}

    /*
    ---------- FORM THÊM BÀI ----------
    */

    public function createArticle()
    {
        $this->checkAdmin();

        $category = new Category();

        $categories = $category->getAll();

        
        include "views/article/add.php";
        include "views/layout/footer.php";
    }

    /*
    ---------- LƯU BÀI ----------
    */

    public function storeArticle()
    {
        $this->checkAdmin();

        $title = $_POST["title"];
        $content = $_POST["content"];
        $category_id = $_POST["category_id"];
        $status = $_POST["status"];

        $image = "";

        if ($_FILES["image"]["name"] != "") {

            $image = time() . "_" . $_FILES["image"]["name"];

            move_uploaded_file(
                $_FILES["image"]["tmp_name"],
                "public/images/" . $image
            );
        }

        $article = new Article();

        $article->create(
            $title,
            $content,
            $category_id,
            $image,
            $status
        );

        header("Location: index.php?action=listArticle");
    }

    /*
    ---------- FORM SỬA ----------
    */

    public function editArticle()
    {
        $this->checkAdmin();

        $id = $_GET["id"];

        $article = new Article();

        $row = $article->getDetail($id);

        $category = new Category();

        $categories = $category->getAll();

        
        include "views/admin/edit_article.php";
        include "views/layout/footer.php";
    }

    /*
    ---------- CẬP NHẬT ----------
    */

    public function updateArticle()
    {
        $this->checkAdmin();

        $id = $_POST["id"];

        $title = $_POST["title"];
        $content = $_POST["content"];
        $category_id = $_POST["category_id"];
        $status = $_POST["status"];

        $image = $_POST["old_image"];

        if ($_FILES["image"]["name"] != "") {

            $image = time() . "_" . $_FILES["image"]["name"];

            move_uploaded_file(
                $_FILES["image"]["tmp_name"],
                "public/images/" . $image
            );
        }

        $article = new Article();

        $article->update(
            $id,
            $title,
            $content,
            $category_id,
            $image,
            $status
        );

        header("Location: index.php?action=listArticle");
    }

    /*
    ---------- XÓA ----------
    */

    public function deleteArticle()
    {
        $this->checkAdmin();

        $id = $_GET["id"];

        $article = new Article();

        $article->delete($id);

        header("Location: index.php?action=listArticle");
    }

    /*
    ---------- DUYỆT ----------
    */

    public function approveArticle()
    {
        $this->checkAdmin();

        $id = $_GET["id"];

        $article = new Article();

        $article->approve($id);

        header("Location: index.php?action=listArticle");
    }

    /*
    =========================
    CATEGORY
    =========================
    */

    public function listCategory()
    {
        $this->checkAdmin();

        $model = new Category();

        $categories = $model->getAllAdmin();

        
        include "views/category/list.php";
        include "views/layout/footer.php";
    }

    public function createCategory()
    {
        $this->checkAdmin();

        
        include "views/category/add.php";
        include "views/layout/footer.php";
    }

    public function storeCategory()
    {
        $this->checkAdmin();

        $model = new Category();

        $name = $_POST["category_name"] ?? "";

        if ($name == "") {
            echo "Tên danh mục không được để trống";
            return;
        }

        $model->add($name);

        header("Location: index.php?action=listCategory");
    }

    public function deleteCategory()
    {
        $this->checkAdmin();

        $id = $_GET["id"];

        $model = new Category();

        $model->delete($id);

        header("Location: index.php?action=listCategory");
    }

    public function toggleCategory()
    {
        $this->checkAdmin();

        $id = $_GET["id"];

        $model = new Category();

        $model->toggleStatus($id);

        header("Location: index.php?action=listCategory");
    }
    
    public function reportedComments()
{
    require_once "models/comment.php";

    $model = new Comment();

    $comments = $model->getReported();

    require "views/admin/reported_comments.php";
}
    
    public function deleteComment()
{
    require_once "models/comment.php";

    $model = new Comment();

    $id = $_GET["id"];

    $model->delete($id);

    header("Location: index.php?action=reported_comments");
}
    
    public function manageUsers()
{
    $sql = "SELECT * FROM user";

    $stmt = $this->db->query($sql);

    $users = $stmt->fetchAll();

    require
    "views/admin/manage_users.php";
}
    
    public function lockUser()
{
    $this->checkAdmin();

    $id = $_GET["id"];

    /*
    Không cho khóa admin
    */

    $sql = "
    SELECT role_id
    FROM user
    WHERE user_id = ?
    ";

    $stmt = $this->db->prepare($sql);

    $stmt->execute([$id]);

    $user = $stmt->fetch();

    if ($user["role_id"] == 1)
    {
        header(
        "Location: index.php?action=manage_users"
        );
        exit;
    }

    /*
    Khóa tài khoản
    */

    $sql = "
    UPDATE user
    SET status = 0
    WHERE user_id = ?
    ";

    $stmt = $this->db->prepare($sql);

    $stmt->execute([$id]);

    header(
    "Location: index.php?action=manage_users"
    );
}
    
    public function unlockUser()
{
    $this->checkAdmin();

    $id = $_GET["id"];

    $sql = "
    UPDATE user
    SET status = 1
    WHERE user_id = ?
    ";

    $stmt = $this->db->prepare($sql);

    $stmt->execute([$id]);

    header(
    "Location: index.php?action=manage_users"
    );
}
}