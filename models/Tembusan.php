<?php

namespace Models;

use App\Models\Surat;
use Illuminate\Database\Eloquent\Model as Eloquent;

class Tembusan extends Eloquent
{
    protected $guarded = ['id'];
    protected $table = 'm_tembusan';
}