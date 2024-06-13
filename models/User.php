<?php

namespace Models;

use App\Models\Surat;
use Illuminate\Database\Eloquent\Model as Eloquent;

class User extends Eloquent
{
    protected $guarded = ['id'];
    protected $table = 'm_user';
}