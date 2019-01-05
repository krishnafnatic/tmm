<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Models\UserMeta;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'role_id', 'name', 'email', 'mobile', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
    
    /**
        Verify User
    */
    public function verifyUser() {
        return $this->hasOne('App\Models\UserVerify', 'user_id', 'id');
    }

    /**
        User Meta
    */
    public function metaUser() {
        return $this->hasMany('App\Models\UserMeta', 'user_id', 'id');
    }

    /**
        User Comments
    */
    public function commentUser() {
        return $this->hasMany('App\Models\Comment', 'user_id', 'id');
    }

    /**
        User Wishlist
    */
    public function wishlist() {
        return $this->hasMany('App\Models\Wishlist', 'user_id', 'id');
    }

    /**
        Get All Users
    */
    public function getAll() {
        return static::all();
    }

    /**
        Find user using user_id
    */
    public function findUser($id) {
        return static::find($id);
    }

    /**
        Delete user using user_id
    */
    public function deleteUser($id) {
        return static::find($id)->delete();
    }

    /*
        Get User Meta using meta_key
    */
    public function getUserMeta( $id, $key ) {

        $meta = UserMeta::where('user_id', $id)
                        ->Where('meta_key', $key)
                        ->select('meta_value')
                        ->get();

        return $meta[0]['meta_value'] ?? '';
    }

    /**
     * Send the password reset notification.
     *
     * @param  string  $token
     * @return void
     */
    public function sendPasswordResetNotification($token) {
        $this->notify(new App\Notifications\MailResetPasswordNotification($token));
    }

}
