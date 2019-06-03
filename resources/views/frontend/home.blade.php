	@extends('frontend.layouts.master')

	@section('content')
		@include('frontend.elements.message')
		@include('frontend.home_template.banner_video')
		@include('frontend.follow_us')
		<div class="container">
			  <div class="container">
                       
                        @include('frontend.fb')
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
					@elseif(   $setting->type == '5bdfe38abda6bb0ce8e60d8c' || $setting->type == '5bdfe37b7f25347d9823a146' || $setting->type == '5bdfe3707e881b4ae4fdc688' || $setting->type == '5bdfe3b046e02e118e78ea03' || $setting->type == '5bdfe39d82aca467d2b66f05' || $setting->type == '5bdfe3a622224851c58db127' || $setting->type == '5bdfe3930332284b34ff63e5' || $setting->type == '5bdfe3647f25347d9823a139' ) 
						@foreach( $home_settings[$setting->type] as $home)

							@include('frontend.home_template.folder_video', [ 'folder_videos' => $home ])
							
						@endforeach
					@else
						@foreach( $home_settings[$setting->type] as $home)

							@include('frontend.home_template.playlist_video', [ 'playlist_videos' => $home ])
							
						@endforeach
					@endif

				@endforeach
			@endif
		</div>
	@endsection