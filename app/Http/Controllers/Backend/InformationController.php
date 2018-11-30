<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\Lang;
use App\Models\Information;
use App\Models\InformationDescription;
use App\Models\Language;
use Illuminate\Support\Facades\Validator;
use DB;

class InformationController extends Controller
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
                Admin Created time
            */
            //$created_at = $this->getFormatedDate( Auth::guard('admin')->user()->created_at );

            /*
                Menu Listing
            */
            $informationQuery = Information::all();

            $information_listing = array();

            foreach($informationQuery as $query) {
                $information_listing[] = InformationDescription::where('information_id', $query->id)->first();
            }


            /*
                Create View
            */
            return view('backend.information', [/*'created_at' => $created_at,*/ 'informations' => $information_listing]);
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

        return view('backend.form_information', ['languages' => $languages]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        
        $information =  $request->get('information_description');

        $validator = Validator::make($request->all(), [ 
            'information_description.*.title'             => 'required|regex:/^[\pL\s\-]+$/u|max:100|unique:information_descriptions',
            'information_description.*.short_description' => 'required|max:255',
            'information_description.*.meta_title'        => 'required|regex:/^[\pL\s\-]+$/u|max:100',
            'information_description.*.meta_description'  => 'required|regex:/^[\pL\s\-]+$/u|max:155',
        ]);

        if ($validator->fails()) {
            return redirect('admin/information/create')
                        ->withErrors($validator)
                        ->withInput();
        }

        /*
            fields inputs
        */
        $current_time = Carbon::now()->toDateTimeString();

        $infoQuery = new Information;

        $infoQuery->created_at = $current_time;

        $infoQuery->save();

        foreach($information as $info) {

            $this->insertInformation( $infoQuery->id, $info ); 
        }

        return redirect('/admin/information')->with('success', Lang::get('messages.page_added', ['page' => 'Information']));

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        }
        
        $verifyInfoID = Information::where('id', $id)->first();
        if(isset($verifyInfoID) ){

            $languages = Language::where('status', 1)->orderBy('order', 'asc')->get();

            $info = array();
            if($languages) {
                foreach($languages as $lang) {
                     $info[$lang->id] = InformationDescription::where( 'information_id', $id)->where('language_id', $lang->id)->first();
                }
            }

            return view('backend.form_information', ['id' => $id, 'languages' => $languages, 'info' => $info]);
            
        }else{
            return redirect('/admin/information')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Information']));
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

        $validator = Validator::make($request->all(), [ 
            'information_description.*.title'             => 'required|regex:/^[\pL\s\-]+$/u|max:100',
            'information_description.*.short_description' => 'required|max:255,short_description',
            'information_description.*.meta_title'        => 'regex:/^[\pL\s\-]+$/u|max:100,meta_title',
            'information_description.*.meta_description'  => 'regex:/^[\pL\s\-]+$/u|max:155,meta_description',
        ]);

        if ($validator->fails()) {
            return redirect("admin/information/$id/edit")
                        ->withErrors($validator)
                        ->withInput();
        }

        $information =  $request->get('information_description');

        /*
            fields inputs
        */
        $current_time = Carbon::now()->toDateTimeString();

        $verifyInfoID = Information::where('id', $id)->first();
        if(isset($verifyInfoID) ){
            
            $info = Information::find($id);

            $info->updated_at = $current_time;

            $info->save();

            foreach($information as $info) {

                $this->updateInformation( $id, $info ); 
            }


            return redirect('/admin/information')->with('success', Lang::get('messages.page_updated', ['page' => 'Information']));
            
        }else{
            return redirect('/admin/information')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Information']));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {

        $verifyInfoID = Information::where('id', $id)->first();
        if(isset($verifyInfoID) ){
            
            Information::destroy($id);

            return redirect('/admin/information')->with('success', Lang::get('messages.page_delete', ['page' => 'Information']));
            
        }else{
            return redirect('/admin/information')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Information']));
        }
    }

    /*
        Insert Records;
    */  
    public function insertInformation( $id, $data ) {
        
        DB::table('information_descriptions')->insert([
            [   'information_id'    => $id,
                'language_id'       => $data['language_id'],
                'title'             => $data['title'],
                'short_description' => $data['short_description'],
                'description'       => $data['description'],
                'meta_title'        => $data['meta_title'],
                'meta_description'  => $data['meta_description'],
                'meta_keyword'      => $data['meta_keyword']
            ],
        ]);
    }   

    /*
        Update Records;
    */  
    public function updateInformation( $id, $data ) {

        //echo $data['title'];die;
        DB::table('information_descriptions')
            ->where('information_id', $id)
            ->where('language_id', $data['language_id'])
            ->update(
                [    
                'title'             => $data['title'],
                'short_description' => $data['short_description'],
                'description'       => $data['description'],
                'meta_title'        => $data['meta_title'],
                'meta_description'  => $data['meta_description'],
                'meta_keyword'      => $data['meta_keyword']
            ]
            );
    } 

    
}
