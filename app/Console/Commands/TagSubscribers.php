<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Video;
use App\Models\User;
use App\Models\Tag;
use App\Models\VideoMeta;
use \Carbon\Carbon;
use DB;
use App\Mail\SubscriberTags;
use Illuminate\Support\Facades\Mail;

use App\Repositories\User\UserInterface as UserInterface;

class TagSubscribers extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'tag:subscribers';
    protected $user;

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'When new vidoe uploads, user get mail of the video listing based on tags';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct( UserInterface $user )
    {
        parent::__construct();
        $this->user = $user;
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle() {

        $all_tags = '';

        /*
            List of registered users;
        */
        $allUser = User::where( 'role_id', 2 )->where( 'state', 2 )->get();

        if( isset( $allUser ) && count( $allUser ) ) { 
            foreach( $allUser as $user ) {
                $user_email = $user['email'];

                /*
                    Get User Tags:

                */
                $all_tags = $this->getUserTags( $user );
                
                /*
                    Get User Meta; meta_key is age;

                */
                $user_v_notify =$this->user->getUserMeta( $user['id'], 'v_notify' );

                /*
                    Check if user has notified for video  notification
                */
                if( !empty( $user_v_notify ) && $user_v_notify != 'off' ) {


                    if( isset( $all_tags ) && !empty( $all_tags ) ) {
    
                        /*
                            Get all Videos using user tags
                        */
                        $video_query = getVideos( 'tag', $all_tags );
    
                        if( isset( $video_query ) && count( $video_query ) > 0  ) {
    
                            /*
                                Get Video Array;
                            */
                            $videos = $this->mailVideoArray( $video_query );
    
                            /*
                                Send mail to users;
                            */
    
                            if( isset( $videos ) && count( $videos ) > 0  ) {
                                Mail::to( $user_email )->send(new SubscriberTags( $videos ));
                            }
                        }
                    }
                }
            } 
        }
    } 

    private function getUserTags( $user ) {

        $allTags = '';

        /*
            @Get User Tags using user_id;
        */
        $user_tag = explode(',', unserialize( $this->user->getUserMeta( $user['id'], 'tag' ) ) ) ?? '';

        if( array_keys( $user_tag, '' ) ) {
            return $allTags;
        }

        $j=1;
        $userTags = Tag::whereIn( 'id', $user_tag )->select( 'tag' )->get();
        $totaltags=count($userTags);

        if( isset( $userTags ) && $totaltags > 0 ) {
            foreach($userTags as $tag) { 

                if($j == $totaltags) {
                    $allTags .= $tag['tag'];
                } else {
                    $allTags .= $tag['tag'].',';
                }  

                $j++;
            }
        }

        return $allTags;
    }

    private function mailVideoArray( $videos ) {

        $videos_array = array();
        foreach( $videos as $video ) {
            if( !empty( $video['id'] ) ) {

                /*
                    get all video that are uploaded today
                */
                $banner_query       = Video::where('id', $video['id'] )->whereDate('created_at', Carbon::today())->first();
                if( isset( $banner_query) &&  !empty( $banner_query )) {

                    $images             = $banner_query->video_meta->where( 'meta_key', 'images' )->first();
                    $description        = $banner_query->video_meta->where( 'meta_key', 'description' )->first();
                    $videos_array[] = array(
                        'video_id'       =>  $video['id'],
                        'name'           =>  substr( $banner_query['name'], 0, env('char_limit') ).' ...',
                        'slug'           =>  $banner_query['slug'],
                        'description'    =>  $description['meta_value'],
                        'images'         =>  unserialize( $images['meta_value'] ),
                    );
                }
            } 
        }

        return $videos_array;
    }
}
