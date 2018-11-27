@extends('backend.layouts.form_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        @if(isset($menu_item->id))
          <i class="fa fa-edit"></i>
          {{ __( 'messages.edit' ) }}  
        @else
          <i class="fa fa-plus"></i>
          {{ __( 'messages.add' ) }}
        @endif
          {{ __( 'messages.menu' ) }}
        <small>Item</small>
        <button type="button" class="btn btn-success btn-add-new" onclick="window.location='{{ url("admin/menu/") }}'">
          <i class="fa fa-arrow-circle-left"></i>
          {{ __( 'messages.back' ) }}
        </button>
      </h1>
      <ol class="breadcrumb">
        <li>
          <a href="{{ route('admin.dashboard') }}">
            <i class="fa fa-dashboard"></i> 
            {{ __( 'messages.dashboard' ) }}
          </a>
        </li>
        <li>
          <a href="{{ route('admin.menu') }}">
            {{ __( 'messages.menu' ) }}
          </a>
        </li>
        <li>
          <a href="{{ url("admin/menu/item/$id/listing") }}">
            {{ __( 'messages.menu_item' ) }}
          </a>
        </li>
        <li class="active">
          @if(isset($menu_item->id))
            {{ __( 'messages.edit' ) }}  
          @else
            {{ __( 'messages.add' ) }}
          @endif
          {{ __( 'messages.menu_item' ) }}
        </li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content" style="margin: 0 auto; width:80%;">
      <div class="row">
        <!-- left column -->
        <div class="col-md-9 col-md-offset-1">
          <!-- general form elements -->
          @include('backend.elements.messages')
          <div class="box box-primary">
            <form class="form" role="form" method="POST" @if(isset($menu_item->id)) action="{{ url("admin/menu/item/$id/$menu_item->id/edit") }}" @else action="{{ url("admin/menu/item/$id/create") }}" @endif>
              {{ csrf_field() }}

              @if( isset($menu_item->id))
                <input type="hidden" name="id" value="{{ $menu_item->id }}" />
              @endif
              <input type="hidden" name="menu_id" value="{{ $id }}" />
              <div class="box-body">
                <div class="form-group{{ $errors->has('title') ? ' has-error' : '' }}">
                  <label for="title">{{ __( 'messages.title' ) }}</label>
                  <input type="text" class="form-control" id="title" name="title" placeholder="{{ __( 'messages.enter_title' ) }}" @if( isset($menu_item->id)) value="{{ $menu_item->title }}" @else value="{{ old('title') }}" @endif maxlength="50" required autocomplete="off" />
                  @if ($errors->has('title'))
                    <span class="help-block">
                        <strong>{{ $errors->first('title') }}</strong>
                    </span>
                  @endif
                </div>

                <div class="form-group{{ $errors->has('slug') ? ' has-error' : '' }}">
                  <label for="slug">{{ __( 'messages.slug' ) }}</label>
                  <input type="text" class="form-control" id="slug" name="slug" placeholder="{{ __( 'messages.enter_slug' ) }}" @if( isset($menu_item->id)) value="{{ $menu_item->slug }}" @else value="{{ old('slug') }}" @endif maxlength="50" required autocomplete="off" />
                  @if ($errors->has('slug'))
                    <span class="help-block">
                        <strong>{{ $errors->first('slug') }}</strong>
                    </span>
                  @endif
                </div>

                <div class="form-group{{ $errors->has('parent_id') ? ' has-error' : '' }}">
                  <label>{{ __( 'messages.parent_menu' ) }}</label>
                  <select class="form-control select2" style="width: 100%;" name="parent_id">
                    @if(isset($menu_item->id))
                      <option value="0" @if($menu_item->parent_id == 0) selected="selected" @endif>
                        {{ __( 'messages.root_menu' ) }}
                      </option>
                    @else
                      <option value="0">{{ __( 'messages.root_menu' ) }}</option>
                    @endif
                    @foreach($menuItems as $menu)
                      @if(isset($menu_item->id))
                        <option value="{{ $menu->id }}" @if($menu_item->parent_id == $menu->id) selected="selected" @endif>
                          {{ $menu->title }}
                        </option>
                      @else
                        <option value="{{ $menu->id }}">
                          {{ $menu->title }}
                        </option>
                      @endif;
                    @endforeach
                  </select>
                  @if ($errors->has('parent_id'))
                    <span class="help-block">
                        <strong>{{ $errors->first('parent_id') }}</strong>
                    </span>
                  @endif
                </div>

                <div class="form-group{{ $errors->has('target') ? ' has-error' : '' }}">
                  <label for="target">{{ __( 'messages.target' ) }}</label>
                  <input type="text" class="form-control" id="target" name="target" placeholder="{{ __( 'messages.enter_target' ) }}" @if(isset($menu_item->id)) value="{{ $menu_item->target }}" @else value="{{ old('target') }}" @endif maxlength="20" autocomplete="off">
                  <small>for eg: "_blank", "_self", "_parent", "_tab", "_top"</small>
                  @if ($errors->has('target'))
                    <span class="help-block">
                        <strong>{{ $errors->first('target') }}</strong>
                    </span>
                  @endif
                </div>

                <div class="form-group{{ $errors->has('icon_class') ? ' has-error' : '' }}">
                  <label for="icon_class">{{ __( 'messages.icon_class' ) }}</label>
                  <input type="text" class="form-control" id="icon_class" name="icon_class" placeholder="{{ __( 'messages.enter_icon' ) }}" @if(isset($menu_item->id)) value="{{ $menu_item->icon_class }}" @else value="{{ old('icon_class') }}" @endif maxlength="20" autocomplete="off" />
                </div>

                <div class="form-group{{ $errors->has('order') ? ' has-error' : '' }}">
                  <label for="order">{{ __( 'messages.order' ) }}</label>
                  <input type="text" class="form-control" id="order" name="order" placeholder="{{ __( 'messages.enter_order' ) }}" @if(isset($menu_item->id)) value="{{ $menu_item->order}}" @else value="{{ old('order') }}" @endif maxlength="4" required autocomplete="off" />
                  @if ($errors->has('order'))
                    <span class="help-block">
                        <strong>{{ $errors->first('order') }}</strong>
                    </span>
                  @endif
                </div>

              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">{{ __( 'messages.submit' ) }}</button>
              </div>
            </form>
          </div> 
        </div>
      </div>
    </section>
  </div>
@endsection