<?php
session_start();
error_reporting(0);

include ('../../config.php');

if (isset($_SESSION['email']) == 0) {
    header('Location: ../../index.php');
}
?>

<?php
$title = "Silahan Kawan | Dashboard";
include ('../head.php');
?>

<body data-topbar="dark">
tes
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
                                <h4 class="mb-sm-0">Dashboard</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Upcube</a></li>
                                        <li class="breadcrumb-item active">Dashboard</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- end page title -->


                    <?php if ($_SESSION['level_id'] == 1 || $_SESSION['level_id'] == 2 || $_SESSION['level_id'] == 3 || $_SESSION['level_id'] == 4) { ?>
                    <div class="row">
                        <div class="col-xl-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-grow-1">
                                            <?php

                                            $sql = $conn->prepare("SELECT count(*) as total_surat FROM m_surat WHERE status = 3");
                                            $sql->execute();
                                            $data = $sql->fetch();
                                            $surat_disposisi = $data['total_surat'];

                                            ?>
                                            <p class="text-truncate font-size-14 mb-2">Semua Disposisi Atasan</p>
                                            <h4 class="mb-2"><?= $surat_disposisi; ?></h4>
                                        </div>
                                        <div class="avatar-sm">
                                            <span class="avatar-title bg-light text-success rounded-3">
                                                <i class="mdi mdi-currency-usd font-size-24"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-grow-1">
                                            <?php

                                            $sql = $conn->prepare("SELECT count(*) as total_surat FROM m_surat WHERE status = 6");
                                            $sql->execute();
                                            $data = $sql->fetch();
                                            $surat_sedang_ditelaah = $data['total_surat'];

                                            ?>
                                            <p class="text-truncate font-size-14 mb-2">Surat Sedang Ditelaah</p>
                                            <h4 class="mb-2"><?= $surat_sedang_ditelaah; ?></h4>
                                        </div>
                                        <div class="avatar-sm">
                                            <span class="avatar-title bg-light text-success rounded-3">
                                                <i class="mdi mdi-currency-usd font-size-24"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-grow-1">
                                            <?php

                                            $sql = $conn->prepare("SELECT count(*) as total_surat FROM m_surat WHERE status = 7");
                                            $sql->execute();
                                            $data = $sql->fetch();
                                            $surat_selesai_ditelaah = $data['total_surat'];

                                            ?>
                                            <p class="text-truncate font-size-14 mb-2">Surat Selesai Ditelaah</p>
                                            <h4 class="mb-2"><?= $surat_selesai_ditelaah; ?></h4>
                                        </div>
                                        <div class="avatar-sm">
                                            <span class="avatar-title bg-light text-success rounded-3">
                                                <i class="mdi mdi-currency-usd font-size-24"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-grow-1">
                                            <?php

                                            $sql = $conn->prepare("SELECT count(*) as total_surat FROM m_surat WHERE status = 8");
                                            $sql->execute();
                                            $data = $sql->fetch();
                                            $surat_hasil_telaah = $data['total_surat'];

                                            ?>
                                            <p class="text-truncate font-size-14 mb-2">Surat Hasil Telaah</p>
                                            <h4 class="mb-2"><?= $surat_hasil_telaah; ?></h4>
                                        </div>
                                        <div class="avatar-sm">
                                            <span class="avatar-title bg-light text-success rounded-3">
                                                <i class="mdi mdi-currency-usd font-size-24"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <?php } ?>

                    <?php if ($_SESSION['level_id'] == 5) { ?>
                    <div class="row">
                        <div class="col-xl-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-grow-1">
                                            <?php

                                            $sql = $conn->prepare("SELECT count(*) as total_surat FROM m_surat WHERE status = 3");
                                            $sql->execute();
                                            $data = $sql->fetch();
                                            $surat_disposisi = $data['total_surat'];

                                            ?>
                                            <p class="text-truncate font-size-14 mb-2">Semua Disposisi Atasan</p>
                                            <h4 class="mb-2"><?= $surat_disposisi; ?></h4>
                                        </div>
                                        <div class="avatar-sm">
                                            <span class="avatar-title bg-light text-success rounded-3">
                                                <i class="mdi mdi-currency-usd font-size-24"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-grow-1">
                                            <?php

                                            $sql = $conn->prepare("SELECT count(*) as total_surat FROM m_surat WHERE status = 6");
                                            $sql->execute();
                                            $data = $sql->fetch();
                                            $surat_sedang_ditelaah = $data['total_surat'];

                                            ?>
                                            <p class="text-truncate font-size-14 mb-2">Surat Sedang Ditelaah</p>
                                            <h4 class="mb-2"><?= $surat_sedang_ditelaah; ?></h4>
                                        </div>
                                        <div class="avatar-sm">
                                            <span class="avatar-title bg-light text-success rounded-3">
                                                <i class="mdi mdi-currency-usd font-size-24"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-grow-1">
                                            <?php

                                            $sql = $conn->prepare("SELECT count(*) as total_surat FROM m_surat WHERE status = 7");
                                            $sql->execute();
                                            $data = $sql->fetch();
                                            $surat_selesai_ditelaah = $data['total_surat'];

                                            ?>
                                            <p class="text-truncate font-size-14 mb-2">Surat Selesai Ditelaah</p>
                                            <h4 class="mb-2"><?= $surat_selesai_ditelaah; ?></h4>
                                        </div>
                                        <div class="avatar-sm">
                                            <span class="avatar-title bg-light text-success rounded-3">
                                                <i class="mdi mdi-currency-usd font-size-24"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-grow-1">
                                            <?php

                                            $sql = $conn->prepare("SELECT count(*) as total_surat FROM m_surat WHERE status = 8");
                                            $sql->execute();
                                            $data = $sql->fetch();
                                            $surat_hasil_telaah = $data['total_surat'];

                                            ?>
                                            <p class="text-truncate font-size-14 mb-2">Surat Hasil Telaah</p>
                                            <h4 class="mb-2"><?= $surat_hasil_telaah; ?></h4>
                                        </div>
                                        <div class="avatar-sm">
                                            <span class="avatar-title bg-light text-success rounded-3">
                                                <i class="mdi mdi-currency-usd font-size-24"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <?php } ?>

                   

                    <!--<div class="row">-->
                    <!--    <div class="col-xl-8">-->
                    <!--        <div class="card">-->
                    <!--            <div class="card-body">-->
                    <!--                <div class="dropdown float-end">-->
                    <!--                    <a href="#" class="dropdown-toggle arrow-none card-drop"-->
                    <!--                        data-bs-toggle="dropdown" aria-expanded="false">-->
                    <!--                        <i class="mdi mdi-dots-vertical"></i>-->
                    <!--                    </a>-->
                    <!--                    <div class="dropdown-menu dropdown-menu-end">-->
                    <!--                        <a href="javascript:void(0);" class="dropdown-item">Sales Report</a>-->
                    <!--                        <a href="javascript:void(0);" class="dropdown-item">Export Report</a>-->
                    <!--                        <a href="javascript:void(0);" class="dropdown-item">Profit</a>-->
                    <!--                        <a href="javascript:void(0);" class="dropdown-item">Action</a>-->
                    <!--                    </div>-->
                    <!--                </div>-->

                    <!--                <h4 class="card-title mb-4">Latest Transactions</h4>-->

                    <!--                <div class="table-responsive">-->
                    <!--                    <table class="table table-centered mb-0 align-middle table-hover table-nowrap">-->
                    <!--                        <thead class="table-light">-->
                    <!--                            <tr>-->
                    <!--                                <th>Name</th>-->
                    <!--                                <th>Position</th>-->
                    <!--                                <th>Status</th>-->
                    <!--                                <th>Age</th>-->
                    <!--                                <th>Start date</th>-->
                    <!--                                <th style="width: 120px;">Salary</th>-->
                    <!--                            </tr>-->
                    <!--                        </thead>-->
                    <!--                        <tbody>-->
                    <!--                            <tr>-->
                    <!--                                <td>-->
                    <!--                                    <h6 class="mb-0">Charles Casey</h6>-->
                    <!--                                </td>-->
                    <!--                                <td>Web Developer</td>-->
                    <!--                                <td>-->
                    <!--                                    <div class="font-size-13"><i-->
                    <!--                                            class="ri-checkbox-blank-circle-fill font-size-10 text-success align-middle me-2"></i>Active-->
                    <!--                                    </div>-->
                    <!--                                </td>-->
                    <!--                                <td>-->
                    <!--                                    23-->
                    <!--                                </td>-->
                    <!--                                <td>-->
                    <!--                                    04 Apr, 2021-->
                    <!--                                </td>-->
                    <!--                                <td>$42,450</td>-->
                    <!--                            </tr>-->
                    <!--                            <tr>-->
                    <!--                                <td>-->
                    <!--                                    <h6 class="mb-0">Alex Adams</h6>-->
                    <!--                                </td>-->
                    <!--                                <td>Python Developer</td>-->
                    <!--                                <td>-->
                    <!--                                    <div class="font-size-13"><i-->
                    <!--                                            class="ri-checkbox-blank-circle-fill font-size-10 text-warning align-middle me-2"></i>Deactive-->
                    <!--                                    </div>-->
                    <!--                                </td>-->
                    <!--                                <td>-->
                    <!--                                    28-->
                    <!--                                </td>-->
                    <!--                                <td>-->
                    <!--                                    01 Aug, 2021-->
                    <!--                                </td>-->
                    <!--                                <td>$25,060</td>-->
                    <!--                            </tr>-->
                    <!--                            <tr>-->
                    <!--                                <td>-->
                    <!--                                    <h6 class="mb-0">Prezy Kelsey</h6>-->
                    <!--                                </td>-->
                    <!--                                <td>Senior Javascript Developer</td>-->
                    <!--                                <td>-->
                    <!--                                    <div class="font-size-13"><i-->
                    <!--                                            class="ri-checkbox-blank-circle-fill font-size-10 text-success align-middle me-2"></i>Active-->
                    <!--                                    </div>-->
                    <!--                                </td>-->
                    <!--                                <td>-->
                    <!--                                    35-->
                    <!--                                </td>-->
                    <!--                                <td>-->
                    <!--                                    15 Jun, 2021-->
                    <!--                                </td>-->
                    <!--                                <td>$59,350</td>-->
                    <!--                            </tr>-->
                    <!--                            <tr>-->
                    <!--                                <td>-->
                    <!--                                    <h6 class="mb-0">Ruhi Fancher</h6>-->
                    <!--                                </td>-->
                    <!--                                <td>React Developer</td>-->
                    <!--                                <td>-->
                    <!--                                    <div class="font-size-13"><i-->
                    <!--                                            class="ri-checkbox-blank-circle-fill font-size-10 text-success align-middle me-2"></i>Active-->
                    <!--                                    </div>-->
                    <!--                                </td>-->
                    <!--                                <td>-->
                    <!--                                    25-->
                    <!--                                </td>-->
                    <!--                                <td>-->
                    <!--                                    01 March, 2021-->
                    <!--                                </td>-->
                    <!--                                <td>$23,700</td>-->
                    <!--                            </tr>-->
                    <!--                            <tr>-->
                    <!--                                <td>-->
                    <!--                                    <h6 class="mb-0">Juliet Pineda</h6>-->
                    <!--                                </td>-->
                    <!--                                <td>Senior Web Designer</td>-->
                    <!--                                <td>-->
                    <!--                                    <div class="font-size-13"><i-->
                    <!--                                            class="ri-checkbox-blank-circle-fill font-size-10 text-success align-middle me-2"></i>Active-->
                    <!--                                    </div>-->
                    <!--                                </td>-->
                    <!--                                <td>-->
                    <!--                                    38-->
                    <!--                                </td>-->
                    <!--                                <td>-->
                    <!--                                    01 Jan, 2021-->
                    <!--                                </td>-->
                    <!--                                <td>$69,185</td>-->
                    <!--                            </tr>-->
                    <!--                            <tr>-->
                    <!--                                <td>-->
                    <!--                                    <h6 class="mb-0">Den Simpson</h6>-->
                    <!--                                </td>-->
                    <!--                                <td>Web Designer</td>-->
                    <!--                                <td>-->
                    <!--                                    <div class="font-size-13"><i-->
                    <!--                                            class="ri-checkbox-blank-circle-fill font-size-10 text-warning align-middle me-2"></i>Deactive-->
                    <!--                                    </div>-->
                    <!--                                </td>-->
                    <!--                                <td>-->
                    <!--                                    21-->
                    <!--                                </td>-->
                    <!--                                <td>-->
                    <!--                                    01 Sep, 2021-->
                    <!--                                </td>-->
                    <!--                                <td>$37,845</td>-->
                    <!--                            </tr>-->
                    <!--                            <tr>-->
                    <!--                                <td>-->
                    <!--                                    <h6 class="mb-0">Mahek Torres</h6>-->
                    <!--                                </td>-->
                    <!--                                <td>Senior Laravel Developer</td>-->
                    <!--                                <td>-->
                    <!--                                    <div class="font-size-13"><i-->
                    <!--                                            class="ri-checkbox-blank-circle-fill font-size-10 text-success align-middle me-2"></i>Active-->
                    <!--                                    </div>-->
                    <!--                                </td>-->
                    <!--                                <td>-->
                    <!--                                    32-->
                    <!--                                </td>-->
                    <!--                                <td>-->
                    <!--                                    20 May, 2021-->
                    <!--                                </td>-->
                    <!--                                <td>$55,100</td>-->
                    <!--                            </tr>-->

                    <!--                        </tbody>-->
                    <!--                    </table>-->
                    <!--                </div>-->
                    <!--            </div>-->
                    <!--        </div>-->
                    <!--    </div>-->
                    <!--    <div class="col-xl-4">-->
                    <!--        <div class="card">-->
                    <!--            <div class="card-body">-->
                    <!--                <div class="float-end">-->
                    <!--                    <select class="form-select shadow-none form-select-sm">-->
                    <!--                        <option selected>Apr</option>-->
                    <!--                        <option value="1">Mar</option>-->
                    <!--                        <option value="2">Feb</option>-->
                    <!--                        <option value="3">Jan</option>-->
                    <!--                    </select>-->
                    <!--                </div>-->
                    <!--                <h4 class="card-title mb-4">Monthly Earnings</h4>-->

                    <!--                <div class="row">-->
                    <!--                    <div class="col-4">-->
                    <!--                        <div class="text-center mt-4">-->
                    <!--                            <h5>3475</h5>-->
                    <!--                            <p class="mb-2 text-truncate">Market Place</p>-->
                    <!--                        </div>-->
                    <!--                    </div>-->
                    <!--                    <div class="col-4">-->
                    <!--                        <div class="text-center mt-4">-->
                    <!--                            <h5>458</h5>-->
                    <!--                            <p class="mb-2 text-truncate">Last Week</p>-->
                    <!--                        </div>-->
                    <!--                    </div>-->
                    <!--                    <div class="col-4">-->
                    <!--                        <div class="text-center mt-4">-->
                    <!--                            <h5>9062</h5>-->
                    <!--                            <p class="mb-2 text-truncate">Last Month</p>-->
                    <!--                        </div>-->
                    <!--                    </div>-->
                    <!--                </div>-->

                    <!--                <div class="mt-4">-->
                    <!--                    <div id="donut-chart" class="apex-charts"></div>-->
                    <!--                </div>-->
                    <!--            </div>-->
                    <!--        </div>-->
                    <!--    </div>-->
                    <!--</div>-->

                    <!-- Chart -->
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title mb-4">Bar Chart Surat Permohonan</h4>

                                    <div
                                            id="column_chart_datalabel"
                                            class="apex-charts"
                                            dir="ltr"
                                    ></div>
                                </div>
                            </div>
                            <!--end card-->
                        </div>
                    <!-- end row -->
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title mb-4">Pie Chart Surat Permohonan</h4>

                                    <div
                                            id="pie_chart"
                                            class="apex-charts"
                                            dir="ltr"
                                    ></div>
                                </div>
                            </div>
                            <!--end card-->
                        </div>
                        <!-- end row -->
                    </div>
                    <!-- end Chart -->
                    
                </div>

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
                    <img src="../../assets/images/layouts/layout-1.jpg" class="img-fluid img-thumbnail" alt="layout-1">
                </div>

                <div class="form-check form-switch mb-3">
                    <input class="form-check-input theme-choice" type="checkbox" id="light-mode-switch" checked>
                    <label class="form-check-label" for="light-mode-switch">Light Mode</label>
                </div>

                <div class="mb-2">
                    <img src="../../assets/images/layouts/layout-2.jpg" class="img-fluid img-thumbnail" alt="layout-2">
                </div>
                <div class="form-check form-switch mb-3">
                    <input class="form-check-input theme-choice" type="checkbox" id="dark-mode-switch"
                        data-bsStyle="../../assets/css/bootstrap-dark.min.css"
                        data-appStyle="../../assets/css/app-dark.min.css">
                    <label class="form-check-label" for="dark-mode-switch">Dark Mode</label>
                </div>

                <div class="mb-2">
                    <img src="../../assets/images/layouts/layout-3.jpg" class="img-fluid img-thumbnail" alt="layout-3">
                </div>
                <div class="form-check form-switch mb-5">
                    <input class="form-check-input theme-choice" type="checkbox" id="rtl-mode-switch"
                        data-appStyle="../../assets/css/app-rtl.min.css">
                    <label class="form-check-label" for="rtl-mode-switch">RTL Mode</label>
                </div>


            </div>

        </div> <!-- end slimscroll-menu-->
    </div>
    <!-- /Right-bar -->

    <?php
    include ('../footer.php');
    ?>


        <script>
            options = {
                chart: {
                    height: 350,
                    type: "bar",
                    toolbar: {
                        show: !1
                    }
                },
                plotOptions: {
                    bar: {
                        horizontal: !1,
                        columnWidth: "10%",
                        endingShape: "rounded"
                    }
                },
                dataLabels: {
                    enabled: !1
                },
                stroke: {
                    show: !0,
                    width: 2,
                    colors: ["transparent"]
                },
                series: [{
                    name: "Semua Disposisi Atasan",
                    data: [<?= $surat_disposisi; ?>]
                }, {
                    name: "Surat Sedang Ditelaah",
                    data: [<?= $surat_sedang_ditelaah; ?>]
                }, {
                    name: "Surat Selesai Ditelaah",
                    data: [<?= $surat_selesai_ditelaah; ?>]
                }, {
                    name: "Surat Hasil Telaah",
                    data: [<?= $surat_hasil_telaah; ?>]
                }],
                colors: ["#1cbb8c", "#0f9cf3", "#fcb92c", "#4aa3ff"],
                xaxis: {
                    categories: [""]
                },
                yaxis: {
                    title: {
                        text: "Jumlah (angka)"
                    }
                },
                grid: {
                    borderColor: "#f1f1f1",
                    padding: {
                        bottom: 10
                    }
                },
                fill: {
                    opacity: 1
                },
                tooltip: {
                    y: {
                        formatter: function(e) {
                            return e
                        }
                    }
                },
                legend: {
                    offsetY: 7
                }
            };
            (chart = new ApexCharts(document.querySelector("#column_chart_datalabel"), options)).render();

            options = {
                chart: {
                    height: 320,
                    type: "pie"
                },
                series: [<?= $surat_disposisi; ?>, <?= $surat_sedang_ditelaah; ?>, <?= $surat_selesai_ditelaah; ?>,  <?= $surat_hasil_telaah; ?>],
                labels: ["Surat Disposisi Atasan", "Surat Sedang Ditelaah", "Surat Selesai Ditelaah", "Surat Hasil Telaah"],
                colors: ["#1cbb8c", "#0f9cf3", "#fcb92c", "#4aa3ff"],
                legend: {
                    show: !0,
                    position: "bottom",
                    horizontalAlign: "center",
                    verticalAlign: "middle",
                    floating: !1,
                    fontSize: "14px",
                    offsetX: 0,
                    offsetY: 5
                },
                responsive: [{
                    breakpoint: 600,
                    options: {
                        chart: {
                            height: 240
                        },
                        legend: {
                            show: !1
                        }
                    }
                }]
            };
            (chart = new ApexCharts(document.querySelector("#pie_chart"), options)).render();
        </script>
