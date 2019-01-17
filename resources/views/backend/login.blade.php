@extends('backend.layouts.login_master')

@section('content')
  <div class="login-box">
    <div class="login-logo">
      <a href="{{ url('/') }}" target="_tab">
        {{ __( 'messages.administrator' ) }}
        {{ config('app.name') }}
      </a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
      <p class="login-box-msg">{{ __( 'messages.sign_in_as' ) }}</p>

      @if (session('status'))
          <div class="alert alert-success">
              {{ session('status') }}
          </div>
      @endif
      @if (session('warning'))
          <div class="alert alert-warning">
              {{ session('warning') }}
          </div>
      @endif

      <form class="form-horizontal" role="form" method="POST" action="{{ route('admin.login.submit') }}" autocomplete="off">
        {{ csrf_field() }}
        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }} has-feedback">
          <input type="email" class="form-control" placeholder="{{ __( 'messages.email' ) }}" id="email" name="email" autocomplete="false" required autofocus />
          <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          @if ($errors->has('email'))
            <span class="help-block">
                <strong>{{ $errors->first('email') }}</strong>
            </span>
          @endif
        </div>
        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }} has-feedback">
          <input type="password" class="form-control" placeholder="{{ __( 'messages.password' ) }}" name="password" required autocomplete="off" />
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
           @if ($errors->has('password'))
              <span class="help-block">
                  <strong>{{ $errors->first('password') }}</strong>
              </span>
          @endif
        </div>
        <div class="form-group{{ $errors->has('g-recaptcha-response') ? ' has-error' : '' }} has-feedback">
          {!! app('captcha')->display() !!}
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
           @if ($errors->has('g-recaptcha-response'))
              <span class="help-block">
                  <strong>{{ $errors->first('g-recaptcha-response') }}</strong>
              </span>
          @endif
        </div>
        <div class="row">
          <!-- /.col -->
          <div class="col-xs-4">
            <button type="submit" class="btn btn-primary btn-block btn-flat">{{ __( 'messages.sign_in' ) }}</button>
          </div>
          <!-- /.col -->
        </div>
      </form>
    </div>
    <!-- /.login-box-body -->
  </div>
<!-- /.login-box -->
@endsection