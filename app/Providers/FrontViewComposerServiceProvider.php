<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Repositories\ViewComposerRepository as Vcomposer;

class FrontViewComposerServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->headerVariable();
        $this->footerVariable();
        $this->bannerVariable();
    }

    /**
     * [headerVariable description]
     * @return [type] [description]
     */
    public function headerVariable()
    {
        view()->composer(['frontend.elements.header'], function($view) {
            $view->with('menu_header',  Vcomposer::header_menu());
            $view->with('menu_profile', Vcomposer::profile_menu());
        });
    }

    /**
     * [footerVariable description]
     * @return [type] [description]
     */
    public function footerVariable()
    {
        view()->composer('frontend.elements.footer', function($view) {
            $view->with('menu_footer',  Vcomposer::footer_menu());
            $view->with('menu_cms_footer', Vcomposer::bottom_footer_menu());
        });
    }

    /**
     * [bannerVariable description]
     * @return [type] [description]
     */
    public function bannerVariable()
    {
        view()->composer('frontend.home_template.banner_video', function($view) {
            $view->with('banner',  Vcomposer::home_banner_video());
        });
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
