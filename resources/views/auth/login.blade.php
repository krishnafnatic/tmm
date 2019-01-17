    @extends('frontend.layouts.master')

    @section('content')
    	<div class="container signup-body">
    		@include('frontend.elements.message')
        	<div class="row justify-content-md-center">
	            <div class="col-sm">
	                <div class="col-sm social-btn signin-social-btn-mr">
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
                  	<h3>{{ __( 'messages.sign_in' ) }}</h3>
                    <form class="form-horizontal" method="POST" action="{{ route('login') }}" autocomplete="off">
                    	{{ csrf_field() }}
                        <div class="form-group{{ $errors->has('email') ? '' : '' }}">
                            <label>{{ __( 'messages.email' ) }}</label>
                            <input id="email" type="email" class="form-control @if ($errors->has('email')) is-invalid  @endif" name="email" value="{{ old('email') }}" required autofocus autocomplete="off" />

                                @if ($errors->has('email'))
                                    <span class="invalid-feedback">
                                        {{ $errors->first('email') }}
                                    </span>
                                @endif
                        </div>
                        <div class="form-group{{ $errors->has('password') ? '' : '' }}">
                            <label>{{ __( 'messages.password' ) }}</label>
                            <input id="password" type="password" class="form-control @if ($errors->has('password')) is-invalid  @endif" name="password" required autocomplete="current-password" />
                                @if ($errors->has('password'))
                                    <span class="invalid-feedback">
                                        {{ $errors->first('password') }}
                                    </span>
                                @endif
                        </div>
                        <div class="form-group{{ $errors->has('g-recaptcha-response') ? '' : '' }}">
                            <!-- <label>{{ __( 'messages.captcha' ) }}</label> -->
                            {!! app('captcha')->display() !!}
                            @if ($errors->has('g-recaptcha-response'))
                                <span class="invalid-feedback">
                                    {{ $errors->first('g-recaptcha-response') }}
                                </span>
                            @endif
                            <br />
                            <label class="remember-me">
                               <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}>{{ __( 'messages.remember_me' ) }}
                            </label>
                            <label class="remember-me">
                                <a href="{{ route( 'password.request' ) }}">
                                    {{ __( 'messages.forgot_password' ) }}
                                </a>
                            </label>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="" value="{{ __( 'messages.sign_in' ) }}" />
                            
                            <span class="already-account"> &nbsp; &nbsp;
                                {{ __( 'messages.account_yet' ) }}
                                <a href="{{ route( 'register' ) }}" class="">
                                    {{ __( 'messages.sign_up' ) }}
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