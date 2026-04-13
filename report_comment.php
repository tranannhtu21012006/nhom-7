<?php

require_once "../models/comment.php";

$model = new Comment();

$comment_id = $_POST["comment_id"];

$model->report($comment_id);

echo "ok";