<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Lang;
use App\Models\Language;
use App\Models\InformationDescription;

class CmsController extends Controller {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {

        return view( 'frontend.about' );
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
    public function show( $slug )
    {
        /*
            Get Language id
        */
        $locale     = \App::getLocale();
        $lang_id    = Language::where( 'locale', $locale )->first()->id;

        if($slug == 'privacy-policy') {

            $cms = InformationDescription::where( 'information_id', 8)->where('language_id', $lang_id)->first();

            return view( 'frontend.cms' , [ 'cms' => $cms ] );

        } else if($slug == 'terms-of-service') {
            $cms = InformationDescription::where( 'information_id', 9)->where('language_id', $lang_id)->first();

            return view( 'frontend.cms' , [ 'cms' => $cms ] );
            
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
}
