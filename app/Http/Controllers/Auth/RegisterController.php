<?php
namespace App\Http\Controllers\Auth;

use App\Mail\VerifyMail;
use App\Models\User;
use App\Models\UserMeta;
use App\Models\UserVerify;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\RegistersUsers;
use Socialite;
use Auth;
use DB;
use \Carbon\Carbon;
use Illuminate\Support\Facades\Lang;
//use Exception;
use URL;
//use Illuminate\Http\File;
//use Illuminate\Support\Facades\Storage;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers, ThrottlesLogins;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct() {
        if ( \request()->get( 'redirect_to' ) ) {
            session()->put( 'redirect.url', \request()->get( 'redirect_to' ) );
        } else {
            $this->redirectTo = URL::previous();
        }
        $this->middleware('guest', ['except' => 'logout']);
    }

    public function index() {

        return view( 'auth.register' );
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name'      => 'required|string|max:100',
            'email'     => 'required|string|email|max:255|unique:users',
            //'mobile' => 'required|regex:/[0-9]{10}/|digits:10',
            'password' => 'required|string|min:8|confirmed|regex:/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/',
            //'g-recaptcha-response' => 'required|captcha',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Model\User
     */
    protected function create(array $data) {
        
        /*
            Create User
        */
        $user = User::create([
            //'role_id'       => '2',
            'name'          => $data['name'],
            'email'         => $data['email'],
            'mobile'        => '', //$data['mobile'],
            'password'      => bcrypt($data['password']),
        ]);

        /*
            Save User Meta
        */

        //die('User id: '. $user->id);

        $current_time = Carbon::now()->toDateTimeString();
        $token = $data['_token'];
        DB::table('user_metas')->insert([
            ['user_id' => $user->id, 'meta_key' => 'login_id',   'meta_value'=>$token,  'created_at'=>$current_time, 'updated_at'=>$current_time],
            ['user_id' => $user->id, 'meta_key' => 'login_with', 'meta_value'=>'Email', 'created_at'=>$current_time, 'updated_at'=>$current_time],
            ['user_id' => $user->id, 'meta_key' => 'flag_redirect', 'meta_value'=> 0, 'created_at'=>$current_time, 'updated_at'=>$current_time],
        ]);

        /*
            Verify User using email
        */
        $verifyUser = UserVerify::create([
            'user_id' => $user->id,
            'token' => str_random(40)
        ]);
        
        /*
            Send email to user
        */
        Mail::to($user->email)->send(new VerifyMail($user));
        return $user;
    }

    /**
     * redirect to facebook login
     *
     */
    public function redirectToFacebook() {
        return Socialite::driver('facebook')->redirect();
    }

    /**
     * Handle facebook callback and save & login user
     *
     */
    public function handleFacebookCallback(Request $request, User $user) {
        
        /*
            If user cancel the page: send it to 404;
        */
        if( $request->get('error') == 'access_denied' ) {
            return redirect()->route('404');
        }

        /*
            If user cancel the page: send it to 404;
        */
        if( $request->get('error_code') == '1349187' ) {
            return redirect()->route('404');
        }
        
        
        /*
            If user submit the page: Do Login;
        */
        $fbUser = Socialite::driver('facebook')->user();
    
        if(User::where('email', '=', $fbUser->getEmail())->first()) {
            $checkUser = User::where('email', '=', $fbUser->getEmail())->first();
            Auth::login($checkUser);
            if(session()->has('redirect.url') ) {
                $URL = session()->get( 'redirect.url' ).'#comments';
                session()->forget( 'redirect.url' );
                return redirect( $URL )->with('success', Lang::get('messages.logged_by', ['by' => "Facebook"]));
            } else {
                return redirect('/')->with('success', Lang::get('messages.logged_by', ['by' => "Facebook"]));
            }
        }
        
        /*
            Save User info
        */
        //$user->role_id      = '2';
        $user->name         = $fbUser->getName();
        $user->email        = $fbUser->getEmail();
        $user->mobile       = '';
        $user->avatar       = $fbUser->getAvatar();
        $user->password     = bcrypt($fbUser->getId());

        /*
            Insert User Info
        */
        $user->save();

        /*
            Save User Meta
        */
        $token = $fbUser->getId();
        DB::table('user_metas')->insert([
            ['user_id' => $user->id, 'meta_key' => 'login_id',   'meta_value'=> $token],
            ['user_id' => $user->id, 'meta_key' => 'login_with', 'meta_value'=> 'Facebook'],
            ['user_id' => $user->id, 'meta_key' => 'flag_redirect', 'meta_value'=> 1],
        ]);
    
        /*
            Authorize User & Redirect
        */
        Auth::login($user);

        if ($request->session()->has('redirect.url')) {
            $URL = $request->session()->get('redirect.url').'#comments';
            $request->session()->forget('redirect.url');
            return redirect( $URL )->with('success', Lang::get('messages.logged_by', ['by' => "Facebook"]));
        } else {
            return redirect('/profile')->with('success', Lang::get('messages.logged_by', ['by' => "Facebook"]));
        }
        
    }

    /**
     * redirect to linkedIn login
     *
     */
    public function redirectToLinkedin() {
        return Socialite::driver('linkedin')->redirect();
    }

    /**
     * Handle linkedIn callback and save & login user
     *
     */
    public function handleLinkedinCallback(Request $request, User $user) {
        
        /*
            If user cancel the page: send it to 404;
        */
        if( $request->get('error') == 'user_cancelled_login' ) {
            return redirect()->route('404');
        }

        /*
            If user cancel the page: send it to 404;
        */
        if( $request->get('error') == 'user_cancelled_authorize' ) {
            return redirect()->route('404');
        }
        
        
        /*
            If user submit the page: Do Login;
        */
        $linkedINUser = Socialite::driver('linkedin')->user();
        
        if(User::where('email', '=', $linkedINUser->getEmail())->first()){
            $checkUser = User::where('email', '=', $linkedINUser->getEmail())->first();
            Auth::login($checkUser);

            if(session()->has('redirect.url') ) {
                $URL = session()->get( 'redirect.url' ).'#comments';
                session()->forget( 'redirect.url' );
                return redirect( $URL )->with('success', Lang::get('messages.logged_by', ['by' => "LinkedIn"]));
            } else {
                return redirect('/')->with('success', Lang::get('messages.logged_by', ['by' => "LinkedIn"]));
            } 
        }
        
        /*
            Save User info
        */
        //$user->role_id      = '2';
        $user->name         = $linkedINUser->getName();
        $user->email        = $linkedINUser->getEmail();
        $user->mobile       = '';
        $user->avatar       = $linkedINUser->getAvatar();
        $user->password     = bcrypt($linkedINUser->getId());
        
        /*
            Insert User Info
        */
        $user->save();

        /*
            Save User Meta
        */
        $token = $linkedINUser->getId();
        DB::table('user_metas')->insert([
            ['user_id' => $user->id, 'meta_key' => 'login_id',   'meta_value'=>$token],
            ['user_id' => $user->id, 'meta_key' => 'login_with', 'meta_value'=>'LinkedIn'],
            ['user_id' => $user->id, 'meta_key' => 'flag_redirect', 'meta_value'=> 1],
        ]);
    
        /*
            Authorize User & Redirect
        */
        Auth::login($user); 

        if ($request->session()->has('redirect.url')) {
            $URL = $request->session()->get('redirect.url').'#comments';
            $request->session()->forget('redirect.url');
            return redirect( $URL )->with('success', Lang::get('messages.logged_by', ['by' => "LinkedIn"]));
        } else {
            return redirect('/profile')->with('success', Lang::get('messages.logged_by', ['by' => "LinkedIn"]));
        }

    }

    /**
     * redirect to google login
     *
     */
    public function redirectToGoogle() {
        return Socialite::driver('google')->redirect();
    }

    /**
     * Handle google callback and save & login user
     *
     */
    public function handleGoogleCallback(Request $request, User $user) {
    
        /*
            If user cancel the page: send it to 404;
        */
        if( $request->get('error') ) {
            return redirect()->route('404');
        }
        
        
        /*
            If user submit the page: Do Login;
        */
        $googleUser = Socialite::driver('google')->user();
        
        if(User::where('email', '=', $googleUser->getEmail())->first()){
            $checkUser = User::where('email', '=', $googleUser->getEmail())->first();
            Auth::login($checkUser); 
            if(session()->has('redirect.url') ) {
                $URL = session()->get( 'redirect.url' ).'#comments';
                session()->forget( 'redirect.url' );
                return redirect( $URL )->with('success', Lang::get('messages.logged_by', ['by' => "Google"]));
            } else {
                return redirect('/')->with('success', Lang::get('messages.logged_by', ['by' => "Google"]));
            } 
        }
        
        /*
            Save User info
        */
        //$user->role_id      = '2';
        $user->name         = $googleUser->getName();
        $user->email        = $googleUser->getEmail();
        $user->mobile       = '';
        $user->avatar       = $googleUser->getAvatar();
        $user->password     = bcrypt($googleUser->getId());
        
        /*
            Insert User Info
        */
        $user->save();

        /*
            Save User Meta
        */
        $token = $googleUser->getId();
        DB::table('user_metas')->insert([
            ['user_id' => $user->id, 'meta_key' => 'login_id',   'meta_value'=>$token],
            ['user_id' => $user->id, 'meta_key' => 'login_with', 'meta_value'=>'Google'],
            ['user_id' => $user->id, 'meta_key' => 'flag_redirect', 'meta_value'=> 1],
        ]);
    
        /*
            Authorize User & Redirect
        */
        Auth::login($user);  

        if ($request->session()->has('redirect.url')) {
            $URL = $request->session()->get('redirect.url').'#comments';
            $request->session()->forget('redirect.url');
            return redirect( $URL )->with('success', Lang::get('messages.logged_by', ['by' => "Google"]));
        } else {
            return redirect('/profile')->with('success', Lang::get('messages.logged_by', ['by' => "Google"]));
        }
    }
    
    /**
    * Verify User using token
    */
    public function verifyUser($token) {
        $verifyUser = UserVerify::where('token', $token)->first();
        if(isset($verifyUser) ){
            $user = $verifyUser->user;
            if($user->state == 1) { //here user state is 'created' => 1;
                $verifyUser->user->state = 2;   //Now user is verified, so state is change from created to verified;
                $verifyUser->user->save();
                $status = Lang::get( 'messages.email_verified', [ 'name' => $verifyUser->user->name] );
            }else{
                $status = Lang::get( 'messages.already_verified' );
            }
        }else{
            return redirect('/login')->with('warning', Lang::get( 'messages.wrong_email' ) );
        }
 
        return redirect('/login')->with('status', $status);
    }

    protected function registered(Request $request, $user) {
        $this->guard('web')->logout();
        return redirect('/login')->with('status', Lang::get( 'messages.send_verify', [ 'email' => $user['email']] ) );
    }
    
    public function registerVerify() {

        return view( 'auth.verify', [ 'verification_link' => Lang::get('messages.verification_link') ] );
    }
}