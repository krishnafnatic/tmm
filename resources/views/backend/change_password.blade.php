@extends('backend.layouts.form_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
          <i class="fa fa-lock"></i>
          {{ __( 'messages.change' ) }}
        <small>{{ __( 'messages.password' ) }}</small>
        <button type="button" class="btn btn-success btn-add-new" onclick="window.location='{{ url("admin/dashboard") }}'">
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
        <li class="active">
          {{ __( 'messages.change_password' ) }}
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
            <form class="form" role="form" method="POST" action="{{ route('admin.changepassword.submit') }}">
              {{ csrf_field() }}
              <div class="box-body">
                <div class="form-group{{ $errors->has('current-password') ? ' was-validated' : '' }}">
                  <label class="col-12 pl-0" for="current-password">
                      {{ __( 'messages.current_password' ) }}
                  </label>
                  <input id="current-password" type="password" name="current-password" class="col-12 form-control" value="{{ old( 'current-password' )}}" autocomplete="off" required autofocus />
                  @if ($errors->has('current-password'))
                      <span class="text-danger">
                          <strong>{{ $errors->first('current-password') }}</strong>
                      </span>
                  @endif
                </div>  

                <div class="form-group{{ $errors->has('new-password') ? ' was-validated' : '' }}">
                  <label class="col-12 pl-0" for="new-password">
                      {{ __( 'messages.new_password' ) }}
                  </label>
                  <input id="new-password" type="password" name="new-password" class="col-12 form-control is-invalid" value="{{ old( 'new-password' )}}" autocomplete="off" required />
                  @if ($errors->has('new-password'))
                      <span class="text-danger">
                          <strong>{{ $errors->first('new-password') }}</strong>
                      </span>
                  @endif
                </div> 

                <div class="form-group">
                    <label class="col-12 pl-0" for="new-password-confirm">
                        {{ __( 'messages.confirm_new_password' ) }}
                    </label>
                    <input id="new-password-confirm" type="password" name="new-password_confirmation" class="col-12 form-control" value="{{ old( 'new-password_confirmation' )}}" autocomplete="off" required />
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