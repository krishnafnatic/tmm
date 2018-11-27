<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserMeta extends Model {
    
    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_metas';


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

    public function user()  {
        return $this->belongsTo('App\Models\User', 'user_id');
    }
}