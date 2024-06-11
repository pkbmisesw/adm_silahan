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
            echo "<script>alert('Berhasil Tambah');</script>";
            header("Location: http://localhost/adm_silahan/view/m_surat/");
            exit();
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
} else if($op == "approve"){
    $id = isset($_GET['id']) ? $_GET['id'] : '';

    if(!$id){
        echo '<script>history.back();</script>';
    }

    $sql = "UPDATE `m_surat` SET `status`=1, `petugas_id`=:petugas_id WHERE `id`=:id";
    $query = $conn->prepare($sql);
    $result = $query->execute([":id" => $id, ":petugas_id" => $_SESSION['user_id']]);

    if ($result){
        echo "<script>alert('Berhasil Approve'); history.back();</script>";
        return;
    }else{
        echo "<script>alert('Gagal Approve'); history.back();</script>";
        return;
    }
} else if($op == "deny"){
    $id = isset($_GET['id']) ? $_GET['id'] : '';

    if(!$id){
        echo '<script>history.back();</script>';
    }

    $sql = "UPDATE `m_surat` SET `status`=5, `petugas_id`=:petugas_id WHERE `id`=:id";
    $query = $conn->prepare($sql);
    $result = $query->execute([":id" => $id, ":petugas_id" => $_SESSION['user_id']]);

    if ($result){
        echo "<script>alert('Berhasil Deny'); history.back();</script>";
        return;
    }else{
        echo "<script>alert('Gagal Deny'); history.back();</script>";
        return;
    }
} else if($op == "disposisi"){
    $id = isset($_GET['id']) ? $_GET['id'] : '';

    if(!$id){
        echo '<script>history.back();</script>';
    }

    $sql = "UPDATE `m_surat` SET `status`=2 WHERE `id`=:id";
    $query = $conn->prepare($sql);
    $result = $query->execute([":id" => $id]);

    if ($result){
        echo "<script>alert('Berhasil Disposisi'); history.back();</script>";
        return;
    }else{
        echo "<script>alert('Gagal Disposisi'); history.back();</script>";
        return;
    }
} else if($op == "telaah"){
    $id = isset($_POST['id']) ? $_POST['id'] : '';

    if(!$id){
        echo '<script>history.back();</script>';
    }

    $selesai_tgl = isset($_POST['selesai_tgl']) ? $_POST['selesai_tgl'] : '';

    if(!$selesai_tgl){
        echo '<script>history.back();</script>';
    }

    $formattedMulaiTgl = date("Y-m-d");
    $formattedSelesaiTgl = date("Y-m-d", strtotime($selesai_tgl));


    $sql = "UPDATE `m_surat` SET `status`=3, `mulai_tgl`=:mulai_tgl, `selesai_tgl`=:selesai_tgl WHERE `id`=:id";
    $query = $conn->prepare($sql);
    $result = $query->execute([":id" => $id, ":mulai_tgl" => $formattedMulaiTgl, ":selesai_tgl" => $formattedSelesaiTgl]);

    if ($result){
        echo "<script>alert('Berhasil Ditelaah'); history.back();</script>";
        return;
    }else{
        echo "<script>alert('Gagal Ditelaah'); history.back();</script>";
        return;
    }
} else if($op == "sedangtelaah"){
    $id = isset($_POST['id']) ? $_POST['id'] : '';

    if(!$id){
        echo '<script>history.back();</script>';
    }

    $telaah_id = isset($_POST['penelaah_id']) ? $_POST['penelaah_id'] : '';

    if(!$telaah_id){
        echo '<script>history.back();</script>';
    }

    $sql = "UPDATE `m_surat` SET `status`=6, `ppkh_id`=:ppkh_id, `telaah_id`=:telaah_id WHERE `id`=:id";
    $query = $conn->prepare($sql);
    $result = $query->execute([":id" => $id, ":ppkh_id" => $_SESSION['user_id'], ":telaah_id" => $telaah_id]);

    if ($result){
        echo "<script>alert('Berhasil Ditelaah'); history.back();</script>";
        return;
    }else{
        echo "<script>alert('Gagal Ditelaah'); history.back();</script>";
        return;
    }
} else if($op == "selesaitelaah"){
    $id = isset($_GET['id']) ? $_GET['id'] : '';

    if(!$id){
        echo '<script>history.back();</script>';
    }

    $sql = "UPDATE `m_surat` SET `status`=7 WHERE `id`=:id";
    $query = $conn->prepare($sql);
    $result = $query->execute([":id" => $id]);

    if ($result){
        echo "<script>alert('Berhasil Ditelaah'); history.back();</script>";
        return;
    }else{
        echo "<script>alert('Gagal Ditelaah'); history.back();</script>";
        return;
    }
}