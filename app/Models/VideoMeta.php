<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VideoMeta extends Model
{
    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'video_metas';


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
        'user_id', 'meta_key', 'meta_value',
    ];

    /**
        Video Meta
    */
    public function video()  {
        return $this->belongsTo('App\Models\Video', 'video_id');
    }

    /*
        Get User Meta using meta_key
    */
    public function getVideoMeta( $video_id, $key ) {

        $meta = VideoMeta::where('video_id', $video_id)
                        ->Where('meta_key', $key)
                        ->select('meta_value')
                        ->get();

        return $meta[0]['meta_value'] ?? '';
    }

    public function getVideoSlug( $video_id ) {

        $video = Video::where('id', $video_id)
                        ->select('slug')
                        ->first();

        return $video['slug'] ?? '';
    }
}
