<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Comment;
use Auth;
use Illuminate\Support\Facades\Lang;
use Carbon\Carbon;
use App\Models\User;
use App;
use App\Models\Language;
use App\Models\Video;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request) {


        /*
            fields inputs
        */

        $video_id   = $request->video_id;
        $locale     = App::getLocale();
        $lang_id    = Language::where( 'locale', $locale )->first()->id;

        /*
            Get Comment Listing;
        */
        $msg = $this->getAjaxCommentListing( $request->video_id, $lang_id, 'commentListing' );

        return response()->json($msg);
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
        
        /*
            fields inputs
        */
        $current_time    = Carbon::now()->toDateTimeString();

        $lang_id = Language::where( 'locale', App::getLocale() )->first()->id;

        $verifyVideoID = Video::where( 'id', $request->video_id )->first()->id;

        /*
            Check wether Video ID is in DB;
        */
        if( !isset( $verifyVideoID ) ) {

            $msg = array(
                'status' => 'success', 
                'message' => Lang::get( 'messages.page_id_not_exists', ['page' => "Video"] )
            );

            return response()->json($msg);
        }

        /*
            Save Comment
        */
        $comment                =   new Comment;
        $comment->user_id       =   Auth::user()->id;
        $comment->video_id      =   $request->video_id;
        $comment->language_id   =   $lang_id;
        $comment->parent_id     =   $request->parent_id;
        $comment->comments      =   $request->comment;
        $comment->status        =   0;
        $comment->created_at    =   $current_time;
        $comment->save();

        /*
            Get Comment Listing on Ajax after Saving Data;
        */

        $msg = $this->getAjaxCommentListing( $request->video_id, $lang_id, 'saveComment' );

        return response()->json($msg);
 
    }

    private function getAjaxCommentListing( $video_id, $lang_id, $type ) {

        $comments = Comment::where( 'video_id', $video_id )
                             ->where( 'language_id', $lang_id )
                             ->where( 'parent_id', 0 )
                             ->where( 'status', 1)
                             ->orderBy( 'id', 'DESC' )
                             ->get();

        $limitCharacters = env('total_characters');
        $charactersRemaining = Lang::get( 'messages.characters_remaining' );

        $tree='<ul class="col user-comment-nested-box">';
            foreach ($comments as $comment) {
                $tree .= $this->commentLi( $comment, $limitCharacters, $charactersRemaining );
                if(count($comment->child_comments)) {
                    $tree .= $this->childView($comment, $limitCharacters, $charactersRemaining);
                }
            }
        $tree .='<ul>';

        $msg = array(
            'status'    => 'success', 
            'count'     => count($comments),
            'comments'  => $tree,
            'type'      => $type,
            'message'   => Lang::get( 'messages.page_added', ['page' => "Comment"] ).' '.
                           Lang::get( 'messages.admin_activate', ['page' => "Comment"] ),
        );

        return $msg;
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
 
    private function childView( $comment, $limitCharacters, $charactersRemaining ) {
        $html = '';
        foreach ($comment->child_comments as $arr) {

            if(count($arr->child_comments)) {
                $html.= $this->commentLi( $arr, $limitCharacters, $charactersRemaining );               
                $html.= $this->childView( $arr );
            }   else   {
                $html.= $this->commentLi( $arr, $limitCharacters, $charactersRemaining );
            }                
        }

        return $html;
    }

    private function commentLi( $comment, $limitCharacters, $charactersRemaining  ) {

        $enableComment  = "event.preventDefault();enableComment( 'replyCommentDiv_".$comment->id."' );";
        $replyCommentArea  ="replyCommentArea( '".$comment->id."' );";
        $onClickCancel     ="event.preventDefault();cancelComment( 'replyCommentDiv_".$comment->id."', 'replyComment_".$comment->id."', 'reply-count-label' );";
        $onClickReplySubmit= "event.preventDefault();replyCommentSubmit( '".$comment->id."', '".$comment->user_id."', '".$comment->video_id."' );";
        $tree = '';
        $tree .= '<li class="comment_id_'.$comment->id.' parent_id_'.$comment->parent_id.'">';
            $tree .= '<span class="user-initials float-left">'. ucfirst( substr( $comment->user->name, 0, 1) ).'</span>';
            $tree .= '<h6 class="user-comment-name">'.$comment->user->name.'</h6>';
            $tree .= '<p class="user-typed-comment">'.$comment->comments.'</p>';
            $tree .= '<button class="btn btn-primary btn-sm  comment-reply" onclick="'.$enableComment.'" ><i class="fas fa-reply"></i> Reply</button>';
            $tree .= '<div id="replyCommentDiv_'.$comment->id.'" style="display:none;">';
                $tree .= '<textarea class="col-10 inline-user-comment" onkeyup="'.$replyCommentArea.'" maxlength="'.$limitCharacters.'" id="replyComment_'.$comment->id.'" placeholder="Type your comment here...">';
                $tree .= '</textarea>';
                $tree .= '<div class="word-counter">';
                    $tree .= '<label id="reply-count-label_'.$comment->id.'">'.$limitCharacters.'</label> ';
                    $tree .= $charactersRemaining;
                $tree .= '</div>';
                $tree .= '<div class="float-right  comment-action-group">';
                    $tree .= '<input type="button" class="btn cancel-comment btn-secondary btn-sm " value="Cancel" onclick="'.$onClickCancel.'" />';
                    $tree .= '<input type="button" class="btn btn-secondary btn-sm" disabled value="Comment" onclick="'.$onClickReplySubmit.'" id="submitReplyComment_'.$comment->id.'"  />';
                $tree .= '</div>';
            $tree .= '</div>'; 
        $tree .= '</li>';

        return $tree;
    }
}
