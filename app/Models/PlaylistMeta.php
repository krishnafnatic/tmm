<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PlaylistMeta extends Model {

    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'playlist_metas';


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
        'playlist_id', 'meta_key', 'meta_value',
    ];

    /**
        Video Meta
    */
    public function playist()  {
        return $this->belongsTo('App\Models\Playlist', 'plaplist_id');
    }

    /*
        Get User Meta using meta_key
    */
    public function getPlaylistMeta( $playlist_id, $key ) {
        
        $meta = PlaylistMeta::where('playlist_id', $playlist_id)
                        ->Where('meta_key', $key)
                        ->select('meta_value')
                        ->get();

        return $meta[0]['meta_value'] ?? '';
    }
}
