<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\StaticPageSeo;
use Auth;
use Illuminate\Support\Facades\Lang;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Route;

class StaticPageController extends Controller
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
        } else {
            $StaticPageSeo = StaticPageSeo::all();
            return view( 'backend.staticpages', [ 'StaticPageSeo' => $StaticPageSeo ] );
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() { 

        /*
            Check Authentication of User
        */

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        } else {
            return view( 'backend.form_staticpageseo');
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'name'     => 'required|regex:/^[\pL\s\-]+$/u|unique:static_pages_seos',
            'route'    => 'required|unique:static_pages_seos',
            'meta_title'    => 'required',
            'meta_description' => 'required',
            'meta_keyword'  => 'required',
        ]);

        $items = StaticPageSeo::create([
            'name' => $request->name,
            'route' => $request->route,
            'meta_title' => $request->meta_title,
            'meta_description' => $request->meta_description,
            'meta_keyword' => $request->meta_keyword,
        ]);

        return redirect('/admin/staticpages')->with('success', Lang::get('messages.page_added', ['page' => 'Static Pages']));
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
        
        $staticPageDetails = StaticPageSeo::where( 'id', $id)->get();

        return view( 'backend.form_staticpageseo', [ 'id' => $id, 'staticPageDetails' => $staticPageDetails ] );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        
        $this->validate($request,[
            'name' => 'required|regex:/^[\pL\s\-]+$/u|unique:static_pages_seos,name,'.$id,
            'route' => 'required|unique:static_pages_seos,route,'.$id,
            'meta_title' => 'required',
            'meta_description' => 'required',
            'meta_keyword' => 'required',
        ]);

        $verifyStaticPageID = StaticPageSeo::where('id', $id)->first();
        if(isset($verifyStaticPageID) ){
            
            $StaticPageSeo = StaticPageSeo::find($id);

            $StaticPageSeo->name = $request->get('name'); 
            $StaticPageSeo->route = $request->get('route'); 
            $StaticPageSeo->meta_title = $request->get('meta_title'); 
            $StaticPageSeo->meta_description = $request->get('meta_description'); 
            $StaticPageSeo->meta_keyword = $request->get('meta_keyword'); 

            $StaticPageSeo->save();

            return redirect('/admin/staticpages')->with('success', Lang::get('messages.page_updated', ['page' => 'Static Pages']));
            
        }else{
            return redirect('/admin/staticpages')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Static Pages']));
        }
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
