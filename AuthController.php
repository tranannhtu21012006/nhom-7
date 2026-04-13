<?php

require_once __DIR__ . "/../config/Database.php";

class AuthController
{
    private $db;

    public function __construct()
{
    $database = new Database();

    $this->db = $database->connect();

    
}

    // ======================
    // FORM LOGIN
    // ======================

    public function login()
    {
        require __DIR__ . "/../views/auth/login.php";
    }

    // ======================
    // HANDLE LOGIN
    // ======================

    public function handleLogin()
{
    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        $username = $_POST["username"];
        $password = $_POST["password"];

        $sql = "SELECT * FROM user WHERE username = ?";

        $stmt = $this->db->prepare($sql);
        $stmt->execute([$username]);

        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user["password"])) {
            if ($user["status"] == 0) {

                 header("Location: index.php?error=locked");

                 exit;

             }

         if (session_status() === PHP_SESSION_NONE) {
          session_start();
        }
          $_SESSION['user'] = $user;
          $_SESSION['user_id'] = $user['user_id'];
          $_SESSION['username'] = $user['username'];
          $_SESSION['role_id'] = $user['role_id'];

         header("Location: index.php");
         exit;


        } else {

            header("Location: index.php?error=1");
            exit;
        }
    }
}

    // ======================
    // FORM REGISTER
    // ======================

    public function register()
{
    include __DIR__ . "/../views/register.php";
}

    // ======================
    // HANDLE REGISTER
    // ======================

    public function handleRegister()
{
    $username = $_POST['username'];
    $password = $_POST['password'];

    // kiểm tra trùng username

    $check = $this->db->prepare(
        "SELECT * FROM user WHERE username=?"
    );

    $check->execute([$username]);

    if ($check->rowCount() > 0)
    {
        $error =
        "Tên tài khoản đã tồn tại";

        include __DIR__ .
        "/../views/register.php";

        return;
    }

    // mã hóa password

    $hashedPassword =
        password_hash(
            $password,
            PASSWORD_DEFAULT
        );

    $sql = "
        INSERT INTO user
        (username, password)
        VALUES (?, ?)
    ";

    $stmt =
        $this->db->prepare($sql);

    $stmt->execute([
        $username,
        $hashedPassword
    ]);

    header(
        "Location: index.php?action=login"
    );
}

    // ======================

    public function logout()
{
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

    session_destroy();

    header("Location: index.php");
    exit;
}
}