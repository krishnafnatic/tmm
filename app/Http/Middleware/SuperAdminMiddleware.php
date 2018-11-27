<?php

namespace App\Http\Middleware;

use Closure;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Contracts\Auth\Guard;

class SuperAdminMiddleware {

    /**
     * The Guard implementation.
     *
     * @var Guard
     */
    protected $auth;

    /**
     * Create a new filter instance.
     *
     * @param  Guard  $auth
     * @return void
     */
    public function __construct(Guard $auth)
    {
        $this->auth = $auth;
    }

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle( $request, Closure $next) {
          
        if( ! $this->auth->user()->hasGroup()) {
            session()->flash('error_msg','This resource is restricted to Administrators!');
            return redirect()->route('home');
        }
        return $next($request);
    }
}
