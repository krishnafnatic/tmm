<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use App\Models\AdminMail;
use App\Notifications\InboxMessage;
use App\Http\Requests\ContactFormRequest;
use Illuminate\Support\Facades\Route;
use App\Models\StaticPageSeo;

class ContactController extends Controller {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        /*
            Meta tags
        */

        $frontend_meta = $this->meta_tags();

        return view( 'frontend.contact', [ 'meta' => $frontend_meta ] );
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
    public function store( ContactFormRequest $message, AdminMail $admin ) {
        
        //$admin->email = $message['email'];
        //send the admin an notification
        $admin->notify(new InboxMessage($message));
        // redirect the user back
        return redirect('/')->with('success', 'thanks for the message! We will get back to you soon!');
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
    private function meta_tags() {

        /*
            Create an empty array
        */

        $frontend_meta = array();

        /*
            Get Current Route
        */

        $current_route = !empty( Route::getCurrentRoute()->getName() ) ? Route::getCurrentRoute()->getName() : '';
        
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
