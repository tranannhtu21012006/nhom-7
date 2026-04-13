<!DOCTYPE html>
<html>

<head>

<title>Đăng ký tài khoản</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

</head>

<body
style="
background: linear-gradient(
to right,
#74ebd5,
#9face6
);
height: 100vh;
">

<div
class="container
d-flex
justify-content-center
align-items-center
h-100">

<div
class="card
shadow
p-4"
style="
width: 350px;
border-radius: 15px;
">

<h4
class="text-center
mb-4">

Đăng ký tài khoản

</h4>

<form
method="POST"
action="index.php?action=handleRegister">

<div class="mb-3">

<label class="form-label">

Username

</label>

<input
type="text"
name="username"
class="form-control"
placeholder="Nhập username"
required>

</div>

<div class="mb-3">

<label class="form-label">

Password

</label>

<input
type="password"
name="password"
class="form-control"
placeholder="Nhập password"
required>

</div>

<button
type="submit"
class="btn btn-primary w-100">

Đăng ký

</button>

</form>

<hr>

<p class="text-center">

Đã có tài khoản?

<a href="index.php?action=login">

Đăng nhập

</a>

</p>

<?php if (isset($error)): ?>

<div
class="alert alert-danger
mt-3
text-center">

<?= $error ?>

</div>

<?php endif; ?>

</div>

</div>

</body>

</html>