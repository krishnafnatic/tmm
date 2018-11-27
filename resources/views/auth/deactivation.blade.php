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
                        <a class="nav-link" href="{{ route( 'user-notification' ) }}" role="notification">
                            {{ __( 'messages.notification' ) }}
                        </a>
                        <a class="nav-link active" href="{{ route( 'profile-deactivate' ) }}" role="deactivate_account">
                            {{ __( 'messages.deactivate_account' ) }}
                        </a>
                    </div>
                </div>  
                
                <div class="col-sm-9">
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade show active" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                            <form class="form-horizontal" method="POST" action="{{ route('profile-deactivate') }}" autocomplete="on" role="deactivate_account">
                                {{ csrf_field() }}  
                                <h3> {{ __( 'messages.deactivate_account' ) }} </h3>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h6>{{ __( 'messages.reason_account_deactivate' ) }}</h6> 
                                        <form class="manage-password">
                                            <div class="form-group{{ $errors->has('reason_deactivate') ? ' was-validated' : '' }}">
                                                <select class="form-control col-sm-12" name="reason_deactivate">
                                                    <option value="0">
                                                        {{ __( 'messages.select_reason' ) }}
                                                    </option>
                                                    @if($reason)
                                                        @foreach($reason as $r)
                                                            <option value="{{ $r->id }}" {{ $r->id == $deactivate_reason ? 'selected' : '' }} > 
                                                                {{ $r->name }} 
                                                                </option>
                                                        @endforeach
                                                    @endif
                                                </select>
                                                @if ($errors->has('reason_deactivate'))
                                                    <div class="text-danger">
                                                        {{ $errors->first('reason_deactivate') }}
                                                    </div>
                                                @endif
                                            </div>
                                            <br>
                                            <div class="form-group{{ $errors->has('current-password') ? ' has-error' : '' }}">
                                                <label class="col-sm-12 pl-0 clearfix"> 
                                                    {{ __( 'messages.password' ) }}
                                                </label> <br>
                                                <input id="current-password" type="password" class="col-sm-12 clearfix form-control" name="current-password" required autocomplete="off" />
                                                <div class="col-sm-12 user-social-inputs-action pl-0">
                                                    <button type="button" class="btn btn-secondary" onclick="event.preventDefault();window.history.back();">
                                                        {{ __( 'messages.cancel' ) }}
                                                    </button>&nbsp;&nbsp;                                         
                                                    <button type="submit" class="btn btn-primary">
                                                         {{ __( 'messages.deactivate' ) }}
                                                    </button>
                                                </div>    
                                            </div>    
                                        </form>
                                    </div>
                                    <div class="col-sm-6 text-right">
                                        <img src="{{ asset( 'frontend/images/delete-account.png' ) }}" class="lock">
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