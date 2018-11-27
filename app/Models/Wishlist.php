<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Wishlist extends Model {

	protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_wishlists';


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
        'user_id', 'video_id',
    ];

    /**
        Video Meta
    */
    public function user()  {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    /**
        Video Meta
    */
    public function video()  {
        return $this->belongsTo('App\Models\Video', 'video_id');
    }
}
