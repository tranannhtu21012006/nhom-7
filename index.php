<?php
    
require_once "views/layout/header.php";    
    
error_reporting(E_ALL);
ini_set('display_errors', 1);

if (session_status() === PHP_SESSION_NONE) {
    
    session_start();
}

$action = $_GET['action'] ?? 'home';

switch ($action)
{

/*
=========================
ARTICLE (User)
=========================
*/

case "home":

    require_once "controllers/ArticleController.php";

    $controller = new ArticleController();

    $controller->home();

break;


case "article":

    require_once "controllers/ArticleController.php";

    $controller = new ArticleController();

    if (isset($_GET["id"])) {

        $controller->detail($_GET["id"]);

    }

break;


case "search":

    require_once "controllers/ArticleController.php";

    $controller = new ArticleController();

    $keyword = $_GET["keyword"] ?? "";

    $controller->search($keyword);

break;



/*
=========================
AUTH
=========================
*/

case "login":

    require_once "controllers/AuthController.php";

    $auth = new AuthController();

    $auth->login();

break;


case "handleLogin":

    require_once "controllers/AuthController.php";

    $auth = new AuthController();

    $auth->handleLogin();

break;


case "logout":

    require_once "controllers/AuthController.php";

    $auth = new AuthController();

    $auth->logout();

break;


case "register":

    require_once "controllers/AuthController.php";

    $controller =
    new AuthController();

    $controller->register();

break;


case "handleRegister":

    require_once "controllers/AuthController.php";

    $controller =
    new AuthController();

    $controller->handleRegister();

break;



/*
=========================
USER
=========================
*/

case "user":

    require_once "controllers/UserController.php";

    $controller = new UserController();

    $controller->profile();

break;


case "changePassword":

    require_once "controllers/UserController.php";

    $controller = new UserController();

    $controller->changePassword();

break;


case "deleteAccount":

    require_once "controllers/UserController.php";

    $controller = new UserController();

    $controller->deleteAccount();

break;


case "add_favorite":

    require_once "controllers/UserController.php";

    $controller = new UserController();

    $controller->addFavorite();

break;



/*
=========================
ADMIN
=========================
*/

case "dashboard":

    require_once "controllers/AdminController.php";

    $admin = new AdminController();

    $admin->dashboard();

break;

case "manage_users":

    require_once "controllers/AdminController.php";

    $admin = new AdminController();

    $admin->manageUsers();

break;
        
case "lock_user":

    require_once
    "controllers/AdminController.php";

    $admin = new AdminController();

    $admin->lockUser();

break;

case "unlock_user":

    require_once
    "controllers/AdminController.php";

    $admin = new AdminController();

    $admin->unlockUser();

break;

/*
=========================
ARTICLE MANAGEMENT
=========================
*/

case "listArticle":

    require_once "controllers/AdminController.php";

    $admin = new AdminController();

    $admin->listArticle();

break;


case "createArticle":

    require_once "controllers/AdminController.php";

    $admin = new AdminController();

    $admin->createArticle();

break;


case "storeArticle":

    require_once "controllers/AdminController.php";

    $admin = new AdminController();

    $admin->storeArticle();

break;


case "editArticle":

    require_once
    "controllers/ArticleController.php";

    $controller = new ArticleController();

    $controller->editArticle();

break;


case "updateArticle":

    require_once
    "controllers/ArticleController.php";

    $controller = new ArticleController();

    $controller->updateArticle();

break;


case "deleteArticle":

    require_once "controllers/AdminController.php";

    $admin = new AdminController();

    $admin->deleteArticle();

break;


case "approveArticle":

    require_once "controllers/AdminController.php";

    $admin = new AdminController();

    $admin->approveArticle();

break;



/*
=========================
CATEGORY MANAGEMENT
=========================
*/

case "listCategory":

    require_once "controllers/AdminController.php";

    $admin = new AdminController();

    $admin->listCategory();

break;


case "createCategory":

    require_once "controllers/AdminController.php";

    $admin = new AdminController();

    $admin->createCategory();

break;


case "storeCategory":

    require_once "controllers/AdminController.php";

    $admin = new AdminController();

    $admin->storeCategory();

break;


case "deleteCategory":

    require_once "controllers/AdminController.php";

    $admin = new AdminController();

    $admin->deleteCategory();

break;


case "toggleCategory":

    require_once "controllers/AdminController.php";

    $admin = new AdminController();

    $admin->toggleCategory();

break;

case "toggleCategoryStatus":

    require_once "models/category.php";

    $category = new Category();

    $id = $_GET["id"];

    $row =
    $category->getById($id);

    if ($row["status"] == 1) {
        $newStatus = 0;
    } else {
        $newStatus = 1;
    }

    $category->updateStatus(
        $id,
        $newStatus
    );

    header(
        "Location: index.php?action=listCategory"
    );

break;

/*
=========================
CATEGORY FILTER (USER)
=========================
*/

case "category":

    require_once "controllers/ArticleController.php";

    $controller = new ArticleController();

    $id = $_GET["id"] ?? 0;

    $controller->category($id);

break;

case "updateAvatar":
    require_once "controllers/UserController.php";

    $controller = new UserController();

    $controller->updateAvatar();

break;

case "updateProfile":
    require_once "controllers/UserController.php";

    $controller = new UserController();

    $controller->updateProfile();

break;

case "deleteFavorite":

    require_once "controllers/UserController.php";

    $controller = new UserController();

    $controller->deleteFavorite();

break;
        
        
case "reported_comments":

    require_once "controllers/AdminController.php";

    $controller = new AdminController();

    $controller->reportedComments();

break;
        
case "delete_comment":

    require_once "controllers/AdminController.php";

    $controller = new AdminController();

    $controller->deleteComment();

break;
/*
=========================
DEFAULT
=========================
*/

default:

    require_once "controllers/ArticleController.php";

    $controller = new ArticleController();

    $controller->home();

break;

}
require_once "views/layout/footer.php";