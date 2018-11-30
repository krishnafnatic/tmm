<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Speaker;
use App\Models\SpeakerDescription;
use App\Models\SpeakerSocial;
use Auth;
use App\Models\Language;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;
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

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        } else {
            /*
                Create View
            */

            $speakerQuery = Speaker::orderBy( 'id', 'desc')->get();

            $speaker_listing = array();

            foreach($speakerQuery as $query) {

                $speaker_descriptions = SpeakerDescription::where('speaker_id', $query->id)->first();
                $speaker_listing[] = array(
                    'speaker_id'    =>  $query->id,
                    'name'  =>  $speaker_descriptions->name,
                    'slug'  =>  $query->slug,
                );
            }

            /*
                Create View
            */
            return view('backend.speaker', [ 'speakers' => $speaker_listing ]);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        }

        $languages = Language::where('status', 1)->orderBy('order', 'asc')->get();

        return view('backend.form_speaker', ['languages' => $languages]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {

        $validator = Validator::make($request->all(), [ 
            'speaker_description.*.name'             => 'required|regex:/^[\pL\s\-]+$/u|max:100|unique:speaker_descriptions',
            'speaker_description.*.designation'      => 'required|max:100',
            'speaker_description.*.short_description' => 'required|max:255',
            'speaker_description.*.meta_title'        => 'required|regex:/^[\pL\s\-]+$/u|max:100',
            'speaker_description.*.meta_description'  => 'required|regex:/^[\pL\s\-]+$/u|max:155',
        ]);

        if ($validator->fails()) {
            return redirect('admin/speaker/create')
                        ->withErrors($validator)
                        ->withInput();
        }

        $this->validate($request, [
            'slug'      => 'required|max:100|unique:speakers',
            'avatar'    => 'required|image|max:2048',
            'facebook'  =>  'nullable|url',
            'linkedin'  =>  'nullable|url',
            'google'    =>  'nullable|url',
            'twitter'   =>  'nullable|url',
        ]);

        $speaker =  $request->get('speaker_description');

        /*
            fields inputs
        */

        $getimageName = time().'.'.$request->avatar->getClientOriginalExtension();
        $request->avatar->move(public_path('speaker'), $getimageName);

        $current_time = Carbon::now()->toDateTimeString();

        $speak_query = new Speaker;

        $speak_query->slug = $request->slug;
        $speak_query->bc_speaker_name = $request->bc_speaker_name;
        $speak_query->avatar = 'speaker/'.$getimageName;
        $speak_query->created_at = $current_time;

        $speak_query->save();

        foreach($speaker as $info) {

            $this->insertSpeaker( $speak_query->id, $info ); 
        }


        $socialQuery = new SpeakerSocial;
        $socialQuery->speaker_id = $speak_query->id;

        if( !empty( $request->facebook ) ) {
            $socialQuery->facebook = $request->facebook;
            $socialQuery->save();
        }

        if( !empty( $request->linkedin ) ) {
            $socialQuery->linkedin = $request->linkedin;
            $socialQuery->save();
        }

        if( !empty( $request->google ) ) {
            $socialQuery->google   = $request->google;
            $socialQuery->save();
        }

        if( !empty( $request->twitter ) ) {
            $socialQuery->twitter = $request->twitter;
            $socialQuery->save();
        }

        return redirect('/admin/speaker')->with('success', Lang::get('messages.page_added', ['page' => 'Speaker']));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show( $id ) {
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit( $id ) {

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        }

        $verifySpeakID = Speaker::where( 'id', $id )->first();

        if(isset($verifySpeakID) ) {

            $languages = Language::where('status', 1)->orderBy('order', 'asc')->get();

            $speak = array();
            if($languages) {
                foreach($languages as $lang) {
                     $speak[$lang->id] = SpeakerDescription::where( 'speaker_id', $id )->where( 'language_id', $lang->id )->first();
                }
            }

            $speak['slug'] = $verifySpeakID->slug;
            $speak['bc_speaker_name'] = $verifySpeakID->bc_speaker_name ?? '';

            if( $verifySpeakID->avatar != '') {
                $speak['avatar'] = asset( $verifySpeakID->avatar );
            } else {
                $speak['avatar'] = '';
            }

            $social = SpeakerSocial::where('speaker_id', $id)->first();

            return view('backend.form_speaker', ['id' => $id, 'languages' => $languages, 'speak' => $speak, 'social' => $social]);
            
        }else{
            return redirect('/admin/speaker')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Speaker' ]));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {

        $this->validate($request, [
            'facebook'  =>  'nullable|url',
            'linkedin'  =>  'nullable|url',
            'google'    =>  'nullable|url',
            'twitter'   =>  'nullable|url',
        ]);

        $validator = Validator::make($request->all(), [
            'slug'                                   => 'required|max:100|unique:speakers,slug,'.$id,
            'speaker_description.*.name'             => 'required|regex:/^[\pL\s\-]+$/u|max:100'.$id,
            'speaker_description.*.designation'      => 'required|max:100',
            'speaker_description.*.short_description' => 'required|max:255,short_description'.$id,
            'speaker_description.*.meta_title'        => 'regex:/^[\pL\s\-]+$/u|max:100,meta_title'.$id,
            'speaker_description.*.meta_description'  => 'regex:/^[\pL\s\-]+$/u|max:155,meta_description'.$id,
        ]);

        if ($validator->fails()) {
            return redirect("admin/speaker/$id/edit")
                        ->withErrors($validator)
                        ->withInput();
        }

        $speaker =  $request->get('speaker_description');
        

        /*
            fields inputs
        */
        $current_time = Carbon::now()->toDateTimeString();

        $verifySpeakID = Speaker::where('id', $id)->first();
        if(isset($verifySpeakID) ){
            
            $speak_query = Speaker::find($id);

            /*
                Check wether image is uploaded again
            */
            if( $request->avatar != '') {

                /*
                    if user is uploading new image;
                    unlink previous one;
                */
                if( $speak_query->avatar != '') {
                    $image_path = public_path("$speak_query->avatar");
                    unlink($image_path);
                }

                $getimageName = time().'.'.$request->avatar->getClientOriginalExtension();
                $request->avatar->move(public_path('speaker'), $getimageName);
                $speak_query->avatar = 'speaker/'.$getimageName;
            }

            

            $speak_query->slug = $request->slug;
            $speak_query->bc_speaker_name = $request->bc_speaker_name;
            $speak_query->updated_at = $current_time;

            $speak_query->save();

            foreach($speaker as $speak) {
                $this->updateSpeaker( $id, $speak );
            }

            $socialQuery = SpeakerSocial::where( 'speaker_id', $id );

            if( !empty( $request->facebook ) ) {
                $socialQuery->update([  'facebook' => $request->facebook]);
            }

            if( !empty( $request->linkedin ) ) {
                $socialQuery->update([  'linkedin' => $request->linkedin]);
            }

            if( !empty( $request->google ) ) {
                $socialQuery->update([  'google' => $request->google]);
            }

            if( !empty( $request->twitter ) ) {
                $socialQuery->update([  'twitter' => $request->twitter]);
            }


            return redirect('/admin/speaker')->with('success', Lang::get('messages.page_updated', ['page' => 'Speaker']));
            
        }else{
            return redirect('/admin/speaker')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Speaker']));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {

        $verifySpeakID = Speaker::where('id', $id)->first();
        if(isset($verifySpeakID) ){
            
            Speaker::destroy($id);

            return redirect('/admin/speaker')->with('success', Lang::get('messages.page_delete', ['page' => 'Speaker']));
            
        }else{
            return redirect('/admin/speaker')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Speaker']));
        }
    }

    /*
        Insert Records;
    */  
    public function insertSpeaker( $id, $data ) {
        
        DB::table('speaker_descriptions')->insert([
            [   'speaker_id'    => $id,
                'language_id'       => $data['language_id'],
                'name'              => $data['name'],
                'designation'       => $data['designation'],
                'short_description' => $data['short_description'],
                'description'       => $data['description'],
                'biography'         => $data['biography'],
                'meta_title'        => $data['meta_title'],
                'meta_description'  => $data['meta_description'],
                'meta_keyword'      => $data['meta_keyword']
            ],
        ]);
    }   

    /*
        Update Records;
    */  
    public function updateSpeaker( $id, $data ) {

        //echo $data['title'];die;
        DB::table('speaker_descriptions')
            ->where('speaker_id', $id)
            ->where('language_id', $data['language_id'])
            ->update(
                [    
                'name'              => $data['name'],
                'designation'       => $data['designation'],
                'short_description' => $data['short_description'],
                'description'       => $data['description'],
                'biography'         => $data['biography'],
                'meta_title'        => $data['meta_title'],
                'meta_description'  => $data['meta_description'],
                'meta_keyword'      => $data['meta_keyword']
            ]
            );
    }
}
