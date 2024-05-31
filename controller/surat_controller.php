<?php
// ini_set('display_errors', 0);
include "../config.php";
// session_start();

$op = $_GET['op'];
if($op == "tambah"){
    $nama = $_POST['nama'];
    $des = $_POST['des'];
    $berkas = $_FILES['berkas'];
    $status = isset($_POST['status']) ? $_POST['status'] : 0;
    
    $dir = "../images/";
    $pathFile = $dir . basename($berkas["name"]);

    $extFile = strtolower(pathinfo($pathFile,PATHINFO_EXTENSION));
    $allowedExt = ["pdf", "zip"];
    if(!in_array($extFile, $allowedExt)){
        echo '<script>alert("Hanya boleh mengupload file pdf dan zip.");history.back();</script>';
        return;
    }

    if(!move_uploaded_file($berkas["tmp_name"], $pathFile)){
        echo '<script>alert("Upload gagal.");history.back();</script>';
        return;
    }

    try {

        $sql = "INSERT INTO m_surat SET
                user_id = :id_user,
                nama = :nama,
                des = :des,
                berkas = :berkas,
                status = :status";

        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':id_user', $_SESSION['user_id']);
        $stmt->bindParam(':nama', $nama);
        $stmt->bindParam(':des', $des);
        $stmt->bindParam(':berkas', $berkas['name']);
        $stmt->bindParam(':status', $status);
        $stmt->execute();
        if($stmt){
            echo "<script>alert('Berhasil Tambah'); history.back()</script>";
        }else {
            echo "<script>alert('Gagal Tambah'); history.back()</script>";
        }
    }
    catch(PDOException $e) {
        echo $e->getMessage();
    }
}else if($op == "hapus"){
    $id = $_GET['id'];

    $querySurat = $conn->prepare("SELECT * FROM m_surat WHERE id=:id");
    $querySurat->execute([":id" => $id]);
    $dataSurat = $querySurat->fetch();

    $dir = "../images/";
    unlink($dir . basename($dataSurat['berkas']));

    $sql = "DELETE FROM m_surat WHERE id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();

    if($stmt){
        echo "<script>alert('Berhasil Menghapus'); history.back();</script>";
    }else{
        echo "<script>alert('Gagal Menghapus'); history.back();</script>";
    }

}