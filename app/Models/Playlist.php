<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Playlist extends Model {

    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'playlists';


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
        'id', 'name', 'slug',
    ];

    /**
        Playlist Meta
    */
    public function metaPlaylist() {
        return $this->hasMany('App\Models\PlaylistMeta', 'playlist_id', 'id');
    }
}
