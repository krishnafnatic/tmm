<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class HomeAdvertisment extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'home_advertisements';


    /**
     * The Primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'type_id', 'image', 'width', 'height',
    ];
}
