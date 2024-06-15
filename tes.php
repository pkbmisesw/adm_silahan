<?php

ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);
// require_once './vendor/autoload.php';
require './bootstrap.php';

use Models\Surat;

// $data = Surat::with('tembusan.user')->get()->toArray();

// echo json_encode($data, JSON_PRETTY_PRINT);
// // print_r();

// foreach ($variable as $key => $value) {
//     # code...
// }

// Mendapatkan bulan dan tahun saat ini

$data = Surat::whereYear('created_at', date('Y'))->where('status', 0)->get()->groupBy(function ($item) {
    return $item->created_at->format('m');
});

$data_bulan = [];

$bulan_sekarang = date('n');

for ($i = 1; $i <= (int) $bulan_sekarang; $i++) {
    array_push($data_bulan, $i);
}


foreach ($data as $bulan => $datas) {
    $bulan = (int) $bulan;

    $index_bulan = array_search($bulan, $data_bulan);

    // echo "ini index : " . array_search($bulan, $data_bulan);
}
// echo (int) $bulan_sekarang;

// echo json_encode($data, JSON_PRETTY_PRINT);
