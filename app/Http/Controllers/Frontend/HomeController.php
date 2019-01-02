<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Video;
use App\Models\VideoMeta;
use App\Models\Playlist;
use App\Models\PlaylistMeta;
use App\Models\HomeSetting;
use App\Models\HomeAdvertisment;
use App\Models\Tag;
use Illuminate\Support\Facades\Lang;
use Newsletter;
use Auth;

use Illuminate\Support\Facades\Mail;

use App\Mail\SubscribeMe;
use App\Mail\UnSubscribeMe;
use App\Repositories\User\UserInterface as UserInterface;

class HomeController extends Controller {

    protected $user;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct( UserInterface $user ) {
        $this->user = $user;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show( VideoMeta $videoMeta, PlaylistMeta $playlistMeta ) {

        /*
            Home page setting for carousels;
        */
        $home_setting = HomeSetting::where( 'status', 'active' )->orderBy( 'order', 'asc')->get();

        $home_setting_array = array();

        if( isset( $home_setting ) && count ( $home_setting ) > 0 ) {
            foreach( $home_setting as $setting ) {

                if( isset( $setting ) && ( !empty( $setting->type ) &&  $setting->type == 'ads' ) ) {

                    $advertisement = HomeAdvertisment::where( 'type_id', $setting->id )->first();

                    $home_setting_array [$setting->type]   =   array(
                        'id'        =>  $setting->id,
                        'ad_id'     =>  $advertisement->id,
                        'heading'   =>  $setting->heading,
                        'type'      =>  $setting->type,
                        'order'     =>  $setting->order,
                        'image'     =>  $advertisement->image,
                        'width'     =>  '', //$advertisement->width,
                        'height'    =>  '', //$advertisement->height,
                    );

                } else if( isset( $setting ) && ( !empty( $setting->type ) &&  $setting->type == 'trending' ) ) {
                    $home_setting_array[$setting->type]   =   $this->homeSetting( $setting->type, $setting->heading, $videoMeta );
                } else if( isset( $setting ) && ( !empty( $setting->type ) &&  $setting->type == 'popular' ) ) {
                    $home_setting_array[$setting->type]   =   $this->homeSetting( $setting->type, $setting->heading, $videoMeta );
                } else if( isset( $setting ) && ( !empty( $setting->type ) &&  $setting->type == 'tag' ) ) {
                    $home_setting_array[$setting->type]   =   $this->homeSetting( $setting->type, $setting->heading, $videoMeta );
                } else if(   $setting->type == '5bdfe38abda6bb0ce8e60d8c' || $setting->type == '5bdfe37b7f25347d9823a146' || $setting->type == '5bdfe3707e881b4ae4fdc688' || $setting->type == '5bdfe3b046e02e118e78ea03' || $setting->type == '5bdfe39d82aca467d2b66f05' || $setting->type == '5bdfe3a622224851c58db127' || $setting->type == '5bdfe3930332284b34ff63e5' || $setting->type == '5bdfe3647f25347d9823a139' ) {
                    $home_setting_array[$setting->type]   =   $this->getFolderVidoes( $setting->type, $setting->heading, $videoMeta );

                } else {
                    $home_setting_array[$setting->type]   =   $this->getPlaylistVidoes( $setting->type, $setting->heading, $videoMeta, $playlistMeta );
                }
            }
        }

        return view('frontend.home', [ 'settings' => $home_setting, 'home_settings' => $home_setting_array ]);
    }

     /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function subscribeNewsletter( Request $request) {

        //echo $request->email;die;

        //Check if a member is subscribed to a list
        $isSubscribed = Newsletter::isSubscribed( $request->email );

        if( $isSubscribed === true) {
            $msg = array(
                'status' => 'success', 
                'type'   => 'newsletter',
                'message' => Lang::get( 'messages.already_subscribed')
            );
        } else {

            $split_name = explode( ' ', $request->name );
            $firstName =  $split_name[0];
            $lastName =  isset( $split_name[1] ) ? $split_name[1] : '' ;
            //echo $request->email;die;

            Newsletter::subscribe('rincewind@discworld.com');
            Newsletter::subscribe( $request->email);

            $email = $request->email;
            $user_subscribe = array( 
                'name' =>  ucwords( $firstName ),
                'email'=>  $request->email,
                'url'  =>   url('/unsubscribe/'.$request->email) 
            );
            /*
                Send Mail to user for user notification;
            */
            Mail::to($email)->send(new SubscribeMe($user_subscribe));

            $msg = array(
                'status' => 'success', 
                'type'   => 'newsletter',
                'message' => Lang::get( 'messages.page_added', ['page' => "Subscribed to Newsletter"] )
            );
        }

        return response()->json($msg);

    }

    public function unSubscribeNewsletter( $email ) {
        

        //Check if a member is subscribed to a list
        $isSubscribed = Newsletter::isSubscribed( $email );

        if( $isSubscribed === true) { 

            /*
                UnSubscribe From MailChimp
            */
            Newsletter::unsubscribe( $email );


            $user_unsubscribe = array( 
                'name' =>  $email,
                'email'=>  $email
            );
            /*
                Send Mail to user for user notification;
            */
            Mail::to($email)->send(new UnSubscribeMe($user_unsubscribe));

            /*
                Redirect to page once done.
            */
            return redirect('/')->with("success", Lang::get( 'messages.already_unsubscribed'));
        } else {
            return redirect('/')->with("success", 'The email id you have provided has not been found in database!');
        }
    }

    private function homeSetting( $type, $heading, $videoMeta ) {


        $videos_array = array(); 
        $allTags = '';

        if( Auth::check() ) {
            $user_id = Auth::user()->id;

            /*
                Get User Meta; meta_key is age;

            */
            $user_tag = explode(',', unserialize( $this->user->getUserMeta( $user_id, 'tag' ) ) ) ?? '';

            $i=1;
            $userTags = Tag::whereIn( 'id', $user_tag )->select( 'tag' )->get();
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
        } 

        if( $type == 'tag' || $type == 'trending' ) {

            $videos = getVideos( $type, $allTags ); 
            if( isset( $videos ) && count( $videos ) > 0 ) {
                foreach( $videos as $video ) {
                    if( !empty( $video['id'] ) ) {
                            $getVideoInfo         = Video::where('id', $video['id'] )->first();
                            $getVideoMetaInfo     = unserialize( $videoMeta->getVideoMeta( $video['id'], 'images' ) );

                        if( isset( $getVideoInfo) &&  !empty( $getVideoInfo )) {
                            $videos_array[] = array(
                                'video_id'       =>  $video['id'],
                                'name'           =>  substr( $getVideoInfo['name'], 0, env('char_limit') ).' ...',
                                'slug'           =>  $getVideoInfo['slug'],
                                'images'         =>  $getVideoMetaInfo,
                            );
                        }
                    } 
                }
            }

            // print '<pre>';
            //     print_r($videos_array);
            // print '</pre>';die;
        } else {
            $videos = getVideos( $type, '' ); 

            if( isset( $videos ) && count( $videos['items'] ) > 0  ) {
                foreach( $videos['items'] as $video ) {
                    if( !empty( $video['video'] ) ) {
                            $getVideoInfo         = Video::where('id', $video['video'] )->first();
                            $getVideoMetaInfo     = unserialize( $videoMeta->getVideoMeta( $video['video'], 'images' ) );

                        if( isset( $getVideoInfo) &&  !empty( $getVideoInfo ) ) {
                            $videos_array[] = array(
                                'video_id'       =>  $video['video'],
                                'name'           =>  substr( $getVideoInfo['name'], 0, env('char_limit') ).' ...',
                                'slug'           =>  $getVideoInfo['slug'],
                                'images'         =>  $getVideoMetaInfo,
                            );
                        }
                    } 
                }
            } 
        }

        
        return $videos_array;
    }

    /*
        get videos form a playlist
    */
    private function getPlaylistVidoes( $type, $heading, $videoMeta, $playlistMeta ) {
        /*
            Get playlist data   using $slug and  model
        */

        /*
            Check is slug is in the db;
            The slug checks if video is exists in db;
        */
        $playlist = Playlist::where( 'slug', $type )->first(); 
        $videos_array = array();

        /*
            check playlist var if isset and not empty;
        */
        if( isset( $playlist ) && !empty( $playlist ) ) {

            /*
                Variable initalize;
            */
            $playlist_name      = $playlistMeta->getPlaylistMeta( $playlist['id'], 'name' );
            $playlist_slug      = Playlist::where( 'id', $playlist['id'])->select('slug')->first();
            $playlist_videos    = unserialize( $playlistMeta->getPlaylistMeta( $playlist['id'], 'video_ids' ) );

            if( count($playlist_videos) > 0 ) {
                foreach(  $playlist_videos as $video_id ) {

                    $video = Video::where( 'id', $video_id)->first();

                    if( isset( $video) &&  !empty( $video ) ) {
                        $vidoe_images       = unserialize( $videoMeta->getVideoMeta( $video_id, 'images' ) );

                        $videos_array[] = array(
                            'video_id'       =>  $video_id,
                            'name'           =>  substr( $video['name'], 0, env('char_limit') ).' ...',
                            'slug'           =>  $video['slug'],
                            'images'         =>  $vidoe_images,
                        );
                    }
                }
            }
        }

        //return $videos_array;

        $playlist_videos = array();

        $playlist_videos['playlist']['playlist_id']     =   $playlist['id'];
        if( isset( $heading ) && !empty( $heading ) ) {
            $playlist_videos['playlist']['playlist_name']   =   $heading;
        }  else {
            $playlist_videos['playlist']['playlist_name']   =   $playlist_name;
        }
        $playlist_videos['playlist']['playlist_slug']   =   $playlist_slug['slug'];
        $playlist_videos['playlist']['playlist_videos'] =   $videos_array;

        return $playlist_videos;
    }


    /*
        get Videos from a folder
    */
    private function getFolderVidoes( $type, $heading, $videoMeta ) {


        $videos_array = array();

        $data = $videoMeta->getVideoFolderMeta( 'folder_id', $type );

        if( count($data) > 0 ) {
            foreach(  $data as $video_data ) {

                $video = Video::where( 'id', $video_data->video_id)->first();

                if( isset( $video) &&  !empty( $video ) ) {
                    $vidoe_images       = unserialize( $videoMeta->getVideoMeta( $video_data->video_id, 'images' ) );

                    $videos_array[] = array(
                        'video_id'       =>  $video_data->video_id,
                        'name'           =>  substr( $video['name'], 0, env('char_limit') ).' ...',
                        'slug'           =>  $video['slug'],
                        'images'         =>  $vidoe_images,
                    );
                }
            }
        }

        //return $videos_array;

        $folder_videos = array();


        $folder_videos['folder']['folder_id']             =   $type;
        //$folder_videos['folder']['folder_name']           =   '';
        if( isset( $heading ) && !empty( $heading ) ) {
            $folder_videos['folder']['folder_heading']    =   $heading;
        }
        $folder_videos['folder']['folder_videos']         =   $videos_array;

        return $folder_videos;

    }

}
