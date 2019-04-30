<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VideoSeo extends Model {
    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'video_seos';


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
        'video_id', 'meta_title', 'created_at', 'updated_at'
    ];

    protected $sortable = [
        'updated_at', 
    ];
}
