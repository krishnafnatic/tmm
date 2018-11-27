<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Wishlist;
use App\Models\VideoMeta;
use Auth;
use Illuminate\Support\Facades\Lang;

class WishlistController extends Controller
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


        if( !Auth::check()) {

            $msg = array(
                'status'    => 'error',
                'type'      => 'wishlist',
                'message'   => Lang::get( 'messages.user_not_exists'),
            );

        } else {

            $hasUserWish =  Wishlist::where( 'user_id', Auth::user()->id )
                                      ->where( 'video_id', $request->video_id )
                                      ->count();

            if( isset( $hasUserWish ) && $hasUserWish > 0 && $request->target == 'remove' ) {

                /*
                    Delete wishlist;
                */
                Wishlist::where( 'user_id', Auth::user()->id )
                         ->where( 'video_id', $request->video_id )
                            ->delete();
                $remainingWish =  Wishlist::where( 'user_id', Auth::user()->id )
                                      ->count();

                $msg = array(
                    'status'    => 'success',
                    'type'      => 'wishlist-'.$request->target,
                    'wishlist_id'   =>  $request->video_id,
                    'leftWish'      =>  $remainingWish,
                    'message'   => Lang::get( 'messages.wishlist_deleted', ['page' => "Wishlist"] ),
                );

            } else {
                /*
                    Save to wish list;
                */
                $wishlist   =   new Wishlist;
                $wishlist->user_id   =   Auth::user()->id;
                $wishlist->video_id  =   $request->video_id;
                $wishlist->save();

                $msg = array(
                    'status'    => 'success',
                    'type'      => 'wishlist-'.$request->target,
                    'message'   => Lang::get( 'messages.wishlist_added', ['page' => "Wishlist"] ),
                );
            }
        }

        return response()->json($msg);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show( VideoMeta $videoMeta ) {

        if( !Auth::guard()->check()) {
            return redirect()->intended(route('login'));
        }
        /*
            Get User ID;
        */
        $user_id = Auth::user()->id;

        /*
            Get wishlist listing by user id;
        */

        $wishlistQuery = wishlist::where( 'user_id', $user_id )->orderBy( 'id', 'desc')->get();

        $all_videos = array();

        if( count( $wishlistQuery ) > 0 ) {
            foreach($wishlistQuery as $wishlist ) {

                $account_id  = $videoMeta->getVideoMeta( $wishlist['video_id'], 'account_id' );
                $name        = $videoMeta->getVideoMeta( $wishlist['video_id'], 'name' );
                $description = $videoMeta->getVideoMeta( $wishlist['video_id'], 'description' );
                $images      = unserialize( $videoMeta->getVideoMeta( $wishlist['video_id'], 'images' ) );
                $filename    = $videoMeta->getVideoMeta( $wishlist['video_id'], 'original_filename' );
                $slug        = $videoMeta->getVideoSlug( $wishlist['video_id'] );

                $all_videos[] = array(
                    'video_id'      =>  $wishlist['video_id'],
                    'account_id'    =>  $account_id,
                    'name'          =>  substr( $name, 0, env('char_limit') ).' ...',
                    'slug'          =>  $slug,
                    'description'   =>  $description,
                    'images'        =>  $images,
                    'filename'      =>  $filename,
                );
            }
        }

        return view( 'frontend.wishlist', [ 'wishlist' => $all_videos, 'user_not_exists' => '' ] );
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

    public function checkIsWhishList( Request $request ) {

        if( !Auth::check()) {

            $msg = array(
                'status'    => 'error',
                'type'      => 'UnLogged',
                'message'   => '',
            );

        } else {

            $hasUserWish =  Wishlist::where( 'user_id', Auth::user()->id )
                                      ->where( 'video_id', $request->video_id )
                                      ->count();

            if( isset( $hasUserWish ) && $hasUserWish > 0 ) {

                $msg = array(
                    'status'    => 'success',
                    'type'      => 'Already',
                    'message'   => '',
                );

            } else {

                 $msg = array(
                    'status'    => 'success',
                    'type'      => 'NotYet',
                    'message'   => '',
                );

            }
        }

        return response()->json($msg);
    }
}
