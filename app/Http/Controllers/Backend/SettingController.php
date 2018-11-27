<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Auth;
use App\Models\HomeSetting;
use App\Models\HomeAdvertisment;
use App\Models\Playlist;
use Illuminate\Support\Facades\Lang;

class SettingController extends Controller
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
    public function store(Request $request) {

        $rules = []; 

        $settings = $request->setting;

        // print '<pre>';
        //         print_r($settings);
        //     print '</pre>';
        // die;
 
        foreach($request->input('setting') as $key => $value) {
            if($value['type'] == 'ads') {
                $rules["setting.{$key}.image"] = 'nullable|image|dimensions:min_width=970,min_height=91';
                //$rules["setting.{$key}.width"] = 'required|numeric';
                //$rules["setting.{$key}.height"] = 'required|numeric';
                //$rules["setting.{$key}.height"] = 'required|numeric';
            }
            $rules["setting.{$key}.heading"] = 'required';
            $rules["setting.{$key}.type"] = 'required|not_in:0';
            $rules["setting.{$key}.order"] = 'required|digits_between:1,3';
            $rules["setting.{$key}.status"] = 'required';
        }

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return redirect('admin/setting')
                        ->withErrors($validator)
                        ->withInput();
        }



        if ($validator->passes()) { 

            if( count( $settings )  > 0 ) {

               foreach( $settings as $setting ) {
                    
                    if( isset( $setting['id'] ) &&  !empty( $setting['id'] ) ) {

                        $verifySettingID = HomeSetting::where( 'id', $setting['id'] )->first();

                        if( isset( $verifySettingID->id ) && !empty( $verifySettingID->id ) ) {
                        //if( isset( $verifySettingID ) ) {

                                /*
                                    Add Setting Type
                                */
                                $this->updateType( $setting['id'], $setting );

                            if( $setting['type'] == 'ads' ) {

                                $random = 
                                $settingAdsQuery = HomeAdvertisment::where( 'type_id', $setting['id'] )->first();
                                if( isset( $settingAdsQuery->id ) && !empty( $settingAdsQuery->id ) ) {

                                    /*
                                        Delete Image from folder
                                    */
                                
                                    if( !empty( $settingAdsQuery->image ) && !empty( $setting['image'] ) ) {
                                        $image_path = public_path("$settingAdsQuery->image");

                                        if( !empty( $settingAdsQuery->image ) && file_exists( $image_path ) ) {
                                            unlink($image_path);
                                        } 
                                    }

                                    if( !empty( $setting['image']) ) {
                                        $extension=$setting['image']->getClientOriginalExtension();
                                        $new_name = md5( uniqid().'_'.time()).'.'.$extension;
                                        $dir = public_path().'/uploads/advertisement/';
                                        $setting['image']->move($dir, $new_name);
                                        $setting['image'] = '/uploads/advertisement/'.$new_name;
                                    } else {
                                        $setting['image'] = $settingAdsQuery->image;
                                    }

                                    $this->updateTypeAdvertisement( $setting['id'], $setting );
                                } else {
                                    /*
                                        Add Setting Type Advertisement
                                    */

                                    if( !empty( $setting['image']) ) {
                                        $extension=$setting['image']->getClientOriginalExtension();
                                        $new_name = md5( uniqid().'_'.time()).'.'.$extension;
                                        $dir = public_path().'/uploads/advertisement/';
                                        $setting['image']->move($dir, $new_name);
                                        $setting['image'] = '/uploads/advertisement/'.$new_name;
                                    }

                                    $this->addTypeAdvertisement( $setting['id'], $setting );
                                }
                            }

                            if( $setting['type'] != 'ads' && ( isset($setting['type_id']) && !empty( $setting['type_id'] ) ) ) {

                                 $settingAdsQuery = HomeAdvertisment::where( 'id', $setting['type_id'] )->first();

                                /*
                                    Delete Image from folder
                                */
                                 
                                if( !empty( $settingAdsQuery->image ) ) {
                                    $image_path = public_path("$settingAdsQuery->image");

                                    if( !empty( $settingAdsQuery->image ) && file_exists( $image_path ) ) {
                                        unlink($image_path);
                                    } 
                                }

                                /*
                                    Delete Setting Type Advertisement
                                */
                                
                                $this->deleteAdvertisement( $setting['id'], $setting['type_id'] );
                            }

                        } else {
                            return redirect('/admin/setting')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Setting']));
                        }


                    } else {
                        /*
                            Add Setting Type
                        */
                        $id = $this->addType( $setting );

                        /*
                            Add Setting Type Advertisement
                        */
                        if( $setting['type'] == 'ads' ) { 
                            $this->addTypeAdvertisement( $id, $setting );
                        }
                    }
                } 
            }


            

           return redirect('/admin/setting')->with('success', Lang::get('messages.page_added', ['page' => 'Setting']));
        }


        //return response()->json(['error'=>$validator->errors()->all()]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show() {

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        }

        /*
            Getting array for home setting
        */  
        $settingQuery = HomeSetting::all();

        /*
            Initializing the settings
        */ 
        $all_settings = array();

        if( count( $settingQuery ) > 0 ){
            foreach( $settingQuery as $setting ) {
                if( $setting['type'] == 'ads' ) {

                    $settingAdsQuery = HomeAdvertisment::where( 'type_id', $setting['id'] )->first();
                    if( isset( $settingAdsQuery->id ) && !empty( $settingAdsQuery->id ) ) {
                        $all_settings[] = array(
                            'id'        =>  $setting['id'],
                            'type_id'   =>  $settingAdsQuery->id,
                            'heading'   =>  $setting['heading'],
                            'type'      =>  $setting['type'],
                            'image'     =>  $settingAdsQuery['image'],
                            'order'     =>  $setting['order'],
                            'status'    =>  $setting['status'],
                            'width'     =>  '', //$settingAdsQuery->width,
                            'height'    =>  '', //$settingAdsQuery->height,
                        );    
                    } else {
                        $all_settings[] = array(
                            'id'        =>  $setting['id'],
                            'type_id'   =>  '',
                            'heading'   =>  $setting['heading'],
                            'type'      =>  $setting['type'],
                            'order'     =>  $setting['order'],
                            'status'    =>  $setting['status'],
                            'image'     =>  '',
                            'width'     =>  '',
                            'height'    =>  '',
                        );
                    }
                }  else {
                    $all_settings[] = array(
                        'id'        =>  $setting['id'],
                        'heading'   =>  $setting['heading'],
                        'type'      =>  $setting['type'],
                        'order'     =>  $setting['order'],
                        'status'    =>  $setting['status'],
                    );
                }
            }
        }

        /*
            Getting array for Playlist name, slug;
        */ 
        $all_playlist = Playlist::orderBy( 'id', 'asc')->get();


        return view( 'backend.setting', [ 'setting' => $all_settings, 'playlist' => $all_playlist ] );
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

    private function addType( $setting ) {

        $home_setting = HomeSetting::create(
            [
                'heading'=> $setting['heading'],
                'type'  =>  $setting['type'],
                'order' =>  $setting['order'],
                'status' => $setting['status'],
            ]
        );

        return $home_setting->id;

    }

    private function addTypeAdvertisement( $id, $setting ) {
        HomeAdvertisment::create(
            [
                'type_id'   =>  $id,
                'image'     =>  $setting['image'],
                'width'     =>  '',
                'height'    =>  '',
            ]
        );
    }

    private function updateType( $id, $setting ) {

        HomeSetting::where( 'id', $id )
            ->update(
                [
                    'heading'=> $setting['heading'],
                    'type'   => $setting['type'],
                    'order'  => $setting['order'],
                    'status' => $setting['status'],
                ]
        );
    }

    public function updateTypeAdvertisement( $id, $setting ){

        HomeAdvertisment::where( 'type_id', $id )
                 ->update(
            [
                'image'   =>  $setting['image'],
                'width'   =>  '',
                'height'  =>  ''
            ]
        );
    }

    private function deleteAdvertisement( $id, $type_id ) {
        HomeAdvertisment::where( 'id', $type_id )
        ->where( 'type_id', $id )
        ->delete();
    }
}
