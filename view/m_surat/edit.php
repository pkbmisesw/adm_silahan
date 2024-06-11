<?php
include("../../config.php");
$response = [];
if (isset($_POST['id'])){
    $berkas = $_FILES['berkas'];

    $querySurat = $conn->prepare("SELECT * FROM m_surat WHERE id=:id");
    $querySurat->execute([":id" => $_POST['id']]);
    $dataSurat = $querySurat->fetch();

    $dir = "../../images/";
    unlink($dir . basename($dataSurat['berkas']));


    $sql = "UPDATE m_surat SET nama=:nama, des=:des WHERE id=:id";
    if($_GET['ref'] == "ditolak") {
        $sql = "UPDATE m_surat SET nama=:nama, des=:des, status=:status WHERE id=:id";
    }

    if(!$berkas['name'] == ""){
        $sql = "UPDATE m_surat SET nama=:nama, des=:des, berkas=:berkas WHERE id=:id";

        if($_GET['ref'] == "ditolak") {
            $sql = "UPDATE m_surat SET nama=:nama, des=:des, berkas=:berkas, status=:status WHERE id=:id";
        }

        $pathFile = $dir . basename($berkas["name"]);
        $extFile = strtolower(pathinfo($pathFile,PATHINFO_EXTENSION));
        $allowedExt = ["png", "jpg", "pdf"];
        if(!in_array($extFile, $allowedExt)){
            echo '<script>alert("Hanya boleh mengupload file jpg, png.");history.back();</script>';
            return;
        }

        if(!move_uploaded_file($berkas["tmp_name"], $pathFile)){
            echo '<script>alert("Upload gagal.");history.back();</script>';
            return;
        }
    }

    $query = $conn->prepare($sql);
    $query->bindParam(":id", $_POST['id']);
    $query->bindParam(":nama", $_POST['nama']);
    $query->bindParam(":des", $_POST['des']);

    if($_GET['ref'] == "ditolak"){
        $status = 0;
        $query->bindParam(":status", $status);
    }

    if(!$berkas['name'] == ""){
        $query->bindParam(":berkas", $berkas['name']);
    }

    $result = $query->execute();

    if ($result){
        // echo "<script>alert('Success Update'); history.back();</script>";
        echo "<script>alert('Success Update');</script>";
        header("Location: http://localhost/adm_silahan/view/m_surat/");
        return;
    }else{
        echo "<script>alert('Failed Update'); history.back();</script>";
        return;
    }
}
echo json_encode($response);
?>