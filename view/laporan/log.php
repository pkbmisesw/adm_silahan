<?php
error_reporting(E_ALL);

include('../../config.php');

if(isset($_SESSION['email'])== 0) {
    header('Location: ../../index.php');
}

if(!($_SESSION['level_id'] == "1" || $_SESSION['level_id'] == 2 || $_SESSION['level_id'] == 3)){
    echo "<script>alert('Maaf! anda tidak bisa mengakses halaman ini '); document.location.href='../admin/'</script>";
}

$master = "Surat";
$dba = "surat";
$ket = "";
$ketnama = "Silahkan mengisi nama";
?>

<?php
$title = "Silahan Kawan | Surat";include('../head_table.php');
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
                <form action="" method="GET" class="form-horizontal">
                <div class="row"> <!-- Baris baru untuk input tanggal -->
                  <div class="col-md-6 col-xs-12"> <!-- Setengah lebar kolom -->
                    <div class="form-group">
                      <label for="tanggal">Tanggal</label>
                      <input type="text" class="form-control" name="tanggal" id="tanggal" readonly value="<?= isset($_GET['tanggal']) ? $_GET['tanggal'] : ""; ?>">
                    </div>
                  </div>

                  <div class="col-md-6 col-xs-12"> <!-- Setengah lebar kolom -->
                    <div class="form-group">
                      <label for="sd">s/d</label>
                      <input type="text" class="form-control" id="sd" name="sd" readonly value="<?= isset($_GET['sd']) ? $_GET['sd'] : ""; ?>"> 
                    </div>
                  </div>
                </div>

                <div class="col-md-12 col-xs-12 mt-3 mb-3">
                  <button onclick="printDiv('printableArea')" value="print" id="print" class="btn btn-success btn-xs" onclick="$('form').attr('target', '_blank');">
                    <i class="fa fa-print"></i>
                    Cetak
                  </button>
                  <button type="submit"  class="btn btn-xs btn-primary" name="filter" value="filter" >
                    <i class="fa fa-filter"></i>
                    Filter
                  </button>
                  <!-- <button type="submit" class="pull-right btn btn-xs btn-primary" name="filter" value="filter" >
                    <i class="fa fa-filter"></i>
                    Filter
                  </button> -->
                  <!-- <a class="pull-right mr-2 btn btn-xs btn-default" href="#">Reset</a> -->
                </div>

              </form>
              

                <div class="row">
                  
                    <div class="col-12">
                        <div class="card">
                          
                            <div class="card-body">

                                <h4 class="card-title">Data <?= $master; ?> Keseluruhan</h4>
                                <table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>User ID</th>
                                        <th>Deskripsi</th>
                                        <th>Date Time</th>
                                    </tr>
                                    </thead>


                                    <tbody>
                                    <?php
                                    $count = 1;

                                    $status = "";   

                                    $tanggal = isset($_GET['tanggal']) ? $_GET['tanggal'] : date("Y-m-d");
                                    $sd = isset($_GET['sd']) ? $_GET['sd'] : date("Y-m-d");
                                    
                                    // Kemudian gunakan variabel ini dalam query Anda
                                    $sql = $conn->prepare("SELECT * FROM `m_log` WHERE DATE(`created_at`) BETWEEN '".date("Y-m-d", strtotime($tanggal))."' AND '".date("Y-m-d", strtotime($sd))."' ORDER BY id DESC");                                    $sql->execute();

                                    while($data=$sql->fetch()) {
                                        ?>
                                        <tr>
                                            <td><?= $count; ?></td>
                                            <td><?= $data['user_id']; ?></td>
                                            <td><?= $data['des']; ?></td>
                                            <td><?= date_format(date_create($data['created_at']), "d/m/Y H:i:s"); ?></td>
                                        </tr>
                                    <?php $count++; } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div> <!-- end col -->
                    <!-- Tabel hanya untuk pencetakan -->
            <div id="printableArea" style="display:none;">
                <table class="table table-bordered" style="border-collapse: collapse; border-spacing: 0; width: 100%; border: 2px solid black !important;">
                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>User ID</th>
                                        <th>Deskripsi</th>
                                        <th>Date Time</th>
                                    </tr>
                                    </thead>


                                    <tbody>
                                    <?php
                                    $count = 1;

                                    $status = "";   

                                    $tanggal = isset($_GET['tanggal']) ? $_GET['tanggal'] : date("Y-m-d");
                                    $sd = isset($_GET['sd']) ? $_GET['sd'] : date("Y-m-d");
                                    
                                    // Kemudian gunakan variabel ini dalam query Anda
                                    $sql = $conn->prepare("SELECT * FROM `m_log` WHERE DATE(`created_at`) BETWEEN '".date("Y-m-d", strtotime($tanggal))."' AND '".date("Y-m-d", strtotime($sd))."' ORDER BY id DESC");                                    $sql->execute();

                                    while($data=$sql->fetch()) {
                                        ?>
                                        <tr>
                                            <td><?= $count; ?></td>
                                            <td><?= $data['user_id']; ?></td>
                                            <td><?= $data['des']; ?></td>
                                            <td><?= date_format(date_create($data['created_at']), "d/m/Y H:i:s"); ?></td>
                                        </tr>
                                    <?php $count++; } ?>
                                    </tbody>
                </table>
            </div>
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

        $('#btn-save-update-operator').click(function(){
            $.ajax({
                url: "edit_operator.php",
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

       $("#berkas_edit").on('change', function({target}){
           const file = target.files[0];

           const formdata = new FormData();
           formdata.append("berkas", file);

           const reader = new FileReader();
           function progressHandler(event) {
               if (event.lengthComputable) {
                   let percentComplete = (event.loaded / event.total) * 100;
                   $("#progressBar_edit").val(percentComplete);
                   $("#uploadStatus_edit").html(percentComplete+"%");
               }
           }

           reader.onprogress = progressHandler;
           reader.readAsArrayBuffer(file);
       });

        $("#berkas_tambah").on('change', function({target}){
            const file = target.files[0];

            const formdata = new FormData();
            formdata.append("berkas", file);

            const reader = new FileReader();
            function progressHandler(event) {
                if (event.lengthComputable) {
                    let percentComplete = (event.loaded / event.total) * 100;
                    $("#progressBar_tambah").val(percentComplete);
                    $("#uploadStatus_tambah").html(percentComplete+"%");
                }
            }

            reader.onprogress = progressHandler;
            reader.readAsArrayBuffer(file);
        });

        $(document).on('click','.btn_update',function(){
            $("#id_edit").val($(this).attr('data-id'));
            $("#nama_edit").val($(this).attr('data-nama'));
            $("#des_edit").val($(this).attr('data-des'));
            $('#edit').modal('show');
        });

        $(document).on('click','.btn_update_operator',function(){
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
    function formatDate(date) {
  var d = new Date(date),
      day = '' + d.getDate(),
      month = '' + (d.getMonth() + 1),
      year = d.getFullYear();

  if (day.length < 2) 
      day = '0' + day;
  if (month.length < 2) 
      month = '0' + month;

  return [day, month, year].join('-');
}

$(document).ready(function() {

      $("#tanggal").datepicker({
        dateFormat: 'dd-mm-yy'
      });

      $("#sd").datepicker({
        dateFormat: 'dd-mm-yy'
      });
    });
    function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;
    window.print();
    document.body.innerHTML = originalContents;
}
</script>
