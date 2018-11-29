<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Video;
use App\Models\VideoMeta;
use Illuminate\Support\Facades\Lang;
use App\Models\Wishlist;
use App\Models\Speaker;
use App\Models\SpeakerDescription;
use Auth;
use DB;
use App\Models\Playlist;
use App\Models\PlaylistMeta;

class VideoDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show( $slug, VideoMeta $videoMeta ) {

        $verifyVideoSlug = Video::where( 'slug', $slug )->first();

        if(isset($verifyVideoSlug) ){

            $video_detail = array();

            $videoMeta = new VideoMeta;

            $video_detail['account_id']  = $videoMeta->getVideoMeta($verifyVideoSlug->id, 'account_id' );
            $video_detail['video_id']  = $verifyVideoSlug->id;
            $video_detail['name']      = $verifyVideoSlug->name;
            $video_detail['slug']      = $verifyVideoSlug->slug;
            $video_detail['tags']      = unserialize( $videoMeta->getVideoMeta($verifyVideoSlug->id, 'tags' ));
            $video_detail['description']    = $videoMeta->getVideoMeta($verifyVideoSlug->id, 'description' );
            $video_detail['images']    = unserialize( $videoMeta->getVideoMeta($verifyVideoSlug->id, 'images' ) );
            $video_detail['custom_fields']  = unserialize( $videoMeta->getVideoMeta($verifyVideoSlug->id, 'custom_fields' ) );
            /*
                Get Speaker from video custom fields;
            */
            $speakers_using_cf = $this->getCustomSpeakers( $video_detail['custom_fields'] );

            $splitArraySpeaker = explode( ',', $speakers_using_cf );
            //die;

            $all_speakers = array();

            if(  $speakers_using_cf ) {
                $speakerQuery = DB::table('speakers')->whereIn( 'bc_speaker_name', $splitArraySpeaker )->get();

                foreach( $speakerQuery as $speaker ) {
                    
                    $speaker_descriptions = SpeakerDescription::where( 'speaker_id', $speaker->id )->first();

                    $all_speakers[] = array(
                        'speaker_id'    =>  $speaker->id,
                        'name'          =>  $speaker_descriptions->name,
                        'slug'          =>  $speaker->slug,
                        'avatar'        =>  $speaker->avatar,
                        'designation'   =>  $speaker_descriptions->designation,
                        'short_description'   =>  $speaker_descriptions->short_description,
                    );
                }
            } 

            /*
                Get User ID;
            */
            $user_id = Auth::user()->id ?? '';

            /*
                Get wishlist listing by user id;
            */

            $wishlistQuery = wishlist::where( 'user_id', $user_id )->get();

            $all_videos = array();

            if( count( $wishlistQuery ) > 0 ) {
                foreach($wishlistQuery as $wishlist ) {

                    $account_id  = $videoMeta->getVideoMeta( $wishlist['video_id'], 'account_id' );
                    $name        = $videoMeta->getVideoMeta( $wishlist['video_id'], 'name' );
                    $description = $videoMeta->getVideoMeta( $wishlist['video_id'], 'description' );
                    $images      = unserialize( $videoMeta->getVideoMeta( $wishlist['video_id'], 'images' ) );
                    $filename    = $videoMeta->getVideoMeta( $wishlist['video_id'], 'original_filename' );
                    $slug        = $videoMeta->getVideoSlug( $wishlist['video_id'] );

                    $all_videos[] = array(
                        'video_id'      =>  $wishlist['video_id'],
                        'account_id'    =>  $account_id,
                        'name'          =>  $name,
                        'slug'          =>  $slug,
                        'description'   =>  $description,
                        'images'        =>  $images,
                        'filename'      =>  $filename,
                    );
                }
            }

            

            return view('frontend.video_detail', ['video_detail' =>  $video_detail, 'wishlist' => $all_videos, 'speakers' => $all_speakers ]);
            
        } else {
            return redirect()->route('404');
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    /**
     * get player response using cURL from Brightcove
     *
     * @return Assoc Array
     */
    public function getVideoViews(Request $request) { 

        $video_id   = $request->get('video_id');
        
        /*
            Calling Helper brightcove function
        */
        $responseDecoded = getVideos( 'view', $video_id );


        return response()->json([
            'status' => 'success', 
            'type'=> 'views',
            'view' => $responseDecoded]);
    }

    private function getCustomSpeakers( $cf ) {

        $speakers = array(  "speaker_1", "speaker_2", "speaker_3", "speaker_4", "speaker_5_", "speaker_6" );
        $all_custom_fields = '';
        $total_cf = count( $cf );
        
        if( $total_cf > 0 ) {
            $i=1;
            foreach( $cf as $k => $v ) {  
                if( in_array($k, $speakers ) ) { 
                    if($i == $total_cf ) {
                        $all_custom_fields .= $v;
                    } else {
                        $all_custom_fields .= $v.',';
                    }
                }

                $i++;
            }
        }

        return $all_custom_fields;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function popularWatchNext( $slug, VideoMeta $videoMeta ) {

        $verifyVideoSlug = Video::where( 'slug', $slug )->first();

        if(isset($verifyVideoSlug) ){

            $video_detail = array();

            $videoMeta = new VideoMeta;

            $video_detail['account_id']  = $videoMeta->getVideoMeta($verifyVideoSlug->id, 'account_id' );
            $video_detail['video_id']  = $verifyVideoSlug->id;
            $video_detail['name']      = $verifyVideoSlug->name;
            $video_detail['slug']      = $verifyVideoSlug->slug;
            $video_detail['tags']      = unserialize( $videoMeta->getVideoMeta($verifyVideoSlug->id, 'tags' ));
            $video_detail['description']    = $videoMeta->getVideoMeta($verifyVideoSlug->id, 'description' );
            $video_detail['images']    = unserialize( $videoMeta->getVideoMeta($verifyVideoSlug->id, 'images' ) );
            $video_detail['custom_fields']  = unserialize( $videoMeta->getVideoMeta($verifyVideoSlug->id, 'custom_fields' ) );

            /*
                Get Speaker from video custom fields;
            */
            $speakers_using_cf = $this->getCustomSpeakers( $video_detail['custom_fields'] );

            $splitArraySpeaker = explode( ',', $speakers_using_cf );
            //die;

            $all_speakers = array();

            if(  $speakers_using_cf ) { 
                $speakerQuery = DB::table('speakers')->whereIn( 'bc_speaker_name', $splitArraySpeaker )->get();

                foreach( $speakerQuery as $speaker ) {
                    // print '<pre>';
                    //     print_r($speaker->id);
                    // print '</pre>';
                    // die;
                    $speaker_descriptions = SpeakerDescription::where( 'speaker_id', $speaker->id )->first();

                    $all_speakers[] = array(
                        'speaker_id'    =>  $speaker->id,
                        'name'          =>  $speaker_descriptions->name,
                        'slug'          =>  $speaker->slug,
                        'avatar'        =>  $speaker->avatar,
                        'designation'   =>  $speaker_descriptions->designation,
                        'short_description'   =>  $speaker_descriptions->short_description,
                    );
                }
            } 

            /*
                Get User ID;
            */
            $user_id = Auth::user()->id ?? '';

            /*
                Get wishlist listing by user id;
            */

            $wishlistQuery = wishlist::where( 'user_id', $user_id )->get();

            $all_videos = array();

            if( count( $wishlistQuery ) > 0 ) {
                foreach($wishlistQuery as $wishlist ) {

                    $account_id  = $videoMeta->getVideoMeta( $wishlist['video_id'], 'account_id' );
                    $name        = $videoMeta->getVideoMeta( $wishlist['video_id'], 'name' );
                    $description = $videoMeta->getVideoMeta( $wishlist['video_id'], 'description' );
                    $images      = unserialize( $videoMeta->getVideoMeta( $wishlist['video_id'], 'images' ) );
                    $filename    = $videoMeta->getVideoMeta( $wishlist['video_id'], 'original_filename' );
                    $slug        = $videoMeta->getVideoSlug( $wishlist['video_id'] );

                    $all_videos[] = array(
                        'video_id'      =>  $wishlist['video_id'],
                        'account_id'    =>  $account_id,
                        'name'          =>  $name,
                        'slug'          =>  $slug,
                        'description'   =>  $description,
                        'images'        =>  $images,
                        'filename'      =>  $filename,
                    );
                }
            }

            /*
                Watch Next based on Popular Videos
            */
            $videos = getVideos( 'popular', '' );
            $videos_array = array();

            if( isset( $videos ) && count( $videos['items'] ) > 0  ) {
                foreach( $videos['items'] as $video ) {
                    if( !empty( $video['video'] ) ) {
                            $getVideoInfo         = Video::where('id', $video['video'] )->first();
                            $getVideoMetaInfo     = unserialize( $videoMeta->getVideoMeta( $video['video'], 'images' ) );

                        if( isset( $getVideoInfo) &&  !empty( $getVideoInfo ) && $video['video'] != $verifyVideoSlug->id) {
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

            return view('frontend.video_detail', ['video_detail' =>  $video_detail, 'wishlist' => $all_videos, 'speakers' => $all_speakers, 'watch_next' => $videos_array, 'type' => 'popular' ]);
            
        } else {
            return redirect()->route('404');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function trendingWatchNext( $slug, VideoMeta $videoMeta ) {

        $verifyVideoSlug = Video::where( 'slug', $slug )->first();

        if(isset($verifyVideoSlug) ){

            $video_detail = array();

            $videoMeta = new VideoMeta;

            $video_detail['account_id']  = $videoMeta->getVideoMeta($verifyVideoSlug->id, 'account_id' );
            $video_detail['video_id']  = $verifyVideoSlug->id;
            $video_detail['name']      = $verifyVideoSlug->name;
            $video_detail['slug']      = $verifyVideoSlug->slug;
            $video_detail['tags']      = unserialize( $videoMeta->getVideoMeta($verifyVideoSlug->id, 'tags' ));
            $video_detail['description']    = $videoMeta->getVideoMeta($verifyVideoSlug->id, 'description' );
            $video_detail['images']    = unserialize( $videoMeta->getVideoMeta($verifyVideoSlug->id, 'images' ) );
            $video_detail['custom_fields']  = unserialize( $videoMeta->getVideoMeta($verifyVideoSlug->id, 'custom_fields' ) );

            /*
                Get Speaker from video custom fields;
            */
            $speakers_using_cf = $this->getCustomSpeakers( $video_detail['custom_fields'] );

            $splitArraySpeaker = explode( ',', $speakers_using_cf );
            //die;

            $all_speakers = array();

            if(  $speakers_using_cf ) {
                $speakerQuery = DB::table('speakers')->whereIn( 'bc_speaker_name', $splitArraySpeaker )->get();

                foreach( $speakerQuery as $speaker ) {
                    // print '<pre>';
                    //     print_r($speaker->id);
                    // print '</pre>';
                    // die;
                    $speaker_descriptions = SpeakerDescription::where( 'speaker_id', $speaker->id )->first();

                    $all_speakers[] = array(
                        'speaker_id'    =>  $speaker->id,
                        'name'          =>  $speaker_descriptions->name,
                        'slug'          =>  $speaker->slug,
                        'avatar'        =>  $speaker->avatar,
                        'designation'   =>  $speaker_descriptions->designation,
                        'short_description'   =>  $speaker_descriptions->short_description,
                    );
                }
            } 

            /*
                Get User ID;
            */
            $user_id = Auth::user()->id ?? '';

            /*
                Get wishlist listing by user id;
            */

            $wishlistQuery = wishlist::where( 'user_id', $user_id )->get();

            $all_videos = array();

            if( count( $wishlistQuery ) > 0 ) {
                foreach($wishlistQuery as $wishlist ) {

                    $account_id  = $videoMeta->getVideoMeta( $wishlist['video_id'], 'account_id' );
                    $name        = $videoMeta->getVideoMeta( $wishlist['video_id'], 'name' );
                    $description = $videoMeta->getVideoMeta( $wishlist['video_id'], 'description' );
                    $images      = unserialize( $videoMeta->getVideoMeta( $wishlist['video_id'], 'images' ) );
                    $filename    = $videoMeta->getVideoMeta( $wishlist['video_id'], 'original_filename' );
                    $slug        = $videoMeta->getVideoSlug( $wishlist['video_id'] );

                    $all_videos[] = array(
                        'video_id'      =>  $wishlist['video_id'],
                        'account_id'    =>  $account_id,
                        'name'          =>  $name,
                        'slug'          =>  $slug,
                        'description'   =>  $description,
                        'images'        =>  $images,
                        'filename'      =>  $filename,
                    );
                }
            }

            /*
                Watch Next based on Popular Videos
            */
            $videos = getVideos( 'trending', '' );
            $videos_array = array();

            if( isset( $videos ) && count( $videos ) > 0  ) {
                foreach( $videos as $video ) {
                    if( !empty( $video['video'] ) ) {
                            $getVideoInfo         = Video::where('id', $video['video'] )->first();
                            $getVideoMetaInfo     = unserialize( $videoMeta->getVideoMeta( $video['video'], 'images' ) );

                        if( isset( $getVideoInfo) &&  !empty( $getVideoInfo ) && $video['video'] != $verifyVideoSlug->id) {
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

            return view('frontend.video_detail', ['video_detail' =>  $video_detail, 'wishlist' => $all_videos, 'speakers' => $all_speakers, 'watch_next' => $videos_array, 'type' => 'trending' ]);
            
        } else {
            return redirect()->route('404');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function playlistWatchNext( $playlist_slug, $video_slug, VideoMeta $videoMeta, PlaylistMeta $playlistMeta ) {

        $verifyVideoSlug = Video::where( 'slug', $video_slug )->first();

        if(isset($verifyVideoSlug) ){

            $video_detail = array();

            $videoMeta = new VideoMeta;

            $video_detail['account_id']  = $videoMeta->getVideoMeta($verifyVideoSlug->id, 'account_id' );
            $video_detail['video_id']  = $verifyVideoSlug->id;
            $video_detail['name']      = $verifyVideoSlug->name;
            $video_detail['slug']      = $verifyVideoSlug->slug;
            $video_detail['tags']      = unserialize( $videoMeta->getVideoMeta($verifyVideoSlug->id, 'tags' ));
            $video_detail['description']    = $videoMeta->getVideoMeta($verifyVideoSlug->id, 'description' );
            $video_detail['images']    = unserialize( $videoMeta->getVideoMeta($verifyVideoSlug->id, 'images' ) );
            $video_detail['custom_fields']  = unserialize( $videoMeta->getVideoMeta($verifyVideoSlug->id, 'custom_fields' ) );
            /*
                Get Speaker from video custom fields;
            */
            $speakers_using_cf = $this->getCustomSpeakers( $video_detail['custom_fields'] );

            $splitArraySpeaker = explode( ',', $speakers_using_cf );
            //die;

            $all_speakers = array();

            if( count( $speakers_using_cf ) ) {
                $speakerQuery = DB::table('speakers')->whereIn( 'bc_speaker_name', $splitArraySpeaker )->get();

                foreach( $speakerQuery as $speaker ) {
                    // print '<pre>';
                    //     print_r($speaker->id);
                    // print '</pre>';
                    // die;
                    $speaker_descriptions = SpeakerDescription::where( 'speaker_id', $speaker->id )->first();

                    $all_speakers[] = array(
                        'speaker_id'    =>  $speaker->id,
                        'name'          =>  $speaker_descriptions->name,
                        'slug'          =>  $speaker->slug,
                        'avatar'        =>  $speaker->avatar,
                        'designation'   =>  $speaker_descriptions->designation,
                        'short_description'   =>  $speaker_descriptions->short_description,
                    );
                }
            } 

            /*
                Get User ID;
            */
            $user_id = Auth::user()->id ?? '';

            /*
                Get wishlist listing by user id;
            */

            $wishlistQuery = wishlist::where( 'user_id', $user_id )->get();

            $all_videos = array();

            if( count( $wishlistQuery ) > 0 ) {
                foreach($wishlistQuery as $wishlist ) {

                    $account_id  = $videoMeta->getVideoMeta( $wishlist['video_id'], 'account_id' );
                    $name        = $videoMeta->getVideoMeta( $wishlist['video_id'], 'name' );
                    $description = $videoMeta->getVideoMeta( $wishlist['video_id'], 'description' );
                    $images      = unserialize( $videoMeta->getVideoMeta( $wishlist['video_id'], 'images' ) );
                    $filename    = $videoMeta->getVideoMeta( $wishlist['video_id'], 'original_filename' );
                    $slug        = $videoMeta->getVideoSlug( $wishlist['video_id'] );

                    $all_videos[] = array(
                        'video_id'      =>  $wishlist['video_id'],
                        'account_id'    =>  $account_id,
                        'name'          =>  $name,
                        'slug'          =>  $slug,
                        'description'   =>  $description,
                        'images'        =>  $images,
                        'filename'      =>  $filename,
                    );
                }
            }

            /*
                Watch Next based on Popular Videos
            */
            $playlist = Playlist::where( 'slug', $playlist_slug )->first(); 
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

                        if( isset( $video) &&  !empty( $video ) && $video_id != $verifyVideoSlug->id ) {
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
            $playlist_videos['playlist']['playlist_name']   =   $playlist_name;
            $playlist_videos['playlist']['playlist_slug']   =   $playlist_slug['slug'];
            $playlist_videos['playlist']['playlist_videos'] =   $videos_array;

            return view('frontend.video_detail', ['video_detail' =>  $video_detail, 'wishlist' => $all_videos, 'speakers' => $all_speakers, 'playlist_watch_next' => $playlist_videos ]);
            
        } else {
            return redirect()->route('404');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function tagWatchNext( $tag, VideoMeta $videoMeta ) {

        if(isset($tag) ){

            
            /*
                Watch Next based on Popular Videos
            */
            $videos = getVideos( 'tag', $tag );
            $videos_array = array();

            if( isset( $videos ) && count( $videos ) > 0  ) {
                foreach( $videos as $video ) { 
                    if( !empty( $video['id'] ) ) {
                            $getVideoInfo         = Video::where('id', $video['id'] )->first();
                            $getVideoMetaInfo     = unserialize( $videoMeta->getVideoMeta( $video['id'], 'images' ) );
                            $description = $videoMeta->getVideoMeta($video['id'], 'description' );

                        if( isset( $getVideoInfo) &&  !empty( $getVideoInfo ) ) {
                            $videos_array[] = array(
                                'video_id'       =>  $video['id'],
                                'name'           =>  substr( $getVideoInfo['name'], 0, env('char_limit') ).' ...',
                                'slug'           =>  $getVideoInfo['slug'],
                                'description'    =>  $description,
                                'images'         =>  $getVideoMetaInfo,
                            );
                        }
                    } 
                }
            }

            return view('frontend.tag', [ 'vidoes' => $videos_array, 'tag' => $tag ]);
            
        } else {
            return redirect()->route('404');
        }
    }
}
