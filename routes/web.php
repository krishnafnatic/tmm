<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
/*
    The Money Mile Website Frontend Controllers
*/
//Route::group(['middleware' => 'web' ], function () {

    /*
        Error Handling
    */
    Route::get('404', ['as' => '404', 'uses' => 'Frontend\ErrorController@notfound']);
    Route::get('500', ['as' => '500', 'uses' => 'Frontend\ErrorController@fatal']);
    Route::get('/cms/{slug}', 'Frontend\CmsController@show');

    /*
        Home page Controller
    */
    Route::get('/', 'Frontend\HomeController@show')->name('public');

    /*
        Video Details Page 
    */
    Route::get('/video/{slug}', 'Frontend\VideoDetailController@show');

    /*
        Video Details Page for popular videos
    */
    Route::get('/popular/{slug}', 'Frontend\VideoDetailController@popularWatchNext');

    /*
        Video Details Page for trending videos
    */
    Route::get('/trending/{slug}', 'Frontend\VideoDetailController@trendingWatchNext');

    /*
        Video Details Page for playlist videos
    */
    Route::get('/playlist/{playlist_slug}/{video_slug}', 'Frontend\VideoDetailController@playlistWatchNext');

    /*
        Video Details Page for playlist videos
    */
    Route::get('/tag/{video_slug}', 'Frontend\VideoDetailController@tagWatchNext');

     /*
        Video Details Page for category / folder videos
    */
    Route::get('/category/{category_name}/{video_slug}', 'Frontend\VideoDetailController@folderWatchNext');

    /*
        Get Video Like Using Ajax;
    */
    Route::post('/bc/analytics', 'Frontend\VideoDetailController@getVideoViews');

    /*
    *   Frontend Search Route; 
    */
    Route::get('/search', 'Frontend\SearchController@index')->name('search');
    Route::post('/search', 'Frontend\SearchController@show')->name( 'search' );

    /*
        Frontend Login Route;
    */
    Route::get('/login', 'Auth\LoginController@index')->name('login');
    Route::post('/login', 'Auth\LoginController@login');

    /*
        Frontend Register Route;
    */
    Route::get('/register', 'Auth\RegisterController@index')->name('register');
    Route::post('/register', 'Auth\RegisterController@register');
    Route::get('/verify', 'Auth\RegisterController@registerVerify');

    /*
        Frontend Logout Route;
    */
    Route::post('logout', 'Auth\LoginController@logout')->name('logout')->middleware( 'web' );

    /*
        Frontend Password Reset Routes;
    */
    Route::get('password/reset', 'Auth\ForgotPasswordController@index')->name('password.request');
    Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
    Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');
    Route::post('password/reset', 'Auth\ResetPasswordController@reset');

    /*
    *	User Account URL 
    */
    Route::get('/profile-settings', 'Auth\AccountController@index')->name('profile-settings');
    Route::post('/profile-settings', 'Auth\AccountController@avatar');
    /*
        User Account Save profile
    */
    Route::post('update-profile', 'Auth\AccountController@updateUserProfile')->name( 'update.profile' );

    /*
        User Account Change Password
    */
    Route::get('/change-password', 'Auth\AccountController@showPasswordForm')->name( 'change-password' );
    Route::post('/change-password','Auth\AccountController@updatePassword')->name('change-password');

    /*
        User Profile
    */
    Route::get('/profile', 'Auth\AccountController@showProfileForm')->name( 'profile' );;
    Route::post('/profile','Auth\AccountController@updateProfile')->name('profile');

    /*
        User Notification
    */
    Route::get('/user-notification', 'Auth\AccountController@showNotificationForm');
    Route::post('/user-notification','Auth\AccountController@updateNotification')->name('user-notification');

    /*
        User Deactivate Account
    */
    Route::get('/profile-deactivate', 'Auth\AccountController@showManageProfileDeactivateForm');
    Route::post('/profile-deactivate','Auth\AccountController@manageProfileDeactivate')->name('profile-deactivate');

    /*
    * Social Linking
    */
    Route::get('facebook', function () {
        return view('facebookAuth');
    });
    Route::get('auth/facebook', 'Auth\RegisterController@redirectToFacebook')->name('auth.facebook');
    Route::get('auth/facebook/callback', 'Auth\RegisterController@handleFacebookCallback');

    /*
    * LinkedIn Login Route
    */
    Route::get('linkedin', function () {
        return view('linkedinAuth');
    });
    Route::get('auth/linkedin', 'Auth\RegisterController@redirectToLinkedin')->name('auth.linkedin');
    Route::get('auth/linkedin/callback', 'Auth\RegisterController@handleLinkedinCallback');

    /*
    * Google Login Route
    */
    Route::get('google', function () {
        return view('googleAuth');
    });
    Route::get('auth/google', 'Auth\RegisterController@redirectToGoogle')->name('auth.google');
    Route::get('auth/google/callback', 'Auth\RegisterController@handleGoogleCallback');

    /*
    	Verify user email
    */
    Route::get('/user/verify/{token}', 'Auth\RegisterController@verifyUser');

    /*
        Login Ajax
    */
    Route::post('/loginAjax', 'Auth\LoginController@loginAjax')->name('loginAjax');

    /*
        List Comment Ajax
    */
    Route::post('/commentList', 'Frontend\CommentController@index')->name('commentList');
    /*
        Store Comment Ajax
    */
    Route::post('/comment', 'Frontend\CommentController@store')->name('comment');

    /*
        video wish list
    */
    Route::post('/wishList', 'Frontend\WishlistController@store')->name('wishList');
    Route::get('/mylist', 'Frontend\WishlistController@show')->name('wishlist');
    Route::post('/checkIsWhishList', 'Frontend\WishlistController@checkIsWhishList');

    /*
        video wish list
    */
    Route::post('/subscribe', 'Frontend\HomeController@subscribeNewsletter')->name('subscribe');
    Route::get('/unsubscribe/{slug}', 'Frontend\HomeController@unSubscribeNewsletter')->name('subscribe');

    /*
        Contact page
    */
    Route::get('/contact', 'Frontend\ContactController@index')->name( 'contact' );
    Route::get('/contact_us', 'Frontend\ContactController@store')->name( 'contact_us' );

    /*
        CMS page
    */
    Route::get('/about', 'Frontend\CmsController@index')->name( 'about' );

    /*
        Speaker page
    */
    Route::get('/speaker/{slug}', 'Frontend\SpeakerController@show');

    /*
        Home Page Popular Videos
    */
    //Route::get('/popular', 'Frontend\HomeController@getPopularVideos');

