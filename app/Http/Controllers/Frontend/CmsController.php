<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Lang;
use App\Models\Language;
use App\Models\InformationDescription;
use Illuminate\Support\Facades\Route;
use App\Models\StaticPageSeo;

class CmsController extends Controller {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {

        /*
            Meta tags
        */
        $slug = '';
        $frontend_meta = $this->meta_tags( $slug );

        return view( 'frontend.about', [ 'meta' => $frontend_meta] );
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

            /*
                Meta tags
            */

            $frontend_meta = $this->meta_tags( $slug );

            $cms = InformationDescription::where( 'information_id', 8)->where('language_id', $lang_id)->first();

            return view( 'frontend.cms' , [ 'cms' => $cms, 'meta' => $frontend_meta ] );

        } else if($slug == 'terms-of-service') {

            /*
                Meta tags
            */

            $frontend_meta = $this->meta_tags( $slug );

            $cms = InformationDescription::where( 'information_id', 9)->where('language_id', $lang_id)->first();

            return view( 'frontend.cms' , [ 'cms' => $cms, 'meta' => $frontend_meta ] );
            
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
     * Create a new controller instance.
     * return meta tags using current route.
     *
     * @return void
     */
    private function meta_tags( $slug ) {

        /*
            Create an empty array
        */

        $frontend_meta = array();

        /*
            Get Current Route
        */

        if( !empty( $slug ) ) {
            $current_route = !empty( $slug ) ? $slug : '';
        } else {
            $current_route = !empty( Route::getCurrentRoute()->getName() ) ? Route::getCurrentRoute()->getName() : '';
        }
        
        if( isset( $current_route ) && !empty( $current_route) )  {

            /*
                Get Meta Fields using current route;
            */
            $metaTags = StaticPageSeo::where( 'route', $current_route )->first();

            if( isset( $metaTags ) && !empty( $metaTags) )  {
                $frontend_meta['name']            =   $metaTags['name'];
                $frontend_meta['route']           =   $metaTags['route'];
                $frontend_meta['meta_title']      =   $metaTags['meta_title'];
                $frontend_meta['meta_description']=   $metaTags['meta_description'];
                $frontend_meta['meta_keyword']    =   $metaTags['meta_keyword'];
            }
        }

        return $frontend_meta;
    }
}
