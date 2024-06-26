<?php
include ("../../config.php");
$response = [];
if (isset($_POST['id'])) {
	$query = $conn->prepare("UPDATE m_user SET nama=:name,email=:email,hp=:hp,level_id=:role_id,status_aktif=:is_active,status_tembusan=:status_tembusan WHERE id=:id");

	$result = $query->execute([
		":name" => $_POST['nama'],
		":email" => $_POST['email'],
		":hp" => $_POST['hp'],
		":role_id" => $_POST['role_id'],
		":is_active" => $_POST['is_active'],
		":id" => $_POST['id'],
		":status_tembusan" => $_POST['status_tembusan']
	]);

	if ($result) {
		$des2 = $_SESSION['nama']." - Baru Saja Mengedit Permohonan ".$nama.", dan Isi = ".$des." dengan file ".$berkas['name'];
            $sql = "INSERT INTO m_log SET
                surat_id = :id_surat,
                user_id = :id_user,
                des = :des2";

            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':surat_id', $_POST['id']);
            $stmt->bindParam(':id_user', $_SESSION['user_id']);
            $stmt->bindParam(':des2', $des2);
            $stmt->execute();
		$response['code'] = 200;
	} else {
		$response['code'] = 505;
	}
}
echo json_encode($response);
?>