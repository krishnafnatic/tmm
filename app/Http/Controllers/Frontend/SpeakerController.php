<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Speaker;
use App\Models\SpeakerDescription;
use App\Models\Language;
use App\Models\SpeakerSocial;
use App\Models\Video;
use App\Models\VideoMeta;
use DB;
use Illuminate\Support\Facades\Lang;

class SpeakerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        
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
        /*
            Get Language id
        */
        $locale     = \App::getLocale();
        $lang_id    = Language::where( 'locale', $locale )->first()->id;

        /*
            speaker;
        */

        $verifySperakerSlug = Speaker::where( 'slug', $slug )->first();
        if(isset($verifySperakerSlug) ){
            $getSpeakerDetails = $verifySperakerSlug->speaker->where( 'language_id', $lang_id);

            /*
                Array
            */
            $speaker_metas = array();
            $speakers_details = array();

            /*
                Details of speaker
            */
            $speakers_details['slug'] = $slug;
            $speakers_details['avatar'] = $verifySperakerSlug->avatar;
            $speakers_details['bc_speaker_name'] = $verifySperakerSlug->bc_speaker_name;
            $speakers_details['name'] = $getSpeakerDetails[0]['name']; 
            $speakers_details['designation'] = $getSpeakerDetails[0]['designation']; 
            $speakers_details['short_description'] = $getSpeakerDetails[0]['short_description']; 
            $speakers_details['description'] = $getSpeakerDetails[0]['description']; 

            /*
                Meta of speaker
            */
            $speaker_metas['meta_title'] = $getSpeakerDetails[0]['meta_title'];
            $speaker_metas['meta_description'] = $getSpeakerDetails[0]['meta_description'];
            $speaker_metas['meta_keyword'] = $getSpeakerDetails[0]['meta_keyword'];

            /*
                Social Data of Speaker
            */
            $social = $verifySperakerSlug->social;


            /*
                Vidoes of Speaker
            */
            $videoQuery = DB::table('video_metas')->whereRaw("meta_value REGEXP '".$verifySperakerSlug->bc_speaker_name."'")->get();
            $all_videos = array();

            $video_title = $getSpeakerDetails[0]['name']."'s Videos";

            if( count($videoQuery) > 0) {

                foreach( $videoQuery as $video ) {

                    $account_id  = $videoMeta->getVideoMeta( $video->video_id, 'account_id' );
                    $name        = $videoMeta->getVideoMeta( $video->video_id, 'name' );
                    $description = $videoMeta->getVideoMeta( $video->video_id, 'description' );
                    $images      = unserialize( $videoMeta->getVideoMeta( $video->video_id, 'images' ) );
                    $filename    = $videoMeta->getVideoMeta( $video->video_id, 'original_filename' );
                    $slug        = $videoMeta->getVideoSlug( $video->video_id );

                    $all_videos[] = array(
                        'video_id'      =>  $video->video_id,
                        'account_id'    =>  $account_id,
                        'name'          =>  $name,
                        'slug'          =>  $slug,
                        'description'   =>  $description,
                        'images'        =>  $images,
                        'filename'      =>  $filename,
                    );
                }

            }

            // print '<pre>';
            //     print_r($all_videos[0]['video_id']);
            // print '</pre>';
            // die( $slug );

            return view('frontend.speaker', [ 'meta' => $speaker_metas, 'speakers_detail' => $speakers_details, 'social' => $social, 'videos' => $all_videos, 'video_title' => $video_title ]);
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

    private function unserialize( $data ) {

        
    }
}
