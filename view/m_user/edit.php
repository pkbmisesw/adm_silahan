<?php
	include("../../config.php");
	$response = [];
	if (isset($_POST['id'])){
        $query = $conn->prepare("UPDATE m_user SET nama=:name,email=:email,hp=:hp,level_id=:role_id,status_aktif=:is_active WHERE id=:id");

        $result = $query->execute([
            ":name" => $_POST['nama'],
            ":email" => $_POST['email'],
            ":hp" => $_POST['hp'],
            ":role_id" => $_POST['role_id'],
            ":is_active" => $_POST['is_active'],
            ":id" => $_POST['id'],
        ]);

		if ($result){
		    $response['code'] = 200;
		}else{
		    $response['code'] = 505;
		}
	}
	echo json_encode($response);
?>