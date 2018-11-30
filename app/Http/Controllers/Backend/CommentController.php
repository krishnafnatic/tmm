<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Comment;
use App\Models\Language;
use App\Models\Video;
use App\Models\User;
use App;
use Auth;
use Illuminate\Support\Facades\Lang;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        }
        
        $comment_array = array();
        $comment_query = Comment::orderBy( 'id', 'desc' )->get(); 

        if( isset( $comment_query ) && count($comment_query) ) {
            foreach( $comment_query as $comment ) { 

                $user_name  = User::where( 'id', $comment->user_id )->first()->name;
                $video_name = Video::where( 'id', $comment->video_id )->first()->name;
                $lang_name  = Language::where( 'locale', App::getLocale() )->first()->name;
                // $parent = ( $comment->parent_id == 0 ) ? 'Root' : Comment::where( 'id', $comment->parent_id)->first()->comments;
                $status = ( $comment->status == 0 ) ? 'Inactive' : 'Active';

                $comment_array[] = array(
                    'id'            =>  $comment->id,
                    'user_id'       =>  $comment->user_id,
                    'user_name'     =>  $user_name,
                    'video_name'    =>  $video_name,
                    'lang_name'     =>  $lang_name,
                    'comment'       =>  $comment->comments,
                    'status'        =>  $status,
                    'is_status'     =>  $comment->status,
                );
                 
            }
        }

        return view( 'backend.comment', [ 'comments' => $comment_array ] );
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

        $comment_id =  $request->comment_id;
        $status_id  =  $request->status_id;
        $state      =  $request->state;

        if( $state == 'active') {

            Comment::where( 'id', $comment_id)
                    ->where('status', 0)
                    ->update(['status' => 1]);


            $msg = array(
                'status'        =>  'inactive',
                'title'         =>  'InActivate Comment',
                'comment_id'    =>  $comment_id,
                'status_id'     =>  1,
                'state'         =>  'inactive',
                'message'       => Lang::get( 'messages.comment_activated' ),
            );


        } else if( $state == 'inactive') {

            Comment::where( 'id', $comment_id)
                    ->where('status', 1)
                    ->update(['status' => 0]);

            $msg = array(
                'status'        =>  'active',
                'title'         =>  'Activate Comment',
                'comment_id'    =>  $comment_id,
                'status_id'     =>  0,
                'state'         =>  'active',
                'message'       => Lang::get( 'messages.comment_inactivated' ),
            );
        }

        return response()->json($msg);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show( $id ) {

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        }
        
        $comment_array = array();
        $comment_query = Comment::where( 'id', $id )->orderBy( 'id', 'desc' )->first(); 

        if(isset($comment_query->id) ) {

            $user_name  = User::where( 'id', $comment_query->user_id )->first()->name;
            $video_name = Video::where( 'id', $comment_query->video_id )->first()->name;
            $lang_name  = Language::where( 'locale', App::getLocale() )->first()->name;
            $status = ( $comment_query->status == 0 ) ? 'Inactive' : 'Active';
            $parent = ( $comment_query->parent_id == 0 ) ? 'Root Comment' : Comment::where( 'id', $comment_query->parent_id)->first()->comments;

            /*
                user Comment Array;
            */
            $comment_array = array(
                'id'            =>  $comment_query->id,
                'user_id'       =>  $comment_query->user_id,
                'user_name'     =>  $user_name,
                'video_name'    =>  $video_name,
                'lang_name'     =>  $lang_name,
                'comment'       =>  $comment_query->comments,
                'parent'        =>  $parent,
                'status'        =>  $status,
            );

            return view( 'backend.view_comment', [ 'user_comment' => $comment_array ] );
        } else {
            return redirect('/admin/comment')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Comment' ]));
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
