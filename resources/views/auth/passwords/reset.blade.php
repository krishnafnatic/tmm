    @extends('frontend.layouts.master')

    @section('content')
        <div class="container signup-body">
            @include('frontend.elements.message')
            <div class="row justify-content-md-center">
                <div class="col-sm"></div>

                <div class="col-sm hidden-sm hidden-md">
                    <h3 class="text-center">{{ __( 'messages.reset_password' ) }}</h3>
                    <form class="form-horizontal" method="POST" action="{{ route('password.request') }}" autocomplete="off">
                        {{ csrf_field() }}

                        <input type="hidden" name="token" value="{{ $token }}">
                        
                        <div class="form-group {{ $errors->has('email') ? '' : '' }}">
                            <label for="email">{{ __( 'messages.email' ) }}</label>
                            <input id="email" type="email" class="form-control {{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" autocomplete="off" autofocus required />
                            @if ($errors->has('email'))
                                <span class="invalid-feedback">
                                    {{ $errors->first('email') }}
                                </span>
                            @endif
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' ' : '' }}">
                            <label for="password">
                                {{ __( 'messages.password' ) }}
                            </label>
                            <input id="password" type="password" class="form-control  {{ $errors->has('password') ? ' is-invalid' : '' }}" value="{{ old('password') }}"  name="password" required>
                            <p id="passwordHelpBlock" class="form-text text-muted">
                                {{ __( 'messages.tooltip_pwd' ) }}
                            </p>

                            @if ($errors->has('password'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('password') }}</strong>
                                </span>
                            @endif
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' ' : '' }}">
                            <label for="password-confirm">
                                {{ __( 'messages.confirm_password' ) }}
                            </label>
                            <input id="password-confirm" type="password" class="form-control @if ($errors->has('password')) is-invalid  @endif" name="password_confirmation" value="{{ old('password_confirmation') }}" required>

                            @if ($errors->has('password'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('password_confirmation') }}</strong>
                                </span>
                            @endif
                        </div>

                        <!--<div class="form-group{{ $errors->has('g-recaptcha-response') ? ' has-error' : '' }}">
                            <label class="col-md-4 control-label">
                                {{ __( 'messages.captcha' ) }}
                            </label>
                            {!! app('captcha')->display() !!}
                            @if ($errors->has('g-recaptcha-response'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('g-recaptcha-response') }}</strong>
                                </span>
                            @endif
                        </div>-->
                        <div class="form-group">
                            <br>    
                            <button type="submit" class="btn-secondary" value="{{ __( 'messages.submit' ) }}" onclick="cancelURL( '{{ route('login') }} ' )">
                                {{ __( 'messages.cancel' ) }}
                            </button> &nbsp; &nbsp;
                            <input type="submit" class="" value="{{ __( 'messages.submit' ) }}" />
                        </div>
                    </form>  
                </div>

                <div class="col-sm signup-box"> </div>
            </div>
        </div>
        <script type="text/javascript">
            function cancelURL( url ) {
                window.location.href=url;
            }
        </script>
    @endsection