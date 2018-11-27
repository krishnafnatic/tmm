<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Video extends Model {
    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'videos';


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
        'id', 'name', 'slug', 'created_at', 'updated_at', 'published_at',
    ];

    protected $sortable = [
        'updated_at', 
    ];

    public function getSortable() {
        return $this->sortable;
    }

    /**
        Video Meta
    */
    public function video_meta() {
        return $this->hasMany('App\Models\VideoMeta', 'video_id', 'id');
    }
}
