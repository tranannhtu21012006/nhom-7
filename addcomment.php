<?php

session_start();

require_once "../models/comment.php";

if (!isset($_SESSION["user"])) {
    echo "not_login";
    exit;
}

$user_id = $_SESSION["user"]["user_id"];

$content = $_POST["content"];

$article_id = $_POST["article_id"];

$comment = new Comment();

$comment->addComment(
    $user_id,
    $article_id,
    $content
);

echo "success";