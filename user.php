<?php

require_once __DIR__ . "/../config/Database.php";

class UserModel {

    private $conn;

    public function __construct() {
        $db = new Database();
        $this->conn = $db->connect();
    }

    // ======================
    // Đổi mật khẩu
    // ======================

    public function changePassword($user_id, $new_password) {

        $hashed = password_hash(
            $new_password,
            PASSWORD_DEFAULT
        );

        $sql = "
            UPDATE user
            SET password = ?
            WHERE user_id = ?
        ";

        $stmt = $this->conn->prepare($sql);

        $stmt->execute([
            $hashed,
            $user_id
        ]);

        return true;
    }

    // ======================
    // Xóa tài khoản
    // ======================

    public function deleteAccount($user_id) {

        $sql = "
            DELETE FROM user
            WHERE user_id = ?
        ";

        $stmt = $this->conn->prepare($sql);

        $stmt->execute([$user_id]);

        return true;
    }

    // ======================
    // Lấy bài viết đã lưu
    // ======================

    public function getFavorites($user_id)
{
    $sql = "
        SELECT 
            favorites.id,
            article.article_id,
            article.title,
            article.image,
            favorites.created_at
        FROM favorites
        JOIN article
        ON favorites.article_id = article.article_id
        WHERE favorites.user_id = ?
        ORDER BY favorites.created_at DESC
    ";

    $stmt = $this->conn->prepare($sql);

    $stmt->execute([$user_id]);

    return $stmt;
}

    // ======================
// Lưu bài viết
// ======================

public function addFavorite($user_id, $article_id)
{
    $sql = "
        INSERT INTO favorites (user_id, article_id)
        VALUES (?, ?)
    ";

    $stmt = $this->conn->prepare($sql);

    return $stmt->execute([
        $user_id,
        $article_id
    ]);
}

public function isFavorite($user_id, $article_id)
{
    $sql = "
        SELECT *
        FROM favorites
        WHERE user_id = ?
        AND article_id = ?
    ";

    $stmt = $this->conn->prepare($sql);

    $stmt->execute([
        $user_id,
        $article_id
    ]);

    return $stmt->rowCount() > 0;
}

public function deleteFavorite($id)
{
    $sql = "
        DELETE FROM favorites
        WHERE id = ?
    ";

    $stmt = $this->conn->prepare($sql);

    return $stmt->execute([$id]);
}

public function getUserById($user_id)
{
    $sql = "SELECT * FROM user WHERE user_id = ?";

    $stmt = $this->conn->prepare($sql);

    $stmt->execute([$user_id]);

    return $stmt->fetch(PDO::FETCH_ASSOC);
}

public function updateAvatar($user_id, $avatar)
{
    $sql = "UPDATE user
            SET avatar = ?
            WHERE user_id = ?";

    $stmt = $this->conn->prepare($sql);

    $stmt->execute([
        $avatar,
        $user_id
    ]);
}

public function updateProfile(
    $user_id,
    $username,
    $email
) {
    if ($email == "") {


        $sql = "
            UPDATE user
            SET username = ?
            WHERE user_id = ?
        ";

        $stmt =
            $this->conn->prepare($sql);

        $stmt->execute([
            $username,
            $user_id
        ]);

    } else {


        $sql = "
            UPDATE user
            SET username = ?,
                email = ?
            WHERE user_id = ?
        ";

        $stmt =
            $this->conn->prepare($sql);

        $stmt->execute([
            $username,
            $email,
            $user_id
        ]);

    }
}

public function saveHistory($user_id, $article_id)
{
    // 1. Xóa nếu bài đã tồn tại
    $sqlCheck = "
        DELETE FROM history
        WHERE user_id = ?
        AND article_id = ?
    ";

    $stmt = $this->conn->prepare($sqlCheck);

    $stmt->execute([
        $user_id,
        $article_id
    ]);

    // 2. Thêm lịch sử mới

    $sqlInsert = "
        INSERT INTO history
        (user_id, article_id, viewed_at)
        VALUES (?, ?, NOW())
    ";

    $stmt = $this->conn->prepare($sqlInsert);

    $stmt->execute([
        $user_id,
        $article_id
    ]);

    // 3. Giữ lại 10 bài gần nhất

    $sqlLimit = "
        DELETE FROM history
        WHERE user_id = ?
        AND history_id NOT IN (
            SELECT history_id
            FROM (
                SELECT history_id
                FROM history
                WHERE user_id = ?
                ORDER BY viewed_at DESC
                LIMIT 10
            ) AS temp
        )
    ";

    $stmt = $this->conn->prepare($sqlLimit);

    $stmt->execute([
        $user_id,
        $user_id
    ]);
}

public function getReadingHistory($user_id)
{
    $sql = "
        SELECT 
            a.article_id,
            a.title,
            a.image,
            h.viewed_at
        FROM history h
        JOIN article a
        ON h.article_id = a.article_id
        WHERE h.user_id = ?
        ORDER BY h.viewed_at DESC
    ";

    $stmt = $this->conn->prepare($sql);

    $stmt->execute([$user_id]);

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

public function checkUsername($username)
{
    $sql = "
        SELECT *
        FROM user
        WHERE username = ?
    ";

    $stmt = $this->conn->prepare($sql);

    $stmt->execute([$username]);

    return $stmt->rowCount() > 0;
}
}