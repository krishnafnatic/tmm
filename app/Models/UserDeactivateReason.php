<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserDeactivateReason extends Model {

    protected $guarded = [];
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'reason_for_account_deactivations';


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
        'name', 'order',
    ];
}
