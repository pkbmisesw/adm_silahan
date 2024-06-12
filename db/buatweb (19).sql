-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2024 at 07:58 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buatweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `m_kantor`
--

CREATE TABLE `m_kantor` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `nama` varchar(255) DEFAULT NULL,
  `des` varchar(500) DEFAULT NULL,
  `alamat` varchar(500) DEFAULT NULL,
  `telp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `m_kantor`
--

INSERT INTO `m_kantor` (`id`, `user_id`, `nama`, `des`, `alamat`, `telp`) VALUES
(1, 163, 'Kementerian Kesehataan', NULL, 'Kemenkes', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_kategori`
--

CREATE TABLE `m_kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `des` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `m_kategori`
--

INSERT INTO `m_kategori` (`id`, `nama`, `des`, `created_at`, `updated_at`) VALUES
(5, 'Testasdf', 'Tos', '2024-02-07 09:53:17', '2024-02-09 06:25:09'),
(6, 'Environment', 'Tsaaa', '2024-02-07 09:55:26', '2024-02-07 09:55:37'),
(7, 'ASdfsadf', '', '2024-02-09 06:25:12', '2024-02-09 06:25:12');

-- --------------------------------------------------------

--
-- Table structure for table `m_surat`
--

CREATE TABLE `m_surat` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `petugas_id` int(11) NOT NULL DEFAULT 0,
  `ppkh_id` int(12) NOT NULL DEFAULT 0,
  `telaah_id` int(12) NOT NULL DEFAULT 0,
  `nama` varchar(255) DEFAULT NULL,
  `des` varchar(500) DEFAULT NULL,
  `berkas` varchar(500) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `note` varchar(255) DEFAULT NULL,
  `mulai_tgl` date DEFAULT NULL,
  `selesai_tgl` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_surat`
--

INSERT INTO `m_surat` (`id`, `user_id`, `petugas_id`, `ppkh_id`, `telaah_id`, `nama`, `des`, `berkas`, `status`, `note`, `mulai_tgl`, `selesai_tgl`, `created_at`, `updated_at`) VALUES
(437, 162, 160, 0, 0, 'Akbar', 'Permohonan Cek Sertifikat no 108', 'Cahyo  MDC CGK 06062024.pdf', 3, NULL, '2024-06-10', '2024-06-14', '2024-06-06 06:10:33', '2024-06-10 08:52:05'),
(433, 162, 161, 0, 0, 'Test', 'Test', 'Haru.pdf', 3, NULL, NULL, NULL, '2024-05-31 08:50:29', '2024-06-10 04:49:31'),
(436, 162, 160, 0, 0, 'tes', 'Perlu dilengkapi daftar Koordinat lokasi permohonan', 'invoice kebutuhan Bahan Kimia BSPJI Manado 22 Mei 2024.pdf', 5, 'Perlu dilengkapi Daftar Koordinat lokasi ', NULL, NULL, '2024-06-06 02:15:58', '2024-06-08 22:44:00'),
(438, 162, 161, 159, 53, 'alt', 'surat 1 tes', 'invoice kebutuhan Bahan Kimia BSPJI Manado 22 Mei 2024.pdf', 7, '', NULL, NULL, '2024-06-06 06:24:29', '2024-06-10 12:09:41'),
(439, 162, 160, 159, 74, 'tes', 'tes', 'invoice kebutuhan Bahan Kimia BSPJI Manado 22 Mei 2024.pdf', 6, '', '2024-06-10', '2024-06-30', '2024-06-06 07:27:54', '2024-06-10 11:40:09'),
(441, 162, 161, 159, 53, 'Tws', 'Tes', '20240605042900923_permohonan unggahan dokumen informasi berkala kemenperin-3.pdf', 6, NULL, NULL, NULL, '2024-06-10 04:39:40', '2024-06-10 11:39:31'),
(440, 162, 159, 0, 0, 'Ketuhanan sosial bagi seluruh rakyat Indonesiabb', 'tes', 'CV BELLA.pdf', 7, NULL, NULL, NULL, '2024-06-06 13:40:12', '2024-06-06 14:06:02'),
(442, 162, 0, 0, 0, 'Pendahuluan', 'Materi Pendahuluan3', 'BSPJI Manado.pdf', 0, NULL, NULL, NULL, '2024-06-11 02:55:15', '2024-06-11 02:55:15');

-- --------------------------------------------------------

--
-- Table structure for table `m_user`
--

