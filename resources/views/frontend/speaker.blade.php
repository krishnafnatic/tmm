	@extends('frontend.layouts.master')

	@section('content')
		<div class="container-fluid px-0 profile-update-container">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-12 text-center">
	                            <div class="speaker_fullprofile">
	                            	@php
                            			$name = $speakers_detail['name'];
                            			$designation = $speakers_detail['designation'];
                            			$description = $speakers_detail['description'];
                            		@endphp
	                            	@if( !empty( $speakers_detail['avatar'] ) )
	                                	<img src="{{ asset( '/'.$speakers_detail['avatar']) }}" class="img-fluid" title="{{ $name }}" alt="{{ $name }}"  />
	                                @endif
	                            </div>
                            	<!-- <a href="" class="edit-profile-2">Edit Profile</a> -->
                            </div>
                            <div class="col-sm-12">
                              	<h2 title="Speaker Name">{{ $name }}</h2>
                              	<h4 title="Speaker Deisgnation">{{ $designation }}</h4>
                                @if( isset( $social['facebook'] ) && !empty( $social['facebook'] ) )
                                    <p style="margin: 20px 0px  0px 0px; " title="Follow Speaker on Social">
                                        {{ __( 'messages.follow_us_on' ) }}
                                    </p>
                                @endif
	                            <ul class="user-profile-social-ico">
                                    @if( isset( $social['facebook'] ) && !empty( $social['facebook'] ) )
	                                   <li> 
                                            <a href="{{ $social['facebook'] }}" target="_blank" title="Follow on Facebook">
                                                <i class="fab fa-facebook fa-2x"></i>
                                            </a>
                                        </li>
                                    @endif

                                    @if( isset( $social['linkedin'] ) && !empty( $social['linkedin'] ) )
                                       <li> 
                                            <a href="{{ $social['linkedin'] }}" target="_blank" title="Follow on Linkedin">
                                                <i class="fab fa-linkedin fa-2x"></i>
                                            </a>
                                        </li>
                                    @endif

                                    @if( isset( $social['google'] ) && !empty( $social['google'] ) )
                                       <li> 
                                            <a href="{{ $social['google'] }}" target="_blank" title="Follow on Google">
                                                <i class="fab fa-google fa-2x"></i>
                                            </a>
                                        </li>
                                    @endif

                                    @if( isset( $social['twitter'] ) && !empty( $social['twitter'] ) )
                                       <li> 
                                            <a href="{{ $social['twitter'] }}" target="_blank" title="Follow on Twitter">
                                                <i class="fab fa-twitter-square fa-2x"></i>
                                            </a>
                                        </li>
                                    @endif
	                            </ul>
                            </div>
                        </div>    
                    </div>
                    <!-- <div class="col-sm-1">
                        <span class="profile-seperator"> </span> 
                    </div>   -->
                    <div class="col-sm-6 pl-5 pt-0" title="Speaker Short Description">
                        <p> {!! $description !!} </p> 
                    </div>
                </div>
            </div>  
      	</div>

        <div class="container">  
            @include('frontend.speaker.video')
        </div>   
	@endsection