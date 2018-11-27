<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use App\Models\Menu;
use App\Models\MenuItem;
use Illuminate\Support\Facades\Lang;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class MenuController extends Controller {

    protected function guard() {
	    return Auth::guard('admin');
	}

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
				Menu Listing
    		*/
    		$menu_listing = Menu::all();

    		/*
				Create View
    		*/
    		return view('backend.menu', ['menus' => $menu_listing]);
    	}
    }

    /**
     * Create Menu Form or page
     *
     * @param  \Menu  $menu
     * @return view()
     */
    public function create() { 

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        }
		return view('backend.form_menu');
    }

   /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {

    	$this->validate($request,[
	        'name' => 'required|regex:/^[\pL\s\-]+$/u|max:50|unique:menus',
        ]);

        $name = $request->get('name');

		$items = Menu::create([
            'name' => $name,
        ]);

		return redirect('/admin/menu')->with('success', Lang::get('messages.page_added', ['page' => 'Menu']));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit( $id ) {  

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        }

    	$verifyMenuID = Menu::where('id', $id)->first();
        if(isset($verifyMenuID) ){
            
            $name = Menu::find($id)->name;

	    	return view('backend.form_menu', ['id' => $id, 'name' => $name]);
            
        }else{
            return redirect('/admin/menu')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Menu']));
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
    		'name' => 'required|regex:/^[\pL\s\-]+$/u|max:50|unique:menus,name,'.$id,
        ]);

        $verifyMenuID = Menu::where('id', $id)->first();
        if(isset($verifyMenuID) ){
            
            $menu = Menu::find($id);

    		$menu->name = $request->get('name'); 

    		$menu->save();

    		return redirect('/admin/menu')->with('success', Lang::get('messages.page_updated', ['page' => 'Menu']));
            
        }else{
            return redirect('/admin/menu')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Menu']));
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function indexItem( $id ) {

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        }

    	$verifyMenuID = Menu::where('id', $id)->first();
        if(isset($verifyMenuID) ){
            
            $menu_items = MenuItem::where('menu_id', $id)->get();

    		return view('backend.menu_item', [ 'id' => $id, 'menu_items' => $menu_items]);	
            
        }else{
            return redirect('/admin/menu')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Menu Item']));
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createItem( $id ) {  

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        }

    	$verifyMenuID = Menu::where('id', $id)->first();
        if(isset($verifyMenuID) ){
            
            $menuItems = MenuItem::all();

    		return view('backend.form_menu_items', ['id' => $id, 'menuItems' => $menuItems]);
            
        }else{
            return redirect('/admin/menu')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Menu Item']));
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeItem(Request $request, $id ) {

    	$this->validate($request,[
	        'title'        => 'required|regex:/^[\pL\s\-]+$/u|max:50',
            'slug'         => 'required|max:50',
            'target'       => 'max:20',
	        'icon_class'   => 'max:20',
            'order'        => 'required|digits_between:1,4|unique:menu_items',
        ]);

        $menuItem = new MenuItem;

    	
    	$menuItem->menu_id 		= $id;
    	$menuItem->parent_id	= $request->get('parent_id');
    	$menuItem->title 		= $request->get('title');
    	$menuItem->slug 		= $request->get('slug');
    	$menuItem->target		= $request->get('target');
    	$menuItem->icon_class 	= $request->get('icon_class');
    	$menuItem->order 		= $request->get('order');

    	$menuItem->save();

    	return redirect("/admin/menu/item/$id/listing")->with('success', Lang::get('messages.page_added', ['page' => 'Menu Item']));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function editItem( $id, $item ) {

        if( !Auth::guard('admin')->check()) {
            return redirect()->intended(route('admin.login'));
        }

    	$verifyMenuItemID = MenuItem::where('id', $item)->where('menu_id', $id)->first();
        if(isset($verifyMenuItemID) ){
            
            $menu_item = MenuItem::where('id', $item)
    					->where('menu_id', $id)->first();

			$menuItems = MenuItem::all();

    		return view('backend.form_menu_items', ['id' => $id, 'menu_item' => $menu_item, 'menuItems' => $menuItems]);
            
        }else{
            return redirect('/admin/menu')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Menu Item']));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateItem(Request $request, $id, $item ) {

    	//die($id);

        $this->validate($request,[
    		'title' => 'required|regex:/^[\pL\s\-]+$/u|max:50,'.$item,
    		'order' => 'required|digits_between:1,4|unique:menu_items,order,'.$item,
    		'slug'  => 'required|max:50,'.$item,
        ]);

        $menuItem = MenuItem::find($item);
    	
    	$menuItem->menu_id 		= $id;
    	$menuItem->parent_id	= $request->get('parent_id');
    	$menuItem->title 		= $request->get('title');
    	$menuItem->slug 		= $request->get('slug');
    	$menuItem->target		= $request->get('target');
    	$menuItem->icon_class 	= $request->get('icon_class');
    	$menuItem->order 		= $request->get('order');

    	$menuItem->save();

    	return redirect("/admin/menu/item/$id/listing")->with('success', Lang::get('messages.page_updated', ['page' => 'Menu Item']));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy( $id ) {

    	$verifyMenuID = Menu::where('id', $id)->first();
        if(isset($verifyMenuID) ){
            
            Menu::destroy($id);

    		return redirect('/admin/menu')->with('success', Lang::get('messages.page_delete', ['page' => 'Menu']));
            
        }else{
            return redirect('/admin/menu')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Menu']));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroyItem( $id, $item ) {

    	$verifyMenuItemID = MenuItem::where('id', $item)->where('menu_id', $id)->first();
        if(isset($verifyMenuItemID) ){
            
            MenuItem::destroy($item);

    		return redirect("/admin/menu/item/$id/listing")->with('success', Lang::get('messages.page_delete', ['page' => 'Menu Item']));
            
        }else{
            return redirect('/admin/menu')->with('warning', Lang::get('messages.page_id_not_exists', ['page' => 'Menu Item']));
        }
    }

    /**
     * Prepare a date for array / JSON serialization.
     *
     * @param  \DateTime  $date
     * @return string
     */
    public function getFormatedDate( $value ) {
        $date = Carbon::parse($value)->format('M D Y');
        return $date;
    }
}
