<?php

require_once __DIR__ . "/../config/Database.php";

class Comment
{
    private $conn;

    public function __construct()
    {
        $db = new Database();
        $this->conn = $db->connect();
    }

public function getCommentsByArticle($id)
{
    $sql = "SELECT comment.*, user.username
            FROM comment
            JOIN user
            ON comment.user_id = user.user_id
            WHERE article_id = :id
            ORDER BY comment_id DESC";

    $stmt = $this->conn->prepare($sql);

    $stmt->bindParam(":id", $id);

    $stmt->execute();

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

    public function addComment(
    $user_id,
    $article_id,
    $content
)
{
    $sql = "INSERT INTO comment
            (user_id, article_id, content)
            VALUES (?, ?, ?)";

    $stmt = $this->conn->prepare($sql);

    return $stmt->execute([
        $user_id,
        $article_id,
        $content
    ]);
}
    
    public function report($id)
{
    $sql = "
        UPDATE comment
        SET reported = 1
        WHERE comment_id = :id
    ";

    $stmt = $this->conn->prepare($sql);

    $stmt->bindParam(":id", $id);

    return $stmt->execute();
}
    
    public function getReported()
{
    $sql = "
        SELECT *
        FROM comment
        WHERE reported = 1
        ORDER BY comment_id DESC
    ";

    return $this->conn->query($sql);
}
    
    public function delete($id)
{
    $sql = "
        DELETE FROM comment
        WHERE comment_id = :id
    ";

    $stmt = $this->conn->prepare($sql);

    $stmt->bindParam(":id", $id);

    return $stmt->execute();
}
}