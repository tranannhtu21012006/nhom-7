<?php

session_start();

require_once "../models/comment.php";

if (!isset($_SESSION["user_id"])) {
    echo "not_login";
    exit;
}

$comment_id = $_POST["comment_id"];

$user_id = $_SESSION["user_id"];

$comment = new Comment();

/*
Chỉ xóa nếu đúng chủ comment
*/

$sql = "
DELETE FROM comment
WHERE comment_id = ?
AND user_id = ?
";

$db = new Database();
$conn = $db->connect();

$stmt = $conn->prepare($sql);

$stmt->execute([
    $comment_id,
    $user_id
]);

echo "deleted";