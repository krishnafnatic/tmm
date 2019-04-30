<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Video;
use App\Models\VideoMeta;
use App\Models\VideoSeo;
use \stdClass;
use Carbon\Carbon;
use Illuminate\Support\Facades\Lang;
use Auth;

class VideoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {

        /*
            Check Authentication of User
        */

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        }

        /*
            define a variable
        */
        $videoListings = array();

        /*
            Get Video details
        */
        $videos = Video::all();

        if( isset( $videos ) && !empty( $videos ) ) {
            foreach( $videos as $video ) {

                /*
                    Get Video seo id
                */
                $VideoSeo = VideoSeo::where( 'video_id', $video->id )->get();

                $videoListings[] = array(
                    'id'        =>  $video->id,
                    'seoID'     =>  isset( $VideoSeo[0]->id ) ? $VideoSeo[0]->id : '',
                    'name'      =>  $video->name,
                );
            }
        }

        return view( 'backend.video', [ 'videos' => $videoListings] );
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function manageSeoTag( $id, VideoMeta $videoMeta) {

        /*
            Check Authentication of User
        */

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        }

        /*
            Created a stdClass
        */
        $videoDetails = new \stdClass();

        /*
            Get video details using video_id;
        */
        $video = Video::where( 'id', $id )->get();

        /*
            Get Video seo details
        */
        $VideoSeo = VideoSeo::where( 'video_id', $id )->get();

        //echo $VideoSeo[0]->meta_title;die;

        $videoDetails->id       = $id;
        $videoDetails->name     = $video[0]->name;
        $videoDetails->images   = unserialize( $videoMeta->getVideoMeta( $id, 'images' ) );
        $videoDetails->seoID    = isset( $VideoSeo[0]->id ) ? $VideoSeo[0]->id : '';
        $videoDetails->mTitle   = isset( $VideoSeo[0]->meta_title ) ? $VideoSeo[0]->meta_title : '';
        $videoDetails->mDesc    = isset( $VideoSeo[0]->meta_description ) ? $VideoSeo[0]->meta_description : '';
        $videoDetails->mTag     = isset( $VideoSeo[0]->meta_tag ) ? $VideoSeo[0]->meta_tag : '';

        //print '<pre>';print_r($videoDetails);die;
 
        return view( 'backend.manageseotag', [ 'video' => $videoDetails ] );
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
    public function storeSeoTags(Request $request) {

        $this->validate($request,[
            'meta_title'        => 'required',
            'meta_description'  => 'required',
            'meta_keyword'      => 'required',
        ]);

        /*
            fields inputs
        */
        $current_time = Carbon::now()->toDateTimeString();

        $infoQuery = new VideoSeo;

        $infoQuery->video_id = $request->video_id;
        $infoQuery->meta_title = $request->meta_title;
        $infoQuery->meta_description = $request->meta_description;
        $infoQuery->meta_tag = $request->meta_keyword;
        $infoQuery->created_at = $current_time;
        $infoQuery->save();

        return redirect('/admin/video/'.$request->video_id.'/manageSeoTag')->with('success', Lang::get('messages.video_meta_response', ['response' => 'Added'])); 
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function editSeoTags(Request $request) {

        $this->validate($request,[
            'meta_title'        => 'required',
            'meta_description'  => 'required',
            'meta_keyword'      => 'required',
        ]);

        /*
            fields inputs
        */
        $current_time = Carbon::now()->toDateTimeString();

        VideoSeo::where( 'video_id', $request->video_id )
            ->where('id', $request->seo_id)
            ->update(
                    [
                        'meta_title'        => $request->meta_title,
                        'meta_description'  => $request->meta_description,
                        'meta_tag'          => $request->meta_keyword
                    ]
            );

        return redirect('/admin/video/'.$request->video_id.'/manageSeoTag')->with('success', Lang::get('messages.video_meta_response', ['response' => 'Updated'])); 
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
}
