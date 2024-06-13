<?php
session_start();
error_reporting(0);

include('../../config.php');

if(isset($_SESSION['email'])== 0) {
    header('Location: ../../index.php');
}

if(!($_SESSION['level_id'] == "1" || $_SESSION['level_id'] == 5)){
    echo "<script>alert('Maaf! anda tidak bisa mengakses halaman ini '); document.location.href='../admin/'</script>";
}

$master = "Surat";
$dba = "surat";
$ket = "";
$ketnama = "Silahkan mengisi nama";
?>

<?php
$title = "Silahan Kawan | Surat Selesai";include('../head_table.php');
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
                                    <li class="breadcrumb-item active"><?= $master; ?> Selesai</li>
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

                                <h4 class="card-title">Data <?= $master; ?> Selesai</h4>
                                <button type="button" class="btn btn-primary mb-4 mt-3" data-bs-toggle="modal" data-bs-target="#tambah">
                                    Ajukan Permohonan
                                </button>

                                <table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Nama</th>
                                        <th>Berkas</th>
                                        <th>Status</th>
                                        <th>Aksi</th>
                                    </tr>
                                    </thead>


                                    <tbody>
                                    <?php
                                    $count = 1;

                                    $status = "";

                                    $sql = $conn->prepare("SELECT m_surat.*, m_user.nama as nama_user FROM `m_surat` INNER JOIN `m_user` ON m_surat.user_id = m_user.id WHERE status=6 ORDER BY id DESC");
                                    $sql->execute();

                                    if ($_SESSION['level_id'] == 5) {
                                        $sql = $conn->prepare("SELECT m_surat.*, m_user.nama as nama_user FROM `m_surat` INNER JOIN `m_user` ON m_surat.user_id = m_user.id WHERE status=6 AND user_id=:user_id ORDER BY id DESC");
                                        $sql->execute([":user_id" => $_SESSION['user_id']]);
                                    }
                                    
                                    while($data=$sql->fetch()) {
                                        if($data['status'] == 0){
                                            $status = "Pending";
                                        }

                                        if($data['status'] == 1){
                                            $status = "Diperiksa";
                                        }

                                        if($data['status'] == 2){
                                            $status = "Di-disposisi";
                                        }

                                        if($data['status'] == 3){
                                            $status = "Ditelaah";
                                        }

                                        if($data['status'] == 4){
                                            $status = "Diterima";
                                        }

                                        if($data['status'] == 5){
                                            $status = "Ditolak";
                                        }

                                        if($data['status'] == 6){
                                            $status = "Selesai";
                                        }

                                        if($data['status'] == 7){
                                            $status = "Selesai Ditelaah";
                                        }

                                        if($data['status'] == 8){
                                            $status = "Sertifikat";
                                        }
                                        ?>
                                    <tr>
                                        <td><?= $count; ?></td>
                                        <td><?= $data['nama'] . ' - ' . $data['des']; ?></td>
                                        <?php if(!$data['note']){ ?>
                                            <td><a href="../../images/<?= $data['berkas']; ?>" target="_blank">Lihat Berkas</a></td>
                                        <?php } else { ?>
                                            <td><a href="../../images/<?= $data['berkas']; ?>" target="_blank">Lihat Berkas</a><br><small><?= $data['note'] ?></small></td>
                                        <?php } ?>

                                        <?php if(!$data['petugas_id']){ ?>
                                            <td><?= $status . " - " . "Menunggu Petugas Cek"; ?></td>
                                        <?php } else {
                                            $sql_user = $conn->prepare("SELECT nama FROM m_user WHERE id=:petugas_id");
                                            $sql_user->execute([":petugas_id" => $data['petugas_id']]);
                                            $data_user = $sql_user->fetch();
                                            ?>
                                            <td><?= $status . " - " . $data_user['nama']; ?></td>
                                        <?php } ?>
                                        <td></td>
                                        <td>
                                            <button
                                                    data-id="<?= $data['id'] ?>"
                                                    data-nama="<?= $data['nama']?>"
                                                    data-des="<?= $data['des']?>"
                                                    type="button" class="btn btn-light btn_update" data-toggle="modal">✎</button>
                                            <a class="btn btn-danger" href="../../controller/<?php echo $dba;?>_controller.php?op=hapus&id=<?php echo $data['id'] ?>" onclick="return confirm('Apakah anda yakin ingin menghapus data ini?');">X</a>
                                        </td>
                                    </tr>
                                        <?php $count++; } ?>
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

<!-- Modal Tambah -->
<div class="modal fade" id="tambah" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">


    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tambah <?php echo $master;?></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../../controller/<?php echo $dba;?>_controller.php?op=tambah" method="post"  enctype="multipart/form-data">

                    <input type="hidden" name="status" value="6" />

                    <div class="form-group">
                        <label class="control-label" >Nama : </label>
                        <input type="text" class="form-control" name="nama" placeholder="Silahkan Mengisi Nama"/>
                    </div>

                    <div class="form-group">
                        <label class="control-label" >Deskripsi : </label>
                        <input type="text" class="form-control" name="des" placeholder="Silahkan Mengisi Deskripsi"/>
                    </div>

                    <div class="form-group">
                        <label class="control-label" >Berkas : </label>
                        <input type="file" class="form-control" name="berkas" required/>
                        <!-- <small>Hanya dapat upload file .pdf</small> -->
                    </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button  type="submit" name="upload" type="button" class="btn btn-primary" >Kirim Permohonan</button>
            </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Edit -->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Edit </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="edit.php" method="POST" enctype="multipart/form-data">

                <div class="modal-body">
                    <div class="form-group">
                        <input type="hidden" id="id_edit" name="id" />

                        <div class="form-group">
                            <label class="control-label" >Nama : </label>
                            <input type="text" class="form-control" id="nama_edit" name="nama" placeholder="Silahkan Mengisi Nama"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label" >Deskripsi : </label>
                            <input type="text" class="form-control" id="des_edit" name="des" placeholder="Silahkan Mengisi Deskripsi"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label" >Berkas : </label>
                            <input type="file" class="form-control" name="berkas"/>
                            <!-- <small>Hanya dapat upload file .pdf</small> -->
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="btn-save-update">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function(){

        $('#btn-save-update').click(function(){
            $.ajax({
                url: "edit.php",
                type : 'post',
                data : $('#form-edit-transaksi-masuk').serialize(),
                success: function(data){
                    var res = JSON.parse(data);
                    if (res.code == 200){
                        alert('Success Update');
                        location.reload();
                    }
                }
            })
        });

        $(document).on('click','.btn_update',function(){
            console.log("Masuk");
            $("#id_edit").val($(this).attr('data-id'));
            $("#nama_edit").val($(this).attr('data-nama'));
            $("#des_edit").val($(this).attr('data-des'));
            $('#edit').modal('show');
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
