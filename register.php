<?php
include 'config.php';


if (isset($_POST['daftar'])) {
    $op = $_GET['op'];
    if($op == "penelaah"){
        $name = $_POST['nama'];
        $email = $_POST['email'];
        $role_id = 6;

        $is_active = 0;
        $pass = $_POST['password'];
        $pass = password_hash($pass, PASSWORD_BCRYPT);
        $sql = "SELECT COUNT(email) AS num FROM m_user WHERE email = :email";
        $stmt = $conn->prepare($sql);

        $stmt->bindValue(':email', $email);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row['num'] > 0) {
            echo "<script>alert('Email Sudah ada'); window.document.location.href='index';</script>";
        } else {
            $stmt = $conn->prepare("INSERT INTO m_user (
                    nama, 
                    email, 
                    password, 
                    level_id, 
                    status_aktif
                    )
                    VALUES (
                        :name, 
                        :email, 
                        :password,
                        :level_id, 
                        :status_aktif
                        );");

            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':password', $pass);
            $stmt->bindParam(':level_id', $role_id);
            $stmt->bindParam(':status_aktif', $is_active);

            if ($stmt->execute()) {
                echo '<script>alert("Berhasil Buat Akun")</script>';
                //redirect to another page
                echo '<script>window.location.replace("index.php")</script>';
                return;
            } else {
                echo '<script>alert("Berhasil Buat Akun")</script>';
                echo '<script>window.location.replace("index.php")</script>';
                return;
            }
        }
    } else {
        $checkbox = isset($_POST['checkbox']) ? $_POST['checkbox'] : '';

        $name = $_POST['nama'];
        $hp = $_POST['hp'];
        $email = $_POST['email'];

        if ($checkbox == "on") {
            $role_id = 5;

            $is_active = 0;
            $pass = $_POST['password'];
            $pass = password_hash($pass, PASSWORD_BCRYPT);

            $sql = "SELECT COUNT(email) AS num FROM m_user WHERE email = :email";
            $stmt = $conn->prepare($sql);

            $stmt->bindValue(':email', $email);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($row['num'] > 0) {
                echo "<script>alert('Email Sudah ada'); window.document.location.href='index';</script>";
            } else {
                $stmt = $conn->prepare("INSERT INTO m_user (
                    nama, 
                    hp, 
                    email, 
                    password, 
                    level_id, 
                    status_aktif
                    )
                    VALUES (
                        :name, 
                        :hp,
                        :email, 
                        :password,
                        :level_id, 
                        :status_aktif
                        );");

                $stmt->bindParam(':name', $name);
                $stmt->bindParam(':hp', $hp);
                $stmt->bindParam(':email', $email);
                $stmt->bindParam(':password', $pass);
                $stmt->bindParam(':level_id', $role_id);
                $stmt->bindParam(':status_aktif', $is_active);

                if ($stmt->execute()) {
                    echo '<script>alert("Berhasil Buat Akun")</script>';
                    //redirect to another page
                    echo '<script>window.location.replace("index.php")</script>';
                    return;
                } else {
                    echo '<script>alert("Berhasil Buat Akun")</script>';
                    echo '<script>window.location.replace("index.php")</script>';
                    return;
                }
            }
        } else {
            $nama_institusi = $_POST['nama_institusi'];
            $alamat_institusi = $_POST['alamat_institusi'];

            $role_id = 5;
            $is_active = 0;
            $pass = $_POST['password'];
            $pass = password_hash($pass, PASSWORD_BCRYPT);

            $sql = "SELECT COUNT(email) AS num FROM m_user WHERE email = :email";
            $stmt = $conn->prepare($sql);

            $stmt->bindValue(':email', $email);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($row['num'] > 0) {
                echo "<script>alert('Email Sudah ada'); window.document.location.href='index';</script>";
            } else {
                $stmt = $conn->prepare("INSERT INTO m_user (
                    nama, 
                    hp, 
                    email, 
                    password, 
                    level_id, 
                    status_aktif
                    )
                    VALUES (
                        :name, 
                        :hp,
                        :email, 
                        :password,
                        :level_id, 
                        :status_aktif
                        );");

                $stmt->bindParam(':name', $name);
                $stmt->bindParam(':hp', $hp);
                $stmt->bindParam(':email', $email);
                $stmt->bindParam(':password', $pass);
                $stmt->bindParam(':level_id', $role_id);
                $stmt->bindParam(':status_aktif', $is_active);

                if ($stmt->execute()) {
                    $userId = $conn->lastInsertId();

                    $queryPerusahaan = $conn->prepare("insert into m_kantor (user_id, nama, alamat) values (:user_id, :nama, :alamat)");
                    $queryPerusahaan->bindParam(":user_id", $userId);
                    $queryPerusahaan->bindParam(":nama", $nama_institusi);
                    $queryPerusahaan->bindParam(":alamat", $alamat_institusi);

                    if ($queryPerusahaan->execute()) {
                        echo '<script>alert("Berhasil Buat Akun")</script>';
                        //redirect to another page
                        echo '<script>window.location.replace("index.php")</script>';
                        return;
                    }

                    echo '<script>alert("Gagal membuat akun")</script>';
                    //redirect to another page
                    echo '<script>window.location.replace("index.php")</script>';

                } else {
                    echo '<script>alert("An error occurred")</script>';
                }
            }
        }
    }
}
?>