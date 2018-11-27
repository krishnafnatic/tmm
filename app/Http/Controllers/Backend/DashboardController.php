<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\Lang;

class DashboardController extends Controller {

	
	protected function guard() {
	    return Auth::guard('admin');
	}
    
    public function index() {

    	if( !Auth::guard('admin')->check()) {
    		return redirect()->intended(route('admin.login'));
    	} else {
    		return view('backend.dashboard');
    	}
    }

    /**
     * Prepare a date for array / JSON serialization.
     *
     * @param  \DateTime  $date
     * @return string
     */
    public function getFormatedDate( $value ) {
        $date = Carbon::parse($value)->format('M D Y');
        return $date;
    }
}
