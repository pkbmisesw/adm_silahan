<!-- ========== Left Sidebar Start ========== -->
<div class="vertical-menu">

    <div data-simplebar class="h-100">

        <!-- User details -->
        <div class="user-profile text-center mt-3">
            <div class="">
                <img src="../../assets/images/users/avatar-1.png" alt="" class="avatar-md rounded-circle">
            </div>
            <div class="mt-3">
                <h4 class="font-size-16 mb-1"><?= $_SESSION['nama']; ?></h4>
                <?php if($_SESSION['level_id'] == 1){ ?>
                <span class="text-muted"><i class="ri-record-circle-line align-middle font-size-14 text-success"></i> Super Admin</span>
                <?php } ?>
                <?php if($_SESSION['level_id'] == 2){ ?>
                    <span class="text-muted"><i class="ri-record-circle-line align-middle font-size-14 text-success"></i> Admin</span>
                <?php } ?>
                <?php if($_SESSION['level_id'] == 3){ ?>
                    <span class="text-muted"><i class="ri-record-circle-line align-middle font-size-14 text-success"></i> Operator</span>
                <?php } ?>
                <?php if($_SESSION['level_id'] == 4){ ?>
                    <span class="text-muted"><i class="ri-record-circle-line align-middle font-size-14 text-success"></i> Pimpinan</span>
                <?php } ?>
                <?php if($_SESSION['level_id'] == 5){ ?>
                    <span class="text-muted"><i class="ri-record-circle-line align-middle font-size-14 text-success"></i> Pemohon</span>
                <?php } ?>
            </div>
        </div>

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
                <li class="menu-title">Menu</li>

                <li>
                    <a href="../admin/" class="waves-effect">
                        <i class="ri-dashboard-line"></i><span class="badge rounded-pill bg-success float-end">3</span>
                        <span>Dashboard</span>
                    </a>
                </li>

                <!-- Superadmin -->
                <?php if($_SESSION['level_id'] == 1){ ?>
                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="ri-mail-send-line"></i>
                        <span>Master Surat</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="email-inbox.html">Surat Disposisi</a></li>
                        <li><a href="../m_surat/diterima.php">Permohonan Diterima</a></li>
                        <li><a href="../m_surat/sertifikasi.php">Permohonan Dengan Sertifikasi</a></li>
                    </ul>
                </li>

                <li class="menu-title">Other</li>
                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="ri-account-box-fill"></i>
                        <span>Master Pengguna</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="../m_user/">Pengaktifan User</a></li>
                        <li><a href="email-inbox.html">Pengaktifan User Dengan Tembusan</a></li>
                        <li><a href="email-inbox.html">Nama Penelaah</a></li>
                    </ul>
                </li>
                <?php } ?>
                <!-- End of Superadmin -->

                <!-- Admin -->
                <?php if($_SESSION['level_id'] == 2){ ?>
                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="ri-mail-send-line"></i>
                        <span>Master Surat</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="../m_surat/ditelaah.php">Surat Ditelaah</a></li>
                        <li><a href="../m_surat/sedangtelaah.php">Surat Sedang Ditelaah</a></li>
                        <li><a href="../m_surat/selesaitelaah.php">Surat Selesai Ditelaah</a></li>
                    </ul>
                </li>

                <li class="menu-title">Other</li>
                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="ri-account-box-fill"></i>
                        <span>Master Pengguna</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="../m_user/">Pengaktifan User</a></li>
                        <li><a href="email-inbox.html">Pengaktifan User Dengan Tembusan</a></li>
                        <li><a href="email-inbox.html">Nama Penelaah</a></li>
                    </ul>
                </li>
                <?php } ?>
                <!-- End of Admin -->

                <!-- Operator -->
                <?php if($_SESSION['level_id'] == 3){ ?>
                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="ri-mail-send-line"></i>
                        <span>Master Surat</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="../m_surat/">Semua Permohonan</a></li>
                        <li><a href="../m_surat/diperiksa.php">Surat Diperiksa</a></li>
                        <li><a href="../m_surat/ditolak.php">Surat Ditolak</a></li>
                        <li><a href="../m_surat/disposisi.php">Surat Didisposisi</a></li>
                        <li><a href="../m_surat/ditelaah.php">Surat Ditelaah</a></li>
                        <li><a href="../m_surat/selesaitelaah.php">Surat Selesai Telaah</a></li>
                    </ul>
                </li>

                <li class="menu-title">Other</li>
                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="ri-account-box-fill"></i>
                        <span>Master Pengguna</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="../m_user/">Pengaktifan User</a></li>
                        <li><a href="email-inbox.html">Pengaktifan User Dengan Tembusan</a></li>
                        <li><a href="email-inbox.html">Nama Penelaah</a></li>
                    </ul>
                </li>
                <?php } ?>
                <!-- End of Operator -->

                <!-- Pimpinan -->
                <?php if($_SESSION['level_id'] == 4){ ?>
                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="ri-mail-send-line"></i>
                        <span>Master Surat</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="../m_surat/disposisi.php">Permohonan Didisposisi</a></li>
                        <li><a href="../m_surat/ditelaah.php">Surat Ditelaah</a></li>
                    </ul>
                </li>

                    <li class="menu-title">Other</li>
                <?php } ?>
                <!-- End of Pimpinan -->

                <!-- Pemohon -->
                <?php if($_SESSION['level_id'] == 5){ ?>
                <li>
                    <a href="../m_surat/" class="waves-effect">
                        <i class="ri-mail-send-line"></i><span class="badge rounded-pill bg-success float-end">3</span>
                        <span>Semua Permohonan</span>
                    </a>
                </li>    
                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="ri-mail-send-line"></i>
                        <span>Master Surat</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <!-- <li><a href="../m_surat/">Semua Permohonan</a></li> -->
                        <li><a href="../m_surat/diperiksa.php">Surat Diperiksa</a></li>
                        <li><a href="../m_surat/ditolak.php">Surat Ditolak</a></li>
                        <li><a href="../m_surat/disposisi.php">Surat Disposisi</a></li>
                        <li><a href="../m_surat/ditelaah.php">Surat Ditelaah</a></li>
                        <li><a href="../m_surat/sedangtelaah.php">Surat Sedang Ditelaah</a></li>
                        <li><a href="../m_surat/selesai.php">Surat Selesai</a></li>
                    </ul>
                </li>

                <li class="menu-title">Other</li>
                <?php } ?>
                <!-- End of Pemohon -->


                <li>
                    <a href="../../logout.php" class="waves-effect">
                        <i class="ri-logout-box-line"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->