//});
/*
	Admin Auth
*/
Route::group(['prefix' => 'admin', /*'middleware' => 'super_admin'*/ ], function () {
    Route::get('/login', 'Backend\LoginController@index')->name('admin.login');
    Route::post('/login', 'Backend\LoginController@login')->name('admin.login.submit');
    Route::post('/admin/logout', 'Backend\LoginController@logout')->name('admin.logout');

    /*
        Show Menu page
    */
    Route::get('/dashboard', 'Backend\DashboardController@index')->name('admin.dashboard');

    /*
        Show Menu page
    */
    Route::get('/menu', 'Backend\MenuController@index')->name('admin.menu');

    /*
		Menu Add
    */
    Route::get('/menu/create', 'Backend\MenuController@create')->name('admin.menu.create');
    Route::post('/menu/create', 'Backend\MenuController@store')->name('admin.menu.create.submit');

    /*
		Menu Edit
    */ 
    Route::get('/menu/{id}/edit', 'Backend\MenuController@edit')->name('admin.menu.id.edit');
    Route::post('/menu/{id}/edit', 'Backend\MenuController@update')->name('admin.menu.id.edit.submit');

    /*
		Menu destroy
    */ 
	Route::get('/menu/{id}/delete', 'Backend\MenuController@destroy')->name('admin.menu.id.delete');

	/*
		Menu Builder Listing ( Menu Items )
    */
    Route::get('/menu/item/{id}/listing', 'Backend\MenuController@indexItem')->name('admin.menu.item.id.listing');

	/*
		Menu Builder Create ( Menu Items )
    */
    Route::get('/menu/item/{id}/create', 'Backend\MenuController@createItem')->name('admin.menu.item.id.create');
    Route::post('/menu/item/{id}/create', 'Backend\MenuController@storeItem')->name('admin.menu.item.id.create.submit');

    /*
		Menu Builder Edit ( Menu Items )
    */
    Route::get('/menu/item/{id}/{item}/edit', 'Backend\MenuController@editItem')->name('admin.menu.item.id.item.edit');
    Route::post('/menu/item/{id}/{item}/edit', 'Backend\MenuController@updateItem')->name('admin.menu.item.id.item.edit.submit');

    /*
		Menu Item destroy
    */ 
	Route::get('/menu/item/{id}/{item}/delete', 'Backend\MenuController@destroyItem')->name('admin.menu.item.id.item.delete');

	/*
		Information Listing
    */ 
	Route::get('/information', 'Backend\InformationController@index')->name('admin.information');

	/*
		Information Create
    */
    Route::get('/information/create', 'Backend\InformationController@create')->name('admin.information.create');
    Route::post('/information/create', 'Backend\InformationController@store')->name('admin.information.create.submit');

    /*
        Information Edit / Update
    */ 
    Route::get('/information/{id}/edit', 'Backend\InformationController@edit')->name('admin.information.id.edit');
    Route::post('/information/{id}/edit', 'Backend\InformationController@update')->name('admin.information.id.edit.submit');

    /*
        Information destroy
    */ 
    Route::get('/information/{id}/delete', 'Backend\InformationController@destroy')->name('admin.information.id.delete');

    /*
        Language Listing
    */
    Route::get('/language', 'Backend\LanguageController@index')->name('admin.language');

    /*
        Language Create / Store
    */
    Route::get('/language/create', 'Backend\LanguageController@create')->name('admin.language.create');
    Route::post('/language/create', 'Backend\LanguageController@store')->name('admin.language.create.submit');

    /*
        Language Edit / Update
    */ 
    Route::get('/language/{id}/edit', 'Backend\LanguageController@edit')->name('admin.language.id.edit');
    Route::post('/language/{id}/edit', 'Backend\LanguageController@update')->name('admin.language.id.edit.submit');

    /*
        Language destroy
    */ 
    Route::get('/language/{id}/delete', 'Backend\LanguageController@destroy')->name('admin.language.id.delete');

    /*
        User Listing
    */
    Route::get('/user', 'Backend\UserController@index')->name('admin.user');
    Route::get('/user/{id}/view', 'Backend\UserController@view')->name('admin.user.id.view');


    /*
		Add / Update Videos;
    */
	Route::get('/videoFromBC', 'Backend\Manual\BC\VideoController@manageVideoFromBC')->name('admin.videoFromBC');

	/*
		Add / Update Playlist;
    */
	Route::get('/playlist', 'Backend\Manual\BC\PlaylistController@managePlaylistFromBC')->name('admin.playlist');

	/*
		Add / Update Playlist;
    */
	Route::get('/tag', 'Backend\Manual\BC\TagController@manageTagFromBC')->name('admin.tag');

    /*
        Add / Update Player;
    */
    Route::get('/player', 'Backend\Manual\BC\PlayerController@managePlayerFromBC')->name('admin.player');

    /*
        Speaker Listing;
    */
    Route::get('/speaker', 'Backend\SpeakerController@index')->name( 'admin.speaker' );

    /*
        Speaker Create
    */
    Route::get('/speaker/create', 'Backend\SpeakerController@create')->name('admin.speaker.create');
    Route::post('/speaker/create', 'Backend\SpeakerController@store')->name('admin.speaker.create.submit');

    /*
        Speaker Edit / Update
    */ 
    Route::get('/speaker/{id}/edit', 'Backend\SpeakerController@edit')->name('admin.speaker.id.edit');
    Route::post('/speaker/{id}/edit', 'Backend\SpeakerController@update')->name('admin.speaker.id.edit.submit');

    /*
        Speaker destroy
    */ 
    Route::get('/speaker/{id}/delete', 'Backend\SpeakerController@destroy')->name('admin.speaker.id.delete');

    /*
        Admin Change Password
    */
    Route::get('/password/change', 'Backend\UserController@showPasswordForm')->name( 'admin.password.change' );
    Route::post('/changepassword','Backend\UserController@changePassowrd')->name('admin.changepassword.submit');

    /*
        Admin Setting
    */
    Route::get('/setting','Backend\SettingController@show')->name('admin.setting');
    Route::post('/setting','Backend\SettingController@store')->name('admin.setting.store.submit');

    /*
        Speaker Listing;
    */
    Route::get('/comment', 'Backend\CommentController@index')->name( 'admin.comment' );
    Route::get('/commentState','Backend\CommentController@store')->name( 'admin.commentState' );
    Route::get('/comment/{id}/view', 'Backend\CommentController@show')->name('admin.comment.id.view');

    /*
        Video Listing
    */
    Route::get('/video', 'Backend\VideoController@index')->name( 'admin.video' );
    
    Route::get('/video/{id}/manageSeoTag', 'Backend\VideoController@manageSeoTag')->name('admin.video.id.manageSeoTag');
    Route::post('/seoTagAdd', 'Backend\VideoController@storeSeoTags')->name('admin.seoTagAdd');
    Route::post('/seoTagEdit', 'Backend\VideoController@editSeoTags')->name('admin.seoTagEdit');


    /*
        Static Pages Listing
    */
    Route::get('/staticpages', 'Backend\StaticPageController@index')->name( 'admin.staticpages' );

    /*
        Add Static Pages
    */
    Route::get('/staticpages/create', 'Backend\StaticPageController@create')->name('admin.staticpages.create');
    Route::post('/staticpages/create', 'Backend\StaticPageController@store')->name('admin.staticpages.create.submit');

    /*
        Edit Static Pages
    */ 
    Route::get('/staticpages/{id}/edit', 'Backend\StaticPageController@edit')->name('admin.staticpages.id.edit');
    Route::post('/staticpages/{id}/edit', 'Backend\StaticPageController@update')->name('admin.staticpages.id.edit.submit');

    Route::post('upload', function(){ echo 'hello'; });
});
 
Route::get('/p', 'PostsController@create');

