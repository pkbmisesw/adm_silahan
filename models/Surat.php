<?php

namespace Models;

use Illuminate\Database\Eloquent\Model as Eloquent;

class Surat extends Eloquent
{
    protected $table = 'm_surat';

    protected $guarded = ['id'];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */

    /*
     * Get Todo of User
     *
     */
    public function tembusan()
    {
        return $this->hasMany(Tembusan::class, 'surat_id', 'id');
    }

}