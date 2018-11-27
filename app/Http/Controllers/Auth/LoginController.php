<?php
namespace App\Http\Controllers\Auth;

use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Auth;
use Illuminate\Support\Facades\Lang;
use DB;
use \Carbon\Carbon;

use App\Repositories\User\UserInterface as UserInterface;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    public $maxAttempts = 1; // change to the max attemp you want.
    public $decayMinutes = 1; // change to the minutes you want.

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/profile';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct( UserInterface $user ) {
        $this->user = $user;
        $this->middleware('guest')->except('logout');
    }

    protected function guard() {
        return Auth::guard('web');
    }

    public function index() {

        return view( 'auth.login' );
    }
    
    /**
        Validate User Login - Check status
    */
    protected function validateLogin(Request $request) {
        $this->validate($request, [
            $this->username() => 'required|exists:users,' . $this->username() . ',state,2,role_id,2',
            'password' => 'required',
            //'g-recaptcha-response' => 'required|captcha',
        ], [
            $this->username() . '.exists' => Lang::get( 'messages.accunt_disabled' )
        ]);
    }
    
    /**
        Authenticated User - Verification of email
    */
    public function authenticated(Request $request, $user) {
        /*
            @user->state == 2 is "verified";
            @user->role_id == 2 is "user";
        */  
        if (!$user->state == 2 && !$user->role_id == 2) { 
            auth()->logout();
            return back()->with('warning', Lang::get( 'messages.confirm_account' ) );
        }

        $flag_redirect = $this->user->getUserMeta( $user->id, 'flag_redirect' );
        if( $flag_redirect == 0 ) {
            $current_time = Carbon::now()->toDateTimeString();
            DB::table('user_metas')
            ->where('user_id', $user->id)
            ->where('meta_key', 'flag_redirect')
            ->update([ 'meta_value'=> 1, 'updated_at'=>$current_time ]);
            return redirect( '/profile' );
        } else {
            return redirect('/');
        }
    }

    /*
        Login user using Ajax for Video Detail page;
    */
    public function loginAjax(Request $request) {

        $email  = $request->email;
        $pwd    = $request->pwd;


        /* 
            Now we use the auth to Authenteicate the user credentials
        */

        if (Auth::guard('web')->attempt( [
                'role_id' => 2, 
                'email' => $email, 
                'password' => $pwd
            ] ) ) {

            $msg = array( 
                    'status' => 'success', 
                    'type'=> 'login',
                    'message' => Lang::get('messages.success_attr', ['attribute' => "Login"])
                );

            return response()->json($msg);
        } else {
            $msg = array(
                    'status' => 'error', 
                    'type'   => 'login',
                    'message' => Lang::get('messages.error_attr', ['attribute' => "Login"])
                );
            return response()->json($msg);
        }
    }

    /*
        User Logout
    */
    protected function logout() {
        Auth::guard('web')->logout();
        return redirect('/');
    }
}
