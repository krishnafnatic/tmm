<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Language extends Model {
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'translations';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'code', 'locale', 'image', 'order', 'status', 'created_at', 'updated_at',
    ];
}
