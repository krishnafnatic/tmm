@extends('backend.layouts.form_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-bars"></i>
        {{ __( 'messages.add' ) }} 
        <small>{{ __( 'messages.menu' ) }} </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="{{ route('admin.dashboard') }}"><i class="fa fa-dashboard"></i> {{ __( 'messages.dashboard' ) }} </a></li>
        <li><a href="{{ route('admin.menu') }}">{{ __( 'messages.menu' ) }} </a></li>
        <li class="active">{{ __( 'messages.add' ) }} </li>
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
            <form class="form" role="form" method="POST" action="{{ route('admin.menu.create.submit') }}">
              {{ csrf_field() }}
              <div class="box-body">
                <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                  <label for="name">Name</label>
                  <input type="text" class="form-control" id="name" name="name" placeholder="Enter Menu Name" required autofocus>
                  @if ($errors->has('name'))
                    <span class="help-block">
                        <strong>{{ $errors->first('name') }}</strong>
                    </span>
                  @endif
                </div> 
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
          </div> 
        </div>
      </div>
    </section>
  </div>
@endsection