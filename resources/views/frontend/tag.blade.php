	@extends('frontend.layouts.master')

	@section('content')
		<div class="container">
			@include('frontend.elements.message')
			<div class="row search-list-header">
				<div class="col-sm-10">  
					<h1>
						{{ __( 'messages.tag' ) }}:
						"{{ $tag }}"
					</h1> 
				</div> 
			</div>

			<div class="video-listing  pl-0">
				@if( $vidoes > 0 )
					@foreach( $vidoes as $video )
						<div class="row video-list-card">
							<div class="col-sm-3 pl-0">
								<a href="{{ url( 'video/'.$video['slug'] ) }}">
									<img src="{{ $video['images']['thumbnail']['src'] }}" title="{{ $video['name'] }}" slug="{{ $video['name'] }}" />
								</a>
							</div>
							<div class="col-sm-8 video_id_{{ $video['video_id'] }}">
								<h3 class="card-title">
									<a href="{{ url( 'video/'.$video['slug'] ) }}">

										{{ $video['name'] }}
									</a>
								</h3> 

								<p> {{ $video['description']}} </p>
							</div>
						</div>
					@endforeach
				@endif
			</div> 
		</div>  
	@endsection