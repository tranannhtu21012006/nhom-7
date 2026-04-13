<?php

require_once "../models/comment.php";

$comment = new Comment();

$comments = $comment->getCommentsByArticle($_GET['article_id']);

foreach ($comments as $row) {

    echo "<p>";
    echo "<strong>" . $row['username'] . "</strong>: ";
    echo $row['content'];
    echo "</p>";

}