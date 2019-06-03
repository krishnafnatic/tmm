<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserMeta;
use Auth;
use App\Models\AgeGroup;
use App\Models\Tag;
use Hash;

class UserController extends Controller {
   	

   	public function index() {
   		
      if( !Auth::guard('admin')->check()) {
        return redirect()->intended(route('admin.login'));
      }  else {
     		$this->isAdmin();

      	/*
    			Menu Listing
    		*/
    		$user_listing = User::where( 'role_id', 2)->orderBy( 'id', 'desc')->get();

    		/*
    			Create View
    		*/
    		return view('backend.user', ['users' => $user_listing]);
      }
   	}

   	public function view( $id ) {

   		if( !Auth::guard('admin')->check()) {
        return redirect()->intended(route('admin.login'));
      }  else {

     		$verifyUserID = User::where('id', $id)->first();
          if(isset($verifyUserID) ) {
          	$userMeta = UserMeta::where( 'user_id', $id )->get(); 

            if( $this->getUserMeta( $id, 'tag' ) != '') {
                $tag_ids  = explode(',', unserialize( $this->getUserMeta( $id, 'tag' ) ) );
                $getTagName = implode(', ', $this->getUserTagName( $tag_ids ) ) ?? '';
            } else {
                $getTagName = '';
            }
           

          	$facebook = $this->getUserMeta( $id, 's_facebook');
          	$linkedin = $this->getUserMeta( $id, 's_linkedin');
          	$twitter  = $this->getUserMeta( $id, 's_twitter');
          	$google   = $this->getUserMeta( $id, 's_google');
            $id       = $this->getUserMeta( $id, 'age'); 

          	$age = AgeGroup::where( 'id', $id)->first()->value ?? '';

          	$user_social = array( 
          			'facebook' => $facebook,
          			'linkedin' =>	$linkedin,
          			'twitter'	 =>	$twitter,
          			'google'	 =>	$google,
          			'age'		   =>	$age,
                'tag'      => $getTagName
          		);

              return view('backend.view_user', ['id' => $id, 'user' => $verifyUserID, 'user_social' => $user_social]);	
          }else{
              return redirect('/admin/user')->with('warning', Lang::get('messages.user_id_not_exists'));
          }
        }
   	}

   	/*
		@is admin;
   	*/
   	private function isAdmin() {
   		
   	}

   	/*
		get user meta by meta_id and user_id;
   	*/
	private function getUserMeta( $id, $key ) {


        $meta = UserMeta::where('user_id', $id)
                        ->Where('meta_key', $key)
                        ->select('meta_value')
                        ->get();

        return $meta[0]['meta_value'] ?? '';
	}

  /*
    Get Tag Name
  */
  private function getUserTagName( $ids ) { 

      if( count($ids) > 0) {
        $tag_name = array(); 

        if(is_array($ids)) {
          foreach( $ids as $id ) {
            $tag_name[] = Tag::where( 'id', $id )->first()->tag;
          }
        } else {
          $tag_name[] = Tag::where( 'id', $id )->first()->tag;
        } 
      }

      return $tag_name ?? '';

  }


  public function showPasswordForm() {

    if( !Auth::guard('admin')->check()) {
      return redirect()->intended(route('admin.login'));
    }

      return view('backend.change_password');
  }

  /**
  *   Change password
  */
  
  public function changePassowrd(Request $request) {

      if (!(Hash::check($request->get('current-password'), Auth::guard('admin')->user()->password))) {
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
      $user = Auth::guard('admin')->user();
      $user->password = bcrypt($request->get('new-password'));
      $user->save();
      return redirect( '/admin/password/change' )->with("success","Password changed successfully !");
  }
 /* public function profile()
    {
        $user = Auth::user();
        return view('profile',compact('user',$user));
    }

  public function update_avatar(Request $request){

        $request->validate([
            'avatar' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $user = Auth::user();

        $avatarName = $user->id.'_avatar'.time().'.'.request()->avatar->getClientOriginalExtension();

        $request->avatar->storeAs('avatars',$avatarName);

        $user->avatar = $avatarName;
        $user->save();

        return back()
            ->with('success','You have successfully upload image.');

    }*/
  
}
