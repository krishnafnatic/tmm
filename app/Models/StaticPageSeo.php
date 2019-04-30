<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StaticPageSeo extends Model
{
    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'static_pages_seos';


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
        'name', 'route', 'meta_title', 'meta_description', 'meta_keyword', 'created_at'
    ];

    protected $sortable = [
        'updated_at', 
    ];
}
