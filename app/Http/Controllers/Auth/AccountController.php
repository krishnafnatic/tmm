<?php
namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use Hash;
use App\Models\User;
use App\Models\AgeGroup;
use App\Models\UserMeta;
use App\Models\Tag;
use App\Models\UserDeactivateReason;
use DB;
use \Carbon\Carbon;
use Illuminate\Support\Facades\Lang;
use App\Models\Video;
use App\Models\VideoMeta;
use Newsletter;
use App\Mail\ChangePassword;
use App\Mail\ChangeNotification;
use App\Mail\AccountDeactivate;
use Illuminate\Support\Facades\Mail;

use App\Repositories\User\UserInterface as UserInterface;


class AccountController extends Controller {


    protected $user;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct( UserInterface $user ) {
        $this->user = $user;
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(VideoMeta $videoMeta) {

        $user_profile = array();
        $userProfiles = UserMeta::where('user_id', '=', Auth::user()->id )->get()->keyBy('meta_key');
         /*
            Get Lising of Tag;
        */
        $tags = Tag::all();

        /*
            Add user profile variables;
        */

        $exUnUserTags = $userProfiles->get( 'tag' )->meta_value ?? '';

        $user_profile = array(
            'tags'          =>  $tags,
            'user_tag'      =>  explode( ',', unserialize( $exUnUserTags ) ),
            'social'        =>  array(
                'facebook'      =>  $userProfiles->get( 's_facebook' )->meta_value ?? '',
                'linkedin'      =>  $userProfiles->get( 's_linkedin' )->meta_value ?? '',
                'google'        =>  $userProfiles->get( 's_google' )->meta_value ?? '',
                'twitter'       =>  $userProfiles->get( 's_twitter' )->meta_value ?? '',
            ),
            'biography'     =>  $userProfiles->get( 'biography' )->meta_value ?? '',
            'designation'   =>  $userProfiles->get( 'designation' )->meta_value ?? '',
        );

        // print '<pre>';
        //     print_r($user_profile);
        // print '</pre>';die;


        /*
            Watch Next based on Popular Videos
        */

        $allTags = '';$i=1;
        $userTags = Tag::whereIn( 'id', $user_profile['user_tag'] )->select( 'tag' )->get();
        $totaltags=count($userTags);


        if( isset( $userTags ) && $totaltags > 0 ) {
            foreach($userTags as $tag) { 
                // 
                if($i == $totaltags) {
                    $allTags .= $tag['tag'];
                } else {
                    $allTags .= $tag['tag'].',';
                }  

                $i++;
            }
        }

        $videos = getVideos( 'tag', $allTags );
        $videos_array = array();

        if( isset( $videos ) && count( $videos ) > 0  ) {
            foreach( $videos as $video ) {
                if( !empty( $video['id'] ) ) {
                        $getVideoInfo         = Video::where('id', $video['id'] )->first();
                    if( isset( $getVideoInfo) &&  !empty( $getVideoInfo )) {
                        $videos_array[] = array(
                            'video_id'       =>  $video['id'],
                            'name'           =>  substr( $video['name'], 0, env('char_limit') ).' ...',
                            'slug'           =>  $getVideoInfo['slug'],
                            'images'         =>  $video['images'],
                        );
                    }
                } 
            }
        }

        return view('auth.account',  [ 'user_profile' => $user_profile, 'recommended_videos' => $videos_array, ]);
    }

    /**c
    * Show change password form
    * 
    */

    public function showPasswordForm() {

        return view( 'auth.password' );
    }

    /**
    *   Change password
        */
    
    public function updatePassword(Request $request) {

        if (!(Hash::check($request->get('current-password'), Auth::user()->password))) {
        // The passwords matches
            return redirect()->back()->with("error","Your current password does not matches with the password you provided. Please try again.");
        }

        if(strcmp($request->get('current-password'), $request->get('new-password')) == 0){
        //Current password and new password are same
            return redirect()->back()->with("error","New Password cannot be same as your current password. Please choose a different password.");
        }

        $validatedData = $request->validate([
            'current-password' => 'required',
            'new-password' => 'required|string|min:8|confirmed|regex:/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/',
             //'g-recaptcha-response' => 'required|captcha',
        ]);

        /*
            Change Password
        */
        $user = Auth::user();
        $user->password = bcrypt($request->get('new-password'));
        $user->save();

        /*
            Send Mail to user for password change
        */
        $email = $user->email;
        Mail::to($email)->send(new ChangePassword($user));

        /*
            Redirect to page once done.
        */
        return redirect( '/profile' )->with("success","Password changed successfully !");
    }

    /*
        Check user profile;
    */
    public function userProfileCheck( $meta_key, $field_value ) {

        // echo $meta_key;
        // echo ' = '. $field_value;die;

        $meta = $this->user->getUserMeta( Auth::user()->id, $meta_key );

        if(empty($meta)) {
            if(!empty($field_value)){
                $this->addUserMeta( $meta_key, $field_value );
            }
        } else {
            if(!empty($field_value)){
                $this->updateUserMeta( $meta_key, $field_value );
            } else {
                $this->deleteUserMeta( $meta_key );
            }
        }
    }

    /*
        Add User Meta using meta_key and meta_value
    */
    public function addUserMeta( $key, $value ) {

        /*
            fields inputs
        */
        $user_id    = Auth::user()->id;
        $current_time = Carbon::now()->toDateTimeString();


        /*
            Insert Records;
        */
        DB::table('user_metas')->insert([
            [   'user_id'   => $user_id,
                'meta_key'  => $key,
                'meta_value'=>$value,
                'created_at'=>$current_time
            ],
        ]);
        
        if($key == 'n_notify' && $value == 'on') {
            $ex = explode( '@', Auth::user()->email );
            Newsletter::subscribe( Auth::user()->email, ['FNAME'=> ucwords($ex['0'] ), 'LNAME'=> '-']);
        }

        if($key == 'n_notify' && $value == 'off') {
            Newsletter::unsubscribe( Auth::user()->email );
        }
    }

    /*
        Update User Meta using meta_key and meta_value
    */
    public function updateUserMeta( $key, $value ) {

        /*
            fields inputs
        */
        $user_id    = Auth::user()->id;
        $current_time = Carbon::now()->toDateTimeString();


        /*
            Update Meta Records;
        */
        DB::table('user_metas')
            ->where('user_id', $user_id)
            ->where('meta_key', $key)
            ->update([ 'meta_value'=>$value, 'updated_at'=>$current_time ]);
            
            
        if($key == 'n_notify' && $value == 'on') {
            $isSubscribed = Newsletter::isSubscribed( Auth::user()->email );
            if( $isSubscribed === FALSE ) {
                $ex = explode( '@', Auth::user()->email );
                Newsletter::subscribe( Auth::user()->email, ['FNAME'=> ucwords($ex['0'] ), 'LNAME'=> '-']);
            }
        }

        if($key == 'n_notify' && $value == 'off') {
            $isSubscribed = Newsletter::isSubscribed( Auth::user()->email );
            if( $isSubscribed === TRUE ) {
                Newsletter::unsubscribe( Auth::user()->email );
            }
        }
    }

    /*
        Delete User Meta;
    */  
    private function deleteUserMeta( $key ) {
        /*
            Get User ID;
        */
        $user_id = Auth::user()->id;

        UserMeta::where( 'user_id', $user_id )
                  ->where( 'meta_key', $key )
                  ->delete();
        if( $key == 'n_notify' ) {
            Newsletter::delete( Auth::user()->email );
        }
    }

    /*
        Deactivate User
    */
    public function deactivateUser() {
        /*
            fields inputs
        */
        $user_id    = Auth::user()->id;
        $current_time = Carbon::now()->toDateTimeString();

        $user = User::find($user_id); 

        $user->state = 3; //User has deactivated his own account;
        $user->updated_at = $current_time;

        $user->save();

    }

    /**
    *  Manage Profile page
    */

    public function showProfileForm() {


        $user_id = Auth::user()->id;

        /*
            Get Lising of Age;
        */
        $ageGroup = AgeGroup::orderBy('order', 'asc')->get();

         /*
            Get Lising of Tag;
        */
        $tags = Tag::all();


         /*
            Get User Meta; meta_key is age;

        */
        $user_tag = explode(',', unserialize( $this->user->getUserMeta( $user_id, 'tag' ) ) ) ?? '';

        /*
            Get User Meta; meta_key is age;

        */
        $user_age =$this->user->getUserMeta( $user_id, 'age' );

        /*
            Get User Meta; meta_key is age;

        */
        $facebook = $this->user->getUserMeta( $user_id, 's_facebook' );


        /*
            Get User Meta; meta_key is linkedin;

        */
        $linkedin = $this->user->getUserMeta( $user_id, 's_linkedin' );

        /*
            Get User Meta; meta_key is google;

        */
        $google = $this->user->getUserMeta( $user_id, 's_google' );

        /*
            Get User Meta; meta_key is twiter

        */
        $twitter = $this->user->getUserMeta( $user_id, 's_twitter' );

        return view('auth.profile', ['ageGroup' => $ageGroup,  'user_age' => $user_age, 'tags' => $tags, 'user_tag' => $user_tag, 's_facebook' => $facebook, 's_linkedin' => $linkedin, 's_google' => $google, 's_twitter' => $twitter]);
    }

    /**
    *  Insert/Update Profile page
    */
    public function updateProfile(Request $request) {

        /*
            Validation for profile page;
        */
        $validatedData = $request->validate([
            'age'       => 'required',
            'tag'       => 'required',
            'facebook'  =>  'nullable|url',
            'linkedin'  =>  'nullable|url',
            'google'    =>  'nullable|url',
            'twitter'   =>  'nullable|url',
        ]);
        
        /*
            fields inputs
        */
        $f_age        = $request->get('age');
        $f_tag        = $request->get('tag');
        $f_facebook   = $request->get('facebook');
        $f_linkedin   = $request->get('linkedin');
        $f_google     = $request->get('google');
        $f_twitter    = $request->get('twitter');

        $counTags = count($f_tag);
        $a_tag = array();
        
        if($counTags > 0) {
            foreach ($f_tag as $t) {
                $a_tag[] = $t;
            }
        }

        $tags = serialize($this->to_string($a_tag));

        /* 
            Get User Meta; meta_key is age;
            Insert or update meta_key = age
        */

        $this->userProfileCheck( 'tag', $tags);
        

        /*
            Get User Meta; meta_key is age;
            Insert or update meta_key = age
        */

        $this->userProfileCheck( 'age', $f_age);

        /*
            Get User Meta; meta_key is s_facebook;
            Insert or update meta_key = s_facebook
        */
        $this->userProfileCheck( 's_facebook', $f_facebook);

        /*
            Get User Meta; meta_key is s_linkedin;
            Insert or update meta_key = s_linkedin
        */
        $this->userProfileCheck( 's_linkedin', $f_linkedin);

        /*
            Get User Meta; meta_key is s_google;
            Insert or update meta_key = s_google
        */
        $this->userProfileCheck( 's_google', $f_google);

        /*
            Get User Meta; meta_key is s_twitter;
            Insert or update meta_key = s_twitter
        */
        $this->userProfileCheck( 's_twitter', $f_twitter);

        return redirect()->back()->with("success","Profile changed successfully !");


        // if ($request->get('age') == '') {
        //     return redirect()->back()->with("error","Please check your age!");
        // }
    }

    private function to_string($data, $glue=', ') {
        $output = '';
        if(!empty($data) && count($data) > 0) {
            $values = array_values($data);
            $output = join($glue, $values);
        }
        return $output;
    }


    /*
        User Notifification form
    */
    public function showNotificationForm() {

        $user_id = Auth::user()->id;

        /*
            Get User Meta; meta_key is newsletter_notification;

        */
        $n_notify = $this->user->getUserMeta( $user_id, 'n_notify' );

        /*
            Get User Meta; meta_key is vidoeo_notification

        */
        $v_notify = $this->user->getUserMeta( $user_id, 'v_notify' );

        return view('auth.notification', ['n_notify' => $n_notify, 'v_notify' => $v_notify ]);
    }

    /**
    *  Insert/Update User Notification
    */
    public function updateNotification(Request $request) {
        /*
            Validation for profile page;
        */
        $validatedData = $request->validate([
            'newsletter' => 'required',
            'video'      => 'required',
        ]);
        
        /*
            fields inputs
        */
        $n_notify   = $request->get('newsletter');
        $v_notify   = $request->get('video');

        /*
            Get User Meta; meta_key is s_twitter;
            Insert or update meta_key = s_twitter
        */
        $this->userProfileCheck( 'n_notify', $n_notify);

        /*
            Get User Meta; meta_key is s_twitter;
            Insert or update meta_key = s_twitter
        */
        $this->userProfileCheck( 'v_notify', $v_notify);

        /*
            Send Mail to user for password change
        */
        $email = Auth::user()->email;
        $notify = array( 
                    'name' => Auth::user()->name, 
                    'n_notify' => $n_notify, 
                    'v_notify' => $v_notify
                );
        /*
            Send Mail to user for user notification;
        */
        Mail::to($email)->send(new ChangeNotification($notify));

        return redirect()->back()->with("success","Notification changed successfully !");
    }

    /*
        Show User Account Deactivation Form
    */
    public function showManageProfileDeactivateForm() {

        $user_id = Auth::user()->id;

        $UserDeactivateReason = UserDeactivateReason::orderBy('order', 'asc')->get();

         /*
            Get User Meta; meta_key is newsletter_notification;

        */
        $account_deactivate =$this->user->getUserMeta( $user_id, 'account_deactivate' );

        /*
            Get User Meta; meta_key is newsletter_notification;

        */
        $deactivate_reason = $this->user->getUserMeta( $user_id, 'deactivate_reason' ); 

        return view('auth.deactivation', ['reason' => $UserDeactivateReason, 'deactivate_reason' => $deactivate_reason ]);
    }

    /*
        Mange User Account Deactivation Form
    */
    public function manageProfileDeactivate(Request $request) {

        /*
            Validation for profile page;
        */
        $validatedData = $request->validate([
            'reason_deactivate' => 'required|not_in:0',
            'current-password'  => 'required',
        ]);

        if (!(Hash::check($request->get('current-password'), Auth::user()->password))) {
        // The passwords matches
            return redirect()->back()->with("error","Your current password does not matches with the password you provided. Please try again.");
        }
        
        /*
            fields inputs
        */
        $deactivation   = $request->get('reason_deactivate');

        /*
            Deactivate Your account
        */
        $this->deactivateUser();

        /*
            Get User Meta; meta_key is account_deactivate;
            Insert or update meta_key = account_deactivate
        */
        $this->userProfileCheck( 'account_deactivate', true);

        /*
            Get User Meta; meta_key is deactivate_reason;
            Insert or update meta_key = deactivate_reason
        */
        $this->userProfileCheck( 'deactivate_reason', $deactivation);

        $userReasonIs = UserDeactivateReason::where( 'id', $deactivation)->first()->name;
        /*
            Send Mail to user for password change
        */
        $email = Auth::user()->email;
        $user_reason = array( 
            'name' => Auth::user()->name,
            'reason'=>$userReasonIs
        );
        /*
            Send Mail to user for user notification;
        */
        Mail::to($email)->send(new AccountDeactivate($user_reason));

        return redirect()->back()->with("success","Account Deactivated successfully !");

    }


    public function updateUserProfile( Request $request ) {

        $key = $request->key;
        $value = $request->value;
        $label = $request->label;

        if( $key == 'picture' ) {

            $user_avatar = Auth::user()->avatar;
            $image_path = public_path("$user_avatar");
            /*
                User Avatar;
            */
            if( $user_avatar != '' && file_exists( $image_path ) ) {
                unlink($image_path);
            } 

            /*
                Upload Image;
            */
            $image = $value;
            list($type, $image) = explode(';', $image);
            list(, $image)      = explode(',', $image);
            $image = base64_decode($image);
            $image_name= time().'.png';
            $path = public_path('user/pic/'.$image_name);

            /*
                Save User Image
            */
            $user           =   Auth::user();
            $user->avatar   =   "user/pic/$image_name";
            $user->save();

            file_put_contents($path, $image);

            $this->userProfileCheck( $key, "user/pic/$image_name");
        }  else {
            $this->userProfileCheck( $key, $value);
        }

        return response()->json([ 
            'status' => 'success', 
            'type'   =>  $key,
            'message' => Lang::get('messages.attribute_saved', [ 'attribute' => ucwords( $label ) ])
        ]);  
    }
} 
