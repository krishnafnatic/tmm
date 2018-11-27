<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Support\Facades\Lang;

class LoginController extends Controller {

	/**
   * Where to redirect users after login.
   *
   * @var string
  */
  protected $redirectTo = '/dashboard';

  /*
    Custom Admin Guard
  */
  protected function guard() {
    return Auth::guard('admin');
  }

  /**
   * Create a new controller instance.
   *
   * @return view
   */
  public function index() { 
  	if( !Auth::guard('admin')->check()) {
  		return view('backend.login');
  	} else {
  		return redirect()->intended(route('admin.dashboard'));
  	}
  }

  /**
      Validate User Login - Check status
  */
  protected function validateLogin(Request $request) {
      $this->validate($request, [
          $this->username() => 'required|exists:users,' . $this->username() . ',role_id,1',
          'password' => 'required',
          //'g-recaptcha-response' => 'required|captcha',
      ], [
          $this->username() . '.exists' => 'The selected email is invalid or the account has been disabled.'
      ]);
  }

  /**
      Authenticated Admin 
  */
  public function login(Request $request) {
    // Validate the form data
    $this->validate($request, [
      'email'   => 'required|email',
      'password' => 'required|min:8'
    ]);
    // Attempt to log the user in
    if (Auth::guard('admin')->attempt(['role_id' => 1, 'email' => $request->email, 'password' => $request->password])) {
      // if successful, then redirect to their intended location
      return redirect()->intended(route('admin.dashboard'));
    }
    // if unsuccessful, then redirect back to the login with the form data
    return redirect()->back()->with('warning', 'Kindly check the credentials.')->withInput($request->only('email'));
  }

  /**
      Logout Admin
  */
  public function logout() {
      //echo Auth::user();die;
      Auth::guard('admin')->logout();
      return redirect('/admin/login');
  }
}
