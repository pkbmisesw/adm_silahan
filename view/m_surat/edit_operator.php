<?php
include("../../config.php");
$response = [];
if (isset($_POST['id'])){
    $sql = "UPDATE m_surat SET note=:note WHERE id=:id";

    $query = $conn->prepare($sql);
    $query->bindParam(":id", $_POST['id']);
    $query->bindParam(":note", $_POST['note']);
    $result = $query->execute();

    if ($result){
        echo "<script>alert('Success Update'); history.back();</script>";
        return;
    }else{
        echo "<script>alert('Failed Update'); history.back();</script>";
        return;
    }
}
echo json_encode($response);
?>