<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model {

    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_comments';


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
        'user_id', 'video_id', 'parent_id', 'comments',
    ];

    /**
        User Comment
    */
    public function user()  {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    /**
        Video Comment
    */
    // public function videoComment()  {
    //     return $this->belongsTo('App\Models\Video', 'video_id');
    // }

    /**
     * Get the index name for the model.
     *
     * @return string
    */
    public function child_comments() {
        return $this->hasMany('App\Models\Comment','parent_id','id')->orderBy('id', 'desc');
    }
}
