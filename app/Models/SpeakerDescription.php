<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SpeakerDescription extends Model {
    
    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'speaker_descriptions';


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
        'language_id', 'name', 'slug', 'designation', 'short_description', 'description', 'biography', 'meta_title', 'meta_description', 'meta_keyword',
    ];

    public function user()  {
        return $this->belongsTo('App\Models\Speaker', 'speaker_id');
    }
}
