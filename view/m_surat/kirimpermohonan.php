<?php
session_start();
error_reporting(0);

include('../../config.php');

if (isset($_SESSION['email']) == 0) {
    header('Location: ../../index.php');
}

if (!($_SESSION['level_id'] == "1" || $_SESSION['level_id'] == 3 || $_SESSION['level_id'] == 5)) {
    echo "<script>alert('Maaf! anda tidak bisa mengakses halaman ini '); document.location.href='../admin/'</script>";
}

$master = "Surat";
$dba = "surat";
$ket = "";
$ketnama = "Silahkan mengisi nama";
?>

<?php
$title = "Silahan Kawan | Kirim Permohonan";include('../head_table.php');
?>

<body data-topbar="dark">

    <!-- <body data-layout="horizontal" data-topbar="dark"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">


        <?php
        include('../header.php');
        ?>

        <?php
        include('../sidebar.php');
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
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Master <?= $master; ?></a></li>
                                        <li class="breadcrumb-item active"><?= $master; ?> Keseluruhan</li>
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

                                    <h4 class="card-title">Form <?= $master; ?> Permohonan</h4>
                                    <form action="../../controller/<?php echo $dba; ?>_controller.php?op=tambah" method="post" enctype="multipart/form-data">
                                        <div class="form-body">

                                            <div class="form-group">
                                                <label class="control-label">Title Surat : </label>
                                                <input type="text" class="form-control" name="nama" placeholder="Silahkan Mengisi Title Surat" />
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label">Deskripsi Berkas : </label>
                                                <input type="text" class="form-control" name="des" placeholder="Silahkan Mengisi Deskripsi Berkas" />
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label">Berkas : </label>
                                                <input type="file" class="form-control" id="berkas_tambah" name="berkas" required />
                                                <small class="text-danger">Hanya dapat upload file .pdf dan .zip dengan size maksimal 50mb.</small>
                                                <progress id="progressBar_tambah" value="0" max="100" style="width:100%;"></progress>
                                                <small id="uploadStatus_tambah"></small>
                                            </div>


                                        </div>
                                        <div class="modal-footer">
                                            <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
                                            <a href="index.php" class="btn btn-secondary" >Kembali</a>
                                            <button name="upload" type="submit" class="btn btn-primary">Kirim Permohonan</button>
                                        </div>
                                    </form>

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
                            <script>
                                document.write(new Date().getFullYear())
                            </script> © Upcube.
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
                    <input class="form-check-input theme-choice" type="checkbox" id="dark-mode-switch" data-bsStyle="assets/css/bootstrap-dark.min.css" data-appStyle="assets/css/app-dark.min.css">
                    <label class="form-check-label" for="dark-mode-switch">Dark Mode</label>
                </div>

                <div class="mb-2">
                    <img src="assets/images/layouts/layout-3.jpg" class="img-fluid img-thumbnail" alt="layout-3">
                </div>
                <div class="form-check form-switch mb-5">
                    <input class="form-check-input theme-choice" type="checkbox" id="rtl-mode-switch" data-appStyle="assets/css/app-rtl.min.css">
                    <label class="form-check-label" for="rtl-mode-switch">RTL Mode</label>
                </div>


            </div>

        </div> <!-- end slimscroll-menu-->
    </div>
    <!-- /Right-bar -->

    <!-- Right bar overlay-->
    <div class="rightbar-overlay"></div>

    <?php
    include('../footer_table.php')
    ?>




    <script type="text/javascript">
        $(document).ready(function() {

            $('#btn-save-update').click(function() {
                $.ajax({
                    url: "edit.php",
                    type: 'post',
                    data: $('#form-edit-transaksi-masuk').serialize(),
                    success: function(data) {
                        var res = JSON.parse(data);
                        if (res.code == 200) {
                            alert('Success Update');
                            location.reload();
                        }
                    }
                })
            });

            $('#btn-save-update-operator').click(function() {
                $.ajax({
                    url: "edit_operator.php",
                    type: 'post',
                    data: $('#form-edit-transaksi-masuk').serialize(),
                    success: function(data) {
                        var res = JSON.parse(data);
                        if (res.code == 200) {
                            alert('Success Update');
                            location.reload();
                        }
                    }
                })
            });

            $("#berkas_edit").on('change', function({
                target
            }) {
                const file = target.files[0];

                const formdata = new FormData();
                formdata.append("berkas", file);

                const reader = new FileReader();

                function progressHandler(event) {
                    if (event.lengthComputable) {
                        let percentComplete = (event.loaded / event.total) * 100;
                        $("#progressBar_edit").val(percentComplete);
                        $("#uploadStatus_edit").html(percentComplete + "%");
                    }
                }

                reader.onprogress = progressHandler;
                reader.readAsArrayBuffer(file);
            });

            $("#berkas_tambah").on('change', function({
                target
            }) {
                const file = target.files[0];

                const formdata = new FormData();
                formdata.append("berkas", file);

                const reader = new FileReader();

                function progressHandler(event) {
                    if (event.lengthComputable) {
                        let percentComplete = (event.loaded / event.total) * 100;
                        $("#progressBar_tambah").val(percentComplete);
                        $("#uploadStatus_tambah").html(percentComplete + "%");
                    }
                }

                reader.onprogress = progressHandler;
                reader.readAsArrayBuffer(file);
            });

            $(document).on('click', '.btn_update', function() {
                $("#id_edit").val($(this).attr('data-id'));
                $("#nama_edit").val($(this).attr('data-nama'));
                $("#des_edit").val($(this).attr('data-des'));
                $('#edit').modal('show');
            });

            $(document).on('click', '.btn_update_operator', function() {
                $("#id_edit").val($(this).attr('data-id'));
                $("#note_edit").val($(this).attr('data-note'));
                $('#edit_operator').modal('show');
            });
        });

        $(document).ready(function() {
            $('#tambah').on('shown.bs.modal', function() {
                $('#myInput').trigger('focus');
            });

            $('#edit').on('shown.bs.modal', function() {
                $('#nama_edit').trigger('focus');
            });


        });
    </script>