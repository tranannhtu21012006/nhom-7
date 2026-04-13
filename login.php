
<div class="container mt-4">

<h3>Đăng nhập</h3>

<div class="login-container"
     style="max-width:400px">

<?php
if(isset($_GET["error"]))
{
    echo '<div class="alert alert-danger">
            Sai tài khoản hoặc mật khẩu
          </div>';
}
?>

<form method="POST"
      action="index.php?action=handleLogin">

<input
name="username"
class="form-control"
placeholder="Username"
required>

<br>

<input
type="password"
name="password"
class="form-control"
placeholder="Password"
required>

<br>

<button class="btn btn-primary w-100">
Đăng nhập
</button>

<br><br>

<a href="index.php?action=register">

Chưa có tài khoản?
Đăng ký

</a>

</form>

</div>

</div>

<?php if(isset($_GET["error"])
&& $_GET["error"] == "locked") { ?>

<div class="alert alert-danger">

Tài khoản đã bị khóa

</div>

<?php } ?>

<?php include "views/layout/footer.php"; ?>