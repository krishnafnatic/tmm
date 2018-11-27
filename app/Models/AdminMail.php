<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Model;

class AdminMail extends Model {
	
    use Notifiable;

    protected $admin;
    protected $email;
	
    public function __construct() {
        $this->admin = config('admin.name');
        $this->email = config('admin.email');
    }
}
