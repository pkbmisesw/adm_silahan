<?php

ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);
// require_once './vendor/autoload.php';
require './bootstrap.php';

use Models\Surat;

$data = Surat::with('tembusan.user')->get()->toArray();

echo json_encode($data, JSON_PRETTY_PRINT);
// print_r();

foreach ($variable as $key => $value) {
    # code...
}