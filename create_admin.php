<?php

$pdo = new PDO("mysql:host=localhost;dbname=sport_news_db", "root", "");

$username = "admin";
$password = password_hash("123", PASSWORD_DEFAULT);

$sql = "INSERT INTO user (username, password, role_id)
        VALUES (?, ?, 1)";

$stmt = $pdo->prepare($sql);
$stmt->execute([$username, $password]);

echo "Tạo admin thành công";