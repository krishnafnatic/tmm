<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class InformationDescription extends Model {
    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'information_descriptions';


    /**
     * The Primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = null;

    /**
     * Indicates if the IDs are auto-incrementing.
     *
     * @var bool
     */
    public $incrementing = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'language_id', 'title', 'short_description', 'description', 'meta_title', 'meta_description', 'meta_keyword',
    ];
}
