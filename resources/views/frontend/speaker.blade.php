	@extends('frontend.layouts.master')

	@section('content')
		<div class="container-fluid px-0 profile-update-container">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-3 text-center">
	                            <div class="user-initials-2">
	                            	@php
                            			$name = $speakers_detail['name'];
                            			$designation = $speakers_detail['designation'];
                            			$description = $speakers_detail['description'];
                            		@endphp
	                            	@if( !empty( $speakers_detail['avatar'] ) )
	                                	<img src="{{ asset( '/'.$speakers_detail['avatar']) }}" width="100%" height="100%" title="{{ $name }}" alt="{{ $name }}" style="    border-radius: 100px;" />
	                                @endif
	                            </div>
                            	<!-- <a href="" class="edit-profile-2">Edit Profile</a> -->
                            </div>
                            <div class="col-sm-8">
                              	<h2>{{ $name }}</h2>
                              	<h4>{{ $designation }}</h4>
	                            <ul class="user-profile-social-ico">
                                    @if( isset( $social['facebook'] ) && !empty( $social['facebook'] ) )
	                                   <li> 
                                            <a href="{{ $social['facebook'] }}" target="_blank">
                                                <i class="fab fa-facebook fa-2x"></i>
                                            </a>
                                        </li>
                                    @endif

                                    @if( isset( $social['linkedin'] ) && !empty( $social['linkedin'] ) )
                                       <li> 
                                            <a href="{{ $social['linkedin'] }}" target="_blank">
                                                <i class="fab fa-linkedin fa-2x"></i>
                                            </a>
                                        </li>
                                    @endif

                                    @if( isset( $social['google'] ) && !empty( $social['google'] ) )
                                       <li> 
                                            <a href="{{ $social['google'] }}" target="_blank">
                                                <i class="fab fa-google fa-2x"></i>
                                            </a>
                                        </li>
                                    @endif

                                    @if( isset( $social['twitter'] ) && !empty( $social['twitter'] ) )
                                       <li> 
                                            <a href="{{ $social['twitter'] }}" target="_blank">
                                                <i class="fab fa-twitter-square fa-2x"></i>
                                            </a>
                                        </li>
                                    @endif
	                            </ul>
                            </div>
                        </div>    
                    </div>
                    <div class="col-sm-1">
                        <span class="profile-seperator"> </span> 
                    </div>  
                    <div class="col-sm-5">
                        <p> {!! $description !!} </p> 
                    </div>
                </div>
            </div>  
      	</div>

        <div class="container">  
            @include('frontend.speaker.video')
        </div>   
	@endsection