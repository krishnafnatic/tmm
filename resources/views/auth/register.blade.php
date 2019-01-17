    @extends('frontend.layouts.master')

    @section('content')
        <div class="container signup-body">
            @include('frontend.elements.message')
            <div class="row justify-content-md-center">
                <div class="col-sm">
                    <div class="col-sm social-btn">
                        <a href="#" class="btn btn-primary col fb-login" onclick=" socialURL( '{{ route('auth.facebook') }}' )">
                            <i class="fab fa-facebook-square fa-2x"></i>
                            <div>{{ __( 'messages.login_with_fb' ) }}</div>
                        </a>
                        <a href="#" class="btn btn-primary col gmail-login" onclick=" socialURL( '{{ route('auth.google') }} ' )">
                            <i class="fab fa-google fa-2x"></i>
                            <div>{{ __( 'messages.login_with_gg' ) }}</div>
                        </a>
                        <a href="#" class="btn btn-primary col linkedin-login" onclick=" socialURL( '{{ route('auth.linkedin') }}' )">
                            <i class="fab fa-linkedin fa-2x"></i>
                            <div>{{ __( 'messages.login_with_li' ) }}</div>
                        </a>
                    </div>
                </div>
                <div class="col-sm hidden-sm hidden-md">
                    <div class="vl">
                        <span class="or"> {{ __( 'messages.or' ) }} </span>
                    </div>
                </div>
            
                <div class="col-sm signup-box">
                    <h3>{{ __( 'messages.sign_up' ) }}</h3>
                    <form class="form-horizontal" method="POST" action="{{ route('register') }}" autocomplete="off">
                        {{ csrf_field() }}
                        <div class="form-group {{ $errors->has('name') ? 'was-validated' : '' }}">
                            <label>{{ __( 'messages.name' ) }}</label>
                            <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus autocomplete="off" />

                            @if ($errors->has('name'))
                                <span class="invalid-feedback">
                                    {{ $errors->first('name') }}
                                </span>
                            @endif
                        </div>

                        <div class="form-group {{ $errors->has('email') ? '' : '' }}">
                            <label>{{ __( 'messages.email' ) }}</label>
                            <input id="email" type="email" class="form-control @if ($errors->has('email')) is-invalid  @endif" name="email" value="{{ old('email') }}" required autocomplete="off" />

                            @if ($errors->has('email'))
                                <span class="invalid-feedback" style="display: block !important;">
                                    {{ $errors->first('email') }}
                                </span>
                            @endif
                        </div>

                        <div class="form-group {{ $errors->has('password') ? '' : '' }}">
                            <label>{{ __( 'messages.password' ) }}</label>
                            <input id="password" type="password" class="form-control @if ($errors->has('password')) is-invalid  @endif" name="password" autocomplete="new-password" required  />
                            @if ($errors->has('password'))
                                <span class="invalid-feedback">
                                    {{ $errors->first('password') }}
                                </span>
                            @endif
                            <p id="passwordHelpBlock" class="form-text text-muted">
                                {{ __( 'messages.tooltip_pwd' ) }}
                            </p>
                        </div>

                        <div class="form-group {{ $errors->has('password') ? '' : '' }}">
                            <label>{{ __( 'messages.confirm_password' ) }}</label>
                            <input id="password-confirm" type="password" class="form-control @if ($errors->has('password')) is-invalid  @endif" autocomplete="new-password" name="password_confirmation" required>
                        </div>

                        <div class="form-group {{ $errors->has('g-recaptcha-response') ? '' : '' }}">
                            <label>{{ __( 'messages.captcha' ) }}</label>
                            {!! app('captcha')->display() !!}
                            @if ($errors->has('g-recaptcha-response'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('g-recaptcha-response') }}</strong>
                                </span>
                            @endif
                        </div>

                        <div class="form-group">
                            <input type="submit" class="" value="{{ __( 'messages.sign_up' ) }}" />
                            <span class="already-account"> &nbsp; &nbsp;
                                {{ __( 'messages.already_account' ) }}
                                <a href="{{ route( 'login' ) }}" class="">
                                    <label>{{ __( 'messages.sign_in' ) }}</label>
                                </a>
                            </span>
                        </div>

                    </form>  
                </div>
            </div>
        </div>
        <script>
            function socialURL( url ) {
                window.location.href=url;
            }
        </script>
    @endsection