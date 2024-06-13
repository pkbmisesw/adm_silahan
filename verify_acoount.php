<?php

include 'config.php';

if (!isset($_GET['token'])) {
    echo "<script> alert('token is required') </script>";
    return;
}

$token = $conn->prepare("SELECT * FROM verify_code WHERE token = :token LIMIT 1");

$token->bindParam(':token', $_GET['token']);

$token->execute();

$data = $token->fetch();

$email_verif = $data['email'];

if (!$email_verif) {
    echo "<script> alert('Token invalid')</script>";
    exit();
}

$update_user = $conn->prepare("UPDATE `m_user` SET `status_aktif`=1 WHERE email = :email");

$update_user->bindParam(':email', $email_verif);

$update_user->execute();

$delete_token = $conn->prepare('DELETE FROM verify_code WHERE token = :token');
$delete_token->bindParam(':token', $_GET['token']);
$delete_token->execute();

// echo "<script> alert('verif success') </script>";
header('Location: index.php?success=Akun berhasil diverifikasi');
return;
// print_r($data['email']);
// return;
// echo "Hello World";