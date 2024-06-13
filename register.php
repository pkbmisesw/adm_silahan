<?php
include 'config.php';
include './helpers/uuid.php';
include './services/mailer.php';
// create a new object

if (isset($_POST['daftar'])) {
    $op = $_GET['op'];
    $uuid = gen_uuid();
    if ($op == "penelaah") {
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

            $token = $conn->prepare("INSERT INTO verify_code (
                token,
                email 
                )
                VALUES (
                    :token, 
                    :email);");

            $token->bindParam(':token', $uuid);
            $token->bindParam(':email', $email);

            // send_email("Verify Account", $email, $name, 'ADM Silahan', "<html> Verify account: <a href='$url_web/verify_acoount.php?token=$uuid'>$url_web/verify_acoount.php?token=$uuid</a> </html> ");
            // $myfile = fopen("./view/verify_email.template", "r") or die("Unable to open file!");
            // send_email("Verify Account", $email, $name, 'ADM Silahan', fread($myfile, filesize('./view/verify_email.template')));
            $myfile = fopen("./view/verify_email.template", "r") or die("Unable to open file!");
            $html_template = fread($myfile, filesize('./view/verify_email.template'));
            $html_template = str_replace('::dashboard_url::', "$url_web/verify_acoount.php?token=$uuid", $html_template);
            $html_template = str_replace('::name::', $name, $html_template);
            $html_template = str_replace('::email::', $email, $html_template);
            $html_template = str_replace('::password::', $_POST['password'], $html_template);
            send_email("Verify Account", $email, $name, 'ADM Silahan', $html_template);
            fclose($myfile);
            if ($stmt->execute() && $token->execute()) {
                echo '<script>alert("Berhasil Buat Akun. Silahkan cek email untuk verifikasi akun")</script>';
                //redirect to another page
                echo '<script>window.location.replace("index.php")</script>';
                return;
            } else {
                echo '<script>alert("Gagal buat akun")</script>';
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

                $token = $conn->prepare("INSERT INTO verify_code (
                    token,
                    email 
                    )
                    VALUES (
                        :token, 
                        :email);");

                $token->bindParam(':token', $uuid);
                $token->bindParam(':email', $email);

                // send_email("Verify Account", $email, $name, 'ADM Silahan', "<html> Verify account: <a href='$url_web/verify_acoount.php?token=$uuid'>$url_web/verify_acoount.php?token=$uuid</a> </html> ");
                $myfile = fopen("./view/verify_email.template", "r") or die("Unable to open file!");
                $html_template = fread($myfile, filesize('./view/verify_email.template'));
                $html_template = str_replace('::dashboard_url::', "$url_web/verify_acoount.php?token=$uuid", $html_template);
                $html_template = str_replace('::name::', $name, $html_template);
                $html_template = str_replace('::email::', $email, $html_template);
                $html_template = str_replace('::password::', $_POST['password'], $html_template);
                send_email("Verify Account", $email, $name, 'ADM Silahan', $html_template);
                fclose($myfile);

                if ($stmt->execute() && $token->execute()) {
                    echo '<script>alert("Berhasil Buat Akun. Silahkan cek email untuk verifikasi akun")</script>';
                    //redirect to another page
                    echo '<script>window.location.replace("index.php")</script>';
                    return;
                } else {
                    echo '<script>alert("Gagal buat Akun")</script>';
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

                $token = $conn->prepare("INSERT INTO verify_code (
                    token,
                    email 
                    )
                    VALUES (
                        :token, 
                        :email);");

                $token->bindParam(':token', $uuid);
                $token->bindParam(':email', $email);

                // send_email("Verify Account", $email, $name, 'ADM Silahan', "<html> Verify account: <a href='$url_web/verify_acoount.php?token=$uuid'>$url_web/verify_acoount.php?token=$uuid</a> </html> ");
                $myfile = fopen("./view/verify_email.template", "r") or die("Unable to open file!");
                $html_template = fread($myfile, filesize('./view/verify_email.template'));
                $html_template = str_replace('::dashboard_url::', "$url_web/verify_acoount.php?token=$uuid", $html_template);
                $html_template = str_replace('::name::', $name, $html_template);
                $html_template = str_replace('::email::', $email, $html_template);
                $html_template = str_replace('::password::', $_POST['password'], $html_template);
                send_email("Verify Account", $email, $name, 'ADM Silahan', $html_template);
                fclose($myfile);

                $token->execute();

                if ($stmt->execute()) {
                    $userId = $conn->lastInsertId();

                    $queryPerusahaan = $conn->prepare("insert into m_kantor (user_id, nama, alamat) values (:user_id, :nama, :alamat)");
                    $queryPerusahaan->bindParam(":user_id", $userId);
                    $queryPerusahaan->bindParam(":nama", $nama_institusi);
                    $queryPerusahaan->bindParam(":alamat", $alamat_institusi);

                    if ($queryPerusahaan->execute()) {
                        echo '<script>alert("Berhasil Buat Akun. Silahkan cek email untuk verifikasi akun")</script>';
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