<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\Lang;
use App\Models\Language;

class LanguageController extends Controller
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
                Language Listing
            */
            $language_listing = Language::all();

            /*
                Create View
            */
            return view('backend.language', [ 'languages' => $language_listing] );
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
        
        return view('backend.form_language');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {

        $this->validate($request,[
            'name'      => 'required|alpha|max:25|unique:translations',
            'code'      => 'required|alpha|max:5|unique:translations',
            'locale'    => 'required|alpha|max:5|unique:translations',
            'image'     => 'max:20|unique:translations',
            'order'     => 'required|digits_between:1,4|unique:translations',
        ]);

        Language::create([
            'name'      => $request->get('name'),
            'code'      => $request->get('code'),
            'locale'    => $request->get('locale'),
            'image'     => $request->get('image'),
            'order'     => $request->get('order'),
            'status'    => $request->get('status'),
        ]);

        return redirect('/admin/language')->with('success', Lang::get('messages.page_added', ['page' => 'Language']));
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
        
        $verifyLangID = Language::where('id', $id)->first();
        if(isset($verifyLangID) ){
            
            $lang = Language::find($id);

            return view('backend.form_language', ['id' => $id, 'lang' => $lang]);
            
        }else{
            return redirect('/admin/language')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Language']));
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

        $this->validate($request,[
            'name'      => 'required|alpha|max:25|unique:translations,name,'.$id,
            'code'      => 'required|alpha|max:5|unique:translations,code,'.$id,
            'locale'    => 'required|alpha|max:5|unique:translations,locale,'.$id,
            'image'     => 'max:20|unique:translations,image,'.$id,
            'order'     => 'required|digits_between:1,4|unique:translations,order,'.$id,
        ]);

        $verifyLangID = Language::where('id', $id)->first();
        if(isset($verifyLangID) ){
            
            $lang = Language::find($id);

            $lang->name = $request->get('name'); 
            $lang->code = $request->get('code'); 
            $lang->locale = $request->get('locale'); 
            $lang->image = $request->get('image'); 
            $lang->order = $request->get('order'); 
            $lang->status = $request->get('status'); 

            $lang->save();

            return redirect('/admin/language')->with('success', Lang::get('messages.page_updated', ['page' => 'Language']));
            
        }else{
            return redirect('/admin/language')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Language']));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        
        $verifyLangID = Language::where('id', $id)->first();
        if(isset($verifyLangID) ){
            
            Language::destroy($id);

            return redirect('/admin/language')->with('success', Lang::get('messages.page_delete', ['page' => 'Language']));
            
        }else{
            return redirect('/admin/language')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Language']));
        }
    }
}
