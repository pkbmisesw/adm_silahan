<?php
// ini_set('display_errors', 0);
include "../config.php";
// session_start();

$op = $_GET['op'];
if ($op == "tambah") {
    $nama = $_POST['nama'];
    $des = $_POST['des'];
    $berkas = $_FILES['berkas'];
    $status = isset($_POST['status']) ? $_POST['status'] : 0;

    $dir = "../images/";
    $pathFile = $dir . basename($berkas["name"]);

    $extFile = strtolower(pathinfo($pathFile, PATHINFO_EXTENSION));
    $allowedExt = ["pdf", "zip"];
    if (!in_array($extFile, $allowedExt)) {
        echo '<script>alert("Hanya boleh mengupload file pdf dan zip.");history.back();</script>';
        return;
    }

    if (!move_uploaded_file($berkas["tmp_name"], $pathFile)) {
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
        if ($stmt) {
            header("Location: $url_web/view/m_surat/");
            echo "<script>alert('Berhasil Tambah');</script>";
            exit();
        } else {
            echo "<script>alert('Gagal Tambah'); history.back()</script>";
        }
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
} else if ($op == "hapus") {
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

    if ($stmt) {
        echo "<script>alert('Berhasil Menghapus'); history.back();</script>";
    } else {
        echo "<script>alert('Gagal Menghapus'); history.back();</script>";
    }
} else if ($op == "approve") {
    $id = isset($_GET['id']) ? $_GET['id'] : '';

    if (!$id) {
        echo '<script>history.back();</script>';
    }

    $sql = "UPDATE `m_surat` SET `status`=1, `petugas_id`=:petugas_id WHERE `id`=:id";
    $query = $conn->prepare($sql);
    $result = $query->execute([":id" => $id, ":petugas_id" => $_SESSION['user_id']]);

    if ($result) {
        echo "<script>alert('Berhasil Approve'); history.back();</script>";
        return;
    } else {
        echo "<script>alert('Gagal Approve'); history.back();</script>";
        return;
    }
} else if ($op == "deny") {
    $id = isset($_GET['id']) ? $_GET['id'] : '';

    if (!$id) {
        echo '<script>history.back();</script>';
    }

    $sql = "UPDATE `m_surat` SET `status`=5, `petugas_id`=:petugas_id WHERE `id`=:id";
    $query = $conn->prepare($sql);
    $result = $query->execute([":id" => $id, ":petugas_id" => $_SESSION['user_id']]);

    if ($result) {
        echo "<script>alert('Berhasil Deny'); history.back();</script>";
        return;
    } else {
        echo "<script>alert('Gagal Deny'); history.back();</script>";
        return;
    }
} else if ($op == "disposisi") {
    $id = isset($_GET['id']) ? $_GET['id'] : '';

    if (!$id) {
        echo '<script>history.back();</script>';
    }

    $sql = "UPDATE `m_surat` SET `status`=2 WHERE `id`=:id";
    $query = $conn->prepare($sql);
    $result = $query->execute([":id" => $id]);

    if ($result) {
        echo "<script>alert('Berhasil Disposisi'); history.back();</script>";
        return;
    } else {
        echo "<script>alert('Gagal Disposisi'); history.back();</script>";
        return;
    }
} else if ($op == "telaah") {
    $id = isset($_GET['id']) ? $_GET['id'] : '';

    if (!$id) {
        echo '<script>history.back();</script>';
    }

    $sql = "UPDATE `m_surat` SET `status`=3 WHERE `id`=:id";
    $query = $conn->prepare($sql);
    $result = $query->execute([":id" => $id]);

    if ($result) {
        echo "<script>alert('Berhasil Ditelaah'); history.back();</script>";
        return;
    } else {
        echo "<script>alert('Gagal Ditelaah'); history.back();</script>";
        return;
    }
} else if ($op == "sedangtelaah") {
    $id = isset($_POST['id']) ? $_POST['id'] : '';

    if (!$id) {
        echo '<script>history.back();</script>';
    }

    $selesai_tgl = isset($_POST['selesai_tgl']) ? $_POST['selesai_tgl'] : '';

    if (!$selesai_tgl) {
        echo '<script>history.back();</script>';
    }

    $formattedMulaiTgl = date("Y-m-d");
    $formattedSelesaiTgl = date("Y-m-d", strtotime($selesai_tgl));

    $telaah_id = isset($_POST['penelaah_id']) ? $_POST['penelaah_id'] : '';

    if (!$telaah_id) {
        echo '<script>history.back();</script>';
    }

    $sql = "UPDATE `m_surat` SET `status`=6, `ppkh_id`=:ppkh_id, `telaah_id`=:telaah_id, `mulai_tgl`=:mulai_tgl, `selesai_tgl`=:selesai_tgl WHERE `id`=:id";
    $query = $conn->prepare($sql);
    $result = $query->execute([":id" => $id, ":ppkh_id" => $_SESSION['user_id'], ":telaah_id" => $telaah_id, ":mulai_tgl" => $formattedMulaiTgl, ":selesai_tgl" => $formattedSelesaiTgl]);

    if ($result) {
        echo "<script>alert('Berhasil Ditelaah'); history.back();</script>";
        return;
    } else {
        echo "<script>alert('Gagal Ditelaah'); history.back();</script>";
        return;
    }
} else if ($op == "selesaitelaah") {
    $id = isset($_GET['id']) ? $_GET['id'] : '';

    if (!$id) {
        echo '<script>history.back();</script>';
    }

    $sql = "UPDATE `m_surat` SET `status`=7 WHERE `id`=:id";
    $query = $conn->prepare($sql);
    $result = $query->execute([":id" => $id]);

    if ($result) {
        echo "<script>alert('Berhasil Ditelaah'); history.back();</script>";
        return;
    } else {
        echo "<script>alert('Gagal Ditelaah'); history.back();</script>";
        return;
    }
} else if ($op == "sertifikat") {
    $id = isset($_GET['id']) ? $_GET['id'] : '';

    if (!$id) {
        echo '<script>history.back();</script>';
    }

    $sql = "UPDATE `m_surat` SET `status`=8 WHERE `id`=:id";
    $query = $conn->prepare($sql);
    $result = $query->execute([":id" => $id]);

    if ($result) {
        echo "<script>alert('Berhasil Disertifikat'); history.back();</script>";
        return;
    } else {
        echo "<script>alert('Gagal Disertifikat'); history.back();</script>";
        return;
    }
} else if ($op == "upload") {
    $file = $_FILES['berkas'];
    $target_dir = "../images/sertifikasi/";

    if (!is_dir($target_dir)) {
        mkdir($target_dir, 0777, true);
    }

    $target_file = $target_dir . basename($file["name"]);
    $fileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    if ($fileType != "pdf" && $fileType != "zip") {
        echo "Hanya file PDF dan ZIP yang diizinkan.";
        exit;
    }

    if (file_exists($target_file)) {
        echo "File sudah ada.";
        exit;
    }

    if ($file["size"] > 50000000) {
        echo "Ukuran file terlalu besar.";
        exit;
    }

    if (move_uploaded_file($file["tmp_name"], $target_file)) {
        // File berhasil diupload, lanjutkan dengan menyimpan informasi ke database

        // Mendapatkan informasi file yang diupload
        $file_name = basename($file["name"]);
        $file_location = $target_file;


        // Buat kueri SQL untuk menyimpan informasi ke database
        $sql = "INSERT INTO m_surat (berkas_serti) VALUES ('$file_location')";

        if ($conn->query($sql) === TRUE) {
            echo "Data file berhasil disimpan ke database.";
            // Arahkan ke halaman setelah upload dan penyimpanan berhasil
            header("Location: http://localhost/adm_silahan/view/m_surat/selesaitelaah.php");
            exit;
        } else {
            echo "Error: " . $sql . "<br>";
        }
    } else {
        echo "Terjadi kesalahan saat mengupload file.";
    }
} else if ($op == "upload_serti") {
    $file = $_FILES['berkas'];
    $target_dir = "../images/sertifikasi/";

    $id = isset($_POST['id']) ? $_POST['id'] : '';

    if (!$id) {
        echo '<script>history.back();</script>';
    }

    if (!is_dir($target_dir)) {
        mkdir($target_dir, 0777, true);
    }

    $target_file = $target_dir . basename($file["name"]);
    $fileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    if ($fileType != "pdf") {
        echo "<script>alert('Hanya PDF yang di izinkan.'); history.back();</script>";
        exit;
    }

    if (file_exists($target_file)) {
        echo "<script>alert('File sudah ada'); history.back();</script>";
        exit;
    }

    if ($file["size"] > 50000000) {
        echo "<script>alert('Ukuran file terlalu besar.'); history.back();</script>";
        exit;
    }

    if (move_uploaded_file($file["tmp_name"], $target_file)) {
        $file_name = basename($file["name"]);
        $file_location = $target_file;

        $sql = $conn->prepare("UPDATE `m_surat` SET `berkas_serti`=:berkas WHERE `id`=:id");

        if ($sql->execute([":berkas" => basename($file['name']), ":id" => $id])) {
            echo "<script>alert('Berhasil di upload'); history.back();</script>";
            exit;
        } else {
            echo "<script>alert('Gagal di upload'); history.back();</script>";
            exit();
        }
    } else {
        echo "<script>alert('Gagal di upload'); history.back();</script>";
    }
} else if ($op == "add_user_tembusan") {
    try {
        $surat_id = $_POST['id'];

        $cari_user_sebelumnya = \Models\Tembusan::where('surat_id', $surat_id)->where('user_id', $_SESSION['user_id'])->first();

        if ($cari_user_sebelumnya) {
            echo "<script>alert('User tembusan sudah ada sebelumnya!'); history.back();</script>";
            return;
        }

        $create = \Models\Tembusan::create([
            'surat_id' => $surat_id,
            'user_id' => $_SESSION['user_id']
        ]);

        if ($create) {
            echo "<script>alert('Berhasil menambahkan user tembusan'); history.back();</script>";
            return;
        } else {
            echo "<script>alert('Gagal ketika memasukan data'); history.back();</script>";
            return;
        }
    } catch (Exception $e) {
        echo "<script>alert('Internal server error')</script>";
    }
}