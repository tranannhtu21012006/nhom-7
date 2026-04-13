<?php

require_once "models/user.php";

class UserController {

    private $userModel;

    public function __construct() {
        $this->userModel = new UserModel();
    }

    // ======================
    // Trang profile
    // ======================

    public function profile()
{
    if (!isset($_SESSION['user'])) {

        header("Location: index.php?action=login");
        exit;
    }

    $user_id = $_SESSION['user']['user_id'];

    $history = $this->userModel
                ->getReadingHistory($user_id);

    $user = $this->userModel
             ->getUserById($user_id);

    $favorites = $this->userModel
                      ->getFavorites($user_id);

    require "views/user/profile.php";
}

    // ======================
    // Đổi mật khẩu
    // ======================

    public function changePassword()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {

            $new_password = $_POST["new_password"];

            $this->userModel->changePassword(
                $_SESSION["user"]["user_id"],
                $new_password
            );

            echo "Đổi mật khẩu thành công";
        }
    }

    // ======================
    // Xóa tài khoản
    // ======================

    public function deleteAccount()
    {
        $this->userModel->deleteAccount(
            $_SESSION["user"]["user_id"]
        );

        session_destroy();

        header("Location: index.php");
        exit;
    }


    // ======================
// Lưu bài báo
// ======================

public function addFavorite()
{
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

    if (!isset($_SESSION["user_id"])) {
        header("Location: index.php?action=login");
        exit;
    }

    if (isset($_GET["article_id"])) {

        $user_id = $_SESSION["user_id"];
        $article_id = $_GET["article_id"];

        // tránh lưu trùng
        if (!$this->userModel->isFavorite($user_id, $article_id)) {
            $this->userModel->addFavorite(
                $user_id,
                $article_id
            );
        }

        header("Location: index.php?action=profile");
    }
}

public function deleteFavorite()
{
    if (!isset($_SESSION["user"])) {

        header("Location: index.php");
        exit;
    }

    if (isset($_GET["id"])) {

        $id = $_GET["id"];

        $this->userModel
             ->deleteFavorite($id);
    }

    header("Location: index.php?action=favorites");
}

public function updateAvatar()
{
    if ($_FILES["avatar"]["name"] != "") {

        $avatar =
            time() . "_" .
            $_FILES["avatar"]["name"];

        move_uploaded_file(
            $_FILES["avatar"]["tmp_name"],
            "public/images/" . $avatar
        );

        $this->userModel->updateAvatar(
            $_SESSION["user"]["user_id"],
            $avatar
        );

        // cập nhật session

        $_SESSION["user"]["avatar"] = $avatar;
    }

    header("Location: index.php?action=profile");
}

public function updateProfile()
{
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

    $user_id =
        $_SESSION["user"]["user_id"];

    $username =
        $_POST["username"];

    $email =
        $_POST["email"] ?? "";

    $this->userModel->updateProfile(
        $user_id,
        $username,
        $email
    );

    /*
    QUAN TRỌNG NHẤT
    cập nhật lại session
    */

    $_SESSION["username"] = $username;

    $_SESSION["user"]["username"] = $username;

    $_SESSION["user"]["email"] = $email;

    header(
        "Location: index.php?action=profile"
    );
}
}