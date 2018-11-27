<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserVerify extends Model {

	/**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_verifies';


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
        'user_id', 'token',
    ];
	
    public function user()  {
        
        return $this->belongsTo('App\Models\User', 'user_id',  'id');
    }
}
