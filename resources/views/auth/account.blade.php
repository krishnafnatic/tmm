@extends('frontend.layouts.account')

@section('content')
<div class="container-fluid px-0 profile-update-container">
    <div class="container">
        <div class="alert alert-dismissable" id="profile_msg" style="display: none;"></div>
        <div class="row">
            <div class="col-sm-6">
                <div class="row">
                    <div class="col-sm-3 text-center">  
                        <!-- <div id="proife_picture"></div> -->
                        <div class="col-sm-12 text-center user-initials-2" style="padding: 0;" id="upload-demo" onclick="uploadImage();">
                            {{ substr( Auth::user()->name, 0, 1) }}
                            <!-- <img class="user-profile-pic" src="" title="{{ Auth::user()->name }}" alt="{{ Auth::user()->name }}" /> -->
                        </div>

                        <!-- <div class="col-sm-12 " style="padding:5%;"> 
                            <input type="file" id="image" style="display: none;" />
                            <button class="btn btn-sm btn-primary btn-block upload-image" style="margin-top:2%;" disabled>
                                {{ __( 'messages.upload_image' ) }}
                            </button>
                        </div> -->
                    </div>
                    <div class="col-sm-8">
                        <h2>{{ Auth::user()->name }}</h2>
                        <input type="text" id="designation" class="float-left col-sm-12"  disabled style="display: none;" name="designation" value="{{ $user_profile['designation'] }}" />
                        <h4 id="content_designation">{{ $user_profile['designation'] }}</h4>
                        <button class="btn btn-sm btn-primary text-right" id="edit_designation" onclick="UpdateUserProfileButton( 'designation', '{{route("update.profile") }}'  )" style="position: relative;">
                            {{ __( 'messages.edit_designation' ) }}
                        </button><br><br>
                        <ul class="user-profile-social-ico">

                            @if( isset( $user_profile['social']['facebook']) && !empty( $user_profile['social']['facebook'] ) )
                            <li> 
                                <a href="{{ $user_profile['social']['facebook'] }}" target="_tab">
                                    <i class="fab fa-facebook fa-2x"></i> 
                                </a> 
                            </li>
                            @endif

                             @if( isset( $user_profile['social']['linkedin']) && !empty( $user_profile['social']['linkedin'] ) )
                            <li>
                                <a href="{{ $user_profile['social']['linkedin'] }}" target="_tab">
                                    <i class="fab fa-linkedin fa-2x"></i>
                                </a>
                            </li>
                            @endif

                            @if( isset( $user_profile['social']['google']) && !empty( $user_profile['social']['google'] ) )
                            <li>
                                <a href="{{ $user_profile['social']['google'] }}" target="_tab">
                                    <i class="fab fa-google fa-2x"></i>
                                </a>
                            </li>
                            @endif

                            @if( isset( $user_profile['social']['twitter']) && !empty( $user_profile['social']['twitter'] ) )
                            <li>
                                <a href="{{ $user_profile['social']['twitter'] }}" target="_tab">
                                    <i class="fab fa-twitter-square fa-2x"></i>
                                </a>
                            </li>
                            @endif
                        </ul>
                        @if( isset( $user_profile['user_tag'] ) && !empty( $user_profile['user_tag'] ) )
                            <h6>{{ __( 'messages.interests' ) }}</h6>
                        @endif
                        <div class="user-interested pl-0">
                            <div class="" data-toggle="buttons">
                                @if( $user_profile['tags'] )
                                    @foreach( $user_profile['tags'] as $tag)
                                        @if( in_array( $tag->id, $user_profile['user_tag'] ) )
                                            <label class="btn btn-default active" for="tag">
                                                <input id="tag_{{ $tag->id }}" autocomplete="off" value="{{ $tag->id }}" name="tag[{{ $tag->id }}]" autocomplete="off" value="{{ $tag->id }}" name="tag[{{ $tag->id }}]" checked type="checkbox" disabled />
                                                {{ $tag->tag }}
                                            </label>
                                        @endif
                                    @endforeach
                                @endif
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
            <div class="col-sm-1">
                <span class="profile-seperator"> </span> 
            </div>  
            <div class="col-sm-5">
                <div id="div_biography">  
                    <textarea name="biography" id="biography" class="type-main-comment float-left m-0" disabled style="display: none;">@if( $user_profile['biography'] ){{ $user_profile['biography'] }}@else{{ __( 'messages.add_about' ) }}@endif
                    </textarea><br><br>
                    <p id="content_biography">
                        @if( $user_profile['biography'] )
                            {{ $user_profile['biography'] }}
                        @else
                            {{ __( 'messages.add_about' ) }}
                        @endif
                    </p>
                </div> 
                <button class="btn btn-sm btn-primary float-left btn-biography" id="edit_biography" onclick="UpdateUserProfileButton( 'biography', '{{route("update.profile") }}'  )">
                    {{ __( 'messages.edit_biography' ) }}
                </button>
            </div>
        </div> 
        @if( isset( $recommended_videos ) && count( $recommended_videos) > 0 )
            @include('frontend.account.recommended_video')
        @endif
    </div> 
</div>
<script type="text/javascript">
    var loader = "{{ asset( 'frontend/images/loader.png' ) }}",
        edit_biography = "{{ __( 'messages.edit_biography' ) }}",
        edit_designation = "{{ __( 'messages.edit_designation' ) }}",
        profile_image_upload = "{{ __( 'messages.profile_image_upload' ) }}",
        save_biography = "{{ __( 'messages.save_biography' ) }}",
        save_designation = "{{ __( 'messages.save_designation' ) }}",
        route_profile = "{{route('update.profile')}}";
</script>
@endsection