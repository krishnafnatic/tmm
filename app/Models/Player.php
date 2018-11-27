<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Player extends Model {
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'players';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'player_id', 'name', 'created_at', 'updated_at', 'published_at',
    ];

    /**
        Video Meta
    */
    public function metaPlayer() {
        return $this->hasMany('App\Models\PlayerMeta', 'player_id');
    }
}
