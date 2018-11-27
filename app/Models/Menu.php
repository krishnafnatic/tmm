<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model {
	
    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'menus';


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
        'name',
    ];

    /**
        User Meta
    */
    public function menu_item() {
        return $this->hasMany('App\Models\MenuItem');
    }
}