CREATE TABLE `m_user` (
  `id` int(11) NOT NULL,
  `codx` varchar(200) DEFAULT NULL,
  `or_id` int(11) DEFAULT 0,
  `id_kec` int(11) NOT NULL DEFAULT 0,
  `id_kel` int(11) NOT NULL DEFAULT 0,
  `nik` varchar(20) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `ttl` varchar(255) DEFAULT NULL,
  `agama` int(11) NOT NULL DEFAULT 0 COMMENT '* 1.ISLAM, 2.KATOLIK, 3.KRISTEN, 4.HINDU, 5.BUDHA, 6.KONGHUCU (isi dalam bentuk angka)',
  `status_kawin` int(11) NOT NULL DEFAULT 0 COMMENT '<small style="color:red">* 0.BELUM MENIKAH, 1.MENIKAH, 2.JANDA/DUDA, 3.CERAI MENINGGAL (isi dalam bentuk angka)</small>',
  `nip` varchar(400) DEFAULT NULL,
  `status_jabatan` int(11) DEFAULT 0 COMMENT '1. SUPER ADMIN\r\n2. ADMIN\r\n3. OPERATOR SEKOLAH\r\n4. PEGAWAI\r\n- 1. PNS\r\n- 2. HONORER\r\n- 3. CPNS\r\n- 4. PPPK\r\n- 5. BLU\r\n\r\n\r\n----------------------\r\nTPPKK BITUNG\r\nlevel id = 1\r\n1. ADMIN KECAMATAN\r\n2. ADMIN KELURAHAN\r\n',
  `pangkat` varchar(400) DEFAULT NULL,
  `jabatan` varchar(500) DEFAULT NULL,
  `tmt` varchar(255) DEFAULT NULL,
  `no_sk` varchar(255) DEFAULT NULL,
  `level_id` int(11) DEFAULT 0 COMMENT 'APLIKASI TPPKK BITUNG\r\n1. SUPER ADMIN\r\n2. ADMIN KELURAHAN\r\n3. MASYARAKAT\r\n4. PENGURUS\r\n5. ADMIN KECAMATAN\r\n-------------------\r\nAPLIKASI SEKOLAH\r\n1. SUPER ADMIN\r\n2. ADMIN\r\n3. OPERATOR SEKOLAH\r\n4. PEGAWAI\r\n------------------\r\nAPLIKASI PPDB\r\n1. SUPER ADMIN\r\n3. OPERATOR SEKOLAH\r\n------------------\r\nAPLIKASI COURSES\r\n1. SUPER ADMIN\r\n2. ADMIN\r\n3. PENGGUNA\r\n4. INSTRUKTUR',
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status_aktif` int(11) DEFAULT 0 COMMENT '0. TIDAK AKTIF, \r\n1. AKTIF\r\n\r\nUNTUK LOGIN SAAT PERTAMA MASUK',
  `api_token` varchar(100) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `hp` varchar(15) DEFAULT NULL,
  `ktp` varchar(500) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `nama_usaha` varchar(255) DEFAULT NULL,
  `des_usaha` varchar(500) DEFAULT NULL,
  `alamat_usaha` varchar(255) DEFAULT NULL,
  `logo_usaha` varchar(500) DEFAULT NULL,
  `id_jenisusaha` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `nuptk` varchar(100) DEFAULT NULL,
  `jenis_kelamin` int(11) DEFAULT 0 COMMENT '* 1. LAKI-LAKI, 2. PEREMPUAN (isi dalam bentuk angka)',
  `tanggal_lahir` varchar(100) DEFAULT NULL,
  `jenis_ptk` int(11) DEFAULT 0 COMMENT '1.KEPALA SEKOLAH, 2.GURU/PENDIDIK, 3.TENAGA KEPENDIDIKAN/TUTOR, 4.BENDAHARA, 5.PETUGAS KEBERSIHAN (isi dalam bentuk angka)',
  `uang` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `m_user`
--

INSERT INTO `m_user` (`id`, `codx`, `or_id`, `id_kec`, `id_kel`, `nik`, `nama`, `des`, `alamat`, `ttl`, `agama`, `status_kawin`, `nip`, `status_jabatan`, `pangkat`, `jabatan`, `tmt`, `no_sk`, `level_id`, `email`, `password`, `status_aktif`, `api_token`, `remember_token`, `hp`, `ktp`, `pic`, `gambar`, `nama_usaha`, `des_usaha`, `alamat_usaha`, `logo_usaha`, `id_jenisusaha`, `created_at`, `updated_at`, `nuptk`, `jenis_kelamin`, `tanggal_lahir`, `jenis_ptk`, `uang`) VALUES
(1, 'fdsg5354da', 0, 0, 0, '', 'Admin', NULL, NULL, NULL, 0, 0, '-', 0, '-', 'Administrator Open Journal System', NULL, NULL, 1, 'admina@gmail.com', '$2y$10$N8NHM29fo7kgAwW82DbfyettlRXvUopCOaoZuxrazXO0R28zXJ5.C', 1, 'ItQzjrZtFyGKZ2BHi6eURs44E8zndU0e5qfiBmwLoECdS83Fq5e13Cv2L718', NULL, '', '', NULL, 'KADISPEND GORUT.jpg', NULL, NULL, NULL, NULL, NULL, '2024-06-06 09:34:51', '2024-02-04 19:13:44', NULL, 0, NULL, 0, 1000000),
(49, NULL, 1, 0, 0, '35535', 'ger', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 3, 'ger@gmail.com', '$2y$10$CKoqbNu3BCTMYS6nuJty0u9kYWGAafFGOpzwjaPx02X.h9ZgSfXae', 1, 'DhAAwy7Q8sJNFMnWZ3qU84Dl2kAymmws6dpHFUNTaVJkRqy1vi3tX6spg52x', NULL, '424244', 'b1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-04 05:27:59', '2023-09-03 22:27:59', NULL, 0, NULL, 0, 0),
(53, NULL, 1, 0, 0, '750502070590001', 'FIRMANSYAH GUSASI,S.Pd', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 3, 'smpn3monanogorut@gmail.com', '$2y$10$Zw5xWCQOzgxNJQBGU0O/hunVfq3uVq5CVPpSr/PNQg1B8USiBypcK', 1, 'd2iCLGIjIszkYO3eVUj2VJW874roswOzwvs892eonCGWpIYnnOAwRmitqgxc', NULL, '082271612224', 'SK PERTAMA (1).jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-22 05:33:56', '2023-12-21 22:33:56', NULL, 0, NULL, 0, 0),
(74, NULL, 69773559, 0, 0, '7505034106750001', 'Masni', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 3, 'masnintuiyo16@guru.sd.belajar.id', '$2y$10$aOD9sZSpu9drGEUAEVRz8.aU6hIp3egcJEWOaQYwaxZD/GQesLaw2', 1, NULL, NULL, '081213392755', 'NPWP UMK ISNARTY LATIF.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-08 08:33:07', '2023-09-08 08:31:53', NULL, 0, NULL, 0, 0),
(119, NULL, 0, 0, 0, '343243242', 'Gera', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 'gerada@gmail.com', '$2y$10$Xq4IXjeZuR4lBX0kJ4LKGOcziuN1/B8oq3WuZAEefP3kPSRCaWaJy', 0, NULL, NULL, '43244', 'i1.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-26 22:18:02', '2023-12-26 22:18:02', NULL, 0, NULL, 0, 0),
(120, NULL, 1, 0, 0, '', 'FIRMANSYAH GUSASI,S.Pd', NULL, 'Desa Katialada Kecamatan Kwandang', '14 Mei 1990', 1, 1, '199005142022211005', 4, 'IX', 'Guru Mapel IPA di SMP Negeri 3 Monano', '01 Maret 2022', '800/BKPP//SK/984/2022', 4, 'firmansyahgusasi@gmail.com', NULL, 1, NULL, NULL, '082271612224', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-26 23:08:41', '2023-12-26 23:07:24', NULL, 1, NULL, 0, 0),
(121, NULL, 0, 0, 0, NULL, 'coba', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 'coba@gmail.com', '$2y$10$DZBbc2aMPjttPtW/iQVldeMXfVHg4Jp1XzZA3BqTZMtM3KPVvRCHq', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-28 23:21:40', '2024-01-28 23:21:40', NULL, 0, NULL, 0, 0),
(122, NULL, 1, 0, 0, '54535255435234532', 'Haris Guru', NULL, NULL, NULL, 0, 0, '4352553525', 1, NULL, 'PRANATA KOMPUTER - AHLI PERTAMA', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 01:31:16', '2024-02-01 01:31:16', '4353252', 1, '10 Oktober 1990', 2, 0),
(123, NULL, 1, 0, 0, '7172025909970001', 'Yesicha Puspitasari Palar', NULL, NULL, NULL, 0, 0, '12345', 1, NULL, 'Guru Teknik komputer', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 05:57:37', '2024-02-01 05:51:18', '1234', 2, '19', 2, 0),
(124, NULL, 1, 0, 0, '7172098883736395', 'Gifens Melisa Tetiwar', NULL, NULL, NULL, 0, 0, '123456', 1, NULL, 'komukasi', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:06:11', '2024-02-01 06:03:53', '123456', 1, '19 oktober 1997', 4, 0),
(125, NULL, 1, 0, 0, '716253735363', 'Meifiana Tukan', NULL, NULL, NULL, 0, 0, '7751515133', 1, NULL, 'ekonomi', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:07:53', '2024-02-01 06:05:27', '12345', 1, '14 september 1998', 1, 0),
(126, NULL, 2, 0, 0, '273647537464', 'inry paskawati', NULL, NULL, NULL, 0, 0, '123455666', 1, NULL, 'Sains', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:06:56', '2024-02-01 06:06:56', '1', 1, '14`oktober', 2, 0),
(127, NULL, 1, 0, 0, '12345675433', 'elisabeth laoh', NULL, NULL, NULL, 0, 0, '1233432', 1, NULL, 'pkin', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:07:41', '2024-02-01 06:07:41', '4', 1, '12 agustus 1997', 2, 0),
(128, NULL, 1, 0, 0, '2625436367', 'lianto salikara', NULL, NULL, NULL, 0, 0, '12345344353', 1, NULL, 'olahraga', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:08:39', '2024-02-01 06:08:39', '1234', 2, '25 oktober', 2, 0),
(129, NULL, 1, 0, 0, '53635473533764', 'riskawati mooduto', NULL, NULL, NULL, 0, 0, '123408797768', 1, NULL, 'kesenian', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:09:44', '2024-02-01 06:09:25', '746464', 1, '14 juli 1998', 3, 0),
(130, NULL, 1, 0, 0, '735363636', 'fauji jamil', NULL, NULL, NULL, 0, 0, '647456464746', 1, NULL, 'Manajemen', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:11:00', '2024-02-01 06:11:00', '34533', 2, '17 juni 1987', 2, 0),
(131, NULL, 1, 0, 0, '27373635373637', 'stifian dumaili', NULL, NULL, NULL, 0, 0, '23455737337', 1, NULL, 'office boy', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:12:11', '2024-02-01 06:12:11', '1234298', 2, '17agustus 1888', 5, 0),
(132, NULL, 1, 0, 0, '78574837484744748', 'windi limpong', NULL, NULL, NULL, 0, 0, '6465864478', 1, NULL, 'kebersihan', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:13:02', '2024-02-01 06:13:02', '54645', 1, '17 desember 1998', 5, 0),
(133, NULL, 1, 0, 0, '73636484747464', 'yunius palar', NULL, NULL, NULL, 0, 0, '335363536', 1, NULL, 'penjaga skolah', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:13:51', '2024-02-01 06:13:51', '3636464', 2, '17 juli', 5, 0),
(134, NULL, 1, 0, 0, '857464846484748', 'Geri Rurimpo', NULL, NULL, NULL, 0, 0, '3746846484', 1, NULL, 'bendahara', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:14:47', '2024-02-01 06:14:47', '7565765', 2, '16 agustus 1998', 4, 0),
(135, NULL, 1, 0, 0, '5736384744948', 'richard dumalang', NULL, NULL, NULL, 0, 0, '7547565465', 1, NULL, 'Guru Teknik komputer', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:15:24', '2024-02-01 06:15:24', '5774567', 2, '26 april 1888', 2, 0),
(136, NULL, 1, 0, 0, '746474648464847', 'Melisa sampelo', NULL, NULL, NULL, 0, 0, '757474747474', 1, NULL, 'pengajar', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:16:11', '2024-02-01 06:16:11', '547545', 1, '19 september 1978', 2, 0),
(137, NULL, 1, 0, 0, '7464547447464', 'martin palar', NULL, NULL, NULL, 0, 0, '647464638', 1, NULL, 'pengajar', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:17:04', '2024-02-01 06:17:04', '36363', 2, '18 juli 1989', 3, 0),
(139, NULL, 2, 0, 0, '74645474474643', 'martin ', NULL, NULL, NULL, 0, 0, '3333444', 1, NULL, 'pengajar', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 06:56:01', '2024-02-01 06:55:29', '36363', 2, '18 juli 1984', 2, 0),
(151, NULL, 1, 0, 0, '7172025989980001', 'Yesicha Puspitasari Palar', NULL, NULL, NULL, 0, 0, '3333444', 1, NULL, 'pengajar', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-05 02:59:54', '2024-02-05 02:59:54', '36363', 2, '18 juli 1984', 2, 0),
(152, NULL, 0, 0, 0, '24242', 'har', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 4, 'har@gmail.com', '$2y$10$cUNVVEuTuS8ujbS1xO3EPeSY5Xw4l26aubqMeeQq7Mw7nVJoQ1j3O', 1, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-05 03:18:36', '2024-02-05 03:18:36', NULL, 0, NULL, 0, 0),
(153, NULL, 0, 0, 0, '855445212633321', 'Nabila1', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 'nabila@gmail.com1', '$2y$10$30w/xPhxgNsbvctEXfXUhe.Uo4KJZRpTzdMy.GHFP5O4hSEGHexVq', 1, NULL, NULL, '0815632452151', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-30 04:27:42', '2024-02-20 05:55:09', NULL, 0, NULL, 0, 0),
(155, NULL, 0, 0, 0, NULL, 'Siswa', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 3, 'siswa@gmail.com', '$2y$10$6aOgDhwH0GdlTnfvwJR1tuhjMc5G08qr1Oih3yQ6mJxw81GeQit2m', 1, NULL, NULL, '2442432434', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04 08:01:23', '2024-03-02 05:22:08', NULL, 0, NULL, 0, 998000),
(156, NULL, 0, 0, 0, NULL, 'ger', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 'ger', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 12:37:53', '2024-03-02 12:37:53', NULL, 0, NULL, 0, 0),
(157, NULL, 0, 0, 0, NULL, 'Test', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 5, '123@g.c', '$2y$10$VjwxUQ8xZs.ONqe09PjeRu9uQILO82lQ34O2.WlO3WlqKevrJeOQe', 0, NULL, NULL, '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-30 06:27:11', '2024-05-30 06:27:11', NULL, 0, NULL, 0, 0),
(158, NULL, 0, 0, 0, NULL, 'Test', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 'superadmin@gmail.com', '$2y$10$tRhgqzvKAJOJZ4NxDci/9uenXLYGiltZTQiB0oIIrBwndR3G8gATe', 1, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-30 07:46:48', '2024-05-30 07:33:59', NULL, 0, NULL, 0, 0),
(159, NULL, 0, 0, 0, NULL, 'Role 2', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 2, 'admin@gmail.com', '$2y$10$66Jq5Isd8Rf1dU.5Jl6t8u0f6YuSCvlhcyk4O/otjIvAd.zgffo1i', 1, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-30 07:46:53', '2024-05-30 07:34:09', NULL, 0, NULL, 0, 0),
(160, NULL, 0, 0, 0, NULL, 'Role 3', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 3, 'operator@gmail.com', '$2y$10$u9JefQbM7xaC3sRA2rOdtuEVMinGXVxXrJIP850T6awBZSsVCjTe.', 1, NULL, NULL, '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-30 07:46:59', '2024-05-30 07:34:22', NULL, 0, NULL, 0, 0),
(161, NULL, 0, 0, 0, NULL, 'Role 4', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 4, 'pimpinan@gmail.com', '$2y$10$jPZ5FqIpN59r8E9JzgxueeS8.EoRBPUpEKXEkCypzLo99FlE5XuFK', 1, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-30 07:47:05', '2024-05-30 07:34:39', NULL, 0, NULL, 0, 0),
(162, NULL, 0, 0, 0, NULL, 'Role 5', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 5, 'pemohon@gmail.com', '$2y$10$48hNZTbWSntYpZwm0Bww4uhNrmozpFpjevn3sn2QKxYQUk.2vk.TO', 1, NULL, NULL, '51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-30 07:47:11', '2024-05-30 07:34:50', NULL, 0, NULL, 0, 0),
(163, NULL, 0, 0, 0, NULL, 'Haris Kemenkes', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 2, 'kemen@gmail.com', '$2y$10$ivHS73KCpPOYnOPs1pVTQOntj3czscJyDRwjOREIxHqLsLVGM6yz2', 1, NULL, NULL, '43535325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-02 13:18:45', '2024-06-02 13:16:36', NULL, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00d752721a98e0e457fdddf37e56e316d1d7a8e2715cdb8c9b145c01f14c45ef930a743f12d61e7e', 161, 3, 'nApp', '[]', 0, '2023-12-04 21:57:52', '2023-12-04 21:57:52', '2024-12-05 04:57:52'),
('01afade2ca541f6cbe5345d211212172c717bf58fa2ac542e900629b64a57b1eb34a6c021a1e73b3', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:49:16', '2023-09-02 10:49:16', '2024-09-02 17:49:16'),
('0232f2f1f534403de2620374291ba6ed5ea0b8ae712ea0b178edc5bc5bbf95430b13117813dedd38', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:16:46', '2023-09-02 09:16:46', '2024-09-02 16:16:46'),
('023e88176eded9f62d7b01789fe3ba5f7607d2aef9a7e5a9ca6a83be1b7ff30ba4ceb0ca5283eb28', 161, 3, 'nApp', '[]', 0, '2024-02-04 04:14:20', '2024-02-04 04:14:20', '2025-02-04 11:14:20'),
('029b59b4685569b02c8cf01b8d661f0b470ad520bf3d5d96ec4ab5109b72cb8fa7ce0ee7cb1ca3fb', 161, 3, 'nApp', '[]', 0, '2024-01-07 16:11:07', '2024-01-07 16:11:07', '2025-01-07 23:11:07'),
('037010e6f248e4a77fd1100d4339b3edc9da0908ce2a091064f5fcd183449b642dfa33bc951f0d56', 6, 3, 'nApp', '[]', 0, '2023-08-07 20:45:14', '2023-08-07 20:45:14', '2024-08-08 03:45:14'),
('03f6749d722e21c1819431c6b2544bb22bd04055a4a787d2a5545b250b13f8e8f93adc383faaa8c1', 1, 3, 'nApp', '[]', 0, '2023-08-24 00:53:34', '2023-08-24 00:53:34', '2024-08-24 07:53:34'),
('0449df367ad2aa03e85b8d362df60593819ad79f4178e00f758270f6f5a1ef349242110aa3e6737e', 1, 3, 'nApp', '[]', 0, '2023-08-09 00:59:34', '2023-08-09 00:59:34', '2024-08-09 07:59:34'),
('05204211c4daf9a0f273d570390ee2dc3116265d9c7ee782f2c58f82427c72a4e0a067d3a0ff80e6', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:17:17', '2023-09-02 09:17:17', '2024-09-02 16:17:17'),
('052f16c985143024a85b558c1d86eadcc18723edf288d5910bf3d7483a454ebbd929361ce9f4c2a5', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:13:05', '2023-09-02 10:13:05', '2024-09-02 17:13:05'),
('058233781b0198331f0df22ed4c8be6bdc49a79a8f615d146b2d446ee0b3fcc8b73e368b0b3934b0', 1, 3, 'nApp', '[]', 0, '2023-09-02 13:45:52', '2023-09-02 13:45:52', '2024-09-02 20:45:52'),
('060387881c5fc9d5e7d1748be6c513c9f0dda8bd5aefea70bc82028ee2dd8955dc31f21adb677cc6', 161, 3, 'nApp', '[]', 0, '2023-11-29 01:12:50', '2023-11-29 01:12:50', '2024-11-29 08:12:50'),
('060c4ec816b7f188522a79a746d26311335a6bd644209cbdf4cbb9b89bdbf864a3cdc279d00d396a', 43, 3, 'nApp', '[]', 0, '2023-09-25 17:59:47', '2023-09-25 17:59:47', '2024-09-26 00:59:47'),
('0658953ad176346f156044d3dd9e51d46768cabfaa6fac7ddf4d11ca40db80819e6552ec1ed09be4', 48, 3, 'nApp', '[]', 0, '2023-08-25 04:57:40', '2023-08-25 04:57:40', '2024-08-25 11:57:40'),
('06caff8c2d7bd0f4b7113af8c9babe90c8c2cb3c1ad3999c66c7ece0b86bd3ea8a4063cd5ef5a574', 1, 3, 'nApp', '[]', 0, '2023-08-26 03:45:34', '2023-08-26 03:45:34', '2024-08-26 10:45:34'),
('073af26b7f0346ae7206e19d21b2594fce72e0e128ac33daca1d34e624587caed3fa2d7b9d7d30c6', 161, 3, 'nApp', '[]', 0, '2024-01-22 16:58:56', '2024-01-22 16:58:56', '2025-01-22 23:58:56'),
('07a87d6bd6594c446b531a74bdd5c3e2ef46e738e9d52de41bc3dbcaa5370695617932de0f8404f7', 43, 3, 'nApp', '[]', 0, '2023-08-24 00:26:35', '2023-08-24 00:26:35', '2024-08-24 07:26:35'),
('08808a613c026c2e2a5fbf4d4691efcfe61f99fa29a0535fd6757f03a5dd41d7f98369acffbaa0c4', 161, 3, 'nApp', '[]', 0, '2024-01-18 19:12:27', '2024-01-18 19:12:27', '2025-01-19 02:12:27'),
('088113882d91e34bd8b395c52fba033ee633accc114de7b210b9d408f88ad9c72809070d77a52866', 56, 3, 'nApp', '[]', 0, '2023-08-17 23:39:29', '2023-08-17 23:39:29', '2024-08-18 06:39:29'),
('089dc479a3c39a81d41167fcfad54c4995acd387140b8068536b054303c44dd6b7e85a89afc8ca60', 1, 3, 'nApp', '[]', 0, '2024-01-28 17:53:25', '2024-01-28 17:53:25', '2025-01-29 00:53:25'),
('08d2e6bc3c997175df14e4f8e6cf85806f3ae0b612da98efd4cc2783e3f6e59200545d737b87d0ad', 161, 3, 'nApp', '[]', 0, '2023-12-06 05:55:49', '2023-12-06 05:55:49', '2024-12-06 12:55:49'),
('08fb036d0a6137c53039cb4471a9aec159ba6b5a7d50c637a63f1823298bd950dc98524cd2b8896f', 1, 3, 'nApp', '[]', 0, '2023-08-08 01:51:27', '2023-08-08 01:51:27', '2024-08-08 08:51:27'),
('095af11ea29260f27aaabd4e5734a66722f4514ea531dfe1b0d68b034ddc1b9c00ed5a3c0ca631df', 43, 3, 'nApp', '[]', 0, '2023-09-02 18:24:24', '2023-09-02 18:24:24', '2024-09-03 01:24:24'),
('0a73d3335fe8dfe3455f019c1cb276769b33c7e7beef6ec3d160a15114ddf3eaeeb4f0769932affe', 1, 3, 'nApp', '[]', 0, '2023-08-21 20:44:32', '2023-08-21 20:44:32', '2024-08-22 03:44:32'),
('0a7485ae926cb227ebcaec910dd7d3f0bb201921fe7564f871bafc1bcf5b0ec51d5730a8499cb102', 1, 3, 'nApp', '[]', 0, '2023-08-16 00:30:38', '2023-08-16 00:30:38', '2024-08-16 07:30:38'),
('0b02a025d445e2895ca125b132d64e4f481c2181da4661d06748f3b33114f7e3cb8e0e41f0ef8787', 43, 3, 'nApp', '[]', 0, '2023-08-26 16:37:40', '2023-08-26 16:37:40', '2024-08-26 23:37:40'),
('0b0b44b4d1abcd595478bedc1be5cb68560ce1eb47b432ded5240d6fc54d26b60ba3bf0d83f7e8f5', 161, 3, 'nApp', '[]', 0, '2023-12-04 17:24:07', '2023-12-04 17:24:07', '2024-12-05 00:24:07'),
('0b182374dcaf814fef3f833acc70f12610136ffba21b34acf7630084d34b844a6600c881d81b1f77', 1, 3, 'nApp', '[]', 0, '2024-02-02 00:53:06', '2024-02-02 00:53:06', '2025-02-02 07:53:06'),
('0b2125cfc1cf4ff34c758dd7c7d311831718676621d54effa3bac6e0447e046abdeb3a7b63c54d06', 161, 3, 'nApp', '[]', 0, '2023-12-02 21:59:54', '2023-12-02 21:59:54', '2024-12-03 04:59:54'),
('0b42f0334c134a3010f487da93f96a478ee017022cc949857cc843ce235da896875706be4c8413b9', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:53', '2023-09-02 09:23:53', '2024-09-02 16:23:53'),
('0bb9f99596d28c4b46fb6445c4c7ad977146fe9c5484eafbf989e86f8495e08caccd911ad5e9766c', 161, 3, 'nApp', '[]', 0, '2024-01-09 17:38:05', '2024-01-09 17:38:05', '2025-01-10 00:38:05'),
('0bc4d179f07aa229dc2d46b986b11a25500a6ceadc888ed1962c144b9da7963e73f0436ebda9f58b', 161, 3, 'nApp', '[]', 0, '2024-01-09 17:53:35', '2024-01-09 17:53:35', '2025-01-10 00:53:35'),
('0bc8a997d06aa2688c4a1c236bfbc86369734e3b896c732007ec37ff4700815cddec339bf8beccdb', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:44:59', '2023-09-02 10:44:59', '2024-09-02 17:44:59'),
('0bdf45a8ad7e301de38f32f96de9407280fd48f134fa438bd7b0a70b6bf2742db54243dc0d5ade25', 1, 3, 'nApp', '[]', 0, '2024-01-31 20:51:24', '2024-01-31 20:51:24', '2025-02-01 03:51:24'),
('0be641bc82a0499deac0c7d5ad8f288e95d9925c3c8fca7873131be20cae89b025dcd283dd69d9f4', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:02:47', '2023-09-02 10:02:47', '2024-09-02 17:02:47'),
('0c0dde435bb38766585dec955cf7c3ba86e1e63718cc9a0f029aae09770f54a692e07bebc939c8e2', 1, 3, 'nApp', '[]', 0, '2023-09-02 19:35:11', '2023-09-02 19:35:11', '2024-09-03 02:35:11'),
('0d1a4e7d3765645d43dda511a9a06f75eb7f6f025aaa8c8c06f90d8bac372d7b17de3dea90174cfe', 1, 3, 'nApp', '[]', 0, '2023-08-07 18:38:04', '2023-08-07 18:38:04', '2024-08-08 01:38:04'),
('0d21e88d1a1a2f0d031dd8f19b8b211ad078b2da19477ae01fc942a22c795e43649956b3f0b687f0', 43, 3, 'nApp', '[]', 0, '2023-08-15 18:36:43', '2023-08-15 18:36:43', '2024-08-16 01:36:43'),
('0d2fa5170c878c58d928d8d4249082517988afeee34d109b0dfb63b4e6a548878aeecc7da6ec61d5', 1, 3, 'nApp', '[]', 0, '2023-11-17 20:48:28', '2023-11-17 20:48:28', '2024-11-18 03:48:28'),
('0d39f4a2c3a1f0d31c3c6c97734bf7150aa462b2b0f042b2c8dbcd7dd01e290d552d0396f468c5a4', 1, 3, 'nApp', '[]', 0, '2023-08-17 21:49:35', '2023-08-17 21:49:35', '2024-08-18 04:49:35'),
('0d522f1a3251cc032fbc1d6b8c1af6347ecdc931d0282adde00b9c8d0c97c2730ec586abf88e56ed', 182, 3, 'nApp', '[]', 0, '2024-01-24 22:53:08', '2024-01-24 22:53:08', '2025-01-25 05:53:08'),
('0d80c877bb2cfcf6687b5cf60391a16b4630f9ac8da69155d749e37cd0f7112cefbb7c936fe92b1e', 161, 3, 'nApp', '[]', 0, '2023-11-29 00:51:52', '2023-11-29 00:51:52', '2024-11-29 07:51:52'),
('0e207cea4c447f0ef7c8f00c5bea60f469efe5beb5d835907719f86836d8d8ce4ce8b21f887c3792', 43, 3, 'nApp', '[]', 0, '2023-08-26 19:39:43', '2023-08-26 19:39:43', '2024-08-27 02:39:43'),
('0e3a038e0bffae5596854ecd0d7107445e359d1e77bcda71897af7b26b9e1cd3641cb9e8a93a63a0', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:44:11', '2023-09-02 09:44:11', '2024-09-02 16:44:11'),
('0e8b2066618ff0c51c9ad0a75676dd293e50b798d4c6a470188c543986fe0574a594e6e38afa001d', 161, 3, 'nApp', '[]', 0, '2024-01-09 07:10:25', '2024-01-09 07:10:25', '2025-01-09 14:10:25'),
('0ed2f65e4d4aa580783d18764b103b03216b4fd4def6364417b5b4eb920fd0fd263a37e3d2b0c886', 1, 3, 'nApp', '[]', 0, '2023-08-17 20:12:14', '2023-08-17 20:12:14', '2024-08-18 03:12:14'),
('0edd99817b2c8dc857bec67423ed9651546dbcf740f0cb0464b813faef8b8ea6cc84eac3a4b73195', 147, 3, 'nApp', '[]', 0, '2023-10-17 20:38:41', '2023-10-17 20:38:41', '2024-10-18 03:38:41'),
('0ee10ec57478c170eac88d6e5995b8300f9a76e2f9d45e7274852c70ff85d3a7f2c31153df3f8ca7', 161, 3, 'nApp', '[]', 0, '2023-11-28 18:05:09', '2023-11-28 18:05:09', '2024-11-29 01:05:09'),
('0f126ddfea7f0fdd886e0d10152354b452c82bcc7d99825b62b1b5cd60ca77d31147e9a3c4053247', 43, 3, 'nApp', '[]', 0, '2023-09-25 17:52:25', '2023-09-25 17:52:25', '2024-09-26 00:52:25'),
('0f35703986f078511fee0b2e7626dac67576263232891f21b0c3fdc79aa3773e22409d908397c1c0', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:53', '2023-09-02 09:23:53', '2024-09-02 16:23:53'),
('0fbd74da93653b4281255b5a10b14d3e3e32d7f8d2c78fe047dcbe88a376aa9d1962e54bda7069e3', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:56', '2023-09-02 09:23:56', '2024-09-02 16:23:56'),
('0ffda752aec27fbe7e424a981539dbb604de7b38f86c78cfd9cf479f7701920c14b8c7fc62994142', 1, 3, 'nApp', '[]', 0, '2023-08-17 21:48:24', '2023-08-17 21:48:24', '2024-08-18 04:48:24'),
('100514529b419809c762dcdaa56458ce154330e624543d0321f75af183113d2205dd50cde453b67c', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:07:11', '2023-09-02 10:07:11', '2024-09-02 17:07:11'),
('102a4afcb51899faa406dacf75c2b09933b7c493ab920eb465b04fba43f213c0ee22c4ae970de128', 56, 3, 'nApp', '[]', 0, '2023-08-18 07:05:57', '2023-08-18 07:05:57', '2024-08-18 14:05:57'),
('103330fe812a467019c81a7ecef3547f60c07d0932643f53c39e73b57189432ed533ccb85272da80', 54, 3, 'nApp', '[]', 0, '2023-08-17 23:24:21', '2023-08-17 23:24:21', '2024-08-18 06:24:21'),
('10fbf64413aba8106d5d889ce98bbd21b63ccd044d10c239b781e670da73f1e801e49b1ceffd959c', 161, 3, 'nApp', '[]', 0, '2024-01-11 18:32:52', '2024-01-11 18:32:52', '2025-01-12 01:32:52'),
('1138b207c7162c22b8252a1f05742ed2f659d146dc96adce53d76bf272e10cd5584cbde4078755ae', 48, 3, 'nApp', '[]', 0, '2023-08-28 18:09:22', '2023-08-28 18:09:22', '2024-08-29 01:09:22'),
('1176106ca1cfb96a89f88c98aafad4d12619a88173b5e40eaa8650eacee89e17adb926992d80faad', 161, 3, 'nApp', '[]', 0, '2023-11-29 01:44:18', '2023-11-29 01:44:18', '2024-11-29 08:44:18'),
('11ccb1376548de3d5f7258ca129aec0d6b02b53889c716874d7665dd0b2e964b1db034f4b6485fb8', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:22:31', '2023-09-02 10:22:31', '2024-09-02 17:22:31'),
('12edb526c7daa785dd1f5ec5faf8395f427180ea106474d32e5debece0c0dddab4bac674f258d294', 146, 3, 'nApp', '[]', 0, '2023-10-17 20:38:19', '2023-10-17 20:38:19', '2024-10-18 03:38:19'),
('1307db66bba319010d58af674405fd3f0142120980d30961b7f058a531986c2de28cd0b880a8f4d0', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:49', '2023-09-02 09:26:49', '2024-09-02 16:26:49'),
('13187baf5accbf4bfb6f9e94323cc6fde07b8abffeeff0f271a6c5870b63d8fc59b7e023f22baee2', 164, 3, 'nApp', '[]', 0, '2023-11-17 20:48:08', '2023-11-17 20:48:08', '2024-11-18 03:48:08'),
('1370e51731b5bd54c8ac9c81788b0f32570eddcacb4ec4161b1461276dccf11866d5b9e48e761b58', 48, 3, 'nApp', '[]', 0, '2024-01-20 17:46:09', '2024-01-20 17:46:09', '2025-01-21 00:46:09'),
('13b8c21a2660cecf05366ad9af22d813bd3e3a70c57b5f271f99dc8c70e44df736f80efda00d0ebf', 1, 3, 'nApp', '[]', 0, '2023-08-15 22:43:24', '2023-08-15 22:43:24', '2024-08-16 05:43:24'),
('15a3c6abdc5225a20cc8993098dcc001ffbdeced9739adc6d96702ee66b34f4bd1f3ebb7de9764c6', 48, 3, 'nApp', '[]', 0, '2023-08-28 17:02:22', '2023-08-28 17:02:22', '2024-08-29 00:02:22'),
('15e62c07c972061c33f5fac3a6a98c7abcd3ab0250021128ec6200c3ce28e044df494958e00facb0', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:15:20', '2023-09-02 09:15:20', '2024-09-02 16:15:20'),
('161a657f7a59d4598ce0615071ee449e4de48c73fee499fb90ac7017fcfd1f2cf495ccb3d76301c9', 55, 3, 'nApp', '[]', 0, '2023-08-17 23:32:18', '2023-08-17 23:32:18', '2024-08-18 06:32:18'),
('1677b87af7b497d221d3f7124f6b4e844a145c05f7a665f05a5d3e92dedf1fa2bf900c114e72f252', 161, 3, 'nApp', '[]', 0, '2023-11-29 18:09:46', '2023-11-29 18:09:46', '2024-11-30 01:09:46'),
('16f85788b0b23b9883fe5fd550ad3806e2b4d8598c7cc4ffd10a013bff7dfb3a8ad0aefabdbbea3b', 1, 3, 'nApp', '[]', 0, '2023-08-24 00:23:28', '2023-08-24 00:23:28', '2024-08-24 07:23:28'),
('17869f4b5118c5c246a559f543a0ead449875d7c013751f9bee72858f84f81fdbf94ef7081101486', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:45:06', '2023-09-02 10:45:06', '2024-09-02 17:45:06'),
('17cd1607865fc99796f300f0c034fd701a7e9b7f3a86ddca61478daee64f8e5158838f2ed78b4f3c', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:06:37', '2023-09-02 10:06:37', '2024-09-02 17:06:37'),
('186941872557224d123c947e8b9e341d92f72b4d998ffc89371b14ab5110cae32053cda871d3ce64', 161, 3, 'nApp', '[]', 0, '2023-11-29 20:27:07', '2023-11-29 20:27:07', '2024-11-30 03:27:07'),
('18891bf30c4e8f25fcd5a94e16a1d3df4bb35b5cf89e9bc21cdcc2ed665fdd0d462fef1d3709198e', 161, 3, 'nApp', '[]', 0, '2024-01-09 23:47:06', '2024-01-09 23:47:06', '2025-01-10 06:47:06'),
('195bfd2345ac5dd0f78437af16e040dd320a2a8fbdb587d19949dca7d37d32ec0e5ca5d5a68fe3b3', 56, 3, 'nApp', '[]', 0, '2023-08-18 07:04:17', '2023-08-18 07:04:17', '2024-08-18 14:04:17'),
('198fbcd199ed1bbbcf2d5626c7ce6b2d4a9893cc87691c817f90e5c2f7edec49a6e31f6c320c1988', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:26:13', '2023-09-02 09:26:13', '2024-09-02 16:26:13'),
('19971168ac14fd597372579997e2ef03ae020560fde6d4da6ce2c3eec7de52ed582bb498ed6202c8', 1, 3, 'nApp', '[]', 0, '2023-09-02 18:28:49', '2023-09-02 18:28:49', '2024-09-03 01:28:49'),
('19cf0d203490c385b835d5ee2a70df1a64df71414f076731f7cbeb97b8fb4f0eb866600edbddb94c', 161, 3, 'nApp', '[]', 0, '2023-11-29 01:59:00', '2023-11-29 01:59:00', '2024-11-29 08:59:00'),
('19ecaeccb191496c79cc0e47b81741d09dcc08956b762d0c73cdf65207569417e4c77f9b98a980eb', 1, 3, 'nApp', '[]', 0, '2023-08-25 15:04:41', '2023-08-25 15:04:41', '2024-08-25 22:04:41'),
('1a194eaaab0c06211378da5390436cd96f4bf2916078b397a0e2bdf46f66d45227c9766860cd917a', 1, 3, 'nApp', '[]', 0, '2023-09-02 08:14:05', '2023-09-02 08:14:05', '2024-09-02 15:14:05'),
('1a5a66e5dd3b4d7eff7a5b764259173059de6ca87e1c018b5cf20788ebe4d80e8dd2289ffb5ee6aa', 1, 3, 'nApp', '[]', 0, '2023-08-15 23:39:51', '2023-08-15 23:39:51', '2024-08-16 06:39:51'),
('1a82217943e28aad8110d34f470dc1033a4e952bdda56d3667d29b8045b7007ddeae9530787e3e1f', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:18:34', '2023-09-02 09:18:34', '2024-09-02 16:18:34'),
('1b190ecfe1722ae393564ba27ecd1ccfb5669ee193b8007d3014d425780285df3e6e26e07ccd2165', 1, 3, 'nApp', '[]', 0, '2023-09-02 13:47:30', '2023-09-02 13:47:30', '2024-09-02 20:47:30'),
('1b86dcb9fe99e8da26ea6aab0a4045d687b7c5922534f4073a737fa514cee6a59487a669b8ee02ab', 1, 3, 'nApp', '[]', 0, '2023-08-28 17:02:41', '2023-08-28 17:02:41', '2024-08-29 00:02:41'),
('1cc2250a8a730ab93ae6a79cb3577f441a4c7b3992cc586e86baeb906c89f0749c8ad39787d6ed72', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:15:21', '2023-09-02 09:15:21', '2024-09-02 16:15:21'),
('1d4b84ddd51b9c5470888c78e0f9bfbfddbb62d883c5b515be8c4c63dacf0db03ed611daa6a99082', 1, 3, 'nApp', '[]', 0, '2023-08-09 01:00:05', '2023-08-09 01:00:05', '2024-08-09 08:00:05'),
('1d4dffa28f07729bb3d9ef6ba1ff7498a661d71858447a9622299ff1fd8eaf002c04248d870175af', 1, 3, 'nApp', '[]', 0, '2023-09-02 20:03:12', '2023-09-02 20:03:12', '2024-09-03 03:03:12'),
('1db0ee1ac58c818512db0a511065a2c5fdd2a4d22c4b06c599e8cedcc7015be727d4ed697a654520', 1, 3, 'nApp', '[]', 0, '2023-09-02 07:55:28', '2023-09-02 07:55:28', '2024-09-02 14:55:28'),
('1e34167f300b8a0d064785d8a153bdffb3255a5f3a9d7075c13d9d2c46f5c99724f2c9c780b3f636', 48, 3, 'nApp', '[]', 0, '2024-01-09 07:11:34', '2024-01-09 07:11:34', '2025-01-09 14:11:34'),
('1e7f0709d2c47b05cad9c6104e95c6be7ce0615c9031e2fe230c75953fe3c606370a074fef70321b', 161, 3, 'nApp', '[]', 0, '2023-12-05 00:40:40', '2023-12-05 00:40:40', '2024-12-05 07:40:40'),
('1e872daee0570880d3b6f8fdc0bcc0195e5b47c00189d0ca3610ffcd02d8aff4a198392518383385', 6, 3, 'nApp', '[]', 0, '2023-08-07 18:11:36', '2023-08-07 18:11:36', '2024-08-08 01:11:36'),
('1e8966d108784ed7105578cb8b9ca7f3bbfeb5781c38a07eaa99718866cf64a1eaf116ed52df0063', 151, 3, 'nApp', '[]', 0, '2023-10-18 16:49:07', '2023-10-18 16:49:07', '2024-10-18 23:49:07'),
('1efb42811d2944474f2645393ecefe9a6f3e2238497e90ff261eb82b45908b454a731179f2c5e254', 161, 3, 'nApp', '[]', 0, '2023-11-29 01:42:22', '2023-11-29 01:42:22', '2024-11-29 08:42:22'),
('1efc203b06046211245b603b663b0a635c774e1d13aa2b2d601d4f653eb9bf30d0afc8df23803d8c', 1, 3, 'nApp', '[]', 0, '2023-09-02 08:13:58', '2023-09-02 08:13:58', '2024-09-02 15:13:58'),
('1f97a20692340ba7e58c7c55f47c65d9a79d6bd68d7542d2fc7bb8cacdf48a26758df0a78c79b2b9', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:16:39', '2023-09-02 09:16:39', '2024-09-02 16:16:39'),
('1fa7658b0a78b63f79f692a1274daacd6d53ba8a49e05207a0938344053d41be230ed36e12fc49f3', 161, 3, 'nApp', '[]', 0, '2024-01-07 17:28:33', '2024-01-07 17:28:33', '2025-01-08 00:28:33'),
('1fd177d897a75833a64c162984eee0e895e349ca88e93620f069c186fc88fc27f881cd5831f81173', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:45:14', '2023-09-02 09:45:14', '2024-09-02 16:45:14'),
('1fe54d545c9bcd9206dcf3eeb0cdeccbb2fc4b84113dd032ea47df0be0eac7e1a73e04ebf65bfb19', 1, 3, 'nApp', '[]', 0, '2023-08-15 20:42:06', '2023-08-15 20:42:06', '2024-08-16 03:42:06'),
('20065dc43b3879d7b5bd7bb3e0b398f00721f905fcb475713e10e9c7aae975ad4da85b3be36561ec', 1, 3, 'nApp', '[]', 0, '2023-09-02 13:42:40', '2023-09-02 13:42:40', '2024-09-02 20:42:40'),
('208fd263ffe69514162b5ccade2e71bc236572658d9ea11cf87081790e791d7d6f98b5f666832da0', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:17:33', '2023-09-02 09:17:33', '2024-09-02 16:17:33'),
('20fc59882e503edb4fb54c7e98d3e820020fa777f58c73d222907b4a0bb0280ed7768957c32e952f', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:19:27', '2023-09-02 10:19:27', '2024-09-02 17:19:27'),
('21797135b17f7cde8a2ea242c81f68a1b36a74d8b44c2d7c5e4355ad19d773b36f8f1e356d31afcd', 1, 3, 'nApp', '[]', 0, '2023-11-21 01:55:17', '2023-11-21 01:55:17', '2024-11-21 08:55:17'),
('22054eee0647d98093cf0fcba992fda7648afec312d5a4cb647691f9a1a032e85c5db22b525d6094', 43, 3, 'nApp', '[]', 0, '2023-08-24 14:28:02', '2023-08-24 14:28:02', '2024-08-24 21:28:02'),
('223c5c2a5b0aad2617c5f7bfaec749d58637f94a1d5f10f409e5293e25f2238e31741e0d35ac0195', 6, 3, 'nApp', '[]', 0, '2023-08-07 18:52:05', '2023-08-07 18:52:05', '2024-08-08 01:52:05'),
('226c1c24ab958c9459a425da5043810db67d44443dc5039358817d7be0cb42336455c7bcc1cf723b', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:57:34', '2023-09-02 09:57:34', '2024-09-02 16:57:34'),
('22a4bda5ec3b1252c4e0308d8d0004db88a9194edb99a8bc2e0e9d1a43fb581e6032bc7dc625073e', 43, 3, 'nApp', '[]', 0, '2023-08-25 05:02:24', '2023-08-25 05:02:24', '2024-08-25 12:02:24'),
('22e0e692e818f4b87bfdfa05d18334299ce0d64ad39c2e9822c49254844716adff2084f361975596', 161, 3, 'nApp', '[]', 0, '2024-01-14 18:37:59', '2024-01-14 18:37:59', '2025-01-15 01:37:59'),
('23012b4321f4b027f70e78625a3b0854d340014dcfc9e1b1c1c6b3b1a8e48217fd1b421ea378427c', 161, 3, 'nApp', '[]', 0, '2024-01-04 20:28:32', '2024-01-04 20:28:32', '2025-01-05 03:28:32'),
('232c86fb6f44c3facca7b063a42683eaff5427948fe960c3610d1c5db2276377a80aafe13a527706', 48, 3, 'nApp', '[]', 0, '2024-01-22 20:51:16', '2024-01-22 20:51:16', '2025-01-23 03:51:16'),
('23811d16c4cb25cb60c7872a18ad7bed6bfc2a9293c1c22c9260ee40cdb7172ba6756019e2823c77', 1, 3, 'nApp', '[]', 0, '2023-08-15 17:41:17', '2023-08-15 17:41:17', '2024-08-16 00:41:17'),
('238611ef672cacac4518a63de461888ca94415166164e1323aa8d380828a5cb4acd2214b45c7c92a', 1, 3, 'nApp', '[]', 0, '2023-08-26 18:10:23', '2023-08-26 18:10:23', '2024-08-27 01:10:23'),
('23d503ce25e75615022ebe4a970d367b04efa3287486d58801d7b87ffc2d31b85f310a3c63c2ac0b', 56, 3, 'nApp', '[]', 0, '2023-08-17 23:51:06', '2023-08-17 23:51:06', '2024-08-18 06:51:06'),
('23d83f76b8e5b5bc0c93082adf1359f97fb5d5390e53e806f3a16418c9b7c3f5718c3d9a22f8bff9', 161, 3, 'nApp', '[]', 0, '2024-01-09 23:52:12', '2024-01-09 23:52:12', '2025-01-10 06:52:12'),
('23fa0a08f76cba73fe39b934cd9076d24d6d446e1b9282b52ab55df6ab9531c5e537d307464346e2', 161, 3, 'nApp', '[]', 0, '2024-01-09 22:23:04', '2024-01-09 22:23:04', '2025-01-10 05:23:04'),
('244839ef0e1e48d51c27ebebf149017c2997d88e30f52e28179bf267d5aae3d22966c1df94709214', 161, 3, 'nApp', '[]', 0, '2023-11-29 20:36:55', '2023-11-29 20:36:55', '2024-11-30 03:36:55'),
('2454114f00f268d3b2c3b18736cde3d6c17a260443fa0ad94365043a335c4fd4c91824f80133409c', 1, 3, 'nApp', '[]', 0, '2023-08-28 00:03:31', '2023-08-28 00:03:31', '2024-08-28 07:03:31'),
('2480ef7b04d501de48b99e8f1c8eb2e69f15f042d4fd520cc02eae5b2b31632fe9572b66a6c20c83', 6, 3, 'nApp', '[]', 0, '2023-08-08 01:00:47', '2023-08-08 01:00:47', '2024-08-08 08:00:47'),
('24a0e1e0de14e7e651f09c0d376747fc16ff26819af2ebf783f51bc3700362741c72354ea2cd770c', 161, 3, 'nApp', '[]', 0, '2023-11-30 14:38:28', '2023-11-30 14:38:28', '2024-11-30 21:38:28'),
('24e3a8cd1679d717dfd766241ae38fd708eaec5546e1b8c71d940cfee0dfed30216f5ef84fc4d98f', 1, 3, 'nApp', '[]', 0, '2023-08-16 00:25:43', '2023-08-16 00:25:43', '2024-08-16 07:25:43'),
('250d911814ef85a76ca36ff04545de80d333b45082590d68404c1b09e7bb0e5bbdfd4d5d9a6c9644', 161, 3, 'nApp', '[]', 0, '2023-12-04 21:42:43', '2023-12-04 21:42:43', '2024-12-05 04:42:43'),
('25485a35975021a65fe3be2301e6cdcf6860c9380f53894248c5a6f4f30fa129cc5036e8294e7a17', 1, 3, 'nApp', '[]', 0, '2023-08-21 23:40:54', '2023-08-21 23:40:54', '2024-08-22 06:40:54'),
('25a631a56f8f12a6c2bac760999451c406eafa2b41e9477db66bdc6c9a0d99ec7c2dc8597c4290bc', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:28:13', '2023-08-16 23:28:13', '2024-08-17 06:28:13'),
('25b32585118552a8bb8dbd117a88b3dc6e6c94422e66adc678fd8ce000b7fada45493c50fe9ef2f8', 161, 3, 'nApp', '[]', 0, '2023-11-28 18:42:32', '2023-11-28 18:42:32', '2024-11-29 01:42:32'),
('25b3fbfdac22a4282f3f2aa04faf1b2ad795fb8694b266f56dec357d719f64c232fccb1a7363c5c2', 43, 3, 'nApp', '[]', 0, '2023-08-16 19:35:31', '2023-08-16 19:35:31', '2024-08-17 02:35:31'),
('268bf96c0f6a61d371f0367eb9357019264f570306f064980c32a1ab8ad833379f39e434b836a4ec', 1, 3, 'nApp', '[]', 0, '2023-09-02 14:28:20', '2023-09-02 14:28:20', '2024-09-02 21:28:20'),
('26ac91f09a4a88e5c69df48639a35c777691d3527b7fdbf395538ba17f1a18789493c6922e71cf86', 1, 3, 'nApp', '[]', 0, '2023-08-24 19:12:02', '2023-08-24 19:12:02', '2024-08-25 02:12:02'),
('26fe42128fa23b40fd9e04e2600922dfd89226ad50286e963800212ffa14b1d2012859e2ac6200ec', 51, 3, 'nApp', '[]', 0, '2023-08-17 10:32:13', '2023-08-17 10:32:13', '2024-08-17 17:32:13'),
('270191fa397d42e25c099ab04c93c9fba20a7a2f697ca24e558a383c22bde1dc4fcbb4f40a0277f6', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:23:07', '2023-09-02 09:23:07', '2024-09-02 16:23:07'),
('273ded8c94ffa58c2c3fb1381f24557cbb33350d87e1b0704491d361660c81837b9bca7f27f138ff', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:54', '2023-09-02 09:23:54', '2024-09-02 16:23:54'),
('279d2f47c6516d1b8c95fd99cebba3d07a87d620b8e97eced43665ba20382a75719441a37ac010cf', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:24:46', '2023-09-02 10:24:46', '2024-09-02 17:24:46'),
('27a3f7c6e3a16d49cd49507dffed29efc9a128a31d29877302045a81f269e046c9bc49bdf7b12d20', 1, 3, 'nApp', '[]', 0, '2023-08-14 23:39:12', '2023-08-14 23:39:12', '2024-08-15 06:39:12'),
('27e5744f2f0dcbf96f3f934ba71815b2e04768173391fcb34a4b484147529fe3227b4d42f67920bf', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:06:36', '2023-09-02 10:06:36', '2024-09-02 17:06:36'),
('282975cd25d8f23423dfcd4c8b1c3c7d3d2ec88b848b21f8df270a5a43241e42cd225ecf8b7a46b7', 161, 3, 'nApp', '[]', 0, '2024-01-04 18:16:20', '2024-01-04 18:16:20', '2025-01-05 01:16:20'),
('287d2401f1c266dcba3589fad570bd89e9ff5c51f72c2b1d093d72283fc860f52049539dc44ebd72', 1, 3, 'nApp', '[]', 0, '2023-08-17 21:47:56', '2023-08-17 21:47:56', '2024-08-18 04:47:56'),
('28e0e2e9d85bc31f2fdeecb64f4e07fc4d97afb8e886fdda0a21c503ab8425bcfab39450511e373e', 161, 3, 'nApp', '[]', 0, '2023-11-29 06:00:20', '2023-11-29 06:00:20', '2024-11-29 13:00:20'),
('290e4d53ef689f1ed4608012220971a73b318bac5f93350c152a074ffaa5e2cbdd935768915de9d0', 1, 3, 'nApp', '[]', 0, '2023-08-25 05:23:56', '2023-08-25 05:23:56', '2024-08-25 12:23:56'),
('2918808cd7ae55c2fae41c1d9775ad0052ae2167b678e13f8e65f255280a8f8e9aaeb41e098985cd', 1, 3, 'nApp', '[]', 0, '2024-02-02 19:05:19', '2024-02-02 19:05:19', '2025-02-03 02:05:19'),
('2b5b7789c8978fef3ddfb68931224bbf4293fc24df3b8d575ed789b6ebabc0f643b01e0e90a7bddf', 1, 3, 'nApp', '[]', 0, '2023-11-29 01:20:50', '2023-11-29 01:20:50', '2024-11-29 08:20:50'),
('2b71ccd00e9ccfbd5cfeec070bbde6a40fcb9f6ca0945aed0c5a3126331d4561f4d69805321c3a15', 43, 3, 'nApp', '[]', 0, '2023-08-26 04:14:56', '2023-08-26 04:14:56', '2024-08-26 11:14:56'),
('2b7af68cd062f29d06abbd73078883b0fda013d8fef2e68b4b7cad3bb63ab289302bf808c1059c6f', 161, 3, 'nApp', '[]', 0, '2023-11-29 00:52:24', '2023-11-29 00:52:24', '2024-11-29 07:52:24'),
('2b9460bf5f39606ed411835aa9d0a5b589e0050f6a0a99555566af493fd4195faac71ada005d8a67', 1, 3, 'nApp', '[]', 0, '2023-08-15 20:39:15', '2023-08-15 20:39:15', '2024-08-16 03:39:15'),
('2be3a41775fb6384a013e20a0ed6ad4a92407b971ccf8b0717f5fef53eb03fa37ab4860c1fad9567', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:13:04', '2023-09-02 10:13:04', '2024-09-02 17:13:04'),
('2c05bcbd6c7b705ebc49e2c608b5b54a3f997253856011251fc064f28406ca040ab4a30316f40482', 161, 3, 'nApp', '[]', 0, '2023-11-28 18:26:29', '2023-11-28 18:26:29', '2024-11-29 01:26:29'),
('2d3cc4c68606a86740805f2c7e63edcdeba375c74f7d8445e7c4b6f60057372d963436b6e83d2dae', 48, 3, 'nApp', '[]', 0, '2024-01-25 18:36:59', '2024-01-25 18:36:59', '2025-01-26 01:36:59'),
('2d88b6df8984e2215acbd8f51dcbd9371a06746f8d525c239fbae7bfe64eb7d629932c2d76422260', 1, 3, 'nApp', '[]', 0, '2023-08-25 05:09:35', '2023-08-25 05:09:35', '2024-08-25 12:09:35'),
('2db2b4ff2681f22e9eab35cfb00e25215398cbb97fe6e8d9da60137a86170d1f333c2b4177b52c55', 43, 3, 'nApp', '[]', 0, '2023-09-05 07:58:44', '2023-09-05 07:58:44', '2024-09-05 14:58:44'),
('2dc40e56a059f46b42acce68b53ccbe5a171d84880e154c40bcceaf0e7b527ed6016f2408a41bd08', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:57:55', '2023-09-02 09:57:55', '2024-09-02 16:57:55'),
('2e15aba415fc4d00ba01abbec2213dd28d80ad3a72c68353a7065002b5db530113b89ba5cddc0e80', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:16:42', '2023-08-16 23:16:42', '2024-08-17 06:16:42'),
('2e715f1403849c2a36a82ff3672ed34179622f152887e3f93d42b4dabf8c937bc5bfcab451cb1fb9', 161, 3, 'nApp', '[]', 0, '2024-01-05 20:47:27', '2024-01-05 20:47:27', '2025-01-06 03:47:27'),
('2f0178e82301afaf1a311b2064f2e07d7da7ea22708b87296d56d9bd777c56c279afb8acb3ff5b27', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:45:12', '2023-09-02 10:45:12', '2024-09-02 17:45:12'),
('2f4da3db8f5f24d11a85dbd74aff232b14fb1a8aa298a212cbed46c96cf5b22115afe4d731e62c27', 1, 3, 'nApp', '[]', 0, '2023-11-29 01:05:22', '2023-11-29 01:05:22', '2024-11-29 08:05:22'),
('2f601d969b4830b0a4b0f3dd0f8d9c65ef9b0d8a05714b41ab2ac3762f0f0ca9474c11e857ac92de', 1, 3, 'nApp', '[]', 0, '2023-09-02 20:35:24', '2023-09-02 20:35:24', '2024-09-03 03:35:24'),
('2f69b8db823b4c65b224624afe9010f4b8dc5ec50daf64970277985f8c8c344396b353ca513eec55', 161, 3, 'nApp', '[]', 0, '2023-11-28 17:40:57', '2023-11-28 17:40:57', '2024-11-29 00:40:57'),
('2fb16ffc09d377d8294e9cf08a029440c960b4913779d6ae66449aaa7a92f79d22c7d62012a4fa78', 1, 3, 'nApp', '[]', 0, '2023-08-24 00:00:54', '2023-08-24 00:00:54', '2024-08-24 07:00:54'),
('2fc49aa8a9e77ca086054d9ca1dd4c880257490b1e3c41d63f643075308658744d8f2b3afc914c9b', 1, 3, 'nApp', '[]', 0, '2024-01-31 23:23:47', '2024-01-31 23:23:47', '2025-02-01 06:23:47'),
('2fd47be7b06b5d035f5e2fbb9cc474d538f8e7ee475b2e748bd4d42a4a5bf23a3430be2e6bc96e77', 6, 3, 'nApp', '[]', 0, '2023-08-07 01:50:41', '2023-08-07 01:50:41', '2024-08-07 08:50:41'),
('2ff5061554531fcc898d2ba5bc72342b61eb76dd0a470ae3f628466b9bd9371a804ea472a176092c', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:48', '2023-09-02 09:26:48', '2024-09-02 16:26:48'),
('30017f465bb863ccfc63221433a074c1e9568f23f1840547d1102126cbe1c7ee47f29a97abde965f', 161, 3, 'nApp', '[]', 0, '2024-01-07 19:27:01', '2024-01-07 19:27:01', '2025-01-08 02:27:01'),
('30488efd10fd05a333401251a8a5bf1b08a9e46cc9a92c203168a0bcbddfbbe40fd604b82123f909', 43, 3, 'nApp', '[]', 0, '2023-08-26 15:32:08', '2023-08-26 15:32:08', '2024-08-26 22:32:08'),
('30a53e46f14ebb3293b8ef041746698413c4c5f506ea5c61f3960f739f932c86b48f910cc4e24863', 161, 3, 'nApp', '[]', 0, '2024-01-11 18:28:06', '2024-01-11 18:28:06', '2025-01-12 01:28:06'),
('30e523c55d369f3d9ee8010f9f0d90ef67fd5d804c7a8531c3abfdb103d39988ca5abcf3f517a3ed', 1, 3, 'nApp', '[]', 0, '2023-08-11 20:19:05', '2023-08-11 20:19:05', '2024-08-12 03:19:05'),
('310fe7e745a39dc707f23a9776201f0ad1bc306292c8e8db9cdec05b8de4b667ba4a2aa155d8c125', 1, 3, 'nApp', '[]', 0, '2023-12-04 18:01:42', '2023-12-04 18:01:42', '2024-12-05 01:01:42'),
('3160c8ee62aea4d60cf45a7ead0e3db1d84bb9910623c95a603c53a4dd05596ac4e622d17a9ce115', 182, 3, 'nApp', '[]', 0, '2024-01-24 19:27:24', '2024-01-24 19:27:24', '2025-01-25 02:27:24'),
('3217b7e45ff8356f7c00ddee5e99f091e576c9b6cc90e2612bf561aa71049aadedf0241f46814128', 1, 3, 'nApp', '[]', 0, '2023-08-20 23:18:00', '2023-08-20 23:18:00', '2024-08-21 06:18:00'),
('32245bd8ad0e0958445cbca88ebe5410be7759f84d023f5e22fc20887c72b137878b625f0c20b45d', 6, 3, 'nApp', '[]', 0, '2023-08-07 18:52:20', '2023-08-07 18:52:20', '2024-08-08 01:52:20'),
('32469de5ccfb3aef7c3875de95eb40011a6459e338497fd3d0003d0b76ebe419ab9d0c942a7aaef2', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:06:37', '2023-09-02 10:06:37', '2024-09-02 17:06:37'),
('324ac15ea6b9b7597e8f2110b8dcff4654cd1357e9beed3d08c301af92060912a12345c845446889', 1, 3, 'nApp', '[]', 0, '2023-08-17 22:06:28', '2023-08-17 22:06:28', '2024-08-18 05:06:28'),
('32c85d2610739f8870f09e18479a2642d3c595c03d64e38431eef75e4215cd5d0c4259f1e4e74e32', 43, 3, 'nApp', '[]', 0, '2023-08-26 08:24:11', '2023-08-26 08:24:11', '2024-08-26 15:24:11'),
('34332c2fae456fc02acc79bc02a0d3f7d07c372d9aa2a8a4593f91f6f9bf9b676edb482f8f814e4d', 161, 3, 'nApp', '[]', 0, '2024-01-27 07:29:54', '2024-01-27 07:29:54', '2025-01-27 14:29:54'),
('350bfecdcf5c09393c25f77125684abfc9c428ee2a5e4703779619bfc5f462b7310d34a239981d3c', 161, 3, 'nApp', '[]', 0, '2024-01-13 16:41:33', '2024-01-13 16:41:33', '2025-01-13 23:41:33'),
('35f2f74d6f188544492f269dd5a2d18ac452941fd13a7c31bc4439e978bd5d5d0e6ea2b33b5dd093', 1, 3, 'nApp', '[]', 0, '2023-09-05 09:10:28', '2023-09-05 09:10:28', '2024-09-05 16:10:28'),
('3615ad7d3f0840b335e539e9bd222481c804ebc674a4c0401a0f3092e31468fce12fe602f0ee70bc', 1, 3, 'nApp', '[]', 0, '2023-08-17 22:06:46', '2023-08-17 22:06:46', '2024-08-18 05:06:46'),
('366f4c8c42fcbe2b6215d29cba6e8062ce98fadeb2316685e5fc1477cf5b04100031920e235bfc1c', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:17:41', '2023-09-02 09:17:41', '2024-09-02 16:17:41'),
('367421dad4512c0c45c3cc639cba9dcb57635e97c42534efbf8c4761cd480f6a03047ff17ad82851', 1, 3, 'nApp', '[]', 0, '2023-09-02 20:06:09', '2023-09-02 20:06:09', '2024-09-03 03:06:09'),
('369e4952d0d776c3eedac3d17218476fc3dbb1e4816dc004a00194609c15a9a2811de3eda24d9091', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:49:15', '2023-09-02 10:49:15', '2024-09-02 17:49:15'),
('36a686fd0c2edf68e49ca8e041225772a3c46406eda01e546b5c17c155cba4ecb4847c57bdd5ab55', 1, 3, 'nApp', '[]', 0, '2023-08-15 23:01:01', '2023-08-15 23:01:01', '2024-08-16 06:01:01'),
('36a6d308f520ebfda2b8bee45f0ca7b03cb3748db4f9d68e851e9f7293a49a1bea081afd50ee635c', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:08:06', '2023-09-02 09:08:06', '2024-09-02 16:08:06'),
('36bfc0771c5006912b7182ad7abe6518aa959a2919937163d04a10d1d5eb950ece87cb4a25354ea1', 161, 3, 'nApp', '[]', 0, '2023-12-02 02:03:34', '2023-12-02 02:03:34', '2024-12-02 09:03:34'),
('373942fae216964308e36210d3349373591d7e01d5f8d6a9484da0acbe16d97349f6a0f0ba5c17fc', 161, 3, 'nApp', '[]', 0, '2023-12-03 00:34:44', '2023-12-03 00:34:44', '2024-12-03 07:34:44'),
('37531385febb0b014e30321ead39a8e2435a56c983b0f657b7090eb8d03826510216616690425b8a', 1, 3, 'nApp', '[]', 0, '2024-01-30 21:08:30', '2024-01-30 21:08:30', '2025-01-31 04:08:30'),
('37b2a2ebe71aebe5dc9caa2efe999fb7ef664fca99d122e88eed3a3846a33367115197271d1b0dc2', 161, 3, 'nApp', '[]', 0, '2023-12-05 00:59:06', '2023-12-05 00:59:06', '2024-12-05 07:59:06'),
('3836eb050e42b0f4beabee976c904c800c756b97e2e740a5537d1b7cd619be270ab282c63882904b', 1, 3, 'nApp', '[]', 0, '2024-01-23 18:54:27', '2024-01-23 18:54:27', '2025-01-24 01:54:27'),
('386314ac0b92919998978732583d87ec2c7e8602f2556d2e043be616cd8bb2549cb2dc1962dc1621', 1, 3, 'nApp', '[]', 0, '2023-08-09 00:59:29', '2023-08-09 00:59:29', '2024-08-09 07:59:29'),
('38760925f1e4ce03ffb565fab15b1099f41a8bc20f29f15a5056e2026e2ff4826d5d5cd6933e1850', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:02:56', '2023-09-02 10:02:56', '2024-09-02 17:02:56'),
('38804d6223d152f47ff450984b0e3e744cd2e90b7a922a4de3203ae65c98243bb3a80b27e2b19472', 1, 3, 'nApp', '[]', 0, '2023-09-02 13:41:42', '2023-09-02 13:41:42', '2024-09-02 20:41:42'),
('392c8d78d640496866b9657e7bd10777e7c787709e36f9b25972cb8d918ee58280947707158e1eff', 43, 3, 'nApp', '[]', 0, '2023-08-26 08:26:05', '2023-08-26 08:26:05', '2024-08-26 15:26:05'),
('3978aadd62e6384fef69d311f169381d2ce46f517ee8ab52cc8112586e386ee5892df067a98d4b82', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:23:19', '2023-09-02 09:23:19', '2024-09-02 16:23:19'),
('3980cc6e979c79e1bbca66f84418231a28eb45ece16c66c4d19bb24da9fd193c6a69c5877dad3141', 43, 3, 'nApp', '[]', 0, '2023-09-03 10:49:02', '2023-09-03 10:49:02', '2024-09-03 17:49:02'),
('39c853e0e0a0e937595595c6eb927f0c1c85412001e46d5ba23c8b149dead07c64eda8653bcb2baf', 6, 3, 'nApp', '[]', 0, '2023-08-07 19:01:08', '2023-08-07 19:01:08', '2024-08-08 02:01:08'),
('3a019d68d3ad9163ea99acc5356184eb7a59337ea1bccc2e9c54be4acf81edbc86c2f96e101e01f7', 1, 3, 'nApp', '[]', 0, '2023-09-02 22:33:38', '2023-09-02 22:33:38', '2024-09-03 05:33:38'),
('3a033cce6dd42fadbb21b70daa982c74e73728ad440e54f864902cd67da8e4d916881d0ba5c5fca2', 48, 3, 'nApp', '[]', 0, '2023-08-25 23:04:33', '2023-08-25 23:04:33', '2024-08-26 06:04:33'),
('3a102d53d4ddc7670f0a329c7c89b0a5a63616007f82c9fe460fd2c82f08697d941f1666bde5e786', 48, 3, 'nApp', '[]', 0, '2023-08-25 05:02:10', '2023-08-25 05:02:10', '2024-08-25 12:02:10'),
('3b330425d56a4058c66a91cef96054a35d5ce7fa73f26dd0333210f94370fe0152e7430ba8d2d83d', 125, 3, 'nApp', '[]', 0, '2023-09-02 20:43:55', '2023-09-02 20:43:55', '2024-09-03 03:43:55'),
('3b82a50a45f4503d77bb5f3617ee91a0ff0aa9313f7e941cad5f1ada77c576a7fc0776559ab88909', 1, 3, 'nApp', '[]', 0, '2023-08-31 18:05:51', '2023-08-31 18:05:51', '2024-09-01 01:05:51'),
('3bb6c2e80966a5dc0f9077431f05011ff9f8be06fc12427a33a57b151b6b583d6f1b60ed18c371aa', 48, 3, 'nApp', '[]', 0, '2024-01-08 21:05:47', '2024-01-08 21:05:47', '2025-01-09 04:05:47'),
('3bcd55d2d70ae43a691210be6f2635a8bb1c977580b09229ac9b97bb4479fa860a778402e9cde45f', 161, 3, 'nApp', '[]', 0, '2024-01-08 18:28:29', '2024-01-08 18:28:29', '2025-01-09 01:28:29'),
('3c5877508957150baf1168ac63cbbb59197dcc7b38cd59ef1a26df85b31067d94333e853b0263ae3', 1, 3, 'nApp', '[]', 0, '2023-09-02 13:48:40', '2023-09-02 13:48:40', '2024-09-02 20:48:40'),
('3cb05eccb0752302732b2082bd395bda96e2366307e56052331d24561305db0d3fad61b7136646d6', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:46', '2023-09-02 09:23:46', '2024-09-02 16:23:46'),
('3d00b0c1b44367f4ef60ffd3abbe7c7676be08eeb3da8c85edc0c9e3f6ccae8a7446a8a83b53ed2b', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:07:10', '2023-09-02 10:07:10', '2024-09-02 17:07:10'),
('3d6b2872ddfc7c3de712471f355673be8ca1b4d475ea0355c43a6d72e94be74e1442cf86f531d8e2', 161, 3, 'nApp', '[]', 0, '2023-12-04 14:52:26', '2023-12-04 14:52:26', '2024-12-04 21:52:26'),
('3dbff48adc738106388dbf6d9be747333cbdcd60517bcf2631b6d383c5cb9133c464cff83f7c1e00', 161, 3, 'nApp', '[]', 0, '2024-01-12 05:45:16', '2024-01-12 05:45:16', '2025-01-12 12:45:16'),
('3dda8e3763e0556ccc877f72b041565d137063283e622238680a8324e63502cbb867f893152c1ab8', 161, 3, 'nApp', '[]', 0, '2024-01-08 19:47:15', '2024-01-08 19:47:15', '2025-01-09 02:47:15'),
('3e460d9a145ab15fa3d2dd979d3aa0e5ba919efc1618f75997bcad5056744dac0e4499f5abf622f3', 1, 3, 'nApp', '[]', 0, '2023-08-16 21:30:12', '2023-08-16 21:30:12', '2024-08-17 04:30:12'),
('3ef7e3810811a9db46b00ad8952ea5ffe61aa06062c2b716e0fe9a29d8d7cb6d7a426e0a44321efa', 1, 3, 'nApp', '[]', 0, '2023-08-24 00:09:07', '2023-08-24 00:09:07', '2024-08-24 07:09:07'),
('3f31e537508997a0b8e343e62f35b471ea7a4ebb2ac3e433f1222adaffa85d43e52e553ae853a276', 1, 3, 'nApp', '[]', 0, '2023-09-25 17:52:43', '2023-09-25 17:52:43', '2024-09-26 00:52:43'),
('3f5211178049224527e84de746e83bbdbd2218c63eed1c66bd3c2b9217adf6557eb07f45b60267ca', 48, 3, 'nApp', '[]', 0, '2023-08-25 05:33:33', '2023-08-25 05:33:33', '2024-08-25 12:33:33'),
('3f5dcb38643136ce3aed42cb10dc13dd0008aadf8fc8d6c68bee80c986462160047010795601211f', 1, 3, 'nApp', '[]', 0, '2023-08-15 14:28:59', '2023-08-15 14:28:59', '2024-08-15 21:28:59'),
('3f9f6194762e5a9a1fd46974ca87b366bb3432f70e7f3523fe030810df0621b579146a4bc6b6d4c6', 1, 3, 'nApp', '[]', 0, '2023-08-17 22:02:08', '2023-08-17 22:02:08', '2024-08-18 05:02:08'),
('40217f540f12ba0bff08aecda4b0e2cec626c542fa4fe9b27a3f3dc79373130ffb5fec5a76b2f171', 43, 3, 'nApp', '[]', 0, '2023-08-26 08:11:18', '2023-08-26 08:11:18', '2024-08-26 15:11:18'),
('413cbde29045ee858a74d43609d23fc5d8ea8bb743dabbd1e9450ea11a100870701cdcea4e651184', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:49', '2023-09-02 09:26:49', '2024-09-02 16:26:49'),
('4171e058aadf0ebaf5ae488b945916b4ac40afc5dda55520a04e59eda466f93d3ae733a355a28255', 182, 3, 'nApp', '[]', 0, '2024-01-24 19:28:13', '2024-01-24 19:28:13', '2025-01-25 02:28:13'),
('419a7214a99d84aa03782d38d0e1ef00242b6c198563b89ddad646450443b3b52c8209cbe9ba30d8', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:14:58', '2023-09-02 09:14:58', '2024-09-02 16:14:58'),
('41b3b233ed68ed1fc80f6329bda1d58ea73591cbf5f03577448daae94b4ed6ed606d4672885c4985', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:43:39', '2023-09-02 10:43:39', '2024-09-02 17:43:39'),
('41ccf69d39e851249061d0b3883d2371b18f36ae9cf550471c21fdfebf6110392e145e5585a74391', 161, 3, 'nApp', '[]', 0, '2023-11-29 05:30:58', '2023-11-29 05:30:58', '2024-11-29 12:30:58'),
('42b8ded82d4ba1da9ee271d54053e334431dcb99f006f50d580045901c8b826fe9a881f7c0f610f9', 1, 3, 'nApp', '[]', 0, '2023-08-09 00:59:28', '2023-08-09 00:59:28', '2024-08-09 07:59:28'),
('42fecb58933f5e1a79653e14fd595bff48f864be5000dd35a1428f412d9488d929287487568bfd54', 48, 3, 'nApp', '[]', 0, '2023-08-25 05:28:27', '2023-08-25 05:28:27', '2024-08-25 12:28:27'),
('43b2d24d4d7976e8bcc495cfe118206f926e33ff513f7303f9845000d23d9819f8146f93fa5ee290', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:08:15', '2023-09-02 10:08:15', '2024-09-02 17:08:15'),
('44ff17a73d2df36d05989ae3679911df1fbd1a30873a9fc5f949ae0381b999f43f762bf1e6bcb61c', 171, 3, 'nApp', '[]', 0, '2024-01-06 18:52:23', '2024-01-06 18:52:23', '2025-01-07 01:52:23'),
('453a37020294cf4b2f7fd4d11ea7954959ae4d97c4a4f478b92631b0f60c5ea8e77157a7d401649a', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:18:52', '2023-09-02 09:18:52', '2024-09-02 16:18:52'),
('458afcbe9420f37893cd6926ff9117dd0953e0abc36490ed690db5bb01a3cb02bc6f20fc23a40fff', 1, 3, 'nApp', '[]', 0, '2023-08-15 17:51:12', '2023-08-15 17:51:12', '2024-08-16 00:51:12'),
('45f8d63056bb4df3b933f131161d856b390d15b6edd6fe2fd63e285b269600b9a361b16eb34557f7', 43, 3, 'nApp', '[]', 0, '2023-09-06 21:16:47', '2023-09-06 21:16:47', '2024-09-07 04:16:47'),
('46010e51b0365ec27e4539cfa4d1a906d6bf379a47805fb1e40cd2a188f539c1efa7535eb4dcfa04', 161, 3, 'nApp', '[]', 0, '2023-12-04 23:37:38', '2023-12-04 23:37:38', '2024-12-05 06:37:38'),
('46f45c4273ea463730de7d14eb1afa4a6c818af1e507896aa5171417eeca3d765c3a3139fe5e6869', 1, 3, 'nApp', '[]', 0, '2023-08-17 21:46:49', '2023-08-17 21:46:49', '2024-08-18 04:46:49'),
('472107b4f75bd60f1156e46ddd3487a6420049d1e3c843c53421c9fd51fd9f08c6ed2ac51b334454', 56, 3, 'nApp', '[]', 0, '2023-08-17 23:53:52', '2023-08-17 23:53:52', '2024-08-18 06:53:52'),
('475db6895b29e112c4729b659aefa560b11715978ada7c8fb6d5e726109f9454b5e58a7264f50897', 124, 3, 'nApp', '[]', 0, '2023-09-02 00:24:23', '2023-09-02 00:24:23', '2024-09-02 07:24:23'),
('479328f8578c09feb72415d067c16933e17c93b7bb42815286832571d2a24d2f722e60ff8bf3a431', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:17:24', '2023-09-02 09:17:24', '2024-09-02 16:17:24'),
('47d4bde7c50b88800f049be59a10d4742bff34d25e51e6d764d1746bd58ab56824abfa81a8bfd248', 1, 3, 'nApp', '[]', 0, '2023-08-17 21:49:25', '2023-08-17 21:49:25', '2024-08-18 04:49:25'),
('47e2d24faf2ca798d606816d80754b22a0d833ae01f35e3c639e15a13944cab3877b0f73d4db42ab', 161, 3, 'nApp', '[]', 0, '2024-02-01 20:32:41', '2024-02-01 20:32:41', '2025-02-02 03:32:41'),
('47f205d7bacae626e25e321826490ce9263c7bd7c4511ee4d1a1da102c3da2e128f20708aff80a71', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:06:39', '2023-09-02 10:06:39', '2024-09-02 17:06:39'),
('48229f91e007578b3ddaadefb5220c5658f10cc393f84df0f429acd8aaf5a98d9a9335dfdf9f85e7', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:59:50', '2023-09-02 09:59:50', '2024-09-02 16:59:50'),
('48627c4534ecc48a1b18dab7d59fdc44fe66d51ed1ea019e0a47cb8864e5c76af7de2a255d9254c6', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:53:48', '2023-09-02 10:53:48', '2024-09-02 17:53:48'),
('4899be54879a10178e117be60e6bf9b6fc81b260b67ec25c6f3b2fc926dada871b9602ba939d3cf7', 43, 3, 'nApp', '[]', 0, '2023-09-25 22:11:59', '2023-09-25 22:11:59', '2024-09-26 05:11:59'),
('49253e7a49a1c65fd55172ad767dc904be517e55bffca9f9dfcb9e2b1a0a19e0f955320fb4614cfd', 178, 3, 'nApp', '[]', 0, '2024-01-11 18:41:11', '2024-01-11 18:41:11', '2025-01-12 01:41:11'),
('494256dd4d6ac6ea55c94bdf02a2693637a06d6ec72619b8427b981641df1214874a09a8361ffe0d', 1, 3, 'nApp', '[]', 0, '2023-08-25 05:26:18', '2023-08-25 05:26:18', '2024-08-25 12:26:18'),
('499b4d9d6f7fe017f7475094ec3c41ca2aa2bb1e54681e9ab60feb9e2f4b0278c6794c7670144a44', 52, 3, 'nApp', '[]', 0, '2023-08-17 10:37:40', '2023-08-17 10:37:40', '2024-08-17 17:37:40'),
('49b0c1280a4c0554f740d0716352138c6cc8d8ec51c324e8f2c79a50bb31ee5183619a3e2f152fa5', 161, 3, 'nApp', '[]', 0, '2024-01-14 21:13:48', '2024-01-14 21:13:48', '2025-01-15 04:13:48'),
('49be8b5bb9d45fa635511c44358ef4818f9e45e515135cf50295fa14f228e7cf812cde1ccf039b0d', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:13:04', '2023-09-02 10:13:04', '2024-09-02 17:13:04'),
('4a90cee94ea91ca8f0478ced3c4656ca0ca8111c686ea3223af66ca1d5360ecfc9fdc8497737073f', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:47', '2023-09-02 09:26:47', '2024-09-02 16:26:47'),
('4afd016b7f25eb6426db4f23f064d16ad47e6305921dcf1fb2b5bca5fbe028c6a7b28e062a446235', 161, 3, 'nApp', '[]', 0, '2023-11-30 14:31:34', '2023-11-30 14:31:34', '2024-11-30 21:31:34'),
('4b3bc8dcb1a509f6e3c859ffbc0d833fce0a002d39632de738a59500cf088ebc5756290a23d7ca0e', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:48', '2023-09-02 09:26:48', '2024-09-02 16:26:48'),
('4b5ddfe4ea8551423ab5c5f96d1477a976b5b9089bb951bc61c1bcc82236b9f64ebed77c9cd3b6dc', 6, 3, 'nApp', '[]', 0, '2023-08-08 18:13:23', '2023-08-08 18:13:23', '2024-08-09 01:13:23'),
('4bcdbdc8c13dc4f7fc7668372b9235c68df682720c2bb9b26abd4215840346f7c6dd4b293c969c5b', 56, 3, 'nApp', '[]', 0, '2023-08-18 00:16:15', '2023-08-18 00:16:15', '2024-08-18 07:16:15'),
('4bfe576af6d80a69ce3fd23d438413f33d45e72d3d71ebf8316eb3330f73fed89c4231a2f916fd39', 161, 3, 'nApp', '[]', 0, '2023-12-20 01:17:26', '2023-12-20 01:17:26', '2024-12-20 08:17:26'),
('4c6faab32ac37ab7a80d0efec43e98534360a0c614d6a0ec662c82bb25fd8d1cb4cfa508196df6be', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:17:36', '2023-09-02 09:17:36', '2024-09-02 16:17:36'),
('4c8c72dd148b74c6bec944018f95b2e477010aceafa2ac3dc59c58cabe24b65f8b93c0e7f39df43c', 161, 3, 'nApp', '[]', 0, '2024-02-01 20:49:27', '2024-02-01 20:49:27', '2025-02-02 03:49:27'),
('4d2a338b9e99abd7e86c9e10034ae96f4234c1e153da4965f5d5c8e98caf0d8cee4a0381a8b5365e', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:57:35', '2023-09-02 09:57:35', '2024-09-02 16:57:35'),
('4e5704a6639afab449220f35fae2d82af4b9b30e239142fb23bed17969063b6f18aa66dc69e9f364', 1, 3, 'nApp', '[]', 0, '2023-08-31 21:02:09', '2023-08-31 21:02:09', '2024-09-01 04:02:09'),
('4ee990a20716b695a0a6ee6b80e7cf17751d2baf77246bc8c1225722be4d9a087d952b61aa8a56c7', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:45:05', '2023-09-02 09:45:05', '2024-09-02 16:45:05'),
('4efe44ec783ca39e570c1795a016659aa4f3b4b7eca606ff5d18388218e2ce810792c4e303fb7836', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:29:52', '2023-09-02 10:29:52', '2024-09-02 17:29:52'),
('4f430fbf9acee870886779c57ef8573f57055f2507e97dd9e86a02930b76099d93d310799e9a8214', 130, 3, 'nApp', '[]', 0, '2023-09-02 22:42:43', '2023-09-02 22:42:43', '2024-09-03 05:42:43'),
('4ff19affe9dd354b8326ac8345cfbd887624d89f372ac6fa51bf70362c39953453e6488d985ccb61', 1, 3, 'nApp', '[]', 0, '2023-08-15 13:04:01', '2023-08-15 13:04:01', '2024-08-15 20:04:01'),
('50641cfcef28c53ed03048a1897c49c8e495bcfb3afe22fba70ea4af3f5c50bb0c28d085c5913e69', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:06:33', '2023-09-02 10:06:33', '2024-09-02 17:06:33'),
('50745bfc58fab6e0d3f4a5e7680ff1926c6aa550e7b3d4e1b0f92ac2084dac269c6139cd83951395', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:24:51', '2023-09-02 10:24:51', '2024-09-02 17:24:51'),
('5082b280d70234c97ee55c785efc0b8765db9fdbed06919795d9ecef45648456ef47d31994a5f7f0', 161, 3, 'nApp', '[]', 0, '2024-02-04 03:36:09', '2024-02-04 03:36:09', '2025-02-04 10:36:09'),
('5089de625f38943e0c8e232b594e19d60fb6c5e97d897cb717e425ae0c5a79ea5ac189b0ff8d01ed', 48, 3, 'nApp', '[]', 0, '2023-08-28 18:15:35', '2023-08-28 18:15:35', '2024-08-29 01:15:35'),
('50efddf9999e1a8ec3df69849e364d060b5ebdf5dd126bc57c9cb57c359a55ad24690816aa7252e3', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:06:38', '2023-09-02 10:06:38', '2024-09-02 17:06:38'),
('513a29a04b879a917c8601ed79915d7b027dc2e56e3f8c7e3cfc99b6b8649ed22c653ec92fdf8a04', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:49', '2023-09-02 09:26:49', '2024-09-02 16:26:49'),
('517aa8831f024eeb322ccdb140effc8485b274108ea526c74e3ffe35a8b3381da2a9da11079b3e10', 1, 3, 'nApp', '[]', 0, '2023-08-15 17:39:28', '2023-08-15 17:39:28', '2024-08-16 00:39:28'),
('519efcfc7d88118fc1644f579706d04a68c90f8ac1ca57399a2e0c140e4aba8a71a7695bc99b4684', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:15:19', '2023-09-02 09:15:19', '2024-09-02 16:15:19'),
('51b58e4d29e0b8735280760e80b51bd9689aca382b8f05204e1b873dbf48739a2b8d8a1d793aac48', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:47', '2023-09-02 09:26:47', '2024-09-02 16:26:47'),
('51d3cf22c64a37a48327177521499df6b99e4db771a53384790339ceb577996aacc998b86153002a', 1, 3, 'nApp', '[]', 0, '2023-08-11 19:17:32', '2023-08-11 19:17:32', '2024-08-12 02:17:32'),
('51dbd3c0d95a78964795c989500f751fc4965f9c955fc16e89682466387dccf330c16a234335047e', 1, 3, 'nApp', '[]', 0, '2023-09-06 20:59:04', '2023-09-06 20:59:04', '2024-09-07 03:59:04'),
('51dd4424b7ca9cc3666313c744bed0f56846d6f48ad679dc169815447ae3b74331de7657a93da9d4', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:50', '2023-09-02 09:26:50', '2024-09-02 16:26:50'),
('51e717e3bf53c2e399a1720be882114660e57f93b89a3ebf1a5940a929d0e2cdcef8ba1b6782fa8f', 161, 3, 'nApp', '[]', 0, '2023-11-30 14:30:12', '2023-11-30 14:30:12', '2024-11-30 21:30:12'),
('52ec7ae0cf0fa51a2635db750cc8e6b0e80fc5eceebc8b0da11d444eacf3c6fd0bccc9a79d4071b6', 43, 3, 'nApp', '[]', 0, '2023-09-25 17:55:00', '2023-09-25 17:55:00', '2024-09-26 00:55:00'),
('536a8b99310b6a7d9ef2dce6463e67f4d21bcbc5d74e54c868cca58d6b217ca529e2bf4f96fe9485', 1, 3, 'nApp', '[]', 0, '2023-08-09 00:59:19', '2023-08-09 00:59:19', '2024-08-09 07:59:19'),
('5374850f7718fe19b6bb1e1541e5210e19af0789958343f2e78e3b881021d66ac33007553db26eff', 1, 3, 'nApp', '[]', 0, '2023-09-02 08:13:58', '2023-09-02 08:13:58', '2024-09-02 15:13:58'),
('53be1c5ce5f52338b13114d2159ff8aebef64429669ef48024e8ee459cbb68b298708f5842602021', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:19:29', '2023-09-02 10:19:29', '2024-09-02 17:19:29'),
('53cc379a4c77bd864e54b3194b581e2f8c23c588a611961642ea39d3311eceb6b54137b9dbffbf89', 56, 3, 'nApp', '[]', 0, '2023-08-18 00:11:46', '2023-08-18 00:11:46', '2024-08-18 07:11:46'),
('53cceba90a82e26344c828e579bac20245f7a56f1da00c2bbad1a199bc6a1bb62ad3f8f35a6185b4', 1, 3, 'nApp', '[]', 0, '2023-08-24 00:00:38', '2023-08-24 00:00:38', '2024-08-24 07:00:38'),
('53e1b1273a5cb8a9e4fb9a7ad198952fa6d2bc27a23bfd296fa516eb916cea07fa0f096af17985e8', 174, 3, 'nApp', '[]', 0, '2024-01-11 15:14:31', '2024-01-11 15:14:31', '2025-01-11 22:14:31'),
('5403d4561b800263ac230dae9fee8302f99d9b2b07ef6a02e04c4afdc90a9801925508de51740158', 169, 3, 'nApp', '[]', 0, '2023-11-28 21:18:33', '2023-11-28 21:18:33', '2024-11-29 04:18:33'),
('5417747d020335f6000d3c0c97ec0e9172d2db45e4371e89d71e77e521e709678f3496bae78987e1', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:34:19', '2023-09-02 09:34:19', '2024-09-02 16:34:19'),
('548ca819a4c13712ed669346f99e3a6186ef6cdbb630c5ee6829a89d1f567a800573d622f6f4f35f', 43, 3, 'nApp', '[]', 0, '2023-09-03 18:51:01', '2023-09-03 18:51:01', '2024-09-04 01:51:01'),
('54ae6c4e65a8644e6b2b0604f7180495e35adc1fd5710bc73a7af4afec27eedcd1e25a7db5838c9a', 161, 3, 'nApp', '[]', 0, '2023-11-29 00:30:12', '2023-11-29 00:30:12', '2024-11-29 07:30:12'),
('5532c6d20897852bd6855f552d2ccd995c1a5a7da5a961db74baf5fd74be0062038b19b76e7da54f', 1, 3, 'nApp', '[]', 0, '2023-08-31 09:49:29', '2023-08-31 09:49:29', '2024-08-31 16:49:29'),
('553edf6fd06112ef28074b987dcce2d738d7531acc79d469bc8d44a5744a0a00b968f17ed55484d2', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:05:46', '2023-09-02 09:05:46', '2024-09-02 16:05:46'),
('5544ced430fe780202ba534402efa279f97212e552e5291d1a99a4f79dffe0466527ba8f49d77e82', 1, 3, 'nApp', '[]', 0, '2024-02-02 19:26:53', '2024-02-02 19:26:53', '2025-02-03 02:26:53'),
('555dd63541762263ed503a292b9b083e56307a6239ffac474a49111c82102feb8a78f75a36981f0a', 48, 3, 'nApp', '[]', 0, '2024-01-23 18:56:15', '2024-01-23 18:56:15', '2025-01-24 01:56:15'),
('55ee55e770e4bed46f1450b4d96d8e4d7ca39cc0d66b850dfb0e521492d7a838d61a8d055049a858', 43, 3, 'nApp', '[]', 0, '2023-08-25 21:50:16', '2023-08-25 21:50:16', '2024-08-26 04:50:16'),
('5607bed13d99beb50bd6840178a74b068c3df7ce27570a2ce9777151d4245cc8ca939aa210a07ae3', 161, 3, 'nApp', '[]', 0, '2023-11-29 21:01:37', '2023-11-29 21:01:37', '2024-11-30 04:01:37'),
('565754731e7ad07335f900f15457a985de1025a826599b506887303bd5f80d0245957d384d75f004', 43, 3, 'nApp', '[]', 0, '2023-09-04 23:34:01', '2023-09-04 23:34:01', '2024-09-05 06:34:01');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('567b0faf5ae04251b5e2ff13b03c199d338df7a6584905e1124aab72fcb9ed5f3bb29f078ad03e67', 56, 3, 'nApp', '[]', 0, '2023-08-18 00:17:40', '2023-08-18 00:17:40', '2024-08-18 07:17:40'),
('56cb2ad4e5d94e489195a0c8dedf70b5c0a5b2404d3419e40aaec04eb38febf254437c2a1b497ad2', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:17:01', '2023-09-02 09:17:01', '2024-09-02 16:17:01'),
('56fa3e94eb3163afdf0fe90656d8c2b662ede0763a9f5da5126c9983eda2141a57122b8fc5f86a57', 161, 3, 'nApp', '[]', 0, '2023-12-03 01:24:27', '2023-12-03 01:24:27', '2024-12-03 08:24:27'),
('571c1132450d4f0729d9e3ea9417935e6d6d3a62219d649fb51ff8b0dffecc4dc75ff1f184a97f90', 1, 3, 'nApp', '[]', 0, '2023-08-16 21:30:54', '2023-08-16 21:30:54', '2024-08-17 04:30:54'),
('57be874198011605cd95c4c7107aa401aae44b29dcbffedf492c8a580612c61e6e6fa476e313e3cd', 48, 3, 'nApp', '[]', 0, '2023-08-25 05:09:59', '2023-08-25 05:09:59', '2024-08-25 12:09:59'),
('583983e93dd48a7dbef11df3aae913f107487daf2e60f1e255e60d23fa2043aa2527cd9c493b7d1b', 56, 3, 'nApp', '[]', 0, '2023-08-22 23:15:47', '2023-08-22 23:15:47', '2024-08-23 06:15:47'),
('583e1b937e04052b44a01504b324a216db9b2d47ff37b33fa17c5beeacf3ccc346106abb8fffab04', 161, 3, 'nApp', '[]', 0, '2023-12-09 07:50:39', '2023-12-09 07:50:39', '2024-12-09 14:50:39'),
('5926642bc21c4198bed8964870f93b16e4025f5bc551a42708c5229bf2536713c0c52a7284e964f9', 161, 3, 'nApp', '[]', 0, '2024-01-07 17:04:03', '2024-01-07 17:04:03', '2025-01-08 00:04:03'),
('5934e449d27f98dbf05f02e7705ad642ac015fbf7d54d79a35619a159d3c23614709cbbc742dc351', 1, 3, 'nApp', '[]', 0, '2023-08-31 21:02:09', '2023-08-31 21:02:09', '2024-09-01 04:02:09'),
('599beaec4ca57d9dbca9513c9a0d654f6a2fa24165894aaec84525ad53ef57901fd06032cba95aeb', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:18:33', '2023-09-02 09:18:33', '2024-09-02 16:18:33'),
('59abdf6a5b7e8251357f582b90bb7b829c423658a1a6e4f6303431c7eaf26994f80168bb300a95a1', 43, 3, 'nApp', '[]', 0, '2023-09-02 11:00:39', '2023-09-02 11:00:39', '2024-09-02 18:00:39'),
('59ac0ed7a2e8200794929ee3279212be5b0851ee030768b20e99d159e8fd504e39de7b510a9a14f0', 161, 3, 'nApp', '[]', 0, '2023-11-30 14:00:50', '2023-11-30 14:00:50', '2024-11-30 21:00:50'),
('59acbbbad0011cfc29f0bccfc3daa6d7f285a9c8e83bc203e06cde199dfba8179dbb0fd4c0d76527', 123, 3, 'nApp', '[]', 0, '2023-09-01 20:52:33', '2023-09-01 20:52:33', '2024-09-02 03:52:33'),
('59bce74d3080d7cd63f6f12db4a712819ab97e9cfd1fdc6c89b53c72e671d928833469f70bd6315e', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:41:13', '2023-09-02 10:41:13', '2024-09-02 17:41:13'),
('59d1e2b7e6130f3595f3b4d3f020617e7d387ed207291c1246cf5e674d0b92e2c0e87130257cb610', 168, 3, 'nApp', '[]', 0, '2023-11-28 20:58:01', '2023-11-28 20:58:01', '2024-11-29 03:58:01'),
('5a065d0d41899e5c7c7bbc84e69388f25ad19ad73dca18159ef3dc4c323926ff2ee006b95049ae39', 161, 3, 'nApp', '[]', 0, '2024-01-08 19:38:04', '2024-01-08 19:38:04', '2025-01-09 02:38:04'),
('5a3ad4ba6ee04a3ff7abd656ce828a65290a4d0c11e8732025b0db5ee66dbfff4521bb1f0f89ddca', 164, 3, 'nApp', '[]', 0, '2023-11-29 14:29:05', '2023-11-29 14:29:05', '2024-11-29 21:29:05'),
('5ad69f7b985cc6a08920e5614177db10f6e39da9c246e2471a4d51c74521e61120a1fdee758b6401', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:09:28', '2023-08-16 23:09:28', '2024-08-17 06:09:28'),
('5b333b4646da5c9318b27f715ef023a441ff3f6dbb7fabd8992f543c3c3b69c9a43a56a3771487fd', 161, 3, 'nApp', '[]', 0, '2023-11-27 00:43:18', '2023-11-27 00:43:18', '2024-11-27 07:43:18'),
('5b879ad8f17596ae1369160bc7ecd3050630a89306d798c3bb7806118203ec7f047d5f8c5b866c75', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:15:10', '2023-08-16 23:15:10', '2024-08-17 06:15:10'),
('5bbbd82cf5498bf1fabf861a2ecdeb0d4d70881b6935ac641b4f979e76435bc5533f53d6a3754045', 43, 3, 'nApp', '[]', 0, '2023-08-30 00:42:27', '2023-08-30 00:42:27', '2024-08-30 07:42:27'),
('5bea347e7a9aeac4cdb3c0c9b76378f4d1387f7596228b5a4bd2b82cff93a6a31a882ab6970df826', 1, 3, 'nApp', '[]', 0, '2023-08-28 18:09:40', '2023-08-28 18:09:40', '2024-08-29 01:09:40'),
('5c128bd6f41983d4fd0482d60f47e93c1fb41cc89d4714cfbbc6457f4e790291e0b6960465088eba', 1, 3, 'nApp', '[]', 0, '2023-09-02 18:27:48', '2023-09-02 18:27:48', '2024-09-03 01:27:48'),
('5c7d9e5f4eba9d2754dc999b506a0ea712b6f0e9568b13e128df93ebc0edf89198e6b8e723035dac', 1, 3, 'nApp', '[]', 0, '2023-09-02 07:55:13', '2023-09-02 07:55:13', '2024-09-02 14:55:13'),
('5c93c80e89394fc5d1d096352d1eb55c17a0a6acf78a5bb7548904cbd59e8b158c6a078c36e8bb13', 161, 3, 'nApp', '[]', 0, '2024-01-09 18:41:35', '2024-01-09 18:41:35', '2025-01-10 01:41:35'),
('5d00c4fb502b84862b630fdebb57260e1ff6363dcb9b37997b8fb0f7b87acf0b8901b4749299d264', 1, 3, 'nApp', '[]', 0, '2023-08-25 05:08:53', '2023-08-25 05:08:53', '2024-08-25 12:08:53'),
('5d54c84d291a86f720080fb3e48b4ace33c392be176566ed570cecc821acb6c552a6a940356adb8d', 161, 3, 'nApp', '[]', 0, '2023-12-05 00:57:01', '2023-12-05 00:57:01', '2024-12-05 07:57:01'),
('5d59d4a289df16b210ce5e2166ef909cdefb3544195badcfda910937be6de22b9b06dc2854656f8f', 180, 3, 'nApp', '[]', 0, '2024-01-16 09:27:50', '2024-01-16 09:27:50', '2025-01-16 16:27:50'),
('5eba662f7a2cd736bba3a24ddfc8a84b589009c4e732df7a7d65bc033b0664b20fa0f2376d12af02', 148, 3, 'nApp', '[]', 0, '2023-10-17 20:44:08', '2023-10-17 20:44:08', '2024-10-18 03:44:08'),
('5ed5d06876f877e520d89a444fb00b32cbf708bbbc6f679be5446124f25604880fe2790cb265f43f', 161, 3, 'nApp', '[]', 0, '2023-11-29 01:26:42', '2023-11-29 01:26:42', '2024-11-29 08:26:42'),
('5f958c29ac71c453a35450a2c2e158d47d34d0a3045cf623a29c122d4f6710eda6e5a88834ca8269', 161, 3, 'nApp', '[]', 0, '2024-01-09 23:50:03', '2024-01-09 23:50:03', '2025-01-10 06:50:03'),
('5fbfa221145433bab7958277d022554c4bd6d2ef09ed49a45255e9a40d8ee9b7d6c57ac89b87e17f', 161, 3, 'nApp', '[]', 0, '2023-11-28 18:09:40', '2023-11-28 18:09:40', '2024-11-29 01:09:40'),
('6017154e9500f78b54b691f079992b074052cf77ce5f7b2bb290415161defc3bc9e8d2f9dcff3828', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:49', '2023-09-02 09:26:49', '2024-09-02 16:26:49'),
('603587b9dd0d24cb739580029b52d600384e225b37f50e40a803592047e9cea448fc0daf844d400e', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:55', '2023-09-02 09:23:55', '2024-09-02 16:23:55'),
('60546a6dacefad707f5268ae77c8b4f2938db0a9ce3b70eee05ca2b94974f57be1d84ba0e1f96984', 161, 3, 'nApp', '[]', 0, '2024-01-10 15:09:06', '2024-01-10 15:09:06', '2025-01-10 22:09:06'),
('60906d94e3b7b43e616df294040d81a1f1e510780800d59293265343eef99d163ef2212da91f9947', 1, 3, 'nApp', '[]', 0, '2024-02-03 20:31:39', '2024-02-03 20:31:39', '2025-02-04 03:31:39'),
('60ab57ec0e0b24810b462a260d3587f3e06c2e37ecc8ded6391a143fa114acdf3f2c7899664661c7', 43, 3, 'nApp', '[]', 0, '2023-08-15 18:12:25', '2023-08-15 18:12:25', '2024-08-16 01:12:25'),
('6125b10d017b407e95418c33abb948c541aa86b25676ba68d65ce45d73373e6b42249abd85ad15de', 1, 3, 'nApp', '[]', 0, '2024-01-31 20:41:37', '2024-01-31 20:41:37', '2025-02-01 03:41:37'),
('613f8e949733ecb6e6aaa418ff4517738fa11332ee26d7c09fc7d45ed4123ed3afcb3001f3772f66', 161, 3, 'nApp', '[]', 0, '2023-12-05 00:55:38', '2023-12-05 00:55:38', '2024-12-05 07:55:38'),
('6175076194f6f8dee42248c4e4aef43d10a25a9ddfce89eb750aacfbc67a15fc77e9fd2235a85927', 1, 3, 'nApp', '[]', 0, '2023-08-25 23:43:35', '2023-08-25 23:43:35', '2024-08-26 06:43:35'),
('618857d20d6223fa39d5f79dbd1529ec4e653a9f2ce33dea6c68fa028ef4faa1655442c6a5e196ec', 1, 3, 'nApp', '[]', 0, '2023-08-25 05:05:17', '2023-08-25 05:05:17', '2024-08-25 12:05:17'),
('61de276f165c859de5642cd57750f4cd8cc4e531c2a130d73f0a700bd2343c0fe621781e307f1883', 173, 3, 'nApp', '[]', 0, '2024-01-07 19:25:53', '2024-01-07 19:25:53', '2025-01-08 02:25:53'),
('61e3af6d2284fa3b30c57519b344f982feeba12bff8a55ed183d5242e3ef09d031fede1e191b2f46', 1, 3, 'nApp', '[]', 0, '2023-08-15 22:21:20', '2023-08-15 22:21:20', '2024-08-16 05:21:20'),
('61f6fb78c552668fd66f597132ea73cf061dff9038896650abff58d406ff791e8e5651430d34732d', 1, 3, 'nApp', '[]', 0, '2023-12-26 19:08:22', '2023-12-26 19:08:22', '2024-12-27 02:08:22'),
('625efd8cd8fc8306787ce3c8c68205a79499d079933a63bd92cf2c0d5770b220e679a57961e1ce3b', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:13:04', '2023-09-02 10:13:04', '2024-09-02 17:13:04'),
('628a3c2a3d589cb83082d333bfd632dbe25eeb92640c495a2168d5b62b652b72f8759927b9c5f110', 161, 3, 'nApp', '[]', 0, '2023-11-17 20:49:00', '2023-11-17 20:49:00', '2024-11-18 03:49:00'),
('62932b8fa4bc344276daf0ca679a37126a9d8dbf91c968b442c129c5e27e1ac643ed6208eeb51d18', 161, 3, 'nApp', '[]', 0, '2024-01-16 09:30:36', '2024-01-16 09:30:36', '2025-01-16 16:30:36'),
('62a8a61ad1dac15e21889cdf49162f228706555b845ffaf44c260f72d62b5e9fd8cc3a42ddcff020', 48, 3, 'nApp', '[]', 0, '2024-01-26 21:34:20', '2024-01-26 21:34:20', '2025-01-27 04:34:20'),
('62aeb0e0d3331ca9c1600d98aec681d4068cfc637c17a92cbee039963fe2ce2bf0d0a385860f6a7d', 43, 3, 'nApp', '[]', 0, '2023-09-05 07:54:07', '2023-09-05 07:54:07', '2024-09-05 14:54:07'),
('633a4a9e22135294d3b070fffddb0757e4e06da4f7b54e66109c235694f406ae8b1def3b9affe141', 161, 3, 'nApp', '[]', 0, '2024-01-04 19:38:48', '2024-01-04 19:38:48', '2025-01-05 02:38:48'),
('633da39c52aad9f1b904164ac4d9d3a337b97ff3479677a24daf2d3085749edc24d13e337d9b80cd', 1, 3, 'nApp', '[]', 0, '2023-09-02 19:36:03', '2023-09-02 19:36:03', '2024-09-03 02:36:03'),
('636a22b12fecd11a620062bbd45cc41f838dd8c5ef7a52e8835333909ba5d852bab76c5fd0602763', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:44:14', '2023-09-02 09:44:14', '2024-09-02 16:44:14'),
('63b962b0bb0642c4a7965c2af209eebf4bfd436b9299004f4ac48252bd27187d7eeec30ba0f4838e', 56, 3, 'nApp', '[]', 0, '2023-08-18 00:59:35', '2023-08-18 00:59:35', '2024-08-18 07:59:35'),
('63cc1b5f957722560e0f48f60e7bc2c75dc7e8aa31a4ab295b0c88e9e66f66d71c006cc7f498c69e', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:13:05', '2023-09-02 10:13:05', '2024-09-02 17:13:05'),
('63cf3cd6004e7be7e400b519c4114fdb2d65dea33f39ac398ac42ff242d230fb5103365004c27219', 43, 3, 'nApp', '[]', 0, '2023-09-05 06:12:16', '2023-09-05 06:12:16', '2024-09-05 13:12:16'),
('63cfb1d69237395ecb93beabf0bdbbf1fd6c28332826a2f748a53079d0cbe154b151d79337a5f959', 159, 3, 'nApp', '[]', 0, '2023-12-03 03:02:25', '2023-12-03 03:02:25', '2024-12-03 10:02:25'),
('649c7518f84e6cf9a53eda740141977b22cbb8ddb2873bce6e3f0e99015800058e80e3d45aeeff2f', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:09:34', '2023-09-02 09:09:34', '2024-09-02 16:09:34'),
('64a13d3fee8740659c201a88a80289b53598b247e8f60d9bd24ea59df25453450122fb49324c08a2', 150, 3, 'nApp', '[]', 0, '2023-10-18 16:47:57', '2023-10-18 16:47:57', '2024-10-18 23:47:57'),
('64e549b8235b8d95a449b038a04c2f661f0dedf75a28b672b3b74e29beb36100c78c4dda8afea2ad', 161, 3, 'nApp', '[]', 0, '2023-11-29 00:18:11', '2023-11-29 00:18:11', '2024-11-29 07:18:11'),
('64f8586a041039b94b5f1852a84b3e5d3fda45891e16ff037b6bae42e1c639520afabfbb96bfa0cd', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:45:10', '2023-09-02 10:45:10', '2024-09-02 17:45:10'),
('650e98acd3499495b559e6c315e22cd1a61f919a004dcf43c10fc26b284504405a30725e82d9b093', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:07:18', '2023-09-02 10:07:18', '2024-09-02 17:07:18'),
('6561c8b6f3302fa64292c73e2aa90776c88e31a8e9108125aeedb90b26115c188fc325513a5370ed', 43, 3, 'nApp', '[]', 0, '2023-08-24 00:53:51', '2023-08-24 00:53:51', '2024-08-24 07:53:51'),
('659109790fa7ec891cedbad19455d80d74112d94a35e445af02e2ac937f22d539e3c4566a7b0f771', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:17:34', '2023-09-02 09:17:34', '2024-09-02 16:17:34'),
('6642ed2c054217222122cf070ea9bd9219073540a4c28ca6611cf7a19edcae3054def066c6425a5f', 1, 3, 'nApp', '[]', 0, '2023-08-14 23:38:37', '2023-08-14 23:38:37', '2024-08-15 06:38:37'),
('66b40b60d405b4bc85f3ea44f51f43aa3fc3716e57b5c8f763a49e3dff020a0a3d219d7063afedd3', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:57:37', '2023-09-02 09:57:37', '2024-09-02 16:57:37'),
('675e0ac267a8677b0dd6b2ce2dfc02dfe94dda4e79ee19d987972d2b8abdf4212a661cb5d10671da', 1, 3, 'nApp', '[]', 0, '2023-08-30 00:08:37', '2023-08-30 00:08:37', '2024-08-30 07:08:37'),
('67a78142e12eaaa44ba3eb56c438e5bd228f70f7017a066e6dc3d0a0923689fd6ef3f5a413501234', 182, 3, 'nApp', '[]', 0, '2024-01-24 21:30:38', '2024-01-24 21:30:38', '2025-01-25 04:30:38'),
('67aab2869f4b21908db23f1e6bd6d9fe865dd0d900c0bbdef18225ab8d85f9e9c80de0a22ef302bc', 161, 3, 'nApp', '[]', 0, '2024-01-08 18:33:39', '2024-01-08 18:33:39', '2025-01-09 01:33:39'),
('67c7a30e0db13f2c17167ee6446118945846a98cc9b3af00ccc1abc58f826001fe74ca5c6e6c1a7d', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:06:38', '2023-09-02 10:06:38', '2024-09-02 17:06:38'),
('67e484d2817b66ff84b86b308e55c5dcb67e49ddbf7341bd28c5ed788051250973008d3d2b57dbe9', 1, 3, 'nApp', '[]', 0, '2023-08-25 05:05:31', '2023-08-25 05:05:31', '2024-08-25 12:05:31'),
('67ebdf585b688af2c371c7bed9c08489f2e352022a7d4b68d996256d5c9ad0f4e48ba7affeb1e599', 1, 3, 'nApp', '[]', 0, '2023-08-25 23:03:51', '2023-08-25 23:03:51', '2024-08-26 06:03:51'),
('68189a168cccd1598eaa0c7316358afa4a24913b1dae2de4ae26158b820d2440080d40363759aecc', 1, 3, 'nApp', '[]', 0, '2023-08-17 22:07:03', '2023-08-17 22:07:03', '2024-08-18 05:07:03'),
('684ba57f65f7144b2113f5f16ea0b3d306e0d0e25526f7af77a015325745ce4c0285a827f1812042', 139, 3, 'nApp', '[]', 0, '2023-09-06 14:19:45', '2023-09-06 14:19:45', '2024-09-06 21:19:45'),
('6884dfbd0a0223a4b73c31a619c4ae63f939d3b4b9434534040356af19cc72c24cd39d390dfb3c18', 161, 3, 'nApp', '[]', 0, '2024-01-28 04:32:29', '2024-01-28 04:32:29', '2025-01-28 11:32:29'),
('6973669ef96e4f1cb230ac7c9da300aad3bf4771502d3c9e22f102783f4805f190cc0f53f01a5d30', 161, 3, 'nApp', '[]', 0, '2023-12-09 16:04:06', '2023-12-09 16:04:06', '2024-12-09 23:04:06'),
('69e3fb5399ac2783d0c6ffc79e50edfe20311efa1e70b261ce2f5c57f664916ab8918108e9af4fbd', 161, 3, 'nApp', '[]', 0, '2023-12-10 17:42:48', '2023-12-10 17:42:48', '2024-12-11 00:42:48'),
('6a21c6a1e8c333e952bb45a8719c47d0499140a9d490a7d689c723c683f40f84dd156a69ad68c5e8', 43, 3, 'nApp', '[]', 0, '2023-08-25 15:05:23', '2023-08-25 15:05:23', '2024-08-25 22:05:23'),
('6a5815a7f0c9effbb5392b40c77f222ff6e85319cbfe26b9a715aab5e23b969a646b391ab7c08902', 56, 3, 'nApp', '[]', 0, '2023-08-18 00:13:08', '2023-08-18 00:13:08', '2024-08-18 07:13:08'),
('6a71166eabe3fbd366f3f7b40a2ac049ed4d2f27a9ae223ae8431ecdb5b584834b19a483b959831d', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:27:53', '2023-08-16 23:27:53', '2024-08-17 06:27:53'),
('6b2e8b29421ba320025255df8def634cd4fe0c747bf0d860992e9b662aa6f9d4dd2b74f1b20bab86', 161, 3, 'nApp', '[]', 0, '2023-11-29 23:14:38', '2023-11-29 23:14:38', '2024-11-30 06:14:38'),
('6b757d66a2287af9ded69226d8fdfd929fb033860561605968df853b9eb3e867204010647fc52722', 43, 3, 'nApp', '[]', 0, '2023-09-07 01:17:33', '2023-09-07 01:17:33', '2024-09-07 08:17:33'),
('6b94f7d950e14bc4407e194a9c7839180ae1d02eef938499c17613cded2707350da8b16f05d07113', 1, 3, 'nApp', '[]', 0, '2023-08-30 00:28:59', '2023-08-30 00:28:59', '2024-08-30 07:28:59'),
('6bfa852b9acb1c2b52e58cc8c2ec50cc66eec393cbb84bb301eed09d24cced7537db233b0302f888', 161, 3, 'nApp', '[]', 0, '2024-01-13 19:28:45', '2024-01-13 19:28:45', '2025-01-14 02:28:45'),
('6c383e3645a907d92f2b6759fd0a5cd10d7b9b919dd3a97e397dcb790f94e93933ee8762f30870bd', 1, 3, 'nApp', '[]', 0, '2023-08-28 18:15:20', '2023-08-28 18:15:20', '2024-08-29 01:15:20'),
('6c8ff837707b810d99874bc7e7be3339c565c245f1e7f962c327aee582109d97f32a57ceb77dca58', 1, 3, 'nApp', '[]', 0, '2024-01-29 21:04:50', '2024-01-29 21:04:50', '2025-01-30 04:04:50'),
('6c94bb65d1aa4e262de5f66cef7d270bd9b389ab16fa716f25a1f41910f15b27cde5292f8e302b40', 161, 3, 'nApp', '[]', 0, '2023-11-28 18:39:32', '2023-11-28 18:39:32', '2024-11-29 01:39:32'),
('6c9b12e25026d35da569eb3e8752c90c42997ddf6aba09ba14dbe06ebd85384d0e150fea23d7c2bd', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:23:09', '2023-09-02 09:23:09', '2024-09-02 16:23:09'),
('6cc9b809175054f455813699da48ea9f3900b377d70a46fdc66f35d2b2d939fcd1d261b532369cb5', 43, 3, 'nApp', '[]', 0, '2023-08-25 05:07:29', '2023-08-25 05:07:29', '2024-08-25 12:07:29'),
('6d01867327d5539d8f2c51daa943279b115288704334ce03e89136c3f88a99f72c0ff8a612bfb4fd', 48, 3, 'nApp', '[]', 0, '2024-01-26 23:06:36', '2024-01-26 23:06:36', '2025-01-27 06:06:36'),
('6d264de3b312d312ca0769a598a32c378fdc99577bec12e5f5ad8101ed2984a83d68f05602284ca7', 182, 3, 'nApp', '[]', 0, '2024-01-25 02:07:58', '2024-01-25 02:07:58', '2025-01-25 09:07:58'),
('6d2d6e800df59f5a55dc231e7d9f94887e29e57dc03ecf3418a3bf1d386f9aff5878c79f1730dfe9', 1, 3, 'nApp', '[]', 0, '2023-08-16 21:15:05', '2023-08-16 21:15:05', '2024-08-17 04:15:05'),
('6d41e319c07fe5d12835a901d18da1d6fb15ee3847dc460495a70552048dac2121f599a046a7a100', 161, 3, 'nApp', '[]', 0, '2023-11-23 23:31:47', '2023-11-23 23:31:47', '2024-11-24 06:31:47'),
('6db068566d6ecabbe2ed9953847a7cbbe51c1a1613f04495b358c5fc4d311dd81242f1002219317a', 56, 3, 'nApp', '[]', 0, '2023-08-18 07:05:58', '2023-08-18 07:05:58', '2024-08-18 14:05:58'),
('6dda593557df2181e829f514146533dfd63037eaa19b40670cb0c4dd14c0f81c2253f84b8f61af2e', 1, 3, 'nApp', '[]', 0, '2023-09-02 08:16:00', '2023-09-02 08:16:00', '2024-09-02 15:16:00'),
('6dee6b1f8e3cc0f5020efba17b02d7fecc42733169e9b3db91a951bb634a640cf0571d4a6dd23dc9', 177, 3, 'nApp', '[]', 0, '2024-01-11 18:40:29', '2024-01-11 18:40:29', '2025-01-12 01:40:29'),
('6df4285430078c4672c58acff2b452c87c925cee8a4d3640a8977facb841be1a9b78e3d302cff787', 43, 3, 'nApp', '[]', 0, '2023-08-25 23:05:09', '2023-08-25 23:05:09', '2024-08-26 06:05:09'),
('6dfc63204d7afa8de185e194a9f14c4a9d8245fbe28fd6a87279820c1c5d9fa66bca1775448402ba', 48, 3, 'nApp', '[]', 0, '2024-02-03 01:13:45', '2024-02-03 01:13:45', '2025-02-03 08:13:45'),
('6e6318d780ed13d1373b272b3912cbb25a0f66920253e2ea2dd4fe975efb534e8b794d977ac07d2e', 161, 3, 'nApp', '[]', 0, '2024-01-04 19:36:05', '2024-01-04 19:36:05', '2025-01-05 02:36:05'),
('6ea3d0fbad82a854eedb8f704e20c2299faa7dedc7c2b33dc6a6919c94bf911623b2185b5d072eaa', 56, 3, 'nApp', '[]', 0, '2023-08-18 07:07:15', '2023-08-18 07:07:15', '2024-08-18 14:07:15'),
('6f6591aa2a49f6b3a10da8de208eb6ad6134106f10b7770df7f1e2d2ea7839ee810346ce9e61462c', 48, 3, 'nApp', '[]', 0, '2024-01-26 18:56:59', '2024-01-26 18:56:59', '2025-01-27 01:56:59'),
('6f98c08213b23bc7244edf2fa4230416b888718d4da68dc39bf801abd096768fa7df9a54b948ac9a', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:15:48', '2023-09-02 09:15:48', '2024-09-02 16:15:48'),
('6f9fae1e3311dee53a2813f09bcf1e37c6fe87eaeb9fb0a6bf897936841e85bad3bbd471a2f15c9e', 161, 3, 'nApp', '[]', 0, '2024-01-25 01:22:15', '2024-01-25 01:22:15', '2025-01-25 08:22:15'),
('6fd66cb026ce1769309e6a540f83e17f1e6b729898da05476df44fba33c128c9f72c20ec832579e7', 161, 3, 'nApp', '[]', 0, '2023-11-23 00:38:36', '2023-11-23 00:38:36', '2024-11-23 07:38:36'),
('7062067b56fb76c0d314e8e13ecf3359c4f579a699e87a1c04d65cd3c44b91a2e0fc1046720666ce', 1, 3, 'nApp', '[]', 0, '2023-11-29 04:36:51', '2023-11-29 04:36:51', '2024-11-29 11:36:51'),
('7066078f3cb37a340e0e51ed2266127493acef318a15efee51f5b98e1f20dd129d5cccc13a08972f', 1, 3, 'nApp', '[]', 0, '2023-08-16 21:31:47', '2023-08-16 21:31:47', '2024-08-17 04:31:47'),
('706ab89b3dfbf5e0340a103f5c3ffb54cdb850b7baf713f96425f6563c65171fbf8d951f8913db18', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:17:05', '2023-09-02 09:17:05', '2024-09-02 16:17:05'),
('706ba6aae3a7c7732389838e046855927b490a3f51f31b355bea88ce6bfe1efb7ea48803de6f1efb', 1, 3, 'nApp', '[]', 0, '2023-08-09 01:16:57', '2023-08-09 01:16:57', '2024-08-09 08:16:57'),
('707820c56ca58e879d155de24fe08f25368c5c2ded2e5fb0627277c0bdb035f06e4c7078a6668178', 48, 3, 'nApp', '[]', 0, '2024-01-08 21:01:56', '2024-01-08 21:01:56', '2025-01-09 04:01:56'),
('709db979566fc2fb9a2c1025aaa2dadf1a280f5eaff7d14cd176039fbc315de87feea9d26aa1c2bb', 161, 3, 'nApp', '[]', 0, '2023-12-03 23:20:06', '2023-12-03 23:20:06', '2024-12-04 06:20:06'),
('70f32ff711f8b2848ff2865c6b6228c8a2b5953017d34d9eef13dfc519f86f87bedf51efbd159d55', 48, 3, 'nApp', '[]', 0, '2023-08-25 05:08:32', '2023-08-25 05:08:32', '2024-08-25 12:08:32'),
('71edf76a52337753725f5915ce5d1a9090cd6555b968d9598a77dadfc4d18e076acb17410cee748a', 161, 3, 'nApp', '[]', 0, '2024-01-24 17:10:34', '2024-01-24 17:10:34', '2025-01-25 00:10:34'),
('727e1c31985d1eeeecf0e6b5de8ef8989f11b208abe30c3fcab3315dd1d536b4e80ed288c18d78d4', 1, 3, 'nApp', '[]', 0, '2023-11-29 01:21:03', '2023-11-29 01:21:03', '2024-11-29 08:21:03'),
('72d46155cbc3455a5d0a482705b632324b2cf6f9fc0560ac79c781747bc6a079bb257435b252589c', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:24:44', '2023-09-02 10:24:44', '2024-09-02 17:24:44'),
('7426957867580e4e5ce8ca066b98743611b3e3a60cbc4deb0f9a71c019ebcb1a6cf0ed92cc4f43d3', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:52', '2023-09-02 09:23:52', '2024-09-02 16:23:52'),
('743b0fe673ce1f8dd288dfc73041b539e672fde7a64a17543a9b7b13d2908a84c6f13c000a7e7ba5', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:18:53', '2023-09-02 09:18:53', '2024-09-02 16:18:53'),
('745d2d700e88f1297d09c2de3bc5c2687cf387139ff9812d7147c3acae8910c83d031b29a3052cbd', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:16:33', '2023-09-02 09:16:33', '2024-09-02 16:16:33'),
('746f717cc105bc5f4193728306db44c212cfca1ec94bd163dc3520e05356ae41fe1983c7d324b5a0', 161, 3, 'nApp', '[]', 0, '2024-01-22 22:50:47', '2024-01-22 22:50:47', '2025-01-23 05:50:47'),
('747ae23b79db53bf29a5e893b5be4c4cae73bd6baeab83562ef680a76339649a5f8e24697b415e50', 164, 3, 'nApp', '[]', 0, '2023-11-29 00:18:50', '2023-11-29 00:18:50', '2024-11-29 07:18:50'),
('7494c64ec988a87956bfc8fb89740a8939beaf31fd226fd36e06626960193d4084fec124de7cf35f', 43, 3, 'nApp', '[]', 0, '2023-08-26 19:41:48', '2023-08-26 19:41:48', '2024-08-27 02:41:48'),
('7556991884e530a277668bc962af44c864d3c74c1d46c8da9b0e03968769514e8211b8de13035a53', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:27:24', '2023-08-16 23:27:24', '2024-08-17 06:27:24'),
('75cbfe536643cf2aa8065c31c5f492e7e4ee8ba644f525c8118b6e6b8367f8ec4713c9e48a06c558', 50, 3, 'nApp', '[]', 0, '2023-08-17 02:27:41', '2023-08-17 02:27:41', '2024-08-17 09:27:41'),
('7684c154e91448ab67d5c34b8440d263926c22f82c0831c83e4903b68991fed196477d8498368532', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:27:59', '2023-08-16 23:27:59', '2024-08-17 06:27:59'),
('76eb440c2b08c15be57fb0bd6d30bde210b0a984139bf2788dfd14dc67120ef1e890841992959207', 43, 3, 'nApp', '[]', 0, '2023-09-05 09:08:04', '2023-09-05 09:08:04', '2024-09-05 16:08:04'),
('76ef8ebc00dad8ca865f62ff7df8394c0db62d1626dc0b8f37b79f60d7a88402468f1a4e87304172', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:45:04', '2023-09-02 09:45:04', '2024-09-02 16:45:04'),
('76f74bbd543f9a73fe66094bb78b623a44b4e7d97034f804d62f88779120465464df813decef6e6b', 121, 3, 'nApp', '[]', 0, '2023-08-31 18:44:44', '2023-08-31 18:44:44', '2024-09-01 01:44:44'),
('77460c0c0ca6f5ce7fbc2fa73dfb09ca30d371acbea1f1eebc4930a4af5d3254962a4b20016f4b0a', 43, 3, 'nApp', '[]', 0, '2023-09-25 17:59:48', '2023-09-25 17:59:48', '2024-09-26 00:59:48'),
('774cf56d39a435a73eac3e2d2aa133fcf87a54dcc107b26a1bad1b96f66cef1e24f8d2ec65e279a3', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:18:51', '2023-09-02 09:18:51', '2024-09-02 16:18:51'),
('77a7fd10c3057f75ae0fbd2ca7d3d222e672b21be3603498f7f08551317deab9a1fdb686c31e603f', 1, 3, 'nApp', '[]', 0, '2024-01-31 20:40:14', '2024-01-31 20:40:14', '2025-02-01 03:40:14'),
('77cb64e2c5f1ef7b510411c783c559ae593c0640879e1b47d4eed48c2daa582c1382db0a40f70b0b', 161, 3, 'nApp', '[]', 0, '2024-01-09 18:25:17', '2024-01-09 18:25:17', '2025-01-10 01:25:17'),
('77f29cf1dd084cd46373d4e489bf0cfba7b539230366ea13b95b41f6c0f56957dd378c8d22b5ce3f', 1, 3, 'nApp', '[]', 0, '2023-11-29 01:32:10', '2023-11-29 01:32:10', '2024-11-29 08:32:10'),
('77fb90a32109e7b827e168039a078907c4b799a34ee64ed56c9ccba21d56702d28a04f2ff324a979', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:36:01', '2023-09-02 09:36:01', '2024-09-02 16:36:01'),
('780e4d8431793a3c94919c7fcca302255019994cadc9a0c998450963ca5c51855e2f79fe605feb44', 43, 3, 'nApp', '[]', 0, '2023-08-26 15:11:46', '2023-08-26 15:11:46', '2024-08-26 22:11:46'),
('7838200a5fdce327680ddc9be6bd8cf4f1fb642d1508b98f779c9437c503f6586394a8d78424923f', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:17:01', '2023-08-16 23:17:01', '2024-08-17 06:17:01'),
('78663aff3ec1caaa1a6277061c8a73c221776a1201e32522f833917de60048765697b430e1db46cb', 1, 3, 'nApp', '[]', 0, '2023-08-08 01:40:01', '2023-08-08 01:40:01', '2024-08-08 08:40:01'),
('78c28658b5769985717546985f435a48e458c28f55c8aa47a1a80975379479d7a46a8ca423f7098b', 1, 3, 'nApp', '[]', 0, '2023-09-01 21:33:16', '2023-09-01 21:33:16', '2024-09-02 04:33:16'),
('78c9215214251fd7b1ab13edef5b560a141a3f036e50b009231551ac4090763283cbb711d0e34cd2', 167, 3, 'nApp', '[]', 0, '2023-11-22 19:30:10', '2023-11-22 19:30:10', '2024-11-23 02:30:10'),
('797ac15fb7316eb3b15682c78b332756b51f9b6ba51d9c07ec8a65939956208218a596957836b2cc', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:17:49', '2023-09-02 09:17:49', '2024-09-02 16:17:49'),
('79c4f326b7b14a21f48de9b35f9ef22bab8f753ffec622b59223cf31f0766651268d76ea580cf7cc', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:17:43', '2023-09-02 09:17:43', '2024-09-02 16:17:43'),
('79d5454eff525e33a915c818e41a4b4502bbfdb0118a948b1448341ba42e94a336a42cb9790c9952', 1, 3, 'nApp', '[]', 0, '2023-08-24 19:36:33', '2023-08-24 19:36:33', '2024-08-25 02:36:33'),
('7a035cfb886afed14475691d4172723c747b2d04d5bc54c744c43b99941965a61cd6a8c0657948b1', 1, 3, 'nApp', '[]', 0, '2023-08-24 22:21:52', '2023-08-24 22:21:52', '2024-08-25 05:21:52'),
('7a5a87ac83006735ee78cafcedcf9d068c0d9e8d1427ad4730a2390bbc17398f94c3cf2bef76c543', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:28:19', '2023-08-16 23:28:19', '2024-08-17 06:28:19'),
('7a9f91f45d060858287909f82a38d70b6a04d46eb9ca3085f0f9e67def6bdfa14851227420557018', 1, 3, 'nApp', '[]', 0, '2023-08-16 22:41:55', '2023-08-16 22:41:55', '2024-08-17 05:41:55'),
('7ac4d4f626b10625797d69da1612ca7c6c9f58346de8493d348e36010207409193b50d2b0a3b0fc1', 161, 3, 'nApp', '[]', 0, '2023-11-28 17:37:45', '2023-11-28 17:37:45', '2024-11-29 00:37:45'),
('7b0ac4cee59733e69b1db2058de0a7fbb407d6133015821f4df46735167c76646fe151221e5f337d', 1, 3, 'nApp', '[]', 0, '2023-08-09 01:13:26', '2023-08-09 01:13:26', '2024-08-09 08:13:26'),
('7cb1359472186923f9844a0d1e01db4593ee93c6ef92a98d54ff4121271739f10c4f50ebb4a31dd8', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:07:16', '2023-08-16 23:07:16', '2024-08-17 06:07:16'),
('7cdaad42503c12c916b0d1feb3553ccdce427a0a3f09b4483a200901bd43e5d38adcd0900ba10e14', 1, 3, 'nApp', '[]', 0, '2023-08-15 23:38:37', '2023-08-15 23:38:37', '2024-08-16 06:38:37'),
('7d266fc645a767d60445e18502970abc41877c974e4f35a94dee7f40dcdb0b7cf4cb7e69b44de25b', 43, 3, 'nApp', '[]', 0, '2023-08-26 15:16:49', '2023-08-26 15:16:49', '2024-08-26 22:16:49'),
('7d3c67145f324e5276bd183352740a1feed2cdc26cc2d6ca9d3fd366eaad6e7aa186f73ec77c23bb', 56, 3, 'nApp', '[]', 0, '2023-08-18 00:15:08', '2023-08-18 00:15:08', '2024-08-18 07:15:08'),
('7d95c241c3ac4962503e322b5f091d1959a797fcdd869015d2fc3c16efd6c0174b650f974500e0ed', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:18:43', '2023-09-02 09:18:43', '2024-09-02 16:18:43'),
('7dbe01ad606b2576dc46eeae4c2f1a81105ce6404027fe1a4b770b7dd9d31bfe83266720ba7b792d', 6, 3, 'nApp', '[]', 0, '2023-08-07 20:01:17', '2023-08-07 20:01:17', '2024-08-08 03:01:17'),
('7dc59b75ff1bebc81630905a65e9b33263e6902969a1c791343d99cecc0763e67d57167f73f73e07', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:01:37', '2023-09-02 10:01:37', '2024-09-02 17:01:37'),
('7e5c49dfb7a3a2c0c679f5f6111ab02542047f3d89ead0db5438a8187a41a69198c2f09c583e6b5a', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:07:07', '2023-09-02 10:07:07', '2024-09-02 17:07:07'),
('7f225672168ac12edddb8131afae4f546d25bd7cfc5a2d3800db1a81235d6ca469688d674137102c', 49, 3, 'nApp', '[]', 0, '2023-08-17 02:04:07', '2023-08-17 02:04:07', '2024-08-17 09:04:07'),
('7f4d446b1872dd7054cabe2e1e4a55f42680daa669094c4810ba86bf662da2ff4ba518299477857b', 1, 3, 'nApp', '[]', 0, '2023-08-09 01:00:03', '2023-08-09 01:00:03', '2024-08-09 08:00:03'),
('7fdecfd055e4ca03b6e05b0cbf8ee73568f02e2d5d3e49fe9088bdb419edf34c964a6f4b21e6f9f0', 48, 3, 'nApp', '[]', 0, '2023-08-25 05:37:11', '2023-08-25 05:37:11', '2024-08-25 12:37:11'),
('801ebb4405a69961ab7254934e173f70853b0ce58b58cebedac6d8f85fe0564207834d211d3d7cee', 161, 3, 'nApp', '[]', 0, '2023-12-02 15:54:51', '2023-12-02 15:54:51', '2024-12-02 22:54:51'),
('80284282ef92bd8b9cffa1d14d93fac561f0651dbb6f3f82b20942af374b3ac5a80f7f5cf2581a3b', 161, 3, 'nApp', '[]', 0, '2023-11-29 20:17:13', '2023-11-29 20:17:13', '2024-11-30 03:17:13'),
('802d3cad241ab3af4e7816717cdaa659fd45c5b23589d0af89c0bcaf478a5ef865f6790a3f7f40fd', 1, 3, 'nApp', '[]', 0, '2023-08-17 23:38:30', '2023-08-17 23:38:30', '2024-08-18 06:38:30'),
('8072ac4911f249eb02aba6d0ea54d9a6ba85735dd24f60e5b814c78446a28543071396d5cf5de321', 56, 3, 'nApp', '[]', 0, '2023-08-18 07:05:58', '2023-08-18 07:05:58', '2024-08-18 14:05:58'),
('80dd674fa78b5ee63ecdd454f57332eb8963fe935ed59d9a5c1b137cba3a2c0fbd56f2b88b02514a', 161, 3, 'nApp', '[]', 0, '2023-11-30 14:23:03', '2023-11-30 14:23:03', '2024-11-30 21:23:03'),
('812a61275ad7423ead4d09d16b94dda5b0d8e5ded93501ddd753c00588bb7f2aee9a91c2d38a489f', 1, 3, 'nApp', '[]', 0, '2023-08-30 00:28:28', '2023-08-30 00:28:28', '2024-08-30 07:28:28'),
('8140a7930a3d5fa94c5d05bb8b82a1939b2e503dddf1190775a2cbc52395e3c8ec361813fa78a8f1', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:57:54', '2023-09-02 09:57:54', '2024-09-02 16:57:54'),
('8184c3bb8f7142cb3af3a80263dfcfe6aa0a782c884de69bc6f04424f823bfbe98dc085f607ef385', 1, 3, 'nApp', '[]', 0, '2023-08-21 20:44:27', '2023-08-21 20:44:27', '2024-08-22 03:44:27'),
('827f6349165b844602ce2c3f0a661d5ad2973fc761e8ed5e1ebf287f5c3b92c5ca47ce07edd6d524', 161, 3, 'nApp', '[]', 0, '2023-11-23 23:10:49', '2023-11-23 23:10:49', '2024-11-24 06:10:49'),
('829e4a9a56baccd68c5555ffe67a1f19b492f3c29787c86b2012d1cf83f95d1295e611d2b833663c', 1, 3, 'nApp', '[]', 0, '2023-08-09 01:13:32', '2023-08-09 01:13:32', '2024-08-09 08:13:32'),
('82c787cdfe315fcb27ef4d117966c4ddadcda2421780725f966a5cac252f20f5c3e75652084d2cf9', 1, 3, 'nApp', '[]', 0, '2023-08-25 01:43:51', '2023-08-25 01:43:51', '2024-08-25 08:43:51'),
('831ac678ace1814012d65c6717b84b2c31d1ebd7362c8c2389729000a054b3ea19fa482e9097aa53', 43, 3, 'nApp', '[]', 0, '2023-08-24 01:17:48', '2023-08-24 01:17:48', '2024-08-24 08:17:48'),
('833624937517728e9425162d45133c577343fd773f7b2d2a3d03a21d98ca7db8f1bcad1fdcce0ba6', 48, 3, 'nApp', '[]', 0, '2024-01-08 21:00:05', '2024-01-08 21:00:05', '2025-01-09 04:00:05'),
('839aff95228260fb8ddd7153f9c34a20729bba0359b73bb5d76adb035788438c8d684f96c59fe475', 43, 3, 'nApp', '[]', 0, '2023-09-02 20:36:09', '2023-09-02 20:36:09', '2024-09-03 03:36:09'),
('83d42c9cfe3d8513ec7254b4a9fff09b1bc1299137373080fc0deeb9085f300e9d8007e2b0c983c8', 1, 3, 'nApp', '[]', 0, '2023-08-25 05:00:41', '2023-08-25 05:00:41', '2024-08-25 12:00:41'),
('841ad3edae7ba5570cdd977de1b4a88e3125cbdc8e99c175c683522d05f04a7e9c8ee01b20ceef96', 1, 3, 'nApp', '[]', 0, '2023-09-02 18:43:20', '2023-09-02 18:43:20', '2024-09-03 01:43:20'),
('848616b30422878d41d397284893de84fdbaf3f6195ae3b57939833d91da0cfce86e05f33d66b86f', 43, 3, 'nApp', '[]', 0, '2023-08-26 18:09:08', '2023-08-26 18:09:08', '2024-08-27 01:09:08'),
('848e4e32dad5f29d45f1f28089fec60f66d6e5e86f5dd10223afc8fac7d9b8a3e1525315b5bf5f6d', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:07:54', '2023-08-16 23:07:54', '2024-08-17 06:07:54'),
('84921d9d7f7ee813d13ebc64669cf46ccdf4626f8f8c8f20f76bfce1369ff3a943b520f79dcce000', 164, 3, 'nApp', '[]', 0, '2023-11-28 19:08:48', '2023-11-28 19:08:48', '2024-11-29 02:08:48'),
('84c20d85046a9bb937e7d555fcb569776f85a11f1e47f7f2f9a64be705dc95243bc0952df10cf9e3', 161, 3, 'nApp', '[]', 0, '2023-11-28 17:54:15', '2023-11-28 17:54:15', '2024-11-29 00:54:15'),
('855d915be1451e21793f487e5a4ebd4963b5f07a244006c49a845ea5c571dafc77fd3007da802fe4', 161, 3, 'nApp', '[]', 0, '2023-11-29 18:13:45', '2023-11-29 18:13:45', '2024-11-30 01:13:45'),
('8648d621d654b0b81eb560d0b615a58477c59fe3d4786cb386d3a944aabdde655c12ccf0327133f3', 48, 3, 'nApp', '[]', 0, '2023-08-26 01:07:31', '2023-08-26 01:07:31', '2024-08-26 08:07:31'),
('867171bcd1430a16d0bc2edb423f422b9e8d005fe8c286d4be45d30c64cb90b7c165c9d292f69daa', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:01:57', '2023-09-02 10:01:57', '2024-09-02 17:01:57'),
('869080de045e3b397c1485281bef67f2e2a9b23ec6e5f2d4a13bb5396b196dc7b4a896c403c5a1c1', 6, 3, 'nApp', '[]', 0, '2023-08-07 20:46:21', '2023-08-07 20:46:21', '2024-08-08 03:46:21'),
('86c12490341537abea0fc71f45946359ef0e8293c8184ab17027ffac9e4d2fe896afb24724f6d866', 161, 3, 'nApp', '[]', 0, '2023-11-29 05:33:17', '2023-11-29 05:33:17', '2024-11-29 12:33:17'),
('86ca41034d0baae5f31c4c52e6ffd3d8e7f4656380e3ad6ad3c77d5108919d477ba46343da42a159', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:16:46', '2023-09-02 09:16:46', '2024-09-02 16:16:46'),
('87633bb8113a1940d8f9b8acd4f4a3f1db6b1a5bf4b40600e4e56b94362c2bfefda790e1e027c987', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:57:36', '2023-09-02 09:57:36', '2024-09-02 16:57:36'),
('8764c4d13443822f5f55960170c6d2aeedfb313f03625ed3fd4f71a2d4191de182322abc6337ab3d', 1, 3, 'nApp', '[]', 0, '2024-02-02 19:21:09', '2024-02-02 19:21:09', '2025-02-03 02:21:09'),
('886c13b823d91ef46f71d8f2e3ab3e3e4b1c66e947631d3ab46058698af9d1fe68d69f364af5349e', 1, 3, 'nApp', '[]', 0, '2023-08-09 01:13:28', '2023-08-09 01:13:28', '2024-08-09 08:13:28'),
('888331c5895467e88f619543467d59b926fc38f9a6dda725a87b3aee256e20e867e0a9efb799428f', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:17:46', '2023-09-02 09:17:46', '2024-09-02 16:17:46'),
('8893167911d97447e8f4c1c0d822d0f5531fb6088f37ac19f55f6717a5dd9793b5397333808623a7', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:13:04', '2023-09-02 10:13:04', '2024-09-02 17:13:04'),
('88d6cb8e40dc4dc48e980ab967fd2599aadf4ce2ea5399e44615364d23ef680a247e9c02001c7c75', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:12:56', '2023-09-02 10:12:56', '2024-09-02 17:12:56'),
('88e49fe84c71dea6e2156dc7302752d2bc30fb38e602ddf2b1eaf5c68174f8c9d832fa88e19fa8bf', 1, 3, 'nApp', '[]', 0, '2023-09-02 13:53:01', '2023-09-02 13:53:01', '2024-09-02 20:53:01'),
('8910ee54474a9d4db5ea22815715e13b47f1ea903df3a4c188e5eb92042daf5fcb3bc066525a02b6', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:54:17', '2023-09-02 10:54:17', '2024-09-02 17:54:17'),
('892a20db824525f627186a2f4af127635268eee00c6c6fd8b6d98808048edd806eb2912044692bab', 43, 3, 'nApp', '[]', 0, '2023-09-05 08:17:40', '2023-09-05 08:17:40', '2024-09-05 15:17:40'),
('8964cdabef5d76122c07501b656e4bb9990a3d90f1fb59fe0c67921a23d90721d987e37ec54b0d26', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:22:33', '2023-08-16 23:22:33', '2024-08-17 06:22:33'),
('8988962dff5e313df8a7a851d2f1c95e4ba0d2f05584d38125e886b0266465af8f558cdf5946d3a4', 1, 3, 'nApp', '[]', 0, '2023-08-17 21:51:36', '2023-08-17 21:51:36', '2024-08-18 04:51:36'),
('89a6271bd4d6339721f2b8e933ff062f1b1e6200ae388c678b0067e91bf3f66820d07b221786f034', 1, 3, 'nApp', '[]', 0, '2023-08-15 18:46:19', '2023-08-15 18:46:19', '2024-08-16 01:46:19'),
('89ae233261409221841d7e54fbe34bb6dc19b08291105a5d0e6448f5ae12f65ab9a94ee4ef86d65e', 48, 3, 'nApp', '[]', 0, '2024-01-26 23:39:21', '2024-01-26 23:39:21', '2025-01-27 06:39:21'),
('89bc79fe8ae989e535c651981b5720b77be453920362d9a1b8a4b4a40ae7a99441b8ef79c5b29863', 1, 3, 'nApp', '[]', 0, '2023-10-22 01:14:34', '2023-10-22 01:14:34', '2024-10-22 08:14:34'),
('89d49794e901c3f8614301f3bc2e7a8ab7d1409515e6dbf69d6d90742bfcc1a07e2980ed8884c4ca', 161, 3, 'nApp', '[]', 0, '2023-12-06 05:17:56', '2023-12-06 05:17:56', '2024-12-06 12:17:56'),
('89db1387454f506ddb5e59573e6e98c178b49a2b5bc9eef686596b88fc3ffdd485ebbc1e716262e5', 1, 3, 'nApp', '[]', 0, '2023-08-15 14:13:40', '2023-08-15 14:13:40', '2024-08-15 21:13:40'),
('89e6c97448dcde6603f49ab1be3a405bbc73b1f337a5411b91ea30cf3b4bd5b1ba0ea344ff6639e2', 161, 3, 'nApp', '[]', 0, '2023-12-03 04:30:09', '2023-12-03 04:30:09', '2024-12-03 11:30:09'),
('8a2efd828f27384e525d202e4c5ef00c338554fd68bae5e37bc767f67568e65c7546bbf2ce75f7d2', 161, 3, 'nApp', '[]', 0, '2024-01-21 20:30:44', '2024-01-21 20:30:44', '2025-01-22 03:30:44'),
('8aac400ca1af62f638ae40e6ebd683c754ca655a1dcb19737a1dc1f87c434f218d33812eba12abcb', 48, 3, 'nApp', '[]', 0, '2024-01-13 19:34:50', '2024-01-13 19:34:50', '2025-01-14 02:34:50'),
('8af4c11f4224e4d3f4717ad3363f5b184b9de597572c7ababe5d9794027bd26371dfa5e9af65b595', 1, 3, 'nApp', '[]', 0, '2023-08-15 22:44:05', '2023-08-15 22:44:05', '2024-08-16 05:44:05'),
('8b1a88b9afb3e58f028e46146a242ed5234e9f7e78bab46951b0ccc325c3cb91da75351dbec1c8ff', 48, 3, 'nApp', '[]', 0, '2024-02-01 17:59:06', '2024-02-01 17:59:06', '2025-02-02 00:59:06'),
('8b65dba9fef3b5d5d974c304c112b3b6c51a10bafa1f5eee58761d4a2ac1e6cd75f87f0d294e9e9d', 1, 3, 'nApp', '[]', 0, '2023-08-30 21:21:45', '2023-08-30 21:21:45', '2024-08-31 04:21:45'),
('8baf7f8e5ad32e4930a960000cd19514343f934892dad70512d03aea024fd245579f3454ab1f066a', 48, 3, 'nApp', '[]', 0, '2023-08-31 21:08:47', '2023-08-31 21:08:47', '2024-09-01 04:08:47'),
('8bc3f0f56ae7100afdd3c6252cc859beebc2cddeb115de13d7bb6058f8662570d71c6fef8a70cb74', 141, 3, 'nApp', '[]', 0, '2023-09-24 19:00:19', '2023-09-24 19:00:19', '2024-09-25 02:00:19'),
('8c24ad5e05ed03a844100ca1a204c56e2931348986988ab62c3c36b4b79fbed1c092fb3e335471ab', 43, 3, 'nApp', '[]', 0, '2023-09-05 05:49:52', '2023-09-05 05:49:52', '2024-09-05 12:49:52'),
('8c73ba187d2da96167864b1e6f2a79ca906391c32125076b160c5189ed5d10ca48d2781d31af9104', 161, 3, 'nApp', '[]', 0, '2023-12-03 01:19:04', '2023-12-03 01:19:04', '2024-12-03 08:19:04'),
('8c907e4fa7f00931ee136af4f5f19ffb85022ebafcb0f2f456780250458e032518c04dfa83f618d0', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:24:42', '2023-09-02 10:24:42', '2024-09-02 17:24:42'),
('8cdd60d5aacd19b4dec29f9b06d2ed90c4342b6112aa5b009d4c44444915387c16e7effe2eb8444c', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:21:06', '2023-09-02 10:21:06', '2024-09-02 17:21:06'),
('8d61c84070d8de1e2684e8ba8bf17c41c20429d4648c12715f9da0a4ed3a8c28480ffbeb67ade994', 164, 3, 'nApp', '[]', 0, '2023-11-29 00:18:54', '2023-11-29 00:18:54', '2024-11-29 07:18:54'),
('8d6295d358c0cc2025fee317b49f5f74071b538d8cf3abb1d09ff5ddaf25974006900cf57f1748ea', 161, 3, 'nApp', '[]', 0, '2023-11-29 00:52:25', '2023-11-29 00:52:25', '2024-11-29 07:52:25'),
('8d6a0b03fc8acf97c40307ea08676403d92254a9158e4e00928aa882609a2c8c27e4604239285001', 48, 3, 'nApp', '[]', 0, '2024-01-13 19:42:52', '2024-01-13 19:42:52', '2025-01-14 02:42:52'),
('8d9f19d2bb2536f12fa2acf607b21a786138d40efeb0b5d60acc1e3c88cc37529f504676fb0f6f47', 1, 3, 'nApp', '[]', 0, '2023-08-31 06:05:57', '2023-08-31 06:05:57', '2024-08-31 13:05:57'),
('8da8396279ba79a730c1b12fe722880d46f7fe64367503179f6ec5cb5bc1677e7e9bcc45300e7110', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:03:09', '2023-09-02 10:03:09', '2024-09-02 17:03:09'),
('8e3e9d5773604bcb83a20e81443b6b08014802df3882485de28525929e8b1846ad2fdb4e94f07b94', 1, 3, 'nApp', '[]', 0, '2023-08-21 00:45:10', '2023-08-21 00:45:10', '2024-08-21 07:45:10'),
('8eff55d37f59d3b8d81ec37f4501e5f95dde38787e16d0f4bd44bb240ede933095f4831d6fb1fe4a', 161, 3, 'nApp', '[]', 0, '2024-01-09 20:27:01', '2024-01-09 20:27:01', '2025-01-10 03:27:01'),
('8f0d9134608cdf13339db4e9bd02c116c88ad551aea31d44cb2a95f825da3ee8516bd25ea25907b3', 161, 3, 'nApp', '[]', 0, '2024-01-27 04:20:13', '2024-01-27 04:20:13', '2025-01-27 11:20:13'),
('8f21b180f16eeb614d3751196c3fcf5ffad00477a71da64b552d5760060cdb58c34ffef0ff6bae69', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:44:09', '2023-09-02 09:44:09', '2024-09-02 16:44:09'),
('8f43619a345e0f9539063aa0db0b0de542f5af5c91d7bb428080fad9a80954ec4cdc2e2a44787ec8', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:41:06', '2023-09-02 10:41:06', '2024-09-02 17:41:06'),
('8f59d56d18af7a129e41b6496f34184134ec9ae5aa79b6509fdff509c3f5ddbef102775c34fe89b8', 1, 3, 'nApp', '[]', 0, '2023-08-31 06:27:55', '2023-08-31 06:27:55', '2024-08-31 13:27:55'),
('8f7503317f6bfdc41abf7d23722539c03a5d6d8b86ad818a6295b1c178b2d80f0d4fb9a1092f56a5', 182, 3, 'nApp', '[]', 0, '2024-02-04 04:13:57', '2024-02-04 04:13:57', '2025-02-04 11:13:57'),
('8fa0b6aa2a1262b184062c8abc74571ee58205e5295ea07ec464863ac8e4771f199367fad70dc070', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:15:57', '2023-08-16 23:15:57', '2024-08-17 06:15:57'),
('8fc30ea3ff016223ae2468211abfa1e27955ccd93ca0b39d341722fd8b888f0cc80c394883f4d74a', 1, 3, 'nApp', '[]', 0, '2023-09-02 14:03:21', '2023-09-02 14:03:21', '2024-09-02 21:03:21'),
('9014688584315f8f107a1a340fc1507ac530330d8323c17acbb2e311f441e5e4a88d2c5f06d24944', 56, 3, 'nApp', '[]', 0, '2023-08-18 00:26:03', '2023-08-18 00:26:03', '2024-08-18 07:26:03'),
('901b9d874d803412dafec98d446cb45f943beff180964704088c3c1ee0d166b89e7cb022096ba415', 164, 3, 'nApp', '[]', 0, '2023-11-29 00:18:02', '2023-11-29 00:18:02', '2024-11-29 07:18:02'),
('901c40a73de3282f592ae4d6dc4dd6df92a75395890f1e35f137c62b04325279857788c9c2b130a6', 56, 3, 'nApp', '[]', 0, '2023-08-25 05:27:40', '2023-08-25 05:27:40', '2024-08-25 12:27:40'),
('903c2061cb730058a172ea805eba0255d7fb355af722af560bc6d58541aac71227fe6b80e24352cc', 43, 3, 'nApp', '[]', 0, '2023-08-24 21:36:23', '2023-08-24 21:36:23', '2024-08-25 04:36:23'),
('904c21bf478be397c5724c13dc526cf353fe05fef42b8b0f54215e576860468bde69136025591d3c', 1, 3, 'nApp', '[]', 0, '2023-08-24 22:22:34', '2023-08-24 22:22:34', '2024-08-25 05:22:34'),
('91ae270dfa6c00ce7ba8eeb309198d1163546eede3f8cf33b314ec483fb017541bd5ff0991e3229d', 144, 3, 'nApp', '[]', 0, '2023-09-26 15:01:16', '2023-09-26 15:01:16', '2024-09-26 22:01:16'),
('91bc3f6950f95fe8a2035d669394f4c0f58a3bdb0f3236ca78327f758ffb073eda71c9edccd92514', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:26:18', '2023-09-02 09:26:18', '2024-09-02 16:26:18'),
('91c5638f3f7a9cc2e3566bf80d8cd31ba93fcfc0fc875df46563ae281868cf96bed747b8cacf65c3', 48, 3, 'nApp', '[]', 0, '2024-01-16 09:28:45', '2024-01-16 09:28:45', '2025-01-16 16:28:45'),
('91f7480ea4134b7c53d5dffe34672b837f0cb6c30f8502bbbcc1c81361cb1e128e94a657b8714115', 1, 3, 'nApp', '[]', 0, '2023-09-02 08:14:04', '2023-09-02 08:14:04', '2024-09-02 15:14:04'),
('929105e170c17905cf100717db52ecb21b32a5c919bfae58aa105c3a2b925856d4ab2512c5f03e0f', 145, 3, 'nApp', '[]', 0, '2023-10-17 19:26:48', '2023-10-17 19:26:48', '2024-10-18 02:26:48'),
('92a22f848302f6c4377e5c5e9aacefa4ba214953851627d9f0a70be38b5aa0024e194efef02c40d9', 161, 3, 'nApp', '[]', 0, '2023-12-03 20:04:05', '2023-12-03 20:04:05', '2024-12-04 03:04:05'),
('92b8edefa706cba97fee9e99d364da545878112b7b66a6a951c54e52e5615bd5dd9f1146061f62de', 1, 3, 'nApp', '[]', 0, '2023-08-15 23:30:31', '2023-08-15 23:30:31', '2024-08-16 06:30:31'),
('92defb32f60ab3d6ca2754d356e57745590e2ae12785f8dd2ed6e4141767bc71ce3061f0b5b1c4dd', 1, 3, 'nApp', '[]', 0, '2023-09-02 11:06:24', '2023-09-02 11:06:24', '2024-09-02 18:06:24'),
('92f68ea9c9b22ecea21c7c1de953e04f962fe53fe140af89225d1a31f7b4971603d1b7777c9d39c2', 1, 3, 'nApp', '[]', 0, '2023-08-08 17:19:49', '2023-08-08 17:19:49', '2024-08-09 00:19:49'),
('934c7254f3a9db51f360f00370a72ffb1f875de2967ebafc4abad6e35715fe6f664ae32f18337e3a', 43, 3, 'nApp', '[]', 0, '2023-08-26 07:56:32', '2023-08-26 07:56:32', '2024-08-26 14:56:32'),
('939bf3cbabae8f3d59eb983d59dddc6efc3d07f30e21eae1317ba409e77699c1591b2d942285a807', 48, 3, 'nApp', '[]', 0, '2024-02-01 20:56:07', '2024-02-01 20:56:07', '2025-02-02 03:56:07'),
('94ab0185e4dda4360dbf5cfcc5589eb278ba0c8f23e80a047366886e64a1aaa0a4dd7e5516f30192', 1, 3, 'nApp', '[]', 0, '2023-08-31 07:10:52', '2023-08-31 07:10:52', '2024-08-31 14:10:52'),
('9541be723c0d9a9228c615065618935ede875fd5351b3d7b18bad37694f26138194ae00abe44b729', 1, 3, 'nApp', '[]', 0, '2023-09-02 11:10:43', '2023-09-02 11:10:43', '2024-09-02 18:10:43'),
('955bc36159e83122c729a39483588b1e656d1499e994b2719f27001365731cb761043d291a73e690', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:45:15', '2023-09-02 10:45:15', '2024-09-02 17:45:15'),
('95867b325180aff5e29f8e0a89c1bc4b307852dc4d20aeb77aa86a538907e50d8b4e0c21f3b3b051', 1, 3, 'nApp', '[]', 0, '2023-09-02 18:52:28', '2023-09-02 18:52:28', '2024-09-03 01:52:28'),
('95968ac259332ec461e4df6515a97ce503c81f7e728f45f12b61d37e11696f56e82a57f5a344e3a6', 43, 3, 'nApp', '[]', 0, '2023-08-15 18:55:04', '2023-08-15 18:55:04', '2024-08-16 01:55:04'),
('95d8c26991979133bbf5f29b68d601a9c8ee811732dc61bcabbaa6ef3e6a308ab669f7ec93395c83', 1, 3, 'nApp', '[]', 0, '2023-08-16 21:32:27', '2023-08-16 21:32:27', '2024-08-17 04:32:27'),
('95e771b6e996a7c02ec4bbab813db5d9c30bea1c9f03a0a2aa843086b265cf99cbcb7ee232c458ac', 161, 3, 'nApp', '[]', 0, '2023-12-26 19:09:04', '2023-12-26 19:09:04', '2024-12-27 02:09:04'),
('95ee95804f2c78685ae01ecabfe42631fa349449db1268379297d5c60153331bff65978e42c3af7a', 1, 3, 'nApp', '[]', 0, '2024-02-04 08:58:36', '2024-02-04 08:58:36', '2025-02-04 15:58:36'),
('9647f6625baadc7168e0bddf01c4b93830379ff9a12287b71970cced08c2d229f3e7f0a2237dfb11', 161, 3, 'nApp', '[]', 0, '2024-01-23 18:55:41', '2024-01-23 18:55:41', '2025-01-24 01:55:41'),
('968d2dcf7f9b64c83c54a3f8fe2f623d12fb34f3d1f68aa00451598e6ba0aa927fd3cef6fb4d65f8', 161, 3, 'nApp', '[]', 0, '2024-01-08 20:59:50', '2024-01-08 20:59:50', '2025-01-09 03:59:50'),
('96c268c187574b6861cffbda6bd2ca7cdd52b3fee51f2080716b2788b9a01e8c354c258a2f104ba8', 43, 3, 'nApp', '[]', 0, '2023-08-15 19:01:40', '2023-08-15 19:01:40', '2024-08-16 02:01:40'),
('97156fbd7e2a1d91fb5712aaf95250a59df70cfc82deaf47bcdb17cbfb262d3355082e4710cd926e', 1, 3, 'nApp', '[]', 0, '2023-08-15 17:41:20', '2023-08-15 17:41:20', '2024-08-16 00:41:20'),
('973b31ac8b86c5ddc77b452a1892783116d40a3329b7da62127035bab52707f6e51d8c43ee620809', 1, 3, 'nApp', '[]', 0, '2023-09-03 10:48:01', '2023-09-03 10:48:01', '2024-09-03 17:48:01'),
('9762b5fb9ac888c20eeedbbe8f0678dfcd930cf6338187cac79cfbc8aec6beed0eceb426b159ffff', 161, 3, 'nApp', '[]', 0, '2023-11-29 01:21:12', '2023-11-29 01:21:12', '2024-11-29 08:21:12'),
('979c184ac77206ce626836382410d6541d0c26322f767923f8e7bf17b9bdc7f0dc8285a049201553', 1, 3, 'nApp', '[]', 0, '2023-09-02 13:39:49', '2023-09-02 13:39:49', '2024-09-02 20:39:49'),
('97fedf9e70278b46bdc28504563432aa7453803afb216e5854b2040f2dfc9183247f06dabe3fb233', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:50', '2023-09-02 09:26:50', '2024-09-02 16:26:50'),
('9897ac0c2f27b19e3c088986b6591cc51d0e436190da647f85ae207efac66fec4ffe521678c86d6b', 1, 3, 'nApp', '[]', 0, '2023-08-25 05:13:29', '2023-08-25 05:13:29', '2024-08-25 12:13:29'),
('98a5a884185124e2ea332332e5e510043911047fadfe529933abb8266527716437083a0ebf762647', 6, 3, 'nApp', '[]', 0, '2023-08-07 20:27:06', '2023-08-07 20:27:06', '2024-08-08 03:27:06'),
('98c17ae7adc1cdadbfea99e1bed871ffde7067ade407be16f33c8f1202f0f9cfa18e925be3f8a689', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:06:38', '2023-09-02 10:06:38', '2024-09-02 17:06:38'),
('98f4aa36cb2b0569753eef5cfc83874e307c467d9917b3674891eec50306181446629960ac79fbe2', 1, 3, 'nApp', '[]', 0, '2023-08-24 21:36:07', '2023-08-24 21:36:07', '2024-08-25 04:36:07'),
('991e183657aec716e4d4d1687ba8abcb2c16b30fc8080069d92ed9e98aa0863c0a113420e68f82bf', 1, 3, 'nApp', '[]', 0, '2023-08-31 05:12:16', '2023-08-31 05:12:16', '2024-08-31 12:12:16'),
('992e0a2e22846cb70dc55c6690477c1957fe61b18ffa05c4ffbe1585c5e37a8c782d44934b615943', 43, 3, 'nApp', '[]', 0, '2023-09-06 23:12:20', '2023-09-06 23:12:20', '2024-09-07 06:12:20'),
('99a2924c23cf6223b6f742a35ee8af1ca119eee27a3a7ec2e6deb41898bb62059e7969ed245ed153', 161, 3, 'nApp', '[]', 0, '2023-11-28 18:05:20', '2023-11-28 18:05:20', '2024-11-29 01:05:20'),
('99b3e86759832b2f58af49dece5fedd0548a4f475829208e51afe9f31bbe8769d8f80ceab4d9df1b', 1, 3, 'nApp', '[]', 0, '2023-09-02 20:05:08', '2023-09-02 20:05:08', '2024-09-03 03:05:08'),
('99f53cee60761a0f4567599f1af848b223df9c336e5f9a77c83b3cb81bfe56d282da26cd21acea3b', 159, 3, 'nApp', '[]', 0, '2023-11-29 20:26:52', '2023-11-29 20:26:52', '2024-11-30 03:26:52'),
('9a0a0b158749c2f57140fb4b3d1f7b771cdc99e68c3353adfa6a3dc9d5b0cb59452e1d76e45d083d', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:26:17', '2023-09-02 09:26:17', '2024-09-02 16:26:17'),
('9a25048fe5fcc7a4d2f5ec006b9c2a9f339f2be6ed8f230ce05225655ebc50494de2a675980eaba8', 53, 3, 'nApp', '[]', 0, '2023-08-17 23:22:26', '2023-08-17 23:22:26', '2024-08-18 06:22:26'),
('9a4ef97768f1fc93fbce9f694f25a6bfc1b0a3b9b0279015335487f0e963a2778b16fe98f91916bb', 161, 3, 'nApp', '[]', 0, '2023-11-30 05:31:38', '2023-11-30 05:31:38', '2024-11-30 12:31:38'),
('9a63892a02ace4857e9dd147cf7b72ec779405ded12265e7bd62df4ff0bb0687a87f40fd804121d9', 161, 3, 'nApp', '[]', 0, '2023-11-23 00:38:35', '2023-11-23 00:38:35', '2024-11-23 07:38:35'),
('9aaf52c842e67dc1cc7ae9f79f7d2e5951b2c4d02b7c545be779b93c161f23d70a7a96d0b7fefa6a', 48, 3, 'nApp', '[]', 0, '2024-01-22 20:46:13', '2024-01-22 20:46:13', '2025-01-23 03:46:13'),
('9aca6aabbeb8620ecfeaf9ebeecaee0886f882acafca9d9bb727b73f01e512de5d51061dd7b11390', 161, 3, 'nApp', '[]', 0, '2023-12-04 22:10:59', '2023-12-04 22:10:59', '2024-12-05 05:10:59'),
('9b71e8541701a34d00f41cbf0c927085248d1819cd26338dbc17de0368097a648c2589bb379c86fe', 161, 3, 'nApp', '[]', 0, '2023-11-30 05:25:41', '2023-11-30 05:25:41', '2024-11-30 12:25:41'),
('9bd24d48d8b4c260d6755c7c3b906cf8d00e21b4a6857420081b1825a95efb7b31888f419500f02c', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:06:50', '2023-09-02 09:06:50', '2024-09-02 16:06:50'),
('9bf1b2a60c3051420dbad042b8630f780a2d677911bb40d2c55d3af3c3b33fa51d99b7824bb39538', 1, 3, 'nApp', '[]', 0, '2023-08-24 19:08:23', '2023-08-24 19:08:23', '2024-08-25 02:08:23'),
('9c00023eb3552dad2c4882ac4c513378c4c53ff7d60fd44f5a1450bbbebf6277a182ecb0d3388eb7', 48, 3, 'nApp', '[]', 0, '2023-08-26 03:48:09', '2023-08-26 03:48:09', '2024-08-26 10:48:09'),
('9c3e80c6a1fc10c55fc9545c477610ce541a8dc815fa04b596cb8b341d6443b080aecf8a0b1069ac', 182, 3, 'nApp', '[]', 0, '2024-01-24 19:27:33', '2024-01-24 19:27:33', '2025-01-25 02:27:33'),
('9c41f664186fa3b2083c34d0521b6324ccceccb8282ece4088d9c9c28e4633526b398caaf6d9a531', 161, 3, 'nApp', '[]', 0, '2023-11-29 22:02:37', '2023-11-29 22:02:37', '2024-11-30 05:02:37'),
('9c643744aea2a2082875f22e82beffb9a38a51f861bac36e6fe0d90d5cbe31c797860644245b644a', 1, 3, 'nApp', '[]', 0, '2023-09-01 23:35:12', '2023-09-01 23:35:12', '2024-09-02 06:35:12'),
('9cdbb2e64ad11633d6e35219feeb9a53bd268b1e86e702a7c901e13060e9ab52dfd33763beb91d81', 1, 3, 'nApp', '[]', 0, '2023-08-25 05:25:31', '2023-08-25 05:25:31', '2024-08-25 12:25:31'),
('9cfd153ef09434f4eefeb752127a650938770031707635f46a1f2287d10248f51ae771fe7c8ac00b', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:54', '2023-09-02 09:23:54', '2024-09-02 16:23:54'),
('9dd90b1acbc27e484f257072e67789002a1799c0305e0f458f62cec9b6457fa496cba8cc08035f7d', 1, 3, 'nApp', '[]', 0, '2023-08-25 05:04:30', '2023-08-25 05:04:30', '2024-08-25 12:04:30'),
('9dda2acd29bd743ab2d4715a3c8626f4d396428eb001384f4808f9efa0ad788d6992800b0882b566', 43, 3, 'nApp', '[]', 0, '2023-09-05 09:00:47', '2023-09-05 09:00:47', '2024-09-05 16:00:47');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('9ded179a68e095f040c805ca66abe79c03a2b4875da10db7408839b5101e3a79b7f3daad7f2d5b16', 1, 3, 'nApp', '[]', 0, '2023-08-30 21:10:28', '2023-08-30 21:10:28', '2024-08-31 04:10:28'),
('9e4fee75a37758ae6e50dccf2560035d5b3b65bee4e7766aeb6b426970513c189963d6d36b443f78', 43, 3, 'nApp', '[]', 0, '2023-08-26 18:34:04', '2023-08-26 18:34:04', '2024-08-27 01:34:04'),
('9e928b296be72aded3658d599eb672986ddbc914a43ec2abc60eef1d839c9b449f8e387997e94569', 164, 3, 'nApp', '[]', 0, '2023-11-29 00:19:18', '2023-11-29 00:19:18', '2024-11-29 07:19:18'),
('9ed79fb0852dc746e2d2e0e6b5120bcb0724d1d179eaa117ef457efc85e75759c73208244f7e0684', 1, 3, 'nApp', '[]', 0, '2023-08-25 05:28:02', '2023-08-25 05:28:02', '2024-08-25 12:28:02'),
('a00a947b0a61c1b0d753f7123b3ae82e55bd5f1803ba7fce3ae6fe459d162ffb91958ef4108c2069', 161, 3, 'nApp', '[]', 0, '2023-11-29 05:32:00', '2023-11-29 05:32:00', '2024-11-29 12:32:00'),
('a083f0f26e4753f71a7162136c8a4bbbe4ef432a9526229da8d037ca9c520f007e1c558aad0fe988', 161, 3, 'nApp', '[]', 0, '2024-01-26 23:38:42', '2024-01-26 23:38:42', '2025-01-27 06:38:42'),
('a0876ad61503814f18d185f245600325d2579e2fac6faf43ea5cf0971273d3bc1ff54f43cf0d1004', 161, 3, 'nApp', '[]', 0, '2024-01-11 18:31:31', '2024-01-11 18:31:31', '2025-01-12 01:31:31'),
('a122487acb1a4f02bab4349dc7ba7710481fd5e04799e0c19caeb36c771fc12be91969b5db33bc2a', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:35:54', '2023-09-02 10:35:54', '2024-09-02 17:35:54'),
('a150da4a53bf4b6915858ae0809dd40c20d7cf05d9ec11d2d238e5cce1a216d5dbc0f554caf8395c', 161, 3, 'nApp', '[]', 0, '2023-12-01 20:05:53', '2023-12-01 20:05:53', '2024-12-02 03:05:53'),
('a1a8a0cb786d325f507ade8da2e0637f89f99fd9bc5e0e2ae55050a7ec9aaa2706dcf490c1e65378', 1, 3, 'nApp', '[]', 0, '2023-08-17 21:51:12', '2023-08-17 21:51:12', '2024-08-18 04:51:12'),
('a1bc0738929bdc23ad5ac8e14529e30383083c8e7002c59f21cdd8525454a9399fb890eb35e7a8ff', 161, 3, 'nApp', '[]', 0, '2024-01-09 17:35:04', '2024-01-09 17:35:04', '2025-01-10 00:35:04'),
('a1bc9c8ef65abbd60e7ac88052eb712a1293808ac2a6bd16ca3cbc7afb1307c1d778c8a668578131', 161, 3, 'nApp', '[]', 0, '2024-01-25 02:07:07', '2024-01-25 02:07:07', '2025-01-25 09:07:07'),
('a218dbddb7326da4070af02d76a07d047f24a59a8a1059e5ff8b2742a1cd8e410f73da3903bcb4c8', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:15:19', '2023-09-02 09:15:19', '2024-09-02 16:15:19'),
('a22916d801e54333cb4a6f6b74c65f7cc0d9beac8e8e7d367ab430f6843de28b5e402ecdad6e78d0', 56, 3, 'nApp', '[]', 0, '2023-08-21 23:35:38', '2023-08-21 23:35:38', '2024-08-22 06:35:38'),
('a2ba1cb704f537605504854d0a57658098b45c0ffd9c7feb051850bc9fe0b86cfbba7a5ee7931ad9', 182, 3, 'nApp', '[]', 0, '2024-01-26 21:32:05', '2024-01-26 21:32:05', '2025-01-27 04:32:05'),
('a2d4ee5310e88a55a8151da16c312023f01a94cbad87e2fccdc778334e1e70a088749054a41be7d5', 1, 3, 'nApp', '[]', 0, '2023-08-15 23:38:25', '2023-08-15 23:38:25', '2024-08-16 06:38:25'),
('a2f082c49aa239157f9205052636e3906159bc960ed14ab02f37f6c2a63e436228b34043278c8a1c', 43, 3, 'nApp', '[]', 0, '2023-08-30 05:07:42', '2023-08-30 05:07:42', '2024-08-30 12:07:42'),
('a303d29855e293307a34dce4bb21dd5dfc5cf08443a7b4062c6edbab641974850e4c43f979f0bb96', 161, 3, 'nApp', '[]', 0, '2024-01-04 19:16:23', '2024-01-04 19:16:23', '2025-01-05 02:16:23'),
('a34a1a0a18f369183ef94d00f498cc8f429917cc2d0a724af5700042ef25b8145924f5c6870da7cd', 56, 3, 'nApp', '[]', 0, '2023-08-18 07:06:25', '2023-08-18 07:06:25', '2024-08-18 14:06:25'),
('a3946304d52b26ec80460602ddb2413291edcd370fff0c28f4801a30dcbcaf6829c8a98e50f0ac8b', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:36:33', '2023-09-02 10:36:33', '2024-09-02 17:36:33'),
('a3ac6e458339f34a997e5c7f997aab22cb6f68e553a3f831dfee232a7b89bbb411932495ad9c7e76', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:13:03', '2023-09-02 10:13:03', '2024-09-02 17:13:03'),
('a3ddac12c95efa3767b84769bba9516681e9b21dfe6e6866c0f968351883f045261fded866014131', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:36:36', '2023-09-02 10:36:36', '2024-09-02 17:36:36'),
('a3fea564c9085d0e341bed9aed21d653d7f90443fe53cb90f34a8b61a2382a5ca713f0370353236e', 161, 3, 'nApp', '[]', 0, '2024-01-09 23:45:48', '2024-01-09 23:45:48', '2025-01-10 06:45:48'),
('a41ef3c06f7422c216d88c09ee0cc11da63d6acdfd75cd4a9ed706c526956b5b49fdd5bf75cfa166', 1, 3, 'nApp', '[]', 0, '2023-08-17 22:05:46', '2023-08-17 22:05:46', '2024-08-18 05:05:46'),
('a519fc4a08f5d86103be5e99db58af8cbe9ec95b4579b5130b23a7511fcb491d70fb600f2fdc5703', 43, 3, 'nApp', '[]', 0, '2023-09-03 17:35:14', '2023-09-03 17:35:14', '2024-09-04 00:35:14'),
('a5d658dc94f423d57f84645423260d361c56c9ad41d493f62a21eb20b0d29b115b520fceb13bcf1f', 1, 3, 'nApp', '[]', 0, '2023-08-15 23:01:00', '2023-08-15 23:01:00', '2024-08-16 06:01:00'),
('a5de817d67d7ab16b0b151b39ffb45672942ca3bbbe6a7d721ecdc36586a195e3bda8f2489577641', 161, 3, 'nApp', '[]', 0, '2023-11-29 19:38:10', '2023-11-29 19:38:10', '2024-11-30 02:38:10'),
('a5e34f86585cdb3e19cf1824674284c95d4341a4fe39d11e349060d602cb9aa7559b3cda79d1cc6c', 48, 3, 'nApp', '[]', 0, '2023-08-17 02:02:45', '2023-08-17 02:02:45', '2024-08-17 09:02:45'),
('a65989146d60777c513f50d0e7eb5852f68f0ce0a72993a0fd040718cd1b04a925caa85fbdf4315d', 1, 3, 'nApp', '[]', 0, '2023-08-24 19:04:20', '2023-08-24 19:04:20', '2024-08-25 02:04:20'),
('a690d897fc012709772d91e75388e56051c6c6eb52b6f535b905d2d71f338c13e22b3bd2d652a63f', 1, 3, 'nApp', '[]', 0, '2023-09-02 07:54:58', '2023-09-02 07:54:58', '2024-09-02 14:54:58'),
('a75a6c2fdb6fcf24df5298818a5af5ec0a79893c4a1f7940bb41eb6175a7c19631db5ab9aa36e233', 1, 3, 'nApp', '[]', 0, '2023-08-17 22:02:43', '2023-08-17 22:02:43', '2024-08-18 05:02:43'),
('a770c01f62c252ccce119d8ee9676e43065452dbe9fcdfff85d5a8e1866ed58cbfa5719f3a9bafcb', 161, 3, 'nApp', '[]', 0, '2024-01-10 15:05:15', '2024-01-10 15:05:15', '2025-01-10 22:05:15'),
('a7a705fcb89c1206fe6f65f5a6746fe4f52d1e9bfaa6466e7e7084df3735d43b7ccba6279bf7c31f', 161, 3, 'nApp', '[]', 0, '2023-11-30 14:19:01', '2023-11-30 14:19:01', '2024-11-30 21:19:01'),
('a7b93ac3ef9d4b31354ecdfcfa6d39a9f4798f45cbe63aa45a27c0282f2729be25d04cddb6b5ec53', 1, 3, 'nApp', '[]', 0, '2023-08-16 21:30:36', '2023-08-16 21:30:36', '2024-08-17 04:30:36'),
('a812f4241e76352ef82cb3635202c9dfc668a8d1cc87cabc63031fab085241b6c5ff4c7de6f37f0c', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:53:33', '2023-09-02 10:53:33', '2024-09-02 17:53:33'),
('a84af02a4b6601bf751293c005dc4bb36ae3df74aa27bde4b5d8117b8b92eb2dbff1f26fbe9d9441', 182, 3, 'nApp', '[]', 0, '2024-01-24 22:53:15', '2024-01-24 22:53:15', '2025-01-25 05:53:15'),
('a9390796b90912659ab89871391745097059dfa0d140083294f54e59eb335d6027ce996714026904', 129, 3, 'nApp', '[]', 0, '2023-09-02 22:17:07', '2023-09-02 22:17:07', '2024-09-03 05:17:07'),
('a97ca7c64690f6173b6e570beb2594bd10fd750d79e71389326b403ab5d2267d31c6702c6cf056b0', 164, 3, 'nApp', '[]', 0, '2023-11-29 00:17:57', '2023-11-29 00:17:57', '2024-11-29 07:17:57'),
('a9fc000e0fb2027c0e41cc82da110c2cf481aae065e9f6e5736b6cd4405e25365d48a66a11e6d714', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:44:17', '2023-09-02 09:44:17', '2024-09-02 16:44:17'),
('a9fde7c25389df211d1c5dea47a84c88b937b6fe5dc3e40d61a546963ca6bedc372c962ad66078c5', 6, 3, 'nApp', '[]', 0, '2023-08-07 23:41:41', '2023-08-07 23:41:41', '2024-08-08 06:41:41'),
('aa0c7b9e8b33e2af33d6b4e2ce509bf3c25626e1c6d1a33e28bbbb04b48a0a796fa835a59dad4229', 1, 3, 'nApp', '[]', 0, '2023-08-31 21:13:42', '2023-08-31 21:13:42', '2024-09-01 04:13:42'),
('aa13042f9dc8981cac0ede23acfd2f62f692b85563647acacc9c52273e9a6caeafefcdafd68ffd4d', 43, 3, 'nApp', '[]', 0, '2023-08-21 20:28:28', '2023-08-21 20:28:28', '2024-08-22 03:28:28'),
('aa2afd895c6813d3d87aa08ee7e50d59ab18f57f13b6a8064652d73240a9c44ed81313c636041bf2', 182, 3, 'nApp', '[]', 0, '2024-01-25 17:29:42', '2024-01-25 17:29:42', '2025-01-26 00:29:42'),
('aa8df08c7149bdaa94f7c8aa77daeee77365af069e449ca90cebf3a3a59d0855cb66d9431dbfb81f', 56, 3, 'nApp', '[]', 0, '2023-08-22 00:58:21', '2023-08-22 00:58:21', '2024-08-22 07:58:21'),
('aafc628466ccd9cc791d6300a4231195bcaeca4a9bb669f5d9e4e73468e18b88928cf2db95866d9b', 43, 3, 'nApp', '[]', 0, '2023-09-05 09:48:21', '2023-09-05 09:48:21', '2024-09-05 16:48:21'),
('ab217e2b04545662884d8c97d63de527f64ebfbd71007126c4c028fb02658f5e16d10ae5939f2bfe', 48, 3, 'nApp', '[]', 0, '2024-01-23 06:48:08', '2024-01-23 06:48:08', '2025-01-23 13:48:08'),
('abd676978d9a1ae704ee09e5b7eb7e0ae5cfd03fbf357c7ccc9c883b18eb6cde5475d5c047abcbb8', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:18:38', '2023-09-02 10:18:38', '2024-09-02 17:18:38'),
('abef55a369ff6e794125ba4793f711dcf1f9df54e9a262651fdf20b85278674b5e51f03a8895705e', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:07:04', '2023-09-02 10:07:04', '2024-09-02 17:07:04'),
('abefbaefc8b65af92da557329984cd2208182504792a93d2a5bf39bea020d4dc8e233bcf26741fa0', 1, 3, 'nApp', '[]', 0, '2023-08-14 23:38:16', '2023-08-14 23:38:16', '2024-08-15 06:38:16'),
('ac136b59091f19d256ed2816da0b5da78022dc191a31806a998833620bada9d339bf18a9aff114e6', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:15:20', '2023-09-02 09:15:20', '2024-09-02 16:15:20'),
('ac2a5347dad6ff980926219da9ec684ffafd0821da935bfdb6dc0a7b659fbd88c579d7975e89a133', 161, 3, 'nApp', '[]', 0, '2024-01-10 22:54:51', '2024-01-10 22:54:51', '2025-01-11 05:54:51'),
('ad878c581e89ce401a6430d318bc13e61110c483b7039cb4fcc2894f8e65f40ffa90a3db5b9e7563', 1, 3, 'nApp', '[]', 0, '2023-09-02 19:39:33', '2023-09-02 19:39:33', '2024-09-03 02:39:33'),
('adadea9652649394c8c3dc8c5d2534e40fc9b7b2f12828c70cf53e56754615595f79e7a7c48a2a86', 172, 3, 'nApp', '[]', 0, '2024-01-07 19:25:01', '2024-01-07 19:25:01', '2025-01-08 02:25:01'),
('ade6801d5a0964634b6bea7e96e47c299749fc9c121b3bafe8aa2fca7df05475c19656725506b4ad', 1, 3, 'nApp', '[]', 0, '2023-08-22 01:00:14', '2023-08-22 01:00:14', '2024-08-22 08:00:14'),
('ae773b4a7f1efb2e6822cb74dc4c674743e7ded046e6e9979d83204b1502bf46fa6747dfc8cf2388', 1, 3, 'nApp', '[]', 0, '2024-01-05 20:47:01', '2024-01-05 20:47:01', '2025-01-06 03:47:01'),
('aef04ad5bcf0d6b813dfece76757bf498b4ceefdc4deb7afa09f67e79ef5630859b8438d8b8ae99e', 1, 3, 'nApp', '[]', 0, '2023-08-30 00:31:42', '2023-08-30 00:31:42', '2024-08-30 07:31:42'),
('aef907e966a623a5dfb93020c52447f80b929a52f64df4424ce6826f0fccf0cf0b8ba3f3cdb4c1b6', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:49:26', '2023-09-02 10:49:26', '2024-09-02 17:49:26'),
('af0ffc3a5d36ddc2ac6f6bbb8cc126bb85a270b644387ab25231d02c8e9ba16f622674d3dfad4532', 1, 3, 'nApp', '[]', 0, '2023-08-15 22:44:47', '2023-08-15 22:44:47', '2024-08-16 05:44:47'),
('af459519d49b5414e97b555cc13fea0fccb08309cfd784b970514e051faca2fbaea76da2c5473222', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:13:42', '2023-08-16 23:13:42', '2024-08-17 06:13:42'),
('af5dcb32ad5c633040fc351941d9732ba61d7567527be919331a94ad41cb2c8dd2d108094e347fc8', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:45:50', '2023-09-02 09:45:50', '2024-09-02 16:45:50'),
('afd804775c7525017f9f3bd8374f7082a2be175b6ece45f7242cda8d34ffdeae9463b20aecc0a609', 161, 3, 'nApp', '[]', 0, '2024-01-08 01:02:28', '2024-01-08 01:02:28', '2025-01-08 08:02:28'),
('afe691eef4acc8f810033a05649221b33eb844e876f259a420f48b8fbbeea008f97b3a5b673d4c5b', 1, 3, 'nApp', '[]', 0, '2023-08-15 02:11:45', '2023-08-15 02:11:45', '2024-08-15 09:11:45'),
('afeec3e34262254227563ac9c6e8d5f0b91b8546a55780221186b6b7135f238c0d1fd8ca1b7cab5c', 43, 3, 'nApp', '[]', 0, '2023-08-25 05:33:20', '2023-08-25 05:33:20', '2024-08-25 12:33:20'),
('aff696204b7145d2d1fbabdf86cc290b25ed496cb608f18fdc83d688feb1cbadd26184877f29856b', 56, 3, 'nApp', '[]', 0, '2023-08-18 00:56:37', '2023-08-18 00:56:37', '2024-08-18 07:56:37'),
('b077c7b50ac4f76395164b5d5e8c775334f4bbb180cbc325b02704a2cfb2bfdfa607871b6afc6d27', 6, 3, 'nApp', '[]', 0, '2023-08-07 20:46:53', '2023-08-07 20:46:53', '2024-08-08 03:46:53'),
('b17f3982e454053dd26e0c30ff7473b44a18b822b4d4a8a83b360892f1079f7d219ebdc616a7cce3', 161, 3, 'nApp', '[]', 0, '2024-02-04 07:06:11', '2024-02-04 07:06:11', '2025-02-04 14:06:11'),
('b1cc3ac7ae04b4c7acd637c318754b5457c5d829ca0b404e0aa6eb13c5579a389b39dfe695f103d1', 1, 3, 'nApp', '[]', 0, '2023-08-24 00:10:08', '2023-08-24 00:10:08', '2024-08-24 07:10:08'),
('b21e73a0ec26eebce7aee5797d77af67b5fcb71a0dcb878a6704812b9718b4ca8a25dbd3d62fd97b', 43, 3, 'nApp', '[]', 0, '2023-09-05 17:48:17', '2023-09-05 17:48:17', '2024-09-06 00:48:17'),
('b263f2f224580a1d7b38cab5ebbd9b4147c05149a4c2951c5cbcad1ff5d4930b2cf369f4d308dff0', 161, 3, 'nApp', '[]', 0, '2023-11-29 00:53:37', '2023-11-29 00:53:37', '2024-11-29 07:53:37'),
('b28e9f86c18459dfc62da40e229e76b72b45b2dcbcd87081217492b443280362f251d1df4bad5f61', 1, 3, 'nApp', '[]', 0, '2023-09-02 14:02:42', '2023-09-02 14:02:42', '2024-09-02 21:02:42'),
('b2bda7d3cc736fe7f60d6610b0d049f28740d325d6770a82db3b4fc4245a125ca295c05f0a15fe27', 161, 3, 'nApp', '[]', 0, '2024-01-08 19:51:44', '2024-01-08 19:51:44', '2025-01-09 02:51:44'),
('b2d9f59e6c766c5ab054069d086b8422505b9f470c7c7c2379136c483fe2d69690d27d56dac5a473', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:54:01', '2023-09-02 10:54:01', '2024-09-02 17:54:01'),
('b2f38708a925f34817f29a6ba3cffd995f552ba9c6487824d639617c1f390a49bad47cddd8286b23', 1, 3, 'nApp', '[]', 0, '2023-09-01 21:45:16', '2023-09-01 21:45:16', '2024-09-02 04:45:16'),
('b2f737d6642f53f1b955dda39e657c59e3d70be7cc4760909830d8778ece66065a70ac239ff7b7f3', 161, 3, 'nApp', '[]', 0, '2023-12-02 16:30:13', '2023-12-02 16:30:13', '2024-12-02 23:30:13'),
('b3954b8dfe185909bd59604a4aa675d28a82f51e038b3a5a369d28a9317e03b5bbbf622aa4c8f56a', 149, 3, 'nApp', '[]', 0, '2023-10-17 21:23:46', '2023-10-17 21:23:46', '2024-10-18 04:23:46'),
('b3abd25a528c7e3b5e25308f97332e08f533379705613cc2eef325b4352e70d58fe64b43c0393d98', 43, 3, 'nApp', '[]', 0, '2023-09-02 20:33:19', '2023-09-02 20:33:19', '2024-09-03 03:33:19'),
('b3ac204ac829370a3f4432dcadd6dd58e89e86e36e3b88c0db1d93d6c06fc1727537547c77c6fc9c', 1, 3, 'nApp', '[]', 0, '2023-08-15 20:04:44', '2023-08-15 20:04:44', '2024-08-16 03:04:44'),
('b41c0bd96a68428f3510b5f0c2d425085bbead2c1f5651c5282676d1b2ad587b6ab2337d8307a5e7', 1, 3, 'nApp', '[]', 0, '2023-08-15 22:47:36', '2023-08-15 22:47:36', '2024-08-16 05:47:36'),
('b442fb75b66cc122b0318b0d9d05fde2b87763e40ac5ad88a73132a78deaa02391e875ee5cb01df6', 138, 3, 'nApp', '[]', 0, '2023-09-06 06:46:51', '2023-09-06 06:46:51', '2024-09-06 13:46:51'),
('b51a6a0db5a49a0f7a37138e02c9d30af47f733e03ae45d5fed46199cbdd60d554e49f3a0d24635d', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:48', '2023-09-02 09:26:48', '2024-09-02 16:26:48'),
('b51fee68d59a88616e827a20f924043e234fc0785ba3f9d28bf6723901cd4bb8ff8dca772c403db3', 179, 3, 'nApp', '[]', 0, '2024-01-11 18:49:06', '2024-01-11 18:49:06', '2025-01-12 01:49:06'),
('b551b69740d576f09687e8f9b1bcf012ebc8cc570083f25acd1ae4a4ad116790b3b8cb7e042b5922', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:57:53', '2023-09-02 09:57:53', '2024-09-02 16:57:53'),
('b5fb9742163019c8df120a6e9d5af5dd5ea8b207e1bda0edbbad1abcaa51c850921452889e5e0c8d', 161, 3, 'nApp', '[]', 0, '2023-12-04 17:55:15', '2023-12-04 17:55:15', '2024-12-05 00:55:15'),
('b680c3f8acbf1939d5ab2e50fcec289084fb26a7ad45a10d97196ba73bcbb3c9dffb0d8aea231ca6', 43, 3, 'nApp', '[]', 0, '2023-09-03 10:49:48', '2023-09-03 10:49:48', '2024-09-03 17:49:48'),
('b699e4de2d9a6c182b26778bf6b57afbfc8d412c2d5352a269aaf96ce3d8ec2b6ea5832e27a7288a', 43, 3, 'nApp', '[]', 0, '2023-08-26 01:08:00', '2023-08-26 01:08:00', '2024-08-26 08:08:00'),
('b6dbeff8459a7448f418f2b83e870c13fb179a18ec238cb444c64d8f2c96623440d075fda260c1e2', 161, 3, 'nApp', '[]', 0, '2023-11-29 18:01:43', '2023-11-29 18:01:43', '2024-11-30 01:01:43'),
('b6ed12ec40cfd6cd25ca6de6652df61e116696df9ad7ab876044d307342bd1010b076a9dbf8b17fd', 6, 3, 'nApp', '[]', 0, '2023-08-07 20:18:56', '2023-08-07 20:18:56', '2024-08-08 03:18:56'),
('b854797209ee3a975e2e68db829172698662f0249257ebca90800ac12fd920ba0c851692fa454f94', 128, 3, 'nApp', '[]', 0, '2023-09-02 22:13:08', '2023-09-02 22:13:08', '2024-09-03 05:13:08'),
('b87b82997cde291cca62d9160b59eaaa9d1343a539f1ac3d2605d6089fe1913dbdec3ae597f26a3b', 43, 3, 'nApp', '[]', 0, '2023-08-26 08:02:31', '2023-08-26 08:02:31', '2024-08-26 15:02:31'),
('b8ae7a18b9b2773a5bfd7eeb4d49095c225a1e4ed71b60b7487561a8ceb5708df5a63f04b13788a2', 182, 3, 'nApp', '[]', 0, '2024-01-31 22:13:20', '2024-01-31 22:13:20', '2025-02-01 05:13:20'),
('b8f0bfbdd6208169560ecf6897c3926aa1b1b74c695f1a2f1ce767a61e90d5e871a63de3127903b3', 1, 3, 'nApp', '[]', 0, '2023-09-02 08:13:56', '2023-09-02 08:13:56', '2024-09-02 15:13:56'),
('b8f2f146cae8c13e5181e20db9893873acb7ae911e9f6b3ae053d1a629f2a4467b2724845614831d', 1, 3, 'nApp', '[]', 0, '2024-01-27 05:31:50', '2024-01-27 05:31:50', '2025-01-27 12:31:50'),
('b925961f96b65fb97e8e1ad456aaddae6ce0ed6206cefbc16bdef2413f29d7d92a9561937b31a9c4', 1, 3, 'nApp', '[]', 0, '2023-09-02 19:34:06', '2023-09-02 19:34:06', '2024-09-03 02:34:06'),
('b934c7c9212fb4bb4fef7469b7beb8082ec96a91d3adb4a1046ff023ff7166a16722344e4b7acd81', 43, 3, 'nApp', '[]', 0, '2023-08-15 20:05:14', '2023-08-15 20:05:14', '2024-08-16 03:05:14'),
('b995f132b668902b8bc5ded5ec5481068f2844aade100c34a3d6fa0c77a7ce36258c816a46d7f600', 48, 3, 'nApp', '[]', 0, '2024-01-25 18:02:54', '2024-01-25 18:02:54', '2025-01-26 01:02:54'),
('ba47581ca4bf0baca05926272f2cceceb42af4e22acfbdf33ac34eda61fe305f77c98c4060fbaa67', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:49', '2023-09-02 09:26:49', '2024-09-02 16:26:49'),
('ba732dfefe76a5e094e9da2e2daabfb526a045879e2b1665ffa3cf14d26a0a9bb61607d0d12fd651', 161, 3, 'nApp', '[]', 0, '2023-12-04 17:12:49', '2023-12-04 17:12:49', '2024-12-05 00:12:49'),
('ba7ac913203c817546448a4065e6d4664e463e7b54c7e7f03a3a5374ee955a0eb76fd66913482819', 1, 3, 'nApp', '[]', 0, '2023-08-17 22:06:54', '2023-08-17 22:06:54', '2024-08-18 05:06:54'),
('ba8fda83449b5f4e2153e42476d2ebacadf14336521e2d3831dcefadaa6eedabf33abc3b40c2e9fb', 48, 3, 'nApp', '[]', 0, '2023-08-25 05:05:47', '2023-08-25 05:05:47', '2024-08-25 12:05:47'),
('ba99c898122bbb657ddd09ad8523e0ba2a017294205983bb4a7f762c5d1933af87ed1170e5d299b0', 161, 3, 'nApp', '[]', 0, '2023-11-28 18:05:05', '2023-11-28 18:05:05', '2024-11-29 01:05:05'),
('baa4cb43afab997e274180dca770ef5a4b9d26fa592394c32516fbedbd6d95e6009dc19fd05a5bd0', 48, 3, 'nApp', '[]', 0, '2024-01-23 07:48:13', '2024-01-23 07:48:13', '2025-01-23 14:48:13'),
('bac8544766bc55e07c136f0500cccd4e12f29db898fe285b015a195a2e5a0bda7806787795fd1493', 6, 3, 'nApp', '[]', 0, '2023-08-07 19:56:59', '2023-08-07 19:56:59', '2024-08-08 02:56:59'),
('bacf5654512d60659e1e0ae54d9190692f335d4526d639b7309b85b5446463422a29b9723eec7051', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:45:00', '2023-09-02 10:45:00', '2024-09-02 17:45:00'),
('bb064ce5a6eb47ec0eabd40f727b2bd1466f179d47815c0a6b266d444e0c7512d76bf5eb4a62b453', 6, 3, 'nApp', '[]', 0, '2023-08-07 01:49:45', '2023-08-07 01:49:45', '2024-08-07 08:49:45'),
('bb5e23fae0e785b800cab57d602842c1c300421251071e52f07abf220946f0062aeaaa9a9180bf29', 1, 3, 'nApp', '[]', 0, '2023-08-17 21:46:13', '2023-08-17 21:46:13', '2024-08-18 04:46:13'),
('bbd766a26d8b4de3f64748e386eaeafbe4c02b7fb13febe8b5a1daa7f82b28169e3aec207368d5b0', 161, 3, 'nApp', '[]', 0, '2024-01-19 00:20:27', '2024-01-19 00:20:27', '2025-01-19 07:20:27'),
('bbe9861c1c5cb6959b60554715d76bd341eca1c595c53eb6ae5154c094ef25ebcf173376a122274d', 161, 3, 'nApp', '[]', 0, '2023-12-05 00:42:48', '2023-12-05 00:42:48', '2024-12-05 07:42:48'),
('bc019e3ea99e95fa1afd045777b9b115263b243dbe8130b34aa9762e4525ae94fe6c6ce2cd873ac9', 1, 3, 'nApp', '[]', 0, '2023-08-25 05:33:03', '2023-08-25 05:33:03', '2024-08-25 12:33:03'),
('bc2e96c96a9174abf373d5e77d12ed2f1fd2d623c788044a5555d9323543fa50291b2a5ba94cf339', 43, 3, 'nApp', '[]', 0, '2023-08-29 18:21:27', '2023-08-29 18:21:27', '2024-08-30 01:21:27'),
('bc5d6a4307cb05917c0bbb14436d5b24f04cbc02a0a3accf8157aaff21013a5bc5e740bd57e09191', 1, 3, 'nApp', '[]', 0, '2023-08-25 21:45:22', '2023-08-25 21:45:22', '2024-08-26 04:45:22'),
('bcb509c2e6e582f93db4dea65ba86ea077ab86779c0b91301dd2864cb1c98f9138e3ed532c896ce3', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:56', '2023-09-02 09:23:56', '2024-09-02 16:23:56'),
('bce298d4cbb7eaab7d43c5b8f88512faf6da9d71207a50524f5a0b652fd43d572ef6a4dd92410323', 161, 3, 'nApp', '[]', 0, '2024-01-12 00:01:53', '2024-01-12 00:01:53', '2025-01-12 07:01:53'),
('bd16629785f4c238387e8b17884f3eaba9eddb5f0722c376988ca338c77e40663a7f93de4e5d4be6', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:24:47', '2023-09-02 10:24:47', '2024-09-02 17:24:47'),
('bd79d12a173837ce6f9d1d1309e9dc5622022097d3a04fb94c3f498d8415712d55fb181241e0374b', 164, 3, 'nApp', '[]', 0, '2023-11-29 00:18:54', '2023-11-29 00:18:54', '2024-11-29 07:18:54'),
('bd879e0ceafcc6f4d4c2fdbecf033d32957b9dd0eff3f3a2ffe12eb4a40d3f83f81a412345b60e79', 161, 3, 'nApp', '[]', 0, '2024-01-07 17:47:38', '2024-01-07 17:47:38', '2025-01-08 00:47:38'),
('bdc0027fa189952e036bc38c78f692811d2684a6b72b42875620d2e87b5ab91d606a2ba20d56cb6d', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:05:44', '2023-09-02 09:05:44', '2024-09-02 16:05:44'),
('be0f6e38fe77facc77f94c2a1f6a736e20aafcb53c12cfded8f7edd1647773f0818090f7b738dceb', 161, 3, 'nApp', '[]', 0, '2023-11-17 20:18:30', '2023-11-17 20:18:30', '2024-11-18 03:18:30'),
('be9706d891120600b2f8bd366a880e872c45f440b6dcbec777de6190312daaec8546b8df1f320149', 43, 3, 'nApp', '[]', 0, '2023-08-24 22:21:35', '2023-08-24 22:21:35', '2024-08-25 05:21:35'),
('bea59e9e60ae7247c42b0ed35427df5796672797bed53a561d3eb44ad97a828cb80d519dc9ddc076', 56, 3, 'nApp', '[]', 0, '2023-08-18 00:36:42', '2023-08-18 00:36:42', '2024-08-18 07:36:42'),
('bed80e9e38ddec04716e59ababf4daeb7f437c745298592ecaf15adc8f16bc025d52f1437e5e31b0', 1, 3, 'nApp', '[]', 0, '2023-09-02 08:19:02', '2023-09-02 08:19:02', '2024-09-02 15:19:02'),
('bf0640051274ad86aa46822b97f86c1c9889d856e9bf0b22b5b366cebdc5c37a25cc92bbcc68ca91', 161, 3, 'nApp', '[]', 0, '2023-11-29 17:18:09', '2023-11-29 17:18:09', '2024-11-30 00:18:09'),
('bf39525565ca0ec4dd776a236dbad869f4eddea208ab95e510214f55c89fd3cc8e366ba51519f8ef', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:47', '2023-09-02 09:26:47', '2024-09-02 16:26:47'),
('bf470273d9d811b921e49356698db79564a149fd6f82490484d2ba4dc646beecc2f235dd6d15395f', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:36:01', '2023-09-02 09:36:01', '2024-09-02 16:36:01'),
('bf9f70d79055740fa502c6ff014ebbe9c8b965ddac7b6628c7dd21c8adfc4c0eeb5200c430dd09c2', 175, 3, 'nApp', '[]', 0, '2024-01-11 15:15:47', '2024-01-11 15:15:47', '2025-01-11 22:15:47'),
('bfa74c99634cc791ba451c3caf6765228da16111ba433a2a1c0d22e8aa808bf95af1b9bfcd85386f', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:55', '2023-09-02 09:23:55', '2024-09-02 16:23:55'),
('bfb4319e8c2fba7dafdef0aa4858b9b6c084cfeb5d992124159bff6af1021074b2755be14b3af1c0', 1, 3, 'nApp', '[]', 0, '2023-08-25 02:52:31', '2023-08-25 02:52:31', '2024-08-25 09:52:31'),
('bff4ee590ea9b30fe453b881cb31c4dea2fd1a6de8d914d234cb796da69dc1eb48d71c86ee51c223', 1, 3, 'nApp', '[]', 0, '2023-09-02 19:25:36', '2023-09-02 19:25:36', '2024-09-03 02:25:36'),
('c0164005212b031a98e341e512b2d0747f85b0dd55c0468c6e41fe4ecf7c190509a1befbf49f0ef8', 48, 3, 'nApp', '[]', 0, '2024-02-01 18:55:45', '2024-02-01 18:55:45', '2025-02-02 01:55:45'),
('c04963f2cf8e9f3893a452c1d32dbe1e88d3c471fbb7901df7ce9d830a5ff1ac4440d5290e4793cf', 48, 3, 'nApp', '[]', 0, '2024-02-02 19:27:20', '2024-02-02 19:27:20', '2025-02-03 02:27:20'),
('c0701f61395ce0e135948d892092553c9e685f277795554e079a6098756b0cba709980cd79405601', 1, 3, 'nApp', '[]', 0, '2023-09-02 13:44:24', '2023-09-02 13:44:24', '2024-09-02 20:44:24'),
('c0b07fc9315807e678cf126b7617447f665496d7d9262dd7689db4654d7be84b3e943e8d051195bd', 161, 3, 'nApp', '[]', 0, '2023-12-17 19:56:42', '2023-12-17 19:56:42', '2024-12-18 02:56:42'),
('c0be8d56c99a6742c405ca1a8d119743b48d97b1753044956ccc3901b926e3769654d8a207c47b38', 1, 3, 'nApp', '[]', 0, '2023-09-02 18:22:21', '2023-09-02 18:22:21', '2024-09-03 01:22:21'),
('c0c045666f544e431489288e74a8c1ac6bf04b1e0aa829ad4795d657479f7ad99a0ebacf71967736', 1, 3, 'nApp', '[]', 0, '2023-09-02 07:55:30', '2023-09-02 07:55:30', '2024-09-02 14:55:30'),
('c24c7d57dfb08074cca132a68b52d26631f8cdc13d7f7e4900fff70b3bff1fc16e75659255e3ed39', 161, 3, 'nApp', '[]', 0, '2024-01-18 23:36:15', '2024-01-18 23:36:15', '2025-01-19 06:36:15'),
('c2df63a2efb2b04ff3b01814cb97e67d3a81f0a4421a6983185d0d6c9c91efa6d0a5f79e059c0a14', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:17:34', '2023-09-02 09:17:34', '2024-09-02 16:17:34'),
('c3592d289b1770f0b8f491a148f17a091947240252bf1997bef4fffe15ee5fdbc25a6a25f502a792', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:21:17', '2023-09-02 10:21:17', '2024-09-02 17:21:17'),
('c3fc63936a94fd2e9bb8abab34ab27c19da976ee1065e8b1f80ed6cb7ce984f3ff68c978cca3028b', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:41:16', '2023-09-02 10:41:16', '2024-09-02 17:41:16'),
('c474d039199eba76a97f7e475da916cf7c0e8dd884278c2be94008a238b08bc14a64fb6a79725d8d', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:43', '2023-09-02 09:26:43', '2024-09-02 16:26:43'),
('c4bc15e9d6b9f0bd619fcf3acb4902730140b4f0862a10375c5f13f9fd1870f1118a73bc9f46a069', 43, 3, 'nApp', '[]', 0, '2023-08-24 18:43:16', '2023-08-24 18:43:16', '2024-08-25 01:43:16'),
('c4e2f49c97240e8663b6e8a8f6ccc3d2fe9f286fa213cf1824e38aad302081fe0839f95004207813', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:23:23', '2023-09-02 09:23:23', '2024-09-02 16:23:23'),
('c4e549642bdd3bc53fd0b509f21d124f94ec71ade53e543764e8f2a992c9aea1c619bd7b33445bf4', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:12:52', '2023-08-16 23:12:52', '2024-08-17 06:12:52'),
('c500197a7ba83be0c13f5802ddc15fd30684ad1e188bb54abcf45e21a67ea109a71cfb482b7cbce5', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:34:22', '2023-09-02 09:34:22', '2024-09-02 16:34:22'),
('c5345f58ab5264bedf6eb958824e0f5f6c510491a58e39d30df2314dc2bdd7180d4effc497bf8531', 161, 3, 'nApp', '[]', 0, '2023-12-04 18:01:56', '2023-12-04 18:01:56', '2024-12-05 01:01:56'),
('c63391399a27674badec2d8c0a254a2b8b1ddf99c9b9d0a49eeefe176d4a2ecdec8b15712006c7c1', 122, 3, 'nApp', '[]', 0, '2023-08-31 21:23:54', '2023-08-31 21:23:54', '2024-09-01 04:23:54'),
('c63a897c05be143700755beb93ada66c3d78bd81444b95138972e4300287460b413065da344613b3', 6, 3, 'nApp', '[]', 0, '2023-08-07 18:36:32', '2023-08-07 18:36:32', '2024-08-08 01:36:32'),
('c64baf994964702703bca22729a0b9ceb69cbded6f047535d062f16dc101f2c08da700906a9dfa9d', 43, 3, 'nApp', '[]', 0, '2023-08-25 02:53:11', '2023-08-25 02:53:11', '2024-08-25 09:53:11'),
('c69fcdbad7d72ea0a9d7f06e809073c1184200f627d507ada426becd3f15dcd6c9b0df9a8c08f306', 1, 3, 'nApp', '[]', 0, '2024-01-29 23:35:41', '2024-01-29 23:35:41', '2025-01-30 06:35:41'),
('c73631bbbbd5481db6c8b852ccc0cbf0922efdefa3d8396810ba0d1e41b040da63d593ac0734def9', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:45:16', '2023-09-02 09:45:16', '2024-09-02 16:45:16'),
('c7710f3b61dce7ce78fe5c894b714e008e85f878916b80a1d0028f937ce1caeac60c7d9f2ea2107b', 1, 3, 'nApp', '[]', 0, '2023-08-24 07:02:24', '2023-08-24 07:02:24', '2024-08-24 14:02:24'),
('c7a8d3fbc79e2d77aef90a28a423c96c3a0f8da155974c8e551649e85f5542f1160fc54561db844c', 1, 3, 'nApp', '[]', 0, '2024-01-27 07:29:43', '2024-01-27 07:29:43', '2025-01-27 14:29:43'),
('c7fd59a097ec20db7861470b608aaa4496be4da7634a026b6fbbdcf683b0342c74ccef80bb472a5a', 1, 3, 'nApp', '[]', 0, '2024-02-01 20:30:35', '2024-02-01 20:30:35', '2025-02-02 03:30:35'),
('c81f8b2ec04f38c01c5a850b62aac6ebb0389afd72c30164441716ded8064f1933d55d8166225819', 1, 3, 'nApp', '[]', 0, '2023-09-25 00:16:40', '2023-09-25 00:16:40', '2024-09-25 07:16:40'),
('c8293812d77509c7c5a96596e1bece9a4c8d0069f60f33100a4cb40ee13f7c692a95acaaee0988d7', 43, 3, 'nApp', '[]', 0, '2023-08-28 00:04:59', '2023-08-28 00:04:59', '2024-08-28 07:04:59'),
('c82c3dd53494b127d387799ad161b14fc2dfe513a9b5dad18733c4ff1b265371bc6f7cb1a3e87ea4', 1, 3, 'nApp', '[]', 0, '2024-01-23 20:03:30', '2024-01-23 20:03:30', '2025-01-24 03:03:30'),
('c8a3eb17a998d495d432aa6b4f62f42045018243da4b5b80a5c359229bd677cc8a777fa32c954696', 48, 3, 'nApp', '[]', 0, '2024-01-28 03:04:08', '2024-01-28 03:04:08', '2025-01-28 10:04:08'),
('c8f109dc4b09e272fb7d37644a8c5be583af83bc8ca9b16716df69ef0aa69a478610d5f33c98d0f2', 1, 3, 'nApp', '[]', 0, '2023-09-02 19:33:37', '2023-09-02 19:33:37', '2024-09-03 02:33:37'),
('c91a1e0339e62f07c912751c46a6eb049a9050f840979d258efa6d1dca5e77e835e0f32d1def0bbb', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:06:33', '2023-09-02 10:06:33', '2024-09-02 17:06:33'),
('c97d66e19c4b08f5246e789d21da25c318bcbb6dd3fbfe9f64e0a781c1c110b1cc47d4d230e6e155', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:07:10', '2023-09-02 10:07:10', '2024-09-02 17:07:10'),
('c9e26383d4bd6d0dbedb73308e6c88ee12b1131de69a86aee9b40bea22ad534711201f201c40b4cb', 161, 3, 'nApp', '[]', 0, '2024-01-11 18:49:46', '2024-01-11 18:49:46', '2025-01-12 01:49:46'),
('cad23c5f8348e26db8a402e18833beb2307072c790be4e4fee68e4f50e3542a4fecebec138645979', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:55', '2023-09-02 09:23:55', '2024-09-02 16:23:55'),
('cae9f82b0db80169a58e9bedce5851f42582f6dda8b8de80acd7197d86115cbea91fcdb80cbb600d', 161, 3, 'nApp', '[]', 0, '2023-12-07 01:40:28', '2023-12-07 01:40:28', '2024-12-07 08:40:28'),
('cb009314ec52f3f64145c76c16a9e73f15c8234b9f88872f3d68701b7a3d63c13cbfc802a19d6cd9', 1, 3, 'nApp', '[]', 0, '2023-08-15 22:53:26', '2023-08-15 22:53:26', '2024-08-16 05:53:26'),
('cb1383b2566780095ada79c682a68a8e81cef2f1c28c368190fb5bbb3ef69b33b432c1b2b1d68c94', 48, 3, 'nApp', '[]', 0, '2023-08-25 15:05:02', '2023-08-25 15:05:02', '2024-08-25 22:05:02'),
('cb4a56c3f8eac129be3dc7a717b9882215ca1c431d48e1d2540c801a951e0d4e9ffa402fd266625f', 161, 3, 'nApp', '[]', 0, '2023-11-30 14:34:21', '2023-11-30 14:34:21', '2024-11-30 21:34:21'),
('cb78d896f2069d57000aeec0fd7a7b63c515d47be58527a8035df9ec7af097265aa211a9753c737e', 161, 3, 'nApp', '[]', 0, '2023-11-29 19:28:29', '2023-11-29 19:28:29', '2024-11-30 02:28:29'),
('cbc825c484ee7ccbd77066a084454d9dfd4e3921af31619409b3c21ddf8dd07e30ee5e885bf940ea', 48, 3, 'nApp', '[]', 0, '2024-01-31 23:24:25', '2024-01-31 23:24:25', '2025-02-01 06:24:25'),
('cbc9df56d0caa1d018bc5b2c9da5dabbc9cac048b7e114b472a6068df21ae22691ca8844271bab33', 166, 3, 'nApp', '[]', 0, '2023-11-22 19:29:31', '2023-11-22 19:29:31', '2024-11-23 02:29:31'),
('cbcde032b31dde8793c60207bc67dcd753e435463644d65132627d7e749348084c059ad5db38c593', 1, 3, 'nApp', '[]', 0, '2023-08-22 01:01:52', '2023-08-22 01:01:52', '2024-08-22 08:01:52'),
('cc1f01e2ea8753f2255e450d8a1b0a58e7712d0c0bfee6ab89414e220afad1cd8a5dbcf1561b9812', 161, 3, 'nApp', '[]', 0, '2023-11-29 05:42:35', '2023-11-29 05:42:35', '2024-11-29 12:42:35'),
('cc215a9ec4075bcdc477cd1b6d105c2d574b26bb6e36364de306130812026495782fbc7ac27f237b', 1, 3, 'nApp', '[]', 0, '2023-08-15 22:38:49', '2023-08-15 22:38:49', '2024-08-16 05:38:49'),
('cc2f622e5ed82ed0ad7f17cdd1fc8e338421b6c5aedc7e908aca4c83d160519c74286f83366527f0', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:34:15', '2023-09-02 09:34:15', '2024-09-02 16:34:15'),
('ccbdaa6305bfff7c6cd8a19a7b157554e922d7eaa97e86b34244d11f9010468a7cab2e3806a6f538', 43, 3, 'nApp', '[]', 0, '2023-08-28 18:08:34', '2023-08-28 18:08:34', '2024-08-29 01:08:34'),
('cd8bafe6434c09d5698d9bf2cac430c4e05941d1864d502204f99b1521a23fb537b552f1354edcb6', 1, 3, 'nApp', '[]', 0, '2024-01-31 23:01:08', '2024-01-31 23:01:08', '2025-02-01 06:01:08'),
('cd930b06aef2af429cf8c0e52794a36702cff7e0c6a092ea6efb70d02333ad20ea89c7bb3ef89d71', 48, 3, 'nApp', '[]', 0, '2024-01-27 04:34:18', '2024-01-27 04:34:18', '2025-01-27 11:34:18'),
('d01cf772fc5a36517bf4968b74ad3f0aa08ae2f3e1cfa4eb0b7045b02c14009a9b0f5a01268bbb68', 1, 3, 'nApp', '[]', 0, '2023-09-02 11:01:18', '2023-09-02 11:01:18', '2024-09-02 18:01:18'),
('d0c678e2ab1553c2c7dc6692f390539465c31f3e6b59b194334d158d7dd623a6e035649ecee56241', 161, 3, 'nApp', '[]', 0, '2023-11-28 17:55:12', '2023-11-28 17:55:12', '2024-11-29 00:55:12'),
('d108fd6529052d79547ea8e979fb6f1fcdb6994d4695456d86fd2242f96f4e085500c8e4cc4562fb', 1, 3, 'nApp', '[]', 0, '2024-02-02 19:32:12', '2024-02-02 19:32:12', '2025-02-03 02:32:12'),
('d12eaf2625b644fab67f6f10cba79014c43abf6f87b6ed9f0f3853d40a1b97b69a2b4de5f9df15c6', 1, 3, 'nApp', '[]', 0, '2024-01-08 20:37:50', '2024-01-08 20:37:50', '2025-01-09 03:37:50'),
('d13663450ff86379c134ee114c8b898a83629dcdf4932b755dbd52893068821443ae79334230f028', 1, 3, 'nApp', '[]', 0, '2023-08-09 01:02:53', '2023-08-09 01:02:53', '2024-08-09 08:02:53'),
('d15be8926768c0a418803e4ef41798bf73190664715edd058f242245adc5a8b3e00b709c13728c67', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:36:24', '2023-09-02 10:36:24', '2024-09-02 17:36:24'),
('d178d4eeb9d109eb070bfca5d934f9055935d58fbe391e6d2bd89dab89e1ac239b4f253106c612bc', 161, 3, 'nApp', '[]', 0, '2024-01-11 18:33:36', '2024-01-11 18:33:36', '2025-01-12 01:33:36'),
('d1a8c86f6a4f13dd35e8a1ba219365e99fb9ba1078017ef3028b0df4bc39df66c6ccedeb0d8475c7', 1, 3, 'nApp', '[]', 0, '2023-09-02 14:20:11', '2023-09-02 14:20:11', '2024-09-02 21:20:11'),
('d1d01e786ea5767d9ba229dc3de9ddbda6315d113410312e66a830ab5c81f2160df63193074dd297', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:55', '2023-09-02 09:23:55', '2024-09-02 16:23:55'),
('d207aa2b0fb443c74a400de22976acbb4a2ce0e07c313b3e85fcff77177b625e1036ede139f3bd4e', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:54', '2023-09-02 09:23:54', '2024-09-02 16:23:54'),
('d246b86e660e3fce25a5da17911d9eee8c7816d1ce291ae512d13c9d996191597b4e77af408e8ea0', 161, 3, 'nApp', '[]', 0, '2024-01-19 00:12:06', '2024-01-19 00:12:06', '2025-01-19 07:12:06'),
('d31b4525882dba94a8ce618b0ea69f823abb73f3265ea4dea83a75e348fdcc8b09e58fda070d48e7', 161, 3, 'nApp', '[]', 0, '2024-01-09 20:48:35', '2024-01-09 20:48:35', '2025-01-10 03:48:35'),
('d385a633f50bc143fb605bf2a1c2ac2ac7a83aab912834f0982457f903e45c13852b6bbe4db051d0', 161, 3, 'nApp', '[]', 0, '2023-12-03 14:51:05', '2023-12-03 14:51:05', '2024-12-03 21:51:05'),
('d3d14ddde5bc812e677b4f14bc6c5e97ad457b686dbf2ef75014b54259c964569be8a9c31dd013a1', 56, 3, 'nApp', '[]', 0, '2023-08-18 07:05:59', '2023-08-18 07:05:59', '2024-08-18 14:05:59'),
('d3df0ba087afa07a4d7e9792a62cb8a2d29a7763afe276f75e4adcd8ec4cfdb47d115bf6017d5215', 161, 3, 'nApp', '[]', 0, '2023-11-30 18:10:12', '2023-11-30 18:10:12', '2024-12-01 01:10:12'),
('d424879fdd06b527f082faf3bfb4be922b35b3ece41f194b87dd6bbf8a18d458663f6bc400b83609', 161, 3, 'nApp', '[]', 0, '2024-01-15 00:22:11', '2024-01-15 00:22:11', '2025-01-15 07:22:11'),
('d47a2cf85197544c88d1cc9ce94b4f5a278749ad009ea90cc4843b7a14d8d77fc020f43c78875edd', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:45:05', '2023-09-02 10:45:05', '2024-09-02 17:45:05'),
('d4b3a753ae6848c2e542e947b55f00b3945aaed670b44b5ebb629b43f6e742fe07fcb54a0e1486d0', 43, 3, 'nApp', '[]', 0, '2023-08-28 18:15:55', '2023-08-28 18:15:55', '2024-08-29 01:15:55'),
('d5b52a412b1bdd062f63651352eacdfc52b079080af8cc14321135b0b20d6c59ea232fdce5e0564b', 1, 3, 'nApp', '[]', 0, '2023-08-24 04:22:13', '2023-08-24 04:22:13', '2024-08-24 11:22:13'),
('d5e38495e987c660923ce80e4fcd812b18796752ded50f326d6cf136bab96e9df8e007700711009c', 43, 3, 'nApp', '[]', 0, '2023-08-24 21:37:30', '2023-08-24 21:37:30', '2024-08-25 04:37:30'),
('d64a8cd82dd4cb6b4fd25b8cb4f71b65366250ff6f475377ee9e0b4c6adef284d2f4f7646fc71870', 1, 3, 'nApp', '[]', 0, '2023-09-02 13:39:56', '2023-09-02 13:39:56', '2024-09-02 20:39:56'),
('d6923c985867203b2acd9f4bc03d9bada274171afd236832f6a0d25a4d108016551a1bd635da7c09', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:43', '2023-09-02 09:23:43', '2024-09-02 16:23:43'),
('d6ed9be1f8ffced061cfe304f2d60e1915483358ba0df6af70258966d74620d7538c4fdf1c25f445', 1, 3, 'nApp', '[]', 0, '2023-09-02 07:55:16', '2023-09-02 07:55:16', '2024-09-02 14:55:16'),
('d8346cc04b78891adf98054671b28e2f40c36dd4b0db972206383dbfb69c81de3dd8947cd997ef8a', 1, 3, 'nApp', '[]', 0, '2023-08-21 18:40:20', '2023-08-21 18:40:20', '2024-08-22 01:40:20'),
('d85fb8244d677726d4a79eb025473bf7021c10ed16ef23908a8bd40a7e2b1fa622ec48ed509b3ffe', 43, 3, 'nApp', '[]', 0, '2023-08-30 19:20:49', '2023-08-30 19:20:49', '2024-08-31 02:20:49'),
('d88fb572e2fc02604f596b090ae355657859a669ebfd4ea9aedb01803e9b60c326ae7e21abb3681d', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:29:41', '2023-09-02 10:29:41', '2024-09-02 17:29:41'),
('d8b2be3392fe84b3390c145e30f8dfad84118033641ae24ede58d6791a59a13d56a19f3e7a7e6bcc', 1, 3, 'nApp', '[]', 0, '2023-09-02 20:07:22', '2023-09-02 20:07:22', '2024-09-03 03:07:22'),
('d8dccbdd7410bef45cbe7302c2ec10b2d4e47199489848ad4342e83c90b0b983ad60884bb34b46d8', 43, 3, 'nApp', '[]', 0, '2023-08-25 05:06:03', '2023-08-25 05:06:03', '2024-08-25 12:06:03'),
('d8f92317b1b4ee8960ceb0a686930788be71133c09616655705445546ca7901e97bc72b3d7a4b651', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:15:18', '2023-09-02 09:15:18', '2024-09-02 16:15:18'),
('d9752b08446dbd73b5d586d59027c30059d96567f3ca99be9298fc640ede02d5e6bbf5c77e204b17', 161, 3, 'nApp', '[]', 0, '2023-12-05 00:31:40', '2023-12-05 00:31:40', '2024-12-05 07:31:40'),
('d984034dc4b8cb23463145c966b6ff80576eac3051d212d05456c14322f7d3bfe0a0478f90cbc9c2', 1, 3, 'nApp', '[]', 0, '2023-09-02 13:57:51', '2023-09-02 13:57:51', '2024-09-02 20:57:51'),
('d9e56518bf08d4add4a646cec2b1bb33ddbec54a27a9efae1a6125a98650073aaca78d23fb904a17', 56, 3, 'nApp', '[]', 0, '2023-08-18 07:05:53', '2023-08-18 07:05:53', '2024-08-18 14:05:53'),
('da4d9eeec849a537954185f89f7c2113fc9540458fdfff7e306443057f90d14b65942463c73e1b53', 1, 3, 'nApp', '[]', 0, '2023-08-09 00:59:35', '2023-08-09 00:59:35', '2024-08-09 07:59:35'),
('da83ae9f1886537fd22167c25a2244a11fc0175a090a0acc95a8107bf29cb484ac130a15d53bd699', 182, 3, 'nApp', '[]', 0, '2024-01-25 01:22:53', '2024-01-25 01:22:53', '2025-01-25 08:22:53'),
('db9737478eb31ef832bd80a666f1ad5ad3b575663ec997a329c5aa035ce254b33c0cbd5e61f5b5fb', 48, 3, 'nApp', '[]', 0, '2024-01-08 20:40:06', '2024-01-08 20:40:06', '2025-01-09 03:40:06'),
('dbc06fe8568509c9004c561999d9a560abb182dd23a2714b0b4b9407f62065d12979f4f7ab4aad3e', 6, 3, 'nApp', '[]', 0, '2023-08-08 00:06:31', '2023-08-08 00:06:31', '2024-08-08 07:06:31'),
('dcc063acc378fed9cf66a422aa5ce58b93f41e633efae28f9b4a9011d507a33193d1fb4237a7f4a8', 1, 3, 'nApp', '[]', 0, '2023-08-26 00:19:23', '2023-08-26 00:19:23', '2024-08-26 07:19:23'),
('dcf6f436d777e03409138d0c6337a36c2f523e73228783787170217460d39c747e67f90ca33094bc', 48, 3, 'nApp', '[]', 0, '2024-01-27 05:41:18', '2024-01-27 05:41:18', '2025-01-27 12:41:18'),
('dd4dcd4b069a2d8ba76afd5df9363e4676911bf0dfea070d968eb820f7d894084461559ae98d0a75', 1, 3, 'nApp', '[]', 0, '2023-08-24 00:27:25', '2023-08-24 00:27:25', '2024-08-24 07:27:25'),
('dd667d9beb6489af94819645e6f27eee74c77e7ae3364fbcd87e2a9122f32d0b5417eac3193c76e0', 48, 3, 'nApp', '[]', 0, '2024-01-13 19:42:32', '2024-01-13 19:42:32', '2025-01-14 02:42:32'),
('dd66f147d219efe436af9793332f13cc2df0ae77c30c8e74f358340c5860d65abbf4277058467949', 43, 3, 'nApp', '[]', 0, '2023-09-02 11:01:10', '2023-09-02 11:01:10', '2024-09-02 18:01:10'),
('dda7e3ae6364867d2971569b701bc09bf5d47cfbdc156e8b9f52c942bea4328951f49384d8c14a85', 43, 3, 'nApp', '[]', 0, '2023-08-15 18:11:42', '2023-08-15 18:11:42', '2024-08-16 01:11:42'),
('dddbda82f764ca5a8e21a2b8d31ac100dbd666d38b39aff13478c91fd1dca96609feaca74827c2ff', 56, 3, 'nApp', '[]', 0, '2023-08-18 00:13:15', '2023-08-18 00:13:15', '2024-08-18 07:13:15'),
('de9258722d873a9d79c9bbfde3e65c14929e45da519018ed23ba40c3f730636a02b16bffdade555b', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:54:29', '2023-09-02 10:54:29', '2024-09-02 17:54:29'),
('deb70b77827b9d1f87a3bbdb6f386d9b84be490bf1bfe1b4fccb3ac2a3270db1e3ae801ec8f6fa4f', 161, 3, 'nApp', '[]', 0, '2024-01-08 20:38:03', '2024-01-08 20:38:03', '2025-01-09 03:38:03'),
('dec0b9bb7d04f866a54fdabbba60d0482df4ee0a7f6681011f526c06a908fcbfe61c67ba5896b77e', 48, 3, 'nApp', '[]', 0, '2024-01-28 02:54:08', '2024-01-28 02:54:08', '2025-01-28 09:54:08'),
('dee121878f7af61484907749e17cf8941ce9e1d54370a30107bec523e83864454c4c69a8b84f0d66', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:36:30', '2023-09-02 10:36:30', '2024-09-02 17:36:30'),
('df85a94be6e2a5bdc8f187dd2df9c30ad3048689b2d91c6e7edf544d15745f08265a2d6fc217516d', 1, 3, 'nApp', '[]', 0, '2024-01-23 18:58:15', '2024-01-23 18:58:15', '2025-01-24 01:58:15'),
('e04857e331171bf3da6e44e4dbd07e6a32c165d4c08dedfbf858750c9d484f14f65212fc41f9afa3', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:17:28', '2023-09-02 09:17:28', '2024-09-02 16:17:28'),
('e049c692164bc3851276b33fd4a9cfb3d1ac7c6c498914cf8b3ac9780806660b53b256f4dbc77ae2', 43, 3, 'nApp', '[]', 0, '2023-08-24 18:27:02', '2023-08-24 18:27:02', '2024-08-25 01:27:02'),
('e074b43b9ecbac17838535a1729ddaa6ea613ea0eeb539fb2d05d336f8d242a81be3d642a63f0e81', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:49:07', '2023-09-02 10:49:07', '2024-09-02 17:49:07'),
('e0e57c1019b1b7764cb95372175b9a2b8f68f456bccc08b34ebea76e810d9859772bcd162557cc1a', 161, 3, 'nApp', '[]', 0, '2024-01-10 17:47:40', '2024-01-10 17:47:40', '2025-01-11 00:47:40'),
('e10c636082ca026cfe84c6c40b86786477d5e77c1eb6b347458cd199d1653594867392ae54d64483', 1, 3, 'nApp', '[]', 0, '2024-01-26 21:33:35', '2024-01-26 21:33:35', '2025-01-27 04:33:35'),
('e149531741b7cefd31ed330802e2e7a824651b28408fde9e49b4d836c2c71cdfe5dd585be4724798', 48, 3, 'nApp', '[]', 0, '2023-09-02 20:35:48', '2023-09-02 20:35:48', '2024-09-03 03:35:48'),
('e1881dbdaf030b6f3959fffa6f40cab8438f2c374d43f96c91a2dc27d79cb341c81dd6319f6c4873', 43, 3, 'nApp', '[]', 0, '2023-08-25 05:28:40', '2023-08-25 05:28:40', '2024-08-25 12:28:40'),
('e1a7b3cf69fbc3d906a4f48f4ed85e140b6727cb7914bb3ed67c149848e5638211a7db6ba2e5e424', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:14:57', '2023-09-02 09:14:57', '2024-09-02 16:14:57'),
('e2002cd9244a44d8f3ab73c852ae9239980f7e1c47455ebe5ec8b640feb7bc982ff2301fcdf64c04', 1, 3, 'nApp', '[]', 0, '2023-09-02 08:14:06', '2023-09-02 08:14:06', '2024-09-02 15:14:06'),
('e25b555e88c4b4eabfad6aa6685a557e3fbb241b4b84c6891552439d66e37be81870909301219bf9', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:06:38', '2023-09-02 10:06:38', '2024-09-02 17:06:38'),
('e26de65390ffbf4fadad1abdb96d4e14815db7f1b43f019b92589e6fbb8736b010cac2c370e14a33', 182, 3, 'nApp', '[]', 0, '2024-01-28 17:55:21', '2024-01-28 17:55:21', '2025-01-29 00:55:21'),
('e2d8ade0c652a6a5cca345e13c994f9ca6b0fc09250f097f09df3cbec3c7eef9459993f55323fd9f', 48, 3, 'nApp', '[]', 0, '2024-01-08 21:01:53', '2024-01-08 21:01:53', '2025-01-09 04:01:53'),
('e3255626ae9f70a5bed91c9adaa697122d95012737f103eed05b6172d5ca9c1427d04187d6039035', 48, 3, 'nApp', '[]', 0, '2024-01-08 20:40:50', '2024-01-08 20:40:50', '2025-01-09 03:40:50'),
('e338f442f5af236c1671d1c878f3eed828b8fce6caca3dab4605972c922116442b7a5bb3bdd413a2', 161, 3, 'nApp', '[]', 0, '2024-01-31 21:21:44', '2024-01-31 21:21:44', '2025-02-01 04:21:44'),
('e3ad373eb096642d7f5ed9f7c28c5bd257739149164033899a7e50cfdedf4990babe7bf8cf7bc605', 43, 3, 'nApp', '[]', 0, '2023-09-03 11:00:40', '2023-09-03 11:00:40', '2024-09-03 18:00:40'),
('e411bb93e81fce96f0fdd1d4485910ad0a9fd8e5b5f56484741eede97f7579c1844cd897d50697da', 1, 3, 'nApp', '[]', 0, '2023-08-09 00:59:32', '2023-08-09 00:59:32', '2024-08-09 07:59:32'),
('e440fdd70531cb255a539b64db9dde4198cf1d306bcd78c131b327195fa4fdbb30bedd53d373c798', 161, 3, 'nApp', '[]', 0, '2024-01-26 21:32:47', '2024-01-26 21:32:47', '2025-01-27 04:32:47'),
('e472349ba0bcedfa23a042a02ee90b08888e51bc7176f946089871974549435091e7fc739f6383a8', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:16:20', '2023-09-02 09:16:20', '2024-09-02 16:16:20'),
('e547bdd28fdf98335b93247200cdd068a24ae263b6bf702063fc4da265b50777374b6a67fab74dc5', 165, 3, 'nApp', '[]', 0, '2023-11-21 01:12:19', '2023-11-21 01:12:19', '2024-11-21 08:12:19'),
('e5b54e376186a48724f3f0173f78f5a776da188ed6de485588d3d1150310977f386df9cc0dcdf877', 164, 3, 'nApp', '[]', 0, '2023-11-29 00:18:54', '2023-11-29 00:18:54', '2024-11-29 07:18:54'),
('e5e1fb656272b7745116741b73bcd91aa410befacef8338eef8f5f9d7502469b0a7c06dfdc61c216', 161, 3, 'nApp', '[]', 0, '2024-02-01 20:31:58', '2024-02-01 20:31:58', '2025-02-02 03:31:58'),
('e5f2d942c687800e96fd92e52017d303483c1594838c2b160aa7fc79698b1227bdc80001de61c854', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:52', '2023-09-02 09:23:52', '2024-09-02 16:23:52'),
('e659d5ac8fb0541475bcbfde144abca6b0a18fae1a7c982261286bae7ebf8748b63e2c930ab7bf91', 161, 3, 'nApp', '[]', 0, '2023-12-02 23:08:26', '2023-12-02 23:08:26', '2024-12-03 06:08:26'),
('e6faef6cf81b3d2d32dc1936ec2ccc9a174f6fd63e3a52c24d0471a3c69b5e49f4e4c6175b522ce3', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:20:28', '2023-09-02 10:20:28', '2024-09-02 17:20:28'),
('e788df2ab44b1379b1e0965351cd2731d1067bd573a1ae73f2dd00c393f80ed6ca5488e3eb88db71', 43, 3, 'nApp', '[]', 0, '2023-08-15 18:55:34', '2023-08-15 18:55:34', '2024-08-16 01:55:34'),
('e7d47dedb84987c7ba70ce48c33f17011085bd34ed12c1364d4e481cb35d5ca9397d5272f064a0c1', 1, 3, 'nApp', '[]', 0, '2023-11-29 00:42:46', '2023-11-29 00:42:46', '2024-11-29 07:42:46'),
('e7e89af29d99a3064b240d47198e7e58f41e98b70f25002011a85a9f68d44734e6d412a29e7c7437', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:17:16', '2023-09-02 09:17:16', '2024-09-02 16:17:16'),
('e89abe142b437aa3b61da5c233f767d132de48ea64d1d408c7b98ee0ccac7d770063ba2c9828a0e6', 1, 3, 'nApp', '[]', 0, '2023-08-15 22:22:46', '2023-08-15 22:22:46', '2024-08-16 05:22:46'),
('e930c6596e350ebb9e14b7d5a1086f4420b89909b989faf08c3b7048c94feec225e7a25a486d58e2', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:23:54', '2023-09-02 09:23:54', '2024-09-02 16:23:54'),
('e9b74f0dc971d4dd9a69fb3da6478798c277f72124217e526047198ed230e0aea9b32f5ba7215b4b', 1, 3, 'nApp', '[]', 0, '2023-08-31 21:06:59', '2023-08-31 21:06:59', '2024-09-01 04:06:59'),
('e9c3900ef07ed8e3ac31e3fd4853dd64dab03d9e535d5d4c4dc20f7c30a7a3e030de0c9fbd3c1600', 43, 3, 'nApp', '[]', 0, '2023-09-06 21:03:22', '2023-09-06 21:03:22', '2024-09-07 04:03:22'),
('e9cb49b49627d5f3f656537c8eb75747f19f3d0aa1e4fe1ca1f4db14cc34dfbe3ee6cda01275009b', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:26:46', '2023-09-02 09:26:46', '2024-09-02 16:26:46'),
('ea029e91bd196ad39f72fe04d5b50e2ec161e00b607e748e2be07e1abce424dbdbe32b33c2637814', 1, 3, 'nApp', '[]', 0, '2023-09-02 18:52:52', '2023-09-02 18:52:52', '2024-09-03 01:52:52'),
('ea1b0654815bf15955c48918b1363aa745dafe179c86c5abd26378d2a7d5b38ce7189d36b8c640fc', 1, 3, 'nApp', '[]', 0, '2023-08-25 05:06:15', '2023-08-25 05:06:15', '2024-08-25 12:06:15'),
('ea5d88893a301fe0dbee8a940881c453fe0b653dbf64cd27a60025dd91960457c20280cdc825d8e5', 43, 3, 'nApp', '[]', 0, '2023-09-05 17:43:11', '2023-09-05 17:43:11', '2024-09-06 00:43:11'),
('ea7e17cfcd2bac6e087ed9d9572393c8d1b76dbb42ac23f16844ad63778f04d3221aea1dcf8bc009', 161, 3, 'nApp', '[]', 0, '2024-01-31 20:52:09', '2024-01-31 20:52:09', '2025-02-01 03:52:09'),
('ea8359d660d325ffba8aeca27bbb906a3c40e10e0bc236fe4472898f03293ba8dcedaa67674da7d9', 43, 3, 'nApp', '[]', 0, '2023-08-25 05:32:47', '2023-08-25 05:32:47', '2024-08-25 12:32:47'),
('ea97345b3cf473c8d6e235c0021a3b899e1fe7f8ebf2771822a2574c4c61fce1ee0df44d3f10d292', 161, 3, 'nApp', '[]', 0, '2023-12-05 17:04:10', '2023-12-05 17:04:10', '2024-12-06 00:04:10'),
('eaa763d6be0ba542d97ba906296fd0833640c397bc23043d872b7138c5627411d8aa269a8109bd51', 48, 3, 'nApp', '[]', 0, '2023-08-25 05:01:55', '2023-08-25 05:01:55', '2024-08-25 12:01:55'),
('eb30bae1c1fe15b3c0aa3261c44845da1092c501777759d0d27040e3bd4bca056147db31d5068b42', 182, 3, 'nApp', '[]', 0, '2024-01-24 19:27:29', '2024-01-24 19:27:29', '2025-01-25 02:27:29'),
('ebe969ac5bae488fde7a83cf315bcb8ce541329248f6b3b1350018bb18a196bedfd5b6f33022a785', 43, 3, 'nApp', '[]', 0, '2023-08-25 05:23:31', '2023-08-25 05:23:31', '2024-08-25 12:23:31'),
('ebf06a3a237450c199f8c741479fef17050080f8c5cf1076b09ad324d5e17108df16a4447aaa3815', 48, 3, 'nApp', '[]', 0, '2023-09-02 18:23:50', '2023-09-02 18:23:50', '2024-09-03 01:23:50'),
('ec616c38567ddb15b2be02925fbb4cfd8e1b5a4345d6c5d06d7a664fe68ba8ed738e5a89e628e09f', 43, 3, 'nApp', '[]', 0, '2023-09-07 01:16:25', '2023-09-07 01:16:25', '2024-09-07 08:16:25'),
('ed5d0b6c9eb89a0bc2c5a734daa37b9698c3abb0b00528bfe2b52e83243581486df36dcc376bf0c2', 161, 3, 'nApp', '[]', 0, '2023-11-29 00:30:36', '2023-11-29 00:30:36', '2024-11-29 07:30:36'),
('eda07219bc4db512e9aa3d60fa137dbf27ee67c9bc1f692f29fb7db18c3d13b54c6cd425f0bb01df', 48, 3, 'nApp', '[]', 0, '2024-01-25 17:43:30', '2024-01-25 17:43:30', '2025-01-26 00:43:30'),
('eda90ec8645e830b9b9b6139d560a4ab566746746e2ec8527f43d33281fab9339a20a1dac6618a55', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:06:52', '2023-09-02 09:06:52', '2024-09-02 16:06:52'),
('edbf3aa7e55d721b2fec343c9eef765e17cc5925192106a4d72abe93abebf37807136147c1a86b63', 161, 3, 'nApp', '[]', 0, '2023-11-29 01:49:17', '2023-11-29 01:49:17', '2024-11-29 08:49:17'),
('edc48d7292d194aea72482fc1094c6a83a39affd8c6003c5a4f5f963e9d814651ad180bfb3dcfab6', 161, 3, 'nApp', '[]', 0, '2024-01-10 17:55:55', '2024-01-10 17:55:55', '2025-01-11 00:55:55'),
('edfbad1aab72f958bfa6cc079d1b0d98cc94b6fd7834e5e721893e783392eb8e73b3173a77079b63', 1, 3, 'nApp', '[]', 0, '2023-08-17 23:37:59', '2023-08-17 23:37:59', '2024-08-18 06:37:59'),
('ee04f0225537a7ebf2892bba64573c61a1e4df43d41902a8a00daa341de38fc7217f671a1c8dc22a', 161, 3, 'nApp', '[]', 0, '2023-11-29 00:30:33', '2023-11-29 00:30:33', '2024-11-29 07:30:33'),
('ee6284973ad77e6b013eae9d5a9a223f575b9a5c9d20d0c60513da304449d6e3224c38c8c095dca8', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:36:02', '2023-09-02 09:36:02', '2024-09-02 16:36:02'),
('ee775d88d53752b24ea11c231c876a696c4406e70dfd5cc84dbea81b71374b1a709c2360442d3be4', 1, 3, 'nApp', '[]', 0, '2023-08-18 01:16:05', '2023-08-18 01:16:05', '2024-08-18 08:16:05'),
('ee9c74318c70902515be68f11438cc459f52d4206f4d3fb976601331c46c0fcceb706295f45611be', 126, 3, 'nApp', '[]', 0, '2023-09-02 21:51:42', '2023-09-02 21:51:42', '2024-09-03 04:51:42'),
('eea31573468d3288728134fecbb00d1c290a599044114ee5119d786865f0f0955b21e08f9caecb0f', 43, 3, 'nApp', '[]', 0, '2023-08-26 07:45:05', '2023-08-26 07:45:05', '2024-08-26 14:45:05'),
('eea96a49e468f28c5cc298ba0d40aef974a8259e883fd531e218aaac1704055e16513b8d4dd5a87d', 1, 3, 'nApp', '[]', 0, '2023-08-16 23:14:46', '2023-08-16 23:14:46', '2024-08-17 06:14:46'),
('ef3860678aab7383aa1fea1413c7f747c751e6193f626fdc2db4271d59386a6e4a2f71997a010fbc', 161, 3, 'nApp', '[]', 0, '2024-01-27 05:32:13', '2024-01-27 05:32:13', '2025-01-27 12:32:13'),
('eff1db38ad6d06afbbed89625032d0960bec9725965cfef15a189494a75489c7ee463e1c35c7165f', 1, 3, 'nApp', '[]', 0, '2024-01-24 20:19:04', '2024-01-24 20:19:04', '2025-01-25 03:19:04'),
('f00d3a3c92250db7ba853608a8120b4a7100c4d188f36db9362bc9de20a7b6a33774cb59082a1daf', 43, 3, 'nApp', '[]', 0, '2023-09-02 11:06:33', '2023-09-02 11:06:33', '2024-09-02 18:06:33'),
('f01494072c50ab3c7e549e119141a7a4f408fb4416d6c32d10d2683fc027cd242b095d32304770ef', 56, 3, 'nApp', '[]', 0, '2023-08-21 23:09:03', '2023-08-21 23:09:03', '2024-08-22 06:09:03');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('f03b9d78db729b9bc1f34e92dad74af8b8be863e5f20c03d3fe9224f81fed8c4262560fe905f104a', 161, 3, 'nApp', '[]', 0, '2023-12-04 22:28:50', '2023-12-04 22:28:50', '2024-12-05 05:28:50'),
('f05120435fa47b52e4f40c906b294cb9cf66251eb2118f56f4320d0cfea01bab388ec86e72c97e67', 48, 3, 'nApp', '[]', 0, '2024-02-04 09:12:26', '2024-02-04 09:12:26', '2025-02-04 16:12:26'),
('f055b2a055601ee8626cb814c65db0ace15410b60874f07a7c12570cd0091e0b8932df6bc4c288d5', 1, 3, 'nApp', '[]', 0, '2023-08-15 22:40:18', '2023-08-15 22:40:18', '2024-08-16 05:40:18'),
('f0c12f5ad6dfc29cbcbd4c5e3f55067927da4d3dc6b5aa9f84cd9a76200e9deae18ef24f79d957fb', 48, 3, 'nApp', '[]', 0, '2024-01-28 17:58:46', '2024-01-28 17:58:46', '2025-01-29 00:58:46'),
('f15e76084c45f4328249f64bbe3ccf85b4fd4178cc4a4e77561faae747ae1d781288a175597f22e3', 1, 3, 'nApp', '[]', 0, '2023-09-01 21:34:01', '2023-09-01 21:34:01', '2024-09-02 04:34:01'),
('f1ce535cb5deb8b2008a92e3e5087f5f0f3ab1196b890b8f4020888c6348a9938c35837b58f1152f', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:14:57', '2023-09-02 09:14:57', '2024-09-02 16:14:57'),
('f2096e4f6476ab8b4193c9e97336ab3aa2dd5653d32abf777af7e8cf069ccbc5af866eceeedab40a', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:17:10', '2023-09-02 09:17:10', '2024-09-02 16:17:10'),
('f2b9238ac045050e0ed482981085a5b58bbd671783386f7c0a7cdae178c64917da5154a5f58d5b69', 1, 3, 'nApp', '[]', 0, '2023-08-15 22:22:17', '2023-08-15 22:22:17', '2024-08-16 05:22:17'),
('f32a7274201ea8c8fbff4b36c055067accf09649ce12eeaeb7a74b0f25d532b2f560a61038552f31', 127, 3, 'nApp', '[]', 0, '2023-09-02 22:07:46', '2023-09-02 22:07:46', '2024-09-03 05:07:46'),
('f35a60d0cc198cdbd9f4b5dd4578bf09f225701a3804c74eeb82de65e654a8cbcd36b90a710a6cb7', 1, 3, 'nApp', '[]', 0, '2023-08-24 00:05:42', '2023-08-24 00:05:42', '2024-08-24 07:05:42'),
('f36ccc2d7febfed1124d1bf6804fe8172675b6d717660f6571eb7c4b14d16e19893ed2f9241f2c97', 161, 3, 'nApp', '[]', 0, '2024-01-13 20:29:26', '2024-01-13 20:29:26', '2025-01-14 03:29:26'),
('f40915c7024e27ec405f3efe85cab267e792f06549f17c96948a279dc756a74179e504315e534a05', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:02:39', '2023-09-02 10:02:39', '2024-09-02 17:02:39'),
('f412178232c87c5951c20ba7635073a1fe67410bebdf06623219352b544c109011c3f6ac321f150c', 1, 3, 'nApp', '[]', 0, '2023-09-02 08:13:59', '2023-09-02 08:13:59', '2024-09-02 15:13:59'),
('f458c394afdd535a281dffe32c04c0e319fc9b08455eba241382ca174aa0663b7d675ec2048ae612', 161, 3, 'nApp', '[]', 0, '2023-11-28 17:19:16', '2023-11-28 17:19:16', '2024-11-29 00:19:16'),
('f45de0e5feecd30eac2affaeec0a69768e2f508ce29f5e061348142eb5d0a6c5c45ab863eb1bc214', 1, 3, 'nApp', '[]', 0, '2023-08-31 09:30:57', '2023-08-31 09:30:57', '2024-08-31 16:30:57'),
('f46949ae4085e2bf3306792fc9ed580d6509502644193c367a90ef73fc25eab6a94af77fabac4862', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:15:10', '2023-09-02 09:15:10', '2024-09-02 16:15:10'),
('f48145ccc741cc57f86a2d254dab51159722ce47331cd9244fb9c0b3cf6d79ed83bd0bd1018a7aee', 161, 3, 'nApp', '[]', 0, '2024-01-28 17:56:39', '2024-01-28 17:56:39', '2025-01-29 00:56:39'),
('f48e156fd5d487e03bfa39f60d947f5849f607ba83c15b95b184695751acb29be9536baa08d6cea2', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:06:37', '2023-09-02 10:06:37', '2024-09-02 17:06:37'),
('f4ad6e6fa87f99030a0fc4226609f4415310e5f207ef3631ebe38f0e3c21364a9662e1e2934c423d', 48, 3, 'nApp', '[]', 0, '2024-01-31 23:56:42', '2024-01-31 23:56:42', '2025-02-01 06:56:42'),
('f4c8cf31fb7ac7bc73623877a46cc5658f1fc453a88a212fc57bfff639fa625f86760ec4de628411', 1, 3, 'nApp', '[]', 0, '2023-08-09 01:13:30', '2023-08-09 01:13:30', '2024-08-09 08:13:30'),
('f5039e7792446cbe90c3d59fb638a736fcacd7c33fe0f082c4c878d8ff4b6004357aac5cecaa8286', 1, 3, 'nApp', '[]', 0, '2023-08-08 18:27:47', '2023-08-08 18:27:47', '2024-08-09 01:27:47'),
('f51d9c42b5727f0ba3863855172864e575ff0d2c8d792960ed516063153c09cd270a4aacf029af7b', 48, 3, 'nApp', '[]', 0, '2024-01-08 20:41:18', '2024-01-08 20:41:18', '2025-01-09 03:41:18'),
('f52a0086d464b049c27bff3bd09197a5967d194493e336115d2c9d98c73fbf5cbe707c8132e601c2', 1, 3, 'nApp', '[]', 0, '2023-08-15 22:22:52', '2023-08-15 22:22:52', '2024-08-16 05:22:52'),
('f55da623c92be54328114760782419a25b749d74b7739d3cfe4fbb5466da75ee9d59d6190b9a1523', 1, 3, 'nApp', '[]', 0, '2023-08-15 22:22:40', '2023-08-15 22:22:40', '2024-08-16 05:22:40'),
('f5c43864d8e5b39274ebfa3e113a4e2deda41e86920cdf5694e98b5fd920124a94ad888b95b0d57b', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:26:07', '2023-09-02 09:26:07', '2024-09-02 16:26:07'),
('f5c700f9883d0866c687ac63cba23fe3af40dfa0020adb96eb8968f074f008e34ee92ba1b52cbc65', 161, 3, 'nApp', '[]', 0, '2024-01-08 16:42:19', '2024-01-08 16:42:19', '2025-01-08 23:42:19'),
('f5ec8fd157f0bebbe8f143216986a944e4a2066cfdc757d7ef724e9480bf8d56305d8aae5671251b', 1, 3, 'nApp', '[]', 0, '2023-09-02 20:07:39', '2023-09-02 20:07:39', '2024-09-03 03:07:39'),
('f604febaf165378a2bf8e9d902ece4f96859297aa00d3da44996e5e848cc1c7463ffadefed5d0e79', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:06:35', '2023-09-02 10:06:35', '2024-09-02 17:06:35'),
('f61c5ea9641ac17d8f685c8e8986e492afa2122b451614260f7daf96b562ffe20af5e60a2b0ddeed', 1, 3, 'nApp', '[]', 0, '2023-09-02 20:29:35', '2023-09-02 20:29:35', '2024-09-03 03:29:35'),
('f677fa9b204df73f1f915d6c74d394f87599f909d14a039de1eb1367049c132bcbe433c3846e563f', 161, 3, 'nApp', '[]', 0, '2024-01-11 18:33:16', '2024-01-11 18:33:16', '2025-01-12 01:33:16'),
('f67f91a763d169e7564f02ee0df51bec9dc6e19241f04a42b3b4e65d3cd0c817fe08ad30c780a161', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:36:01', '2023-09-02 09:36:01', '2024-09-02 16:36:01'),
('f69e695c035c5ce8f332af15d4ba404da8b9cc60332836d2dd88a662e28e9d42659f56d7b8208199', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:45:14', '2023-09-02 09:45:14', '2024-09-02 16:45:14'),
('f700c39d38400ddf941d65be0c4f12db20749fafb7f70108fd77de2e4a58bc8e1d672de1548ab44f', 1, 3, 'nApp', '[]', 0, '2023-08-31 21:03:03', '2023-08-31 21:03:03', '2024-09-01 04:03:03'),
('f73c5c48b808021923cf655f92b764cb914521b559e14fc3a8e59ce1e13bdbe4d08e3af386dfd349', 48, 3, 'nApp', '[]', 0, '2023-08-31 21:09:50', '2023-08-31 21:09:50', '2024-09-01 04:09:50'),
('f836be0e516d800f2b69f0b61268047c64c82811a63a96685d254f92a5acac2ed9f750e312ee0929', 43, 3, 'nApp', '[]', 0, '2023-08-30 07:40:04', '2023-08-30 07:40:04', '2024-08-30 14:40:04'),
('f85876f1efee2b517a53ce4064fcf20f3035e9623b2ba6ddcb0466df9f6faddf170898e98de914af', 161, 3, 'nApp', '[]', 0, '2023-11-29 01:57:17', '2023-11-29 01:57:17', '2024-11-29 08:57:17'),
('f861522e8847ddef9a8ec2b0fb8fdea0161b32f631b52d4ce0e03613e0f16a4c59f7427b6e4f340e', 1, 3, 'nApp', '[]', 0, '2023-08-24 01:16:11', '2023-08-24 01:16:11', '2024-08-24 08:16:11'),
('f8661fc6faf7bd40cf75f98804b17e99ef4722e7d5f209b0a27eb8b2152b8eec833d93794576aa52', 161, 3, 'nApp', '[]', 0, '2023-11-29 00:39:09', '2023-11-29 00:39:09', '2024-11-29 07:39:09'),
('f8cf85e2b360dd29740df8199f4f6c4aa92a8927232d192d20d6e1c143c57a2d3f536ec859e3e1ec', 1, 3, 'nApp', '[]', 0, '2023-09-02 19:38:26', '2023-09-02 19:38:26', '2024-09-03 02:38:26'),
('f94839c525cc40a2c3eb1949bbb55f7ba4e4a4354a408164ea86c0f078bdae4f6ad866200eba9c97', 161, 3, 'nApp', '[]', 0, '2023-11-29 00:12:00', '2023-11-29 00:12:00', '2024-11-29 07:12:00'),
('f96dc0d51c22ba3ac40359d59df56a51d188e7b3b07cb24a288c0944ae8a90ed226db24b8cbdefd0', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:57:53', '2023-09-02 09:57:53', '2024-09-02 16:57:53'),
('f96e6166d98369de1ff26480a651749af830c39c9efc8ee5da04c378b17b25f87b8fed6e2c1be04b', 48, 3, 'nApp', '[]', 0, '2023-08-25 05:07:49', '2023-08-25 05:07:49', '2024-08-25 12:07:49'),
('f96eb227bddba3ee614f516bc164bae709fcb4d8c2a6931f262547e1621ecad14da1d389dd96f4df', 161, 3, 'nApp', '[]', 0, '2023-12-03 13:06:21', '2023-12-03 13:06:21', '2024-12-03 20:06:21'),
('fa0c93e634459a6dff67e35d6f4d420d87c60b93a14ea7a9c38bb160b30f2f9f350abdb019c3c6f7', 48, 3, 'nApp', '[]', 0, '2024-01-28 04:33:17', '2024-01-28 04:33:17', '2025-01-28 11:33:17'),
('fa2b5f5f968eebec2865a0c011ef046f6c8bf782da754b7d2f71361591c461b447122fb73163ef91', 161, 3, 'nApp', '[]', 0, '2023-11-30 05:35:29', '2023-11-30 05:35:29', '2024-11-30 12:35:29'),
('fa6b0e160f0d13ba6aa913e08ca89def01c05cae3642ac592f4654cb91561f443829ec3f09d72855', 43, 3, 'nApp', '[]', 0, '2023-09-05 07:59:28', '2023-09-05 07:59:28', '2024-09-05 14:59:28'),
('fa8ed7d31ea9d16b641e0a7a105a9b580ec8f7d0bc2328ea1247e17ba6cc33511502970b798e6929', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:07:44', '2023-09-02 10:07:44', '2024-09-02 17:07:44'),
('faa6396df80796a883d5433ae71c890d4c511ef72e7b60ef7a06e7c0715b4ca16cf0e26cefd5fd89', 1, 3, 'nApp', '[]', 0, '2023-08-31 21:05:06', '2023-08-31 21:05:06', '2024-09-01 04:05:06'),
('faaa4e0876b5da64eb2847717673d399c3d3ad5f248fd312f61a90070a523ce03c8b06d572e1135e', 1, 3, 'nApp', '[]', 0, '2023-09-02 10:36:51', '2023-09-02 10:36:51', '2024-09-02 17:36:51'),
('fadc7ab7a1a1e07f7c33da2a6f91156a016f3bad1c46348dae32fd7d1fb5db7961ffe6f959b135d5', 161, 3, 'nApp', '[]', 0, '2024-01-11 18:49:14', '2024-01-11 18:49:14', '2025-01-12 01:49:14'),
('faf2e8ffb58bc769356c30749d036c77ae642a4811c61c5afb1a7fd0e749e4b454f55d2e500c7ac9', 43, 3, 'nApp', '[]', 0, '2023-09-02 09:59:41', '2023-09-02 09:59:41', '2024-09-02 16:59:41'),
('fafe971599d764629365d3608786ba203beceb9e85a3de39eb7c4778cc558510ed2f06fc7bd832b1', 43, 3, 'nApp', '[]', 0, '2023-09-05 17:25:14', '2023-09-05 17:25:14', '2024-09-06 00:25:14'),
('fc40d473754943488a4ccbf3186e179b3aecf5a9ebb7d45600d3e7a59210b326e1b2d98a2d7d3fd7', 1, 3, 'nApp', '[]', 0, '2023-09-02 20:29:04', '2023-09-02 20:29:04', '2024-09-03 03:29:04'),
('fcb83e8c51de958e8e040ac6236185dd795798928f15915d86a73c053588aeeaa5e319d53d27e1f3', 1, 3, 'nApp', '[]', 0, '2023-08-09 01:13:24', '2023-08-09 01:13:24', '2024-08-09 08:13:24'),
('fcca55d0fd9cf41c6523a037f0cc0e9100522f78648c1ac0963087f0df7746bde9b1a831e3140355', 43, 3, 'nApp', '[]', 0, '2023-09-05 09:19:03', '2023-09-05 09:19:03', '2024-09-05 16:19:03'),
('fccd2ff153a54a4e1df998d105de14bb1172d7df1f073e962460ce56e12d19f6eb7e2d80f2603743', 161, 3, 'nApp', '[]', 0, '2024-01-26 23:04:31', '2024-01-26 23:04:31', '2025-01-27 06:04:31'),
('fcd15650fb7a7238bfec2d94e5c3643d4be4de0ba9fa1b3a31b10d4adf2db50b256cf3663ca9447d', 43, 3, 'nApp', '[]', 0, '2023-09-02 10:06:58', '2023-09-02 10:06:58', '2024-09-02 17:06:58'),
('fd02836d467f5012c8455e59def715205111253240e4ec883015c3d22381bb8b64abee5dcf7bbda2', 48, 3, 'nApp', '[]', 0, '2023-09-02 09:16:42', '2023-09-02 09:16:42', '2024-09-02 16:16:42'),
('fd1cba10c7b2b2f5a03891d368b0e4f568503c21f994cf9e808ae7e91b4039c53be99212178417b7', 161, 3, 'nApp', '[]', 0, '2023-11-29 00:40:25', '2023-11-29 00:40:25', '2024-11-29 07:40:25'),
('fd26f959a3f32ec992da083ebd50f1d81ed719d3dd7ac692c575d80de219031853582cd82d103cc3', 176, 3, 'nApp', '[]', 0, '2024-01-11 15:19:33', '2024-01-11 15:19:33', '2025-01-11 22:19:33'),
('fd28f68b85cfbc414dc556be132a999ab6aa462e1cc20cbe1a628dd252339a35eac29e78c99caae6', 161, 3, 'nApp', '[]', 0, '2024-01-20 16:12:29', '2024-01-20 16:12:29', '2025-01-20 23:12:29'),
('fd8fc59af9cd0543a3d499a46694e987e30a0adbed5b12ac638a175b5e0bf35366adfceee0ea1de9', 1, 3, 'nApp', '[]', 0, '2023-08-08 18:33:18', '2023-08-08 18:33:18', '2024-08-09 01:33:18'),
('fd969a6b2ec11e4855d74a3fd1e7b434e7ed9a4039a35799a5ac04b1711715043f1baac05aae4b5e', 1, 3, 'nApp', '[]', 0, '2023-09-02 09:16:57', '2023-09-02 09:16:57', '2024-09-02 16:16:57'),
('fd9b2026cd6cb52cd3e75ab9d2bb226711a54cf8ac5b9faaafe72bc8308b50f12eb1a3459ced6b70', 1, 3, 'nApp', '[]', 0, '2023-08-26 01:07:13', '2023-08-26 01:07:13', '2024-08-26 08:07:13'),
('fdaf67e05b92c4f4ffa44474507411b1cfb33b9c7f97e48bd1c0469e11ec12e93105a8dd8c10b893', 1, 3, 'nApp', '[]', 0, '2023-08-30 04:57:30', '2023-08-30 04:57:30', '2024-08-30 11:57:30'),
('fde28cc8dd18654385e5dcea2d084cb884575ed724bd332d7a0af280f913767329bbf3083a57cf07', 1, 3, 'nApp', '[]', 0, '2023-11-29 23:14:14', '2023-11-29 23:14:14', '2024-11-30 06:14:14'),
('fded9a01a6fbfc4420571548746148f309536700ec41837fc7221c40102f858723a9dc13c147540f', 48, 3, 'nApp', '[]', 0, '2023-09-02 20:30:40', '2023-09-02 20:30:40', '2024-09-03 03:30:40'),
('fe87884e5530c9a4243cec9ede263f05be4cdecc255893a926b13e240ce6f54073ecf4a2363198b1', 43, 3, 'nApp', '[]', 0, '2023-09-02 23:46:47', '2023-09-02 23:46:47', '2024-09-03 06:46:47'),
('feef01df68e8bef86ab8c8bf8f276165bd89c487947654517c2cbcd86c134caf4d101637c9a6db68', 161, 3, 'nApp', '[]', 0, '2024-01-04 19:18:28', '2024-01-04 19:18:28', '2025-01-05 02:18:28'),
('ff045536a0536e05c67ccbd23e0df6d673c283f8c4eeb8bc7623c4df290e846976e5ebed0f67b9d9', 43, 3, 'nApp', '[]', 0, '2023-09-03 11:00:15', '2023-09-03 11:00:15', '2024-09-03 18:00:15'),
('ff3310189bac0e1319fd62a0342c7bfdf678513771654ecdd9490315551ae1623dc58ee6d99ca703', 161, 3, 'nApp', '[]', 0, '2023-11-29 00:15:49', '2023-11-29 00:15:49', '2024-11-29 07:15:49'),
('ff637ffb5a98a20c00784046caf37499dc0c382496c728a1a5f760dd242736a9e62a8d5354b1fe37', 1, 3, 'nApp', '[]', 0, '2023-08-31 05:41:24', '2023-08-31 05:41:24', '2024-08-31 12:41:24'),
('ff6eee79a87223deeb5a6ad682e0dadc66a2459218515bc7992422d43ac4a50f5096c4ac049d0541', 161, 3, 'nApp', '[]', 0, '2023-11-28 17:34:12', '2023-11-28 17:34:12', '2024-11-29 00:34:12'),
('ffa98dd9b3ebd7121e7c11a562e754f8dd679be3c1f1543d28ff7286055e3f097e13c26c30afcf0d', 1, 3, 'nApp', '[]', 0, '2023-08-21 23:36:56', '2023-08-21 23:36:56', '2024-08-22 06:36:56'),
('ffd6465d13a0ea8dba5a8a484721421020be71c688531481eee59500312f4b39acb4810d649bcc98', 142, 3, 'nApp', '[]', 0, '2023-09-24 19:01:01', '2023-09-24 19:01:01', '2024-09-25 02:01:01'),
('ffdcbd584a02ac6c3f9ab29c235f00a97cab3c78c73ad3b1ca1d97e8f245f21c0bf8f46ca45f1fd3', 1, 3, 'nApp', '[]', 0, '2023-09-02 18:04:03', '2023-09-02 18:04:03', '2024-09-03 01:04:03');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'e5wMz76DEYrWxV8nIvfuE0HJzYmXr4g4DHTeU2m7', 'http://localhost', 1, 0, 0, '2022-11-09 14:05:17', '2022-11-09 14:05:17'),
(2, NULL, 'Laravel Password Grant Client', 'yybXTBMrXLXBBsuTjtvM2GL2fLWlDwqcG6uDSTvL', 'http://localhost', 0, 1, 0, '2022-11-09 14:05:17', '2022-11-09 14:05:17'),
(3, NULL, 'Laravel Personal Access Client', 'ss5clIVwEkiIeKkkxfHoUyl8qRkiEAuLSd3MkCLQ', 'http://localhost', 1, 0, 0, '2023-08-07 01:49:22', '2023-08-07 01:49:22'),
(4, NULL, 'Laravel Password Grant Client', 'fMAWV72HOt6UohdWnwjdfXA5YxlqSYnVBMsS7yo1', 'http://localhost', 0, 1, 0, '2023-08-07 01:49:22', '2023-08-07 01:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-11-09 14:05:17', '2022-11-09 14:05:17'),
(2, 3, '2023-08-07 01:49:22', '2023-08-07 01:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `des` varchar(500) DEFAULT NULL,
  `alamat` varchar(500) DEFAULT NULL,
  `run_text` varchar(255) DEFAULT NULL,
  `wa` varchar(25) DEFAULT NULL,
  `kata_wa` varchar(255) DEFAULT NULL,
  `seo` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `yt` varchar(200) DEFAULT NULL,
  `warna` varchar(100) DEFAULT NULL,
  `neon` varchar(100) DEFAULT NULL,
  `skin` varchar(100) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `s_satu` varchar(255) DEFAULT NULL,
  `s_dua` varchar(255) DEFAULT NULL,
  `s_tiga` varchar(255) DEFAULT NULL,
  `s_empat` varchar(255) DEFAULT NULL,
  `s_lima` varchar(255) DEFAULT NULL,
  `s_enam` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `nama`, `des`, `alamat`, `run_text`, `wa`, `kata_wa`, `seo`, `email`, `yt`, `warna`, `neon`, `skin`, `logo`, `s_satu`, `s_dua`, `s_tiga`, `s_empat`, `s_lima`, `s_enam`, `created_at`, `updated_at`) VALUES
(1, 'IN SKILL', 'IN SKILL', 'Jl. Walanda Maramis No. 20 Kel. Madidir Kec. Madidir Kota Bitung – Sulawesi Utara 95514', 'Selamat datang di situs resmi TP PKK BITUNG', '6289531012691', 'Saya ingin bertanya tentang layanan ?', 'tppkk bitung', 'pkkbitung@gmail.com', 'xRWudwZQA0k', '#1679bb', '#ff3c34', 'red', '3.png', 'w_slide.php', 'w_konten.php', 'w_berita.php', 'w_run.php', '', '', '2022-05-15 22:57:09', '2024-02-13 09:11:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_kantor`
--
ALTER TABLE `m_kantor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_kategori`
--
ALTER TABLE `m_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_surat`
--
ALTER TABLE `m_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_kantor`
--
ALTER TABLE `m_kantor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_kategori`
--
ALTER TABLE `m_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `m_surat`
--
ALTER TABLE `m_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=443;

--
-- AUTO_INCREMENT for table `m_user`
--
ALTER TABLE `m_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
