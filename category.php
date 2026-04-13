<?php

require_once "config/Database.php";

class Category
{
    private $conn;

    public function __construct()
    {
        $db = new Database();
        $this->conn = $db->connect();
    }

    public function getAll()
{
    $sql = "
        SELECT *
        FROM category
        WHERE status = 1
        ORDER BY category_id DESC
    ";

    $stmt =
    $this->conn->query($sql);

    return $stmt->fetchAll();
}

    public function getActive()
    {
        $sql = "SELECT *
                FROM category
                WHERE status = 1";

        $stmt = $this->conn->prepare($sql);

        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function add($name)
    {
        $sql = "INSERT INTO category(category_name, status)
                VALUES (?, 1)";

        $stmt = $this->conn->prepare($sql);

        return $stmt->execute([$name]);
    }

    public function delete($id)
    {
        $sql = "DELETE FROM category
                WHERE category_id = ?";

        $stmt = $this->conn->prepare($sql);

        return $stmt->execute([$id]);
    }

    public function toggleStatus($id)
    {
        $sql = "UPDATE category
                SET status = NOT status
                WHERE category_id = ?";

        $stmt = $this->conn->prepare($sql);

        return $stmt->execute([$id]);
    }
    
    public function getById($id)
{
    $sql = "
        SELECT *
        FROM category
        WHERE category_id = ?
    ";

    $stmt =
    $this->conn->prepare($sql);

    $stmt->execute([$id]);

    return $stmt->fetch();
}
    
    public function updateStatus(
    $id,
    $status
)
{
    $sql = "
        UPDATE category
        SET status = ?
        WHERE category_id = ?
    ";

    $stmt =
    $this->conn->prepare($sql);

    $stmt->execute([
        $status,
        $id
    ]);
}
    
    public function getAllAdmin()
{
    $sql = "
        SELECT *
        FROM category
        ORDER BY category_id DESC
    ";

    $stmt =
    $this->conn->query($sql);

    return $stmt->fetchAll();
}
}