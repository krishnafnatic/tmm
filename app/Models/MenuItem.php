<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MenuItem extends Model {
	protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'menu_items';


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
        'menu_id', 'parent_id', 'title', 'slug', 'target', 'icon_class', 'order', 
    ];

    public function user()  {
        return $this->belongsTo('App\Models\Menu', 'menu_id');
    }

    /**
     * Get the index name for the model.
     *
     * @return string
    */
    public function child_menu_items() {
        return $this->hasMany('App\Models\MenuItem','parent_id','id') ;
    }

    
}
