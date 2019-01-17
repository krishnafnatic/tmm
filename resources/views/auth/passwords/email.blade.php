    @extends('frontend.layouts.master')

    @section('content')
        <div class="container signup-body">
            @include('frontend.elements.message')
            <div class="row justify-content-md-center">
                <div class="col-sm"></div>

                <div class="col-sm hidden-sm hidden-md">
                    <h3 class="text-left">{{ __( 'messages.logging_help' ) }}</h3>
                    <p>{{ __( 'messages.forget_pwd_note' ) }}</p>
                    <form class="form-horizontal" method="POST" action="{{ route('password.email') }}" autocomplete="off">
                        {{ csrf_field() }}
                        <div class="form-group {{ $errors->has('email') ? '' : '' }}">
                            <label style="margin-top: 5px;">{{ __( 'messages.email' ) }}</label>
                            <input id="validationCustom03" type="email" class="form-control {{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" autocomplete="off" required />
                                @if ($errors->has('email'))
                                    <span class="invalid-feedback">
                                        {{ $errors->first('email') }}
                                    </span>
                                @endif
                        </div>
                        <div class="form-group{{ $errors->has('g-recaptcha-response') ? ' has-error' : '' }}">
                            <!-- <label class="col-md-4 control-label">
                                {{ __( 'messages.captcha' ) }}
                            </label> -->
                            {!! app('captcha')->display() !!}
                            @if ($errors->has('g-recaptcha-response'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('g-recaptcha-response') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group">
                            <br>    
                            <button type="button" class="btn-secondary" value="{{ __( 'messages.cancel' ) }}" onclick="cancelURL( '{{ route('login') }} ' )">
                                {{ __( 'messages.cancel' ) }}
                            </button> &nbsp; &nbsp;
                            <input type="submit" class="" value="{{ __( 'messages.submit' ) }}" />
                        </div>
                    </form>  
                </div>

                <div class="col-sm signup-box"> </div>
            </div>
        </div>
        <script>
            function cancelURL( url ) {
                window.location.href=url;
            }
        </script>
    @endsection