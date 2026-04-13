<?php

require_once __DIR__ . "/../config/Database.php";

class Article
{
    private $conn;

    public function __construct()
    {
        $db = new Database();
        $this->conn = $db->connect();
    }

    public function getAll()
{
    $sql = "SELECT *
            FROM article
            ORDER BY article_id DESC";

    $stmt = $this->conn->prepare($sql);

    $stmt->execute();

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

    public function create(
    $title,
    $content,
    $category_id,
    $image,
    $status
)
{
    $sql = "INSERT INTO article
            (title, content, category_id, image, status)
            VALUES (?, ?, ?, ?, ?)";

    $stmt = $this->conn->prepare($sql);

    return $stmt->execute([
        $title,
        $content,
        $category_id,
        $image,
        $status
    ]);
}

    public function delete($id)
    {
        $sql = "DELETE FROM article
                WHERE article_id = ?";

        $stmt = $this->conn->prepare($sql);

        return $stmt->execute([$id]);
    }

    public function approve($id)
    {
        $sql = "UPDATE article
                SET status = 1
                WHERE article_id = ?";

        $stmt = $this->conn->prepare($sql);

        return $stmt->execute([$id]);
    }

    public function getHotNews()
{
    $sql = "SELECT *
            FROM article
            WHERE status = 1
            ORDER BY article_id DESC
            LIMIT 5";

    $stmt = $this->conn->prepare($sql);

    $stmt->execute();

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

public function getDetail($id)
{
    $sql = "
    SELECT *
    FROM article
    WHERE article_id = ?
    AND status = 1
    ";

    $stmt = $this->conn->prepare($sql);

    $stmt->execute([$id]);

    return $stmt->fetch(PDO::FETCH_ASSOC);
}

public function search($keyword)
{
    $sql = "SELECT * FROM article
            WHERE status = 1
            AND (
                title LIKE :keyword
                OR content LIKE :keyword
            )
            ORDER BY article_id DESC";

    $stmt = $this->conn->prepare($sql);

    $like = "%" . $keyword . "%";

    $stmt->bindParam(":keyword", $like, PDO::PARAM_STR);

    $stmt->execute();

    return $stmt;
}

public function saveArticle($user_id, $article_id) {

    $sql = "
        INSERT INTO favorites
        (user_id, article_id)
        VALUES (?, ?)
    ";

    $stmt = $this->conn->prepare($sql);

return $stmt->execute([
    $user_id,
    $article_id
]);
}

public function getByCategory($category_id)
{
    $sql = "SELECT *
            FROM article
            WHERE category_id = ?
            AND status = 1";

    $stmt = $this->conn->prepare($sql);

    $stmt->execute([$category_id]);

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

public function update(
    $id,
    $title,
    $content,
    $category_id,
    $image,
    $status
)
{
    $sql = "UPDATE article
            SET title = ?,
                content = ?,
                category_id = ?,
                image = ?,
                status = ?
            WHERE article_id = ?";

    $stmt = $this->conn->prepare($sql);

    return $stmt->execute([
        $title,
        $content,
        $category_id,
        $image,
        $status,
        $id
    ]);
}

public function getArticlesPagination($start, $limit)
{
    $sql = "
        SELECT *
        FROM article
        WHERE status = 1
        ORDER BY article_id DESC
        LIMIT ?, ?
    ";

    $stmt = $this->conn->prepare($sql);

    $stmt->bindParam(1, $start, PDO::PARAM_INT);
    $stmt->bindParam(2, $limit, PDO::PARAM_INT);

    $stmt->execute();

    return $stmt;
}

public function countArticles()
{
    $sql = "
        SELECT COUNT(*) as total
        FROM article
        WHERE status = 1
    ";

    $stmt = $this->conn->query($sql);

    return $stmt->fetch()['total'];
}

public function getByCategoryPagination(
    $category_id,
    $start,
    $limit
)
{
    $sql = "
        SELECT *
        FROM article
        WHERE category_id = ?
        AND status = 1
        ORDER BY article_id DESC
        LIMIT ?, ?
    ";

    $stmt =
        $this->conn->prepare($sql);

    $stmt->bindParam(
        1,
        $category_id,
        PDO::PARAM_INT
    );

    $stmt->bindParam(
        2,
        $start,
        PDO::PARAM_INT
    );

    $stmt->bindParam(
        3,
        $limit,
        PDO::PARAM_INT
    );

    $stmt->execute();

    return $stmt->fetchAll(
        PDO::FETCH_ASSOC
    );
}

public function countByCategory(
    $category_id
)
{
    $sql = "
        SELECT COUNT(*) as total
        FROM article
        WHERE category_id = ?
        AND status = 1
    ";

    $stmt =
        $this->conn->prepare($sql);

    $stmt->execute([
        $category_id
    ]);

    return $stmt->fetch()['total'];
}
 
    public function updateTitle($id, $title)
{
    $sql = "
    UPDATE article
    SET title = ?
    WHERE article_id = ?
    ";

    $stmt =
    $this->conn->prepare($sql);

    return $stmt->execute([
        $title,
        $id
    ]);
}
    
    public function getArticleById($id)
{
    $sql = "
    SELECT *
    FROM article
    WHERE article_id = ?
    ";

    $stmt =
    $this->conn->prepare($sql);

    $stmt->execute([$id]);

    return $stmt->fetch(PDO::FETCH_ASSOC);
}
    
    public function updateArticle(
    $id,
    $title,
    $content,
    $status
)
{
    $sql = "
    UPDATE article
    SET
        title = ?,
        content = ?,
        status = ?
    WHERE article_id = ?
    ";

    $stmt = $this->conn->prepare($sql);

    return $stmt->execute([
        $title,
        $content,
        $status,
        $id
    ]);
}
    
    public function getPublicArticles()
{
    $sql = "
        SELECT *
        FROM article
        WHERE status = 1
        ORDER BY article_id DESC
    ";

    $stmt = $this->conn->prepare($sql);

    $stmt->execute();

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}
    
    public function getRelatedArticles(
    $category_id,
    $current_id
)
{
    $sql = "
        SELECT *
        FROM article
        WHERE category_id = ?
        AND article_id != ?
        AND status = 1
        ORDER BY article_id DESC
        LIMIT 4
    ";

    $stmt =
        $this->conn->prepare($sql);

    $stmt->execute([
        $category_id,
        $current_id
    ]);

    return $stmt->fetchAll(
        PDO::FETCH_ASSOC
    );
}
}
