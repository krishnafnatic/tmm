<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PlayerMeta extends Model {

    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'player_metas';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'player_id', 'meta_key', 'meta_value',
    ];

    /**
        Video Meta
    */
    public function player()  {
        return $this->belongsTo('App\Models\Player', 'player_id');
    }
}
