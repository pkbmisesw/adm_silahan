<?php
// require "vendor/autoload.php";
require_once 'vendor/autoload.php';
include 'db/koneksi.php';

use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule;
$capsule->addConnection([
    "driver" => "mysql",
    "host" => $host,
    "database" => $db,
    "username" => $user,
    "password" => $pass
]);
$capsule->setAsGlobal();
$capsule->bootEloquent();