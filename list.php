<h2>Quản lý danh mục</h2>

<a href="index.php?action=createCategory" class="btn btn-primary mb-3">
    Thêm danh mục
</a>

<table class="table table-bordered">
    <tr>
        <th>ID</th>
        <th>Tên danh mục</th>
        <th>Trạng thái</th>
        <th>Hành động</th>
    </tr>

    <?php foreach ($categories as $row): ?>

    <tr>
        <td><?php echo $row["category_id"]; ?></td>

        <td><?php echo $row["category_name"]; ?></td>

        <td>

<?php
if ($row["status"] == 1) {
    echo "<span class='badge bg-success'>Hiển thị</span>";
} else {
    echo "<span class='badge bg-secondary'>Ẩn</span>";
}
?>

</td>

        <td>

            <a href="index.php?action=toggleCategoryStatus&id=<?php echo $row['category_id']; ?>"
class="btn btn-sm btn-warning">

Bật / Tắt

</a>

            <a href="index.php?action=deleteCategory&id=<?php echo $row["category_id"]; ?>"
               class="btn btn-danger"
               onclick="return confirm('Bạn có chắc muốn xóa?')">
               Xóa
            </a>

        </td>
    </tr>

    <?php endforeach; ?>

</table>