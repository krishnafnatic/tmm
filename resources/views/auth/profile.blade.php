@extends('frontend.layouts.master')
 
@section('content')
    <div class="container">
        <div class="user-account-holder card">
             @include('frontend.elements.message')
            <div class="row">  
                <div class="col-sm-3 tmm-account-tab">
                    <div class="nav flex-column nav-pills account-tabs" id="v-pills-tab" role="account" aria-orientation="vertical">
                        <a class="nav-link active" href="{{ route( 'profile' ) }}" role="profile">
                            {{ __( 'messages.profile' ) }}
                        </a>
                        <a class="nav-link" href="{{ route( 'change-password' ) }}" role="change-password">
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
                        <div class="tab-pane fade show active" id="profile" role="profile">
                            <form class="form-horizontal" method="POST" action="{{ route( 'profile' ) }}">
                                {{ csrf_field() }}
                                <h6> {{ __( 'messages.detail_setup' ) }}</h6>
                                <br><br>
                                <h3> {{ __( 'messages.how_old' ) }} </h3>
                                <div class="col user-age pl-0 form-group{{ $errors->has('age') ? ' was-validated' : '' }}">
                                    <div class="" data-toggle="buttons">
                                        @if($ageGroup)
                                            @foreach($ageGroup as $age)
                                                <label class="btn btn-default {{ $age->id == $user_age ? 'active' : '' }}" for="age">
                                                    <input name="age" value="{{ $age->id }}" id="age_{{ $age->id }}" autocomplete="off" type="radio" {{ $age->id == $user_age ? 'checked' : '' }} /> {{ $age->value }}
                                                </label>
                                            @endforeach
                                        @endif

                                        @if ($errors->has('age'))
                                            <div class="text-danger">
                                                {{ $errors->first('age') }}
                                            </div>
                                        @endif
                                    </div>
                                </div>

                                <br><br>

                                <h3> {{ __( 'messages.interested_in' ) }} </h3>
                                <div class="col user-interested pl-0 form-group{{ $errors->has('tag') ? ' was-validated' : '' }}">
                                    <div class="" data-toggle="buttons">
                                        @if($tags)
                                            @foreach($tags as $tag)
                                                @if(in_array($tag->id, $user_tag))
                                                    <label class="btn btn-default active" for="tag">
                                                        <input id="tag_{{ $tag->id }}" autocomplete="off" value="{{ $tag->id }}" name="tag[{{ $tag->id }}]" checked="checked" type="checkbox"> 
                                                        {{ $tag->tag }}
                                                    </label>
                                                @else 
                                                    <label class="btn btn-default">
                                                        <input id="tag_{{ $tag->id }}" autocomplete="off" value="{{ $tag->id }}" name="tag[{{ $tag->id }}]" type="checkbox"> 
                                                        {{ $tag->tag }}
                                                    </label>
                                                @endif
                                            @endforeach
                                        @endif

                                        @if ($errors->has('tag'))
                                            <div class="text-danger">
                                                {{ $errors->first('tag') }}
                                            </div>
                                        @endif
                                    </div>
                                </div>

                                <br><br><br>
                                <div class="row">
                                    <h6 class="col-sm-11 optional-hr">optional</h6>
                                    <h3 class="ccol-sm-12"> {{ __( 'messages.social_links' ) }} </h3>
                                    <div class="col-sm-12 form-group{{ $errors->has('facebook') ? ' was-validated' : '' }} row">
                                        <label for="facebook" class="col-sm-2 col-form-label">
                                            {{ __( 'messages.facebook' ) }}
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="facebook" placeholder="https://www.facebook.com/TheMoneyMile/" name="facebook" value="{{ $s_facebook }}" />
                                        </div>
                                        @if ($errors->has('facebook'))
                                            <div class="text-danger">
                                                {{ $errors->first('facebook') }}
                                            </div>
                                        @endif
                                    </div>

                                    <div class="col-sm-12 form-group{{ $errors->has('linkedin') ? ' was-validated' : '' }} row">
                                        <label for="linkedin" class="col-sm-2 col-form-label">
                                            {{ __( 'messages.linkedin' ) }}
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="linkedin" placeholder="https://www.linkedin.com/in/vivek-law-618322ab/" name="linkedin" value="{{ $s_linkedin }}" />
                                        </div>
                                        @if ($errors->has('linkedin'))
                                            <div class="text-danger">
                                                {{ $errors->first('linkedin') }}
                                            </div>
                                        @endif
                                    </div>

                                    <div class="col-sm-12 form-group{{ $errors->has('google') ? ' was-validated' : '' }} row ">
                                        <label for="google" class="col-sm-2 col-form-label">
                                            {{ __( 'messages.google' ) }}
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="google" placeholder="https://plus.google.com/u/0/+RishabhAgarwalddn" name="google" value="{{ $s_google }}" />
                                        </div>
                                         @if ($errors->has('google'))
                                            <div class="text-danger">
                                                {{ $errors->first('google') }}
                                            </div>
                                        @endif
                                    </div>

                                    <div class="col-sm-12 form-group{{ $errors->has('twitter') ? ' was-validated' : '' }} row">
                                        <label for="twitter" class="col-sm-2 col-form-label">
                                            {{ __( 'messages.twitter' ) }}
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="twitter" placeholder="https://twitter.com/themoney_mile?lang=en" name="twitter" value="{{ $s_twitter }}" />
                                        </div>
                                        @if ($errors->has('twitter'))
                                            <div class="text-danger">
                                                {{ $errors->first('twitter') }}
                                            </div>
                                        @endif
                                    </div>

                                    <div class="col-sm-12 form-group row">
                                        <div class="col-sm-2"> &nbsp;</div>
                                        <div class="col-sm-10 user-social-inputs-action">
                                            <button type="button" class="btn btn-secondary" onclick="event.preventDefault();cancel( '{{ route('profile-settings') }}' )">
                                                {{ __( 'messages.cancel' ) }}
                                            </button>&nbsp;&nbsp;
                                            <button type="submit" class="btn btn-primary">
                                                {{ __( 'messages.save_changes' ) }}
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>    
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function cancel( url ) {
            window.location.href=url;
        }
    </script>
@endsection