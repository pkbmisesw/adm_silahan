<?php

include 'config.php';

if (isset($_POST['reset'])) {
    // echo "ini adalah reset";
    $password1 = $_POST['password1'];
    $password2 = $_POST['password2'];

    if ($password1 !== $password2) {
        header('Location: verify-reset-password.php?error=Password tidak sama&token=' . $_GET['token']);
        exit();
    }

    $token = $conn->prepare("SELECT * FROM verify_code WHERE token = :token AND `type` = 'reset_password' LIMIT 1");
    $token->bindParam(':token', $_GET['token']);
    $token->execute();
    $my_token = $token->fetch();

    if (!$my_token['email']) {
        header('Location: verify-reset-password.php?error=Token invalid&token=' . $_GET['token']);
        exit();
    }

    $pass = password_hash($password1, PASSWORD_BCRYPT);

    $user_update = $conn->prepare("UPDATE `m_user` SET `password`= :password_new WHERE email = :email");
    $user_update->bindParam(':password_new', $pass);
    $user_update->bindParam(':email', $my_token['email']);
    $user_update->execute();

    $token_delete = $conn->prepare('DELETE FROM `verify_code` WHERE token = :token');
    $token_delete->execute([
        ':token' => $_GET['token']
    ]);
    header("Location: index.php?success=Reset password success");
}

if (!isset($_GET['token'])) {
    echo "<script> alert('token is required') </script>";
    return;
}

$token = $conn->prepare("SELECT * FROM verify_code WHERE token = :token AND `type` = 'reset_password' LIMIT 1");

$token->bindParam(':token', $_GET['token']);

$token->execute();

$data = $token->fetch();

$email_verif = $data['email'];

if (!$email_verif) {
    echo "<script> alert('Token invalid')</script>";
    exit();
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
                        <form class="form-horizontal mt-3" action="" method="post" autocomplete="off">

                            <?php if ($_GET['error']) { ?>
                                <div class="alert alert-danger" role="alert">
                                    <?= $_GET['error'] ?>
                                </div>
                            <?php } ?>

                            <div class="form-group mb-3 row">
                                <div class="col-12">
                                    <input class="form-control" type="password" required="" placeholder="Password"
                                        name="password1">
                                </div>
                            </div>

                            <div class="form-group mb-3 row">
                                <div class="col-12">
                                    <input class="form-control" type="password" required=""
                                        placeholder="Confirmation Password" name="password2">
                                </div>
                            </div>

                            <div class="form-group mb-3 text-center row mt-3 pt-1">
                                <div class="col-12">
                                    <button class="btn btn-warning w-100 waves-effect waves-light" name="reset"
                                        type="submit">Reset</button>
                                </div>
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

    <!-- Modal Register -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel">Daftar Institusi</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="register.php" method="post" class="user" enctype="multipart/form-data">
                        <div class="form-label-group">
                            <input type="checkbox" name="checkbox" id="checkbox_pribadi">
                            <label for="checkbox_pribadi"> Daftar Sebagai Pribadi</label><br>
                        </div>

                        <div class="form-label-group">
                            <label>Nama Institusi :</label>
                            <input type="text" id="nama_institusi" name="nama_institusi" class="form-control"
                                placeholder="Nama Institusi" required autofocus>
                        </div>

                        <!-- <div class="form-label-group">
                        <label>Deskripsi Institusi :</label> -->
                        <input type="hidden" name="deskripsi_institusi" class="form-control"
                            placeholder="Deskripsi Institusi" required autofocus>
                        <!-- </div> -->

                        <div class="form-label-group">
                            <label>Alamat Institusi :</label>
                            <input type="text" id="alamat_institusi" name="alamat_institusi" class="form-control"
                                placeholder="Alamat Institusi" required autofocus>
                        </div>

                        <!-- <div class="form-label-group">
                        <label>Telp Institusi :</label> -->
                        <input type="hidden" name="telp_institusi" class="form-control" placeholder="Telp Institusi"
                            required autofocus>
                        <!-- </div> -->

                        <div class="form-label-group">
                            <label>Nama Narahubung :</label>
                            <input type="text" name="nama" class="form-control" placeholder="Nama Lengkap" required
                                autofocus>
                        </div>

                        <div class="form-label-group">
                            <label>Nomor HP / WA Narahubung :</label>
                            <input type="text" name="hp" class="form-control" placeholder="085200000000" required>
                            <small style="color:red;">* isi dimulai dari 0852000000</small>
                        </div>

                        <!-- <div class="form-label-group">
                        <label>Jenis Kelamin :</label>
                        <select class="form-control" id="gender" name="gender" required>
                            <option value="1">Laki-laki</option>
                            <option value="2">Perempuan</option>
                        </select>
                    </div> -->
                        <input type="hidden" name="gender" class="form-control">

                        <div class="form-label-group">
                            <label>Email :</label>
                            <input type="email" name="email" class="form-control" placeholder="Email address" required>
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
    <!-- End of Modal Register -->

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