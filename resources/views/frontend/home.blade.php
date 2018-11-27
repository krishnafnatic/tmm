	@extends('frontend.layouts.master')

	@section('content')
		@include('frontend.elements.message')
		@include('frontend.home_template.banner_video')
		<div class="container">
			@if( isset( $settings ) && count ( $settings ) > 0 )	
				@foreach( $settings as $setting )
					@if( $setting->type == 'ads' )
						@include('frontend.home_template.advertisement', [ 'advertisment' => $home_settings[$setting->type ], 'heading' => $setting->heading ])
					@elseif( $setting->type == 'tag' )
						@include('frontend.account.recommended_video', [ 'recommended_videos' => $home_settings[$setting->type] , 'heading' => $setting->heading ])
					@elseif( $setting->type == 'trending' )
						@include('frontend.home_template.trending_video', [ 'trending_videos' => $home_settings[$setting->type], 'heading' => $setting->heading ])
					@elseif( $setting->type == 'popular' )
						@include('frontend.home_template.popular_video', [ 'popular_videos' => $home_settings[$setting->type], 'heading' => $setting->heading ])
					@else
						@foreach( $home_settings[$setting->type] as $home)

							@include('frontend.home_template.playlist_video', [ 'playlist_videos' => $home ])
							
						@endforeach
					@endif

				@endforeach
			@endif
	@endsection