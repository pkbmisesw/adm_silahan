<?php

session_start(); // Digunakan untuk memulai session

include 'bootstrap.php';
include 'db/koneksi.php';

date_default_timezone_set("Asia/Makassar");
//echo date("Y/m/d h:i:a");

// 
$url_web = 'http://localhost/adm_silahan';

// SMTP Server
$mail_host = 'smtp.gmail.com';
$mail_username = 'rezavanessa.accggl@gmail.com';
$mail_password = 'pcumxzbhklenfuxs';
$mail_port = 587;

try {
    $conn = new PDO("mysql:host={$host};dbname={$db}", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e) {
    echo $e->getMessage();
}


?>
