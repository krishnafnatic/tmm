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
                        <a class="nav-link active" href="{{ route( 'change-password' ) }}" role="change-password">
                            {{ __( 'messages.password' ) }}
                        </a>
                        <a class="nav-link" href="{{ route( 'user-notification' ) }}" role="notification">
                            {{ __( 'messages.notification' ) }}
                        </a>
                        <a class="nav-link" href="{{ route( 'profile-deactivate' ) }}" role="deactivate_account">
                            {{ __( 'messages.deactivate_account' ) }}
                        </a>
                    </div>
                </div>  
                
                <div class="col-sm-9">
                    <div class="tab-content" id="v-pills-tabContent">
                         <div class="tab-pane fade show active" id="change-password" role="change-password">
                            <form class="form-horizontal" role="change-password" method="POST" action="{{ route('change-password') }}" autocomplete="on">
                                {{ csrf_field() }}
                                <h3> {{ __( 'messages.change_password' ) }} </h3>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group{{ $errors->has('current-password') ? '' : '' }}">
                                            <label class="col-sm-12 pl-0" for="current-password">
                                                {{ __( 'messages.current_password' ) }}
                                            </label>
                                            <input id="current-password" type="password" name="current-password" class="col-sm-12 form-control @if ($errors->has('current-password')) is-invalid @endif" autocomplete="off" required autofocus />
                                            @if ($errors->has('current-password'))
                                                <span class="text-danger">
                                                   {{ $errors->first('current-password') }}
                                                </span>
                                            @endif
                                        </div> 

                                        <div class="form-group{{ $errors->has('new-password') ? '' : '' }}">
                                            <label class="col-sm-12 pl-0" for="new-password">
                                                {{ __( 'messages.new_password' ) }}
                                            </label>
                                            <input id="new-password" type="password" name="new-password" class="col-sm-12 form-control @if ($errors->has('new-password')) is-invalid @endif" autocomplete="off" required />
                                            @if ($errors->has('new-password'))
                                                <span class="text-danger">
                                                    {{ $errors->first('new-password') }}
                                                </span>
                                            @endif
                                        </div> 

                                        <div class="form-group">
                                            <label class="col-sm-12 pl-0" for="new-password-confirm">
                                                {{ __( 'messages.confirm_new_password' ) }}
                                            </label>
                                            <input id="new-password-confirm" type="password" name="new-password_confirmation" class="col-sm-12 form-control" autocomplete="off" required />
                                        </div>

                                        <div class="user-social-inputs-action">
                                            <button type="button" class="btn btn-secondary" onclick="event.preventDefault();window.history.back();">
                                                {{ __( 'messages.cancel' ) }}
                                            </button>&nbsp;&nbsp;
                                            <button type="submit" class="btn btn-primary">
                                                {{ __( 'messages.update' ) }}
                                            </button>
                                        </div> 
                                    </div>
                                    <div class="col-sm-6 text-right">
                                        <img src="{{ asset( 'frontend/images/lock.png' ) }}" class="lock" />
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
<style type="text/css">
    .was-validated .is-invalid {
            border-color: #dc3545 !important;
    }
</style>