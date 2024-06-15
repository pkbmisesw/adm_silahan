<?php
session_start();
error_reporting(0);

include ('../../config.php');

if (isset($_SESSION['email']) == 0) {
    header('Location: ../../index.php');
}

if (!($_SESSION['level_id'] == "1" || $_SESSION['level_id'] == 2 || $_SESSION['level_id'] == 3)) {
    echo "<script>alert('Maaf! anda tidak bisa mengakses halaman ini '); document.location.href='../admin/'</script>";
}

// if (!($_SESSION['level_id'] == "1" || $_SESSION['level_id'] == 2 || $_SESSION['level_id'] == 3 || $_SESSION['level_id'] == 5)) {
//     echo "<script>alert('Maaf! anda tidak bisa mengakses halaman ini '); document.location.href='../admin/'</script>";
// }

$master = "Pengguna";
$dba = "pengguna";
$ket = "";
$ketnama = "Silahkan mengisi nama";
?>

<?php
$title = "Silahan Kawan | Operator";
include ('../head_table.php');
?>

<body data-topbar="dark">

    <!-- <body data-layout="horizontal" data-topbar="dark"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">


        <?php
        include ('../header.php');
        ?>

        <?php
        include ('../sidebar.php');
        ?>



        <!-- ============================================================== -->
        <!-- Start right Content here -->
        <!-- ============================================================== -->
        <div class="main-content">

            <div class="page-content">
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">Data <?= $master; ?></h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Master
                                                <?= $master; ?></a></li>
                                        <li class="breadcrumb-item active">Semua <?= $master; ?></li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">

                                    <h4 class="card-title">Data <?= $master; ?></h4>

                                    <table id="datatable" class="table table-bordered dt-responsive nowrap"
                                        style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Nama</th>
                                                <th>Email</th>
                                                <th>Nomer HP</th>
                                                <th>Role ID</th>
                                                <th>Status Aktif</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>


                                        <tbody>
                                            <?php
                                            $count = 1;

                                            $sql = $conn->prepare("SELECT * FROM `m_user` WHERE level_id=3 ORDER BY id DESC");
                                            $sql->execute();
                                            while ($data = $sql->fetch()) {
                                                ?>
                                                <tr>
                                                    <td><?php echo $count; ?></td>
                                                    <td><?php echo $data['nama']; ?></td>
                                                    <td><?php echo $data['email']; ?></td>
                                                    <td><?php echo $data['hp']; ?></td>
                                                    <td>
                                                        <?php
                                                        if ($data['level_id'] == 1) {
                                                            echo "Super Admin";
                                                        } else if ($data['level_id'] == 2) {
                                                            echo "Admin";
                                                        } elseif ($data['level_id'] == 3) {
                                                            echo "Operator";
                                                        } elseif ($data['level_id'] == 4) {
                                                            echo "Pimpinan";
                                                        } elseif ($data['level_id'] == 5) {
                                                            echo "Pemohon";
                                                        } elseif ($data['level_id'] == 6) {
                                                            echo "Penelaah";
                                                        } elseif ($data['level_id'] == 0) {
                                                            echo "Non Jabatan";
                                                        }
                                                        //echo $data['level_id']; 
                                                        ?>

                                                    </td>
                                                    <td>

                                                        <?php

                                                        if ($data['status_aktif'] == 0) {
                                                            echo "Tidak Aktif";
                                                        } elseif ($data['status_aktif'] == 1) {
                                                            echo "Aktif";
                                                        }
                                                        //echo $data['status_aktif']; 
                                                    
                                                        ?>

                                                    </td>
                                                    <td>
                                                        <button data-id="<?= $data['id'] ?>" data-nama="<?= $data['nama'] ?>"
                                                            data-email="<?= $data['email'] ?>" data-hp="<?= $data['hp'] ?>"
                                                            data-role_id="<?= $data['level_id'] ?>"
                                                            data-is_active="<?= $data['status_aktif'] ?>" type="button"
                                                            class="btn btn-light btn_update" data-toggle="modal">✎</button>
                                                            <?php if ($_SESSION['level_id'] == 1) { ?>
                                                            <a class="btn btn-danger"
                                                            href="../../controller/<?php echo $dba; ?>_controller.php?op=hapus&id=<?php echo $data['id'] ?>"
                                                            onclick="return confirm('Apakah anda yakin ingin menghapus data ini?');">X</a>
                                                            <?php } ?>
                                                    </td>
                                                </tr>
                                                <?php $count++;
                                            } ?>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div> <!-- end col -->
                    </div> <!-- end row -->

                </div> <!-- container-fluid -->
            </div>
            <!-- End Page-content -->

            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <script>document.write(new Date().getFullYear())</script> © Upcube.
                        </div>
                        <div class="col-sm-6">
                            <div class="text-sm-end d-none d-sm-block">
                                Crafted with <i class="mdi mdi-heart text-danger"></i> by Themesdesign
                            </div>
                        </div>
                    </div>
                </div>
            </footer>

        </div>
        <!-- end main content-->

    </div>
    <!-- END layout-wrapper -->

    <!-- Right Sidebar -->
    <div class="right-bar">
        <div data-simplebar class="h-100">
            <div class="rightbar-title d-flex align-items-center px-3 py-4">

                <h5 class="m-0 me-2">Settings</h5>

                <a href="javascript:void(0);" class="right-bar-toggle ms-auto">
                    <i class="mdi mdi-close noti-icon"></i>
                </a>
            </div>

            <!-- Settings -->
            <hr class="mt-0" />
            <h6 class="text-center mb-0">Choose Layouts</h6>

            <div class="p-4">
                <div class="mb-2">
                    <img src="assets/images/layouts/layout-1.jpg" class="img-fluid img-thumbnail" alt="layout-1">
                </div>

                <div class="form-check form-switch mb-3">
                    <input class="form-check-input theme-choice" type="checkbox" id="light-mode-switch" checked>
                    <label class="form-check-label" for="light-mode-switch">Light Mode</label>
                </div>

                <div class="mb-2">
                    <img src="assets/images/layouts/layout-2.jpg" class="img-fluid img-thumbnail" alt="layout-2">
                </div>
                <div class="form-check form-switch mb-3">
                    <input class="form-check-input theme-choice" type="checkbox" id="dark-mode-switch"
                        data-bsStyle="assets/css/bootstrap-dark.min.css" data-appStyle="assets/css/app-dark.min.css">
                    <label class="form-check-label" for="dark-mode-switch">Dark Mode</label>
                </div>

                <div class="mb-2">
                    <img src="assets/images/layouts/layout-3.jpg" class="img-fluid img-thumbnail" alt="layout-3">
                </div>
                <div class="form-check form-switch mb-5">
                    <input class="form-check-input theme-choice" type="checkbox" id="rtl-mode-switch"
                        data-appStyle="assets/css/app-rtl.min.css">
                    <label class="form-check-label" for="rtl-mode-switch">RTL Mode</label>
                </div>


            </div>

        </div> <!-- end slimscroll-menu-->
    </div>
    <!-- /Right-bar -->

    <!-- Right bar overlay-->
    <div class="rightbar-overlay"></div>

    <?php
    include ('../footer_table.php')
        ?>

    <!-- Modal Edit -->
    <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Edit </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="form-edit-transaksi-masuk">

                    <div class="modal-body">
                        <div class="form-group">
                            <input type="hidden" id="id_edit" name="id" />

                            <div class="form-group">
                                <label class="control-label">Nama : </label>
                                <input type="text" class="form-control" id="nama_edit" name="nama" />
                            </div>

                            <div class="form-group">
                                <label class="control-label">Email : </label>
                                <input type="text" class="form-control" id="email_edit" name="email" />
                            </div>

                            <div class="form-group">
                                <label class="control-label">HP : </label>
                                <input type="text" class="form-control" id="hp_edit" name="hp" />
                            </div>

                            <div class="form-group">
                                <label class="control-label">Role ID : </label>
                                <input type="text" class="form-control" id="role_id_edit" name="role_id" />
                            </div>

                            <div class="form-group">
                                <label class="control-label">Status Aktif : </label>
                                <input type="text" class="form-control" id="is_active_edit" name="is_active" />
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="btn-save-update">Save changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <script type="text/javascript">
        $(document).ready(function () {

            $('#btn-save-update').click(function () {
                $.ajax({
                    url: "edit.php",
                    type: 'post',
                    data: $('#form-edit-transaksi-masuk').serialize(),
                    success: function (data) {
                        var res = JSON.parse(data);
                        if (res.code == 200) {
                            alert('Success Update');
                            location.reload();
                        }
                    }
                })
            });

            $(document).on('click', '.btn_update', function () {
                console.log("Masuk");
                $("#id_edit").val($(this).attr('data-id'));
                $("#nama_edit").val($(this).attr('data-nama'));
                $("#email_edit").val($(this).attr('data-email'));
                $("#hp_edit").val($(this).attr('data-hp'));
                $("#role_id_edit").val($(this).attr('data-role_id'));
                $("#is_active_edit").val($(this).attr('data-is_active'));
                $('#edit').modal('show');
            });
        });

        $(document).ready(function () {
            $('#tambah').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus');
            });

            $('#edit').on('shown.bs.modal', function () {
                $('#nama_edit').trigger('focus');
            });


        });
    </script>