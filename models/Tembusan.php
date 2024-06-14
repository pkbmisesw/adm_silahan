<?php

namespace Models;

use App\Models\Surat;
use Illuminate\Database\Eloquent\Model as Eloquent;

class Tembusan extends Eloquent
{
    protected $guarded = ['id'];
    protected $table = 'm_tembusan';

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    // public function surat() {
    //     return $this->
    // }
}