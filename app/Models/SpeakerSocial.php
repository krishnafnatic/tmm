<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SpeakerSocial extends Model {
    
    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'speaker_socials';


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
        'speaker_id', 'facebook', 'linkedin', 'google', 'twitter',
    ];

    public function social()  {
        return $this->belongsTo('App\Models\Speaker', 'speaker_id');
    }
}
