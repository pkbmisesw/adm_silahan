<?php

require './bootstrap.php';

use Models\Surat;

print_r(Surat::all()->toArray());