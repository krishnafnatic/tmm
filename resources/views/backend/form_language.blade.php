@extends('backend.layouts.form_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        @if(isset($id))
          <i class="fa fa-edit"></i>
          {{ __( 'messages.edit' ) }}
        @else
          <i class="fa fa-plus"></i>
          {{ __( 'messages.add' ) }}
        @endif
        <small>{{ __( 'messages.language' ) }}</small>
        <button type="button" class="btn btn-success btn-add-new" onclick="window.location='{{ url("admin/language") }}'">
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
          <a href="{{ route('admin.language') }}">
            {{ __( 'messages.language' ) }}
          </a>
        </li>
        <li class="active">
          @if(isset($id))
            {{ __( 'messages.edit' ) }}
          @else
            {{ __( 'messages.add' ) }}
          @endif
          {{ __( 'messages.language' ) }}
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
            <form class="form" role="form" method="POST" @if(isset($id)) action="{{ url("admin/language/$id/edit") }}" @else action="{{ route('admin.language.create.submit') }}" @endif />
              {{ csrf_field() }}
              <div class="box-body">
                <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                  <label for="name">{{ __( 'messages.name' ) }}</label>
                  <input type="text" class="form-control" id="name" name="name" placeholder="{{ __( 'messages.enter_name' ) }}" @if(isset($id)) value="{{ $lang->name }}" @else value="{{ old('name') }}" @endif maxlength="25" required autofocus autocomplete="off" />
                  @if ($errors->has('name'))
                    <span class="help-block">
                        <strong>{{ $errors->first('name') }}</strong>
                    </span>
                  @endif
                </div> 

                <div class="form-group{{ $errors->has('code') ? ' has-error' : '' }}">
                  <label for="code">{{ __( 'messages.code' ) }}</label>
                  <input type="text" class="form-control" id="code" name="code" placeholder="{{ __( 'messages.enter_code' ) }}" @if(isset($id)) value="{{ $lang->code }}" @else value="{{ old('code') }}" @endif maxlength="5" required autocomplete="off"  />
                  @if ($errors->has('code'))
                    <span class="help-block">
                        <strong>{{ $errors->first('code') }}</strong>
                    </span>
                  @endif
                </div> 

                <div class="form-group{{ $errors->has('locale') ? ' has-error' : '' }}">
                  <label for="locale">{{ __( 'messages.locale' ) }}</label>
                  <input type="text" class="form-control" id="locale" name="locale" placeholder="{{ __( 'messages.enter_locale' ) }}" @if(isset($id)) value="{{ $lang->locale }}" @else value="{{ old('locale') }}" @endif maxlength="5" required autocomplete="off" />
                  @if ($errors->has('locale'))
                    <span class="help-block">
                        <strong>{{ $errors->first('locale') }}</strong>
                    </span>
                  @endif
                </div> 

                <div class="form-group{{ $errors->has('image') ? ' has-error' : '' }}">
                  <label for="image">{{ __( 'messages.image' ) }}</label>
                  <input type="text" class="form-control" id="image" name="image" placeholder="{{ __( 'messages.enter_image' ) }}" @if(isset($id)) value="{{ $lang->image }}" @else value="{{ old('image') }}" @endif maxlength="20"  autocomplete="off" />
                  @if ($errors->has('image'))
                    <span class="help-block">
                        <strong>{{ $errors->first('image') }}</strong>
                    </span>
                  @endif
                </div> 

                <div class="form-group{{ $errors->has('order') ? ' has-error' : '' }}">
                  <label for="order">{{ __( 'messages.order' ) }}</label>
                  <input type="text" class="form-control" id="order" name="order" placeholder="{{ __( 'messages.enter_order' ) }}" @if(isset($id)) value="{{ $lang->order }}" @else value="{{ old('order') }}" @endif maxlength="4" required autocomplete="off" />
                  @if ($errors->has('order'))
                    <span class="help-block">
                        <strong>{{ $errors->first('order') }}</strong>
                    </span>
                  @endif
                </div> 

                <div class="form-group{{ $errors->has('status') ? ' has-error' : '' }}">
                  <label for="order">Status</label>
                  <select name="status" id="status" class="form-control">
                    <option value="1" @if(isset($lang->status) && $lang->status == 1) selected="selected" @endif>{{ __( 'messages.active' ) }}</option>
                    <option value="0" @if(isset($lang->status) && $lang->status == 0) selected="selected" @endif>{{ __( 'messages.inactive' ) }}</option>
                  </select>
                  @if ($errors->has('status'))
                    <span class="help-block">
                        <strong>{{ $errors->first('status') }}</strong>
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