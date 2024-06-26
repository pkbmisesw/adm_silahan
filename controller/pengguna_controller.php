<?php
ini_set('display_errors', 0);
include "../config.php";
session_start();

$op = $_GET['op'];
if ($op == "hapus") {
    $id = $_GET['id'];

    $sql = "DELETE FROM m_user WHERE id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();

    if ($stmt) {
        echo "<script>alert('Berhasil Menghapus'); document.location.href=('../view/m_user/')</script>";
    } else {
        echo "<script>alert('Gagal Menghapus'); document.location.href=('../view/m_user/')</script>";
    }
} else if ($op == 'update') {
    try {
        \Models\User::find($_SESSION['user_id'])->updateOrFail([
            'nama' => $_POST['nama'],
            'hp' => $_POST['hp']
        ]);

        $_SESSION['nama'] = $_POST['nama'];
        echo "<script>alert('Berhasil update data !'); history.back()</script>";
    } catch (Exception $e) {
        echo "<script>alert('Gagal update data !'); history.back()</script>";
        return;
    }
}