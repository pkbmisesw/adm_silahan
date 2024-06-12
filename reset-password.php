<?php
error_reporting(0);
include 'config.php';
include './helpers/uuid.php';
include './services/mailer.php';

if (!isset($_SESSION['email']) == 0) {
    header('Location: view/admin/');
}

if (isset($_POST['reset'])) {
    $email = $_POST['email'];

    try {
        //$sql = "SELECT * FROM users WHERE name = :name AND password = :password";
        $sql = "SELECT * FROM m_user WHERE email = :email LIMIT 1";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':email', $email);
        //$stmt->bindParam(':password', $password);
        $stmt->execute();

        $row = $stmt->fetch();
        $uuid = gen_uuid();

        if ($row['email']) {
            $myfile = fopen("./view/reset_password.template", "r") or die("Unable to open file!");
            $html_template = fread($myfile, filesize('./view/reset_password.template'));
            $html_template = str_replace('::link_reset::', "$url_web/verify-reset-password.php?token=$uuid", $html_template);
            // send_email("Verify Account", $email, $name, 'ADM Silahan', $html_template);
            send_email("Reset Password - Silahan Kawan", $email, $row['nama'], 'ADM Silahan', $html_template);
            fclose($myfile);

            $token = $conn->prepare("INSERT INTO verify_code (
                `token`,
                `email`,
                `type`
                )
                VALUES (
                    :token, 
                    :email,
                    'reset_password');");

            $token->bindParam(':token', $uuid);
            $token->bindParam(':email', $email);
            if (!$token->execute()) {
                echo "<script>alert('Error database');</script>";
                return;
            }
            header("Location: reset-password.php?success=Link verifikasi berhasil di kirim via email");
        } else {
            header("Location: reset-password.php?error=Email tidak ditemukan");
        }

        die();
        $hash_password = $row['password'];
        if (password_verify($password, $hash_password)) {
            $count = $stmt->rowCount();
            if ($count == 1) {
                $_SESSION['email'] = $email;
                $_SESSION['nama'] = $row['nama'];
                $_SESSION['gambar'] = $row['gambar'];
                $_SESSION['password'] = $row['password'];
                $_SESSION['user_id'] = $row['id'];
                $_SESSION['level_id'] = $row['level_id'];
                header("Location: view/admin/");
                return;
            } else {
                echo "<div class='notif'>Silahkan Lengkapi Data !</div>";
            }
        }
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
}

?>

<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8" />
    <title>SI-Lahan Kawana</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesdesign" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.png">

    <!-- Bootstrap Css -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

</head>

<body class="auth-body-bg">
    <div class="bg-overlay"></div>
    <div class="wrapper-page">
        <div class="container-fluid p-0">
            <div class="card">
                <div class="card-body">

                    <div class="text-center mt-4">
                        <div class="mb-3">
                            <a href="index.html" class="auth-logo">
                                <img src="assets/images/logo-dark.png?p=3" height="30" class="logo-dark mx-auto" alt="">
                                <img src="assets/images/logo-light.png?p=4" height="30" class="logo-light mx-auto"
                                    alt="">
                            </a>
                        </div>
                    </div>

                    <h4 class="text-muted text-center font-size-18"><b>Reset Password</b></h4>

                    <div class="p-3">
                        <form class="form-horizontal mt-3" action="" method="post">

                            <?php if ($_GET['error']) { ?>
                                <div class="alert alert-danger" role="alert">
                                    <?= $_GET['error'] ?>
                                </div>
                            <?php } ?>

                            <?php if ($_GET['success']) { ?>
                                <div class="alert alert-success" role="alert">
                                    <?= $_GET['success'] ?>
                                </div>
                            <?php } ?>
                            <div class="form-group mb-3 row">
                                <div class="col-12">
                                    <input class="form-control" type="text" required="" placeholder="Email"
                                        name="email">
                                </div>
                            </div>

                            <div class="form-group mb-3 text-center row mt-3 pt-1">
                                <div class="col-12">
                                    <button class="btn btn-warning w-100 waves-effect waves-light" name="reset"
                                        type="submit">Reset</button>
                                </div>

                            </div>

                            <div class="form-group mb-0 row mt-2">
                                <!-- <div class="col-sm-7 mt-3">
                                <a href="auth-recoverpw.html" class="text-muted"><i class="mdi mdi-lock"></i> Forgot your password?</a>
                            </div> -->

                            </div>
                        </form>
                    </div>
                    <!-- end -->
                    <p>Versi 1.1.0</p>
                </div>
                <!-- end cardbody -->

            </div>
            <!-- end card -->
        </div>
        <!-- end container -->
    </div>
    <!-- end -->

    <!-- Modal Register Penelaah -->
    <div class="modal fade" id="modalRegisterPenelaah" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel">Daftar Penelaah</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="register.php?op=penelaah" method="post" class="user" enctype="multipart/form-data">
                        <div class="form-label-group">
                            <label>Nama Lengkap :</label>
                            <input type="text" name="nama" class="form-control" placeholder="Nama Lengkap" required
                                autofocus>
                        </div>

                        <div class="form-label-group">
                            <label>Email :</label>
                            <input type="email" name="email" class="form-control" placeholder="Email Address" required>
                        </div>

                        <div class="form-label-group">
                            <label>Password :</label>
                            <input type="password" name="password" class="form-control" placeholder="Password" required>
                        </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light waves-effect" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary waves-effect waves-light" name="daftar">Save
                        changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- JAVASCRIPT -->
    <script src="assets/libs/jquery/jquery.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#checkbox_pribadi").on("change", function () {
                const namaInstitusi = $("#nama_institusi");
                const alamatInstitusi = $("#alamat_institusi");
                if ($(this).prop("checked") === true) {

                    namaInstitusi.removeAttr("required");
                    alamatInstitusi.removeAttr("required");

                    namaInstitusi.prop("disabled", true)
                    alamatInstitusi.prop("disabled", true)
                }
                else {
                    namaInstitusi.prop("required", true);
                    alamatInstitusi.prop("required", true);

                    namaInstitusi.prop("disabled", false)
                    alamatInstitusi.prop("disabled", false)
                }
            });
        });
    </script>

    <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/libs/metismenu/metisMenu.min.js"></script>
    <script src="assets/libs/simplebar/simplebar.min.js"></script>
    <script src="assets/libs/node-waves/waves.min.js"></script>

    <script src="assets/js/app.js"></script>

</body>

</html>