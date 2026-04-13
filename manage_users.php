<div class="container mt-4">

<h2 class="text-center mb-4">

Quản lý tài khoản

</h2>

<div class="card shadow rounded-4">

<div class="card-body">

<table class="table table-hover text-center">

<thead class="table-dark">

<tr>

<th>Tên đăng nhập</th>

<th>Vai trò</th>

<th>Trạng thái</th>

<th>Hành động</th>

</tr>

</thead>

<tbody>

<?php foreach($users as $u): ?>

<tr>

<td>

<strong>

<?= $u["username"]; ?>

</strong>

</td>

<td>

<?php if($u["role_id"] == 1): ?>

<span class="badge bg-danger">

Admin

</span>

<?php else: ?>

<span class="badge bg-primary">

User

</span>

<?php endif; ?>

</td>

<td>

<?php if($u["status"] == 1): ?>

<span class="badge bg-success">

Hoạt động

</span>

<?php else: ?>

<span class="badge bg-secondary">

Đã khóa

</span>

<?php endif; ?>

</td>

<td>

<?php if($u["role_id"] != 1): ?>

<?php if($u["status"] == 1): ?>

<a href="index.php?action=lock_user&id=<?= $u["user_id"]; ?>"

class="btn btn-danger btn-sm">

Khóa

</a>

<?php else: ?>

<a href="index.php?action=unlock_user&id=<?= $u["user_id"]; ?>"

class="btn btn-success btn-sm">

Mở khóa

</a>

<?php endif; ?>

<?php else: ?>

<span class="text-muted">

Không thể khóa

</span>

<?php endif; ?>

</td>

</tr>

<?php endforeach; ?>

</tbody>

</table>

</div>

</div>

</div>