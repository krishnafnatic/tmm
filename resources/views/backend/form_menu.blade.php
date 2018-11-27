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
        <small>{{ __( 'messages.menu' ) }}</small>
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
        <li class="active">
          @if(isset($id))
            {{ __( 'messages.edit' ) }}
          @else
            {{ __( 'messages.add' ) }}
          @endif
          {{ __( 'messages.menu' ) }}
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
            <form class="form" role="form" method="POST" @if(isset($id)) action="{{ url("admin/menu/$id/edit") }}" @else action="{{ route('admin.menu.create.submit') }}" @endif>
              {{ csrf_field() }}
              <div class="box-body">
                <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                  <label for="name">{{ __( 'messages.name' ) }}</label>
                  <input type="text" class="form-control" id="name" name="name" placeholder="{{ __( 'messages.enter_name' ) }}" @if(isset($id)) value="{{ $name }}" @else value="{{ old('name') }}" @endif maxlength="50" required autofocus autocomplete="off" />
                  @if ($errors->has('name'))
                    <span class="help-block">
                        <strong>{{ $errors->first('name') }}</strong>
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