<?php

class Database
{
    private $host = "sql113.infinityfree.com";
    private $dbname = "if0_41549253_sport_news_db";
    private $username = "if0_41549253";
    private $password = "tintuctheothao1";

    public function connect()
    {
        try {
            $conn = new PDO(
                "mysql:host=$this->host;dbname=$this->dbname;charset=utf8",
                $this->username,
                $this->password
            );

            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            return $conn;

        } catch(PDOException $e) {

            die("Lỗi kết nối DB: " . $e->getMessage());
        }
    }
}