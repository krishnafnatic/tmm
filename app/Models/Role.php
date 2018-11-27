<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Role extends Model {

	/**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'roles';


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
        'name', 'role'
    ];
    

}
