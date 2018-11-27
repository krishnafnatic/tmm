<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Speaker extends Model {
    
    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'speakers';


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
       'slug', 'avatar', 'created_at'
    ];

    /**
        speaker description
    */
    public function speaker() {
        return $this->hasMany('App\Models\SpeakerDescription');
    }

    public function social() {
        return $this->hasOne('App\Models\SpeakerSocial');
    }
}
