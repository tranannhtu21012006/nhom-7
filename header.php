<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require_once __DIR__ . "/../../models/category.php";

$categoryModel = new Category();

$categories = $categoryModel->getAll();
?>

<!DOCTYPE html>
<html>
<head>

<title>Sports News</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>

.article-title
{
    font-size: 32px;
    font-weight: 700;
}

.article-content
{
    line-height: 1.8;
    font-size: 17px;
}

.comment-box
{
    border: 1px solid #ddd;
    padding: 12px;
    border-radius: 10px;
    margin-bottom: 10px;
    background: #fafafa;
}

.comment-user
{
    font-weight: 600;
}

.comment-actions
{
    margin-top: 5px;
}

</style>
<link rel="stylesheet" href="public/css/style.css">

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

<div class="container-fluid">

<a class="navbar-brand" href="index.php">
Sports News
</a>

<button class="navbar-toggler"
type="button"
data-bs-toggle="collapse"
data-bs-target="#navbarNav">

<span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse"
id="navbarNav">

<div class="navbar-nav">

<!-- Trang chủ -->

<a class="nav-link"
href="index.php">
⌂ Trang chủ
</a>

<!-- DANH MỤC DROPDOWN -->

<div class="nav-item dropdown">

<a class="nav-link dropdown-toggle"

href="#"

role="button"

data-bs-toggle="dropdown">

☰ Danh mục

</a>

<ul class="dropdown-menu category-menu">

<?php foreach($categories as $cat): ?>

<li>

<a
class="dropdown-item category-box"
href="index.php?action=category&id=<?= $cat['category_id'] ?>"
>

<?= $cat['category_name'] ?>

</a>

</li>

<?php endforeach; ?>

</ul>

</div>

</div>

<!-- SEARCH -->

<form class="d-flex ms-3"
method="GET"
action="index.php">

<input
class="form-control me-2"
type="search"
name="keyword"
placeholder="Tìm kiếm bài báo..."
required>

<input
type="hidden"
name="action"
value="search">

<button
class="btn btn-outline-light">
Tìm
</button>

</form>

<div class="navbar-nav ms-auto">

<?php if(isset($_SESSION['user_id'])): ?>

<span class="nav-link">
<?php if(isset($_SESSION['user']['avatar'])): ?>

<img
src="public/images/<?=
$_SESSION['user']['avatar']
?>"
width="35"
height="35"
style="
border-radius:50%;
object-fit:cover;
">

<?php endif; ?>

Xin chào,
<?= $_SESSION['username'] ?>
</span>

<a href="index.php?action=user"
class="btn btn-primary">
⚙ Tài khoản
</a>

<?php if(isset($_SESSION["role_id"]) && $_SESSION["role_id"] == 1): ?>

<a class="nav-link text-warning"
href="index.php?action=dashboard">
Trang Admin
</a>

<?php endif; ?>

<a class="nav-link"
href="index.php?action=logout">
↳ Đăng xuất
</a>

<?php else: ?>

<a class="nav-link"
href="#"
onclick="openLogin()">
Đăng nhập
</a>

<?php endif; ?>

</div>

</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</nav>