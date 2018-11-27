<?php

namespace App\Repositories;
use DB;
use Auth;
use App\Models\Menu;
use App\Models\Video;

class ViewComposerRepository {
    

    /**
     * [header_menu description]
     * @return [type] [description]
     */
    public static function header_menu() {

        $header_query = Menu::where( 'id', '=', 23 )->first();
        $header_menu = $header_query->menu_item->where( 'parent_id', 0 );

        return $header_menu;
    }

     /**
     * [profile_menu description]
     * @return [type] [description]
     */
    public static function profile_menu() {

        $profile_query = Menu::where( 'id', '=', 24 )->first();
        $profile_menu = $profile_query->menu_item;

        return $profile_menu;
    }

     /**
     * [footer_menu description]
     * @return [type] [description]
     */
    public static function footer_menu() {

        $footer_query = Menu::where( 'id', '=', 25 )->first();
        $footer_menu = $footer_query->menu_item;

        return $footer_menu;
    }

     /**
     * [bottom_footer_menu description]
     * @return [type] [description]
     */
    public static function bottom_footer_menu() {

        $bottom_query = Menu::where( 'id', '=', 26 )->first();
        $bottom_footer_menu = $bottom_query->menu_item;

        return $bottom_footer_menu;
    }

    /**
     * [home_banner_video]
     * @return [type] [description]
     */
    public static function home_banner_video() {

        $bannerArray = array();

        $banner_query = Video::orderBy('updated_at', 'desc')->first();
        $account_id = $banner_query->video_meta->where( 'meta_key', 'account_id' )->first();
        $name       = $banner_query->video_meta->where( 'meta_key', 'name' )->first();
        $description = $banner_query->video_meta->where( 'meta_key', 'description' )->first();
        $images     = $banner_query->video_meta->where( 'meta_key', 'images' )->first();

        if( isset( $banner_query->id ) && !empty( $banner_query->id ) ) {
            $bannerArray = array(
                'video_id'      =>  $banner_query->id,
                'account_id'    =>  $account_id['meta_value'],
                'name'          =>  $name['meta_value'],
                'slug'          =>  $banner_query->slug,
                'description'   =>  $description['meta_value'],
                'images'        =>  unserialize( $images['meta_value'] )
            );
        }

        return $bannerArray;
    }
}