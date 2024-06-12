<?php

session_start(); // Digunakan untuk memulai session

date_default_timezone_set("Asia/Makassar");
//echo date("Y/m/d h:i:a");

// 
$url_web = 'http://localhost/adm_silahan';

$host = "localhost"; // nama host anda
$user = "root"; // usernames dari host anda
$pass = ""; //password dari host anda
$db   = "buatweb"; // nama database yang anda miliki

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
