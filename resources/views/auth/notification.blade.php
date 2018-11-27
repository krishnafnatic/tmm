@extends('frontend.layouts.master')
 
@section('content')
    <div class="container">
        <div class="user-account-holder card">
            @include('frontend.elements.message')
            <div class="row">  
                <div class="col-sm-3 tmm-account-tab">
                    <div class="nav flex-column nav-pills account-tabs" id="v-pills-tab" role="account" aria-orientation="vertical">
                        <a class="nav-link" href="{{ route( 'profile' ) }}" role="profile">
                            {{ __( 'messages.profile' ) }}
                        </a>
                        <a class="nav-link" href="{{ route( 'change-password' ) }}" role="change-password">
                            {{ __( 'messages.password' ) }}
                        </a>
                        <a class="nav-link active" href="{{ route( 'user-notification' ) }}" role="notification">
                            {{ __( 'messages.notification' ) }}
                        </a>
                        <a class="nav-link" href="{{ route( 'profile-deactivate' ) }}" role="deactivate_account">
                            {{ __( 'messages.deactivate_account' ) }}
                        </a>
                    </div>
                </div>  
                
                <div class="col-sm-9">
                    <div class="tab-content" id="v-pills-tabContent">
                         <div class="tab-pane fade show active" id="notification" role="notification">
                            <form class="form-horizontal" role="notification" method="POST" action="{{ route('user-notification') }}" autocomplete="on" id="needs-validation" novalidate>
                                {{ csrf_field() }} 
                                <h3> {{ __( 'messages.notification' ) }} </h3>
                                <h6>{{ __( 'messages.newsletter_notification' ) }}</h6> 
                                <p>{{ __( 'messages.monthly_newsletter' ) }}</p> 
                                <div class="form-group{{ $errors->has('newsletter') ? ' was-validated' : '' }}">
                                    <label class="btn btn-default pl-0">
                                        <input id="newsletter" type="radio" class="" value="on" name="newsletter" {{ $n_notify == 'on' ? 'checked' : '' }} />
                                        {{ __( 'messages.on' ) }}
                                    </label>
                                    <label class="btn btn-default">
                                        <input id="newsletter" type="radio" class="" value="off" name="newsletter" {{ $n_notify == 'off' ? 'checked' : '' }} />
                                        {{ __( 'messages.off' ) }}
                                    </label> 
                                    <br />
                                     @if ($errors->has('newsletter'))
                                        <div class="text-danger">
                                            {{ $errors->first('newsletter') }}
                                        </div>
                                    @endif
                                </div>
                                <h6>{{ __( 'messages.video_notification' ) }}</h6> 
                                <p>{{ __( 'messages.monthly_video' ) }}</p>  

                                <div class="form-group{{ $errors->has('video') ? ' was-validated' : '' }}">
                                    <label class="btn btn-default pl-0">
                                        <input id="video" type="radio" class="" value="on" name="video" {{ $v_notify == 'on' ? 'checked' : '' }} />
                                        {{ __( 'messages.on' ) }}
                                    </label>
                                    <label class="btn btn-default">
                                        <input id="video" type="radio" class="" value="off" name="video" {{ $v_notify == 'off' ? 'checked' : '' }} />
                                        {{ __( 'messages.off' ) }}
                                    </label> 
                                    <br />
                                    @if ($errors->has('video'))
                                        <div class="text-danger">
                                            {{ $errors->first('video') }}
                                        </div>
                                    @endif
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-2"> &nbsp;</div>
                                    <div class="col-sm-10 user-social-inputs-action">
                                        <button type="button" class="btn btn-secondary" onclick="event.preventDefault();window.history.back();">
                                            {{ __( 'messages.cancel' ) }}
                                        </button>&nbsp;&nbsp;
                                        <button type="submit" class="btn btn-primary">
                                            {{ __( 'messages.save_changes' ) }}
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>    
            </div>
        </div>
    </div>
@endsection