<!DOCTYPE html>
<html>
<head>

<title>User Profile</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

</head>

<body>

<div class="container mt-4">

<h2>Tài khoản của bạn</h2>

<hr>

<h4>Ảnh đại diện</h4>

<?php if(!empty($user['avatar'])): ?>

<img
src="public/images/<?php echo $user['avatar']; ?>"
width="120"
style="border-radius:50%;">

<?php else: ?>

<img
src="public/images/default.png"
width="120">

<?php endif; ?>

<br><br>

<form method="POST"
action="index.php?action=updateAvatar"
enctype="multipart/form-data">

<input
type="file"
name="avatar"
class="form-control"
required>

<br>

<button class="btn btn-success">
Cập nhật ảnh đại diện
</button>

</form>

<hr>

<h4>Cập nhật thông tin cá nhân</h4>

<form method="POST"
action="index.php?action=updateProfile">

Tên người dùng

<input type="text"
name="username"
class="form-control"
value="<?php echo $user['username']; ?>"
required>

<br>

Email

<input type="email"
name="email"
class="form-control"
value="<?php echo $user['email']; ?>">

<br>

<button class="btn btn-primary">
Cập nhật thông tin
</button>

</form>

<hr>

<h4>Đổi mật khẩu</h4>

<form method="POST"
action="index.php?action=changePassword">

<input type="password"
name="new_password"
class="form-control"
placeholder="Mật khẩu mới"
required>

<br>

<button class="btn btn-primary">
Đổi mật khẩu
</button>

</form>

<hr>

<h4>Xóa tài khoản</h4>

<a
href="index.php?action=deleteAccount"
class="btn btn-danger"
onclick="return confirm('Bạn chắc chắn muốn xóa?')">

Xóa tài khoản

</a>

<hr>

<h4>Bài báo đã lưu</h4>

<?php while($row = $favorites->fetch(PDO::FETCH_ASSOC)) { ?>

<div class="card mb-3">

<div class="card-body">

<h5>
<?php echo $row["title"]; ?>
</h5>

<a
href="index.php?action=article&id=<?php echo $row["article_id"]; ?>"
class="btn btn-success">

Xem bài

</a>
<a href="
index.php?action=deleteFavorite
&id=<?= $row['id'] ?>
"
class="btn btn-danger btn-sm"
onclick="return confirm('Xóa bài đã lưu?')">

Xóa

</a>
</div>

</div>

<?php } ?>

<hr>

<h4>Lịch sử đọc</h4>

<table class="table">

<tr>
    <th>Tiêu đề</th>
    <th>Thời gian</th>
    <th>Hành động</th>
</tr>

<?php foreach ($history as $h): ?>

<tr>

<td>
<?= $h['title'] ?>
</td>

<td>
<?= $h['viewed_at'] ?>
</td>

<td>

<a href="
index.php?action=article
&id=<?= $h['article_id'] ?>
"
class="btn btn-info">

Xem lại

</a>

</td>

</tr>

<?php endforeach; ?>

</table>

</div>

</body>
</html>