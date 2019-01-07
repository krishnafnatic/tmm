	@extends('frontend.layouts.master')

	@section('content')
		<div class="container">
			@include('frontend.elements.message')
			<div class="row search-list-header">
				<div class="col-sm-10">
					@if( $q )
						<h6> {{ __( 'messages.found_result', [ 'total' => $videos['total'] ] ) }} </h6>
						<h1>
							{{ $q }}
						</h1>
					@else 
						<h6>{{ __( 'messages.found_result', [ 'total' => $videos['total'] ] ) }} </h6>
						<h1>
							{{ __( 'messages.all_videos' ) }}
						</h1>
					@endif
				</div>

				<div class="col-sm-2">
					<ul class="navbar-nav">
						<li class="nav-item dropdown">
			                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                  	{{ __( 'messages.sort_by' ) }}
			                </a>
			                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			                  	<a class="dropdown-item" href="{{ route( 'search' ) }}?q={{ $q }}&sort=asc">
			                  		{{ __( 'messages.asc_order' ) }}
			                  	</a>
			                  	<a class="dropdown-item" href="{{ route( 'search' ) }}?q={{ $q }}&sort=desc">
			                  		{{ __( 'messages.desc_order' ) }}
			                  	</a>
			                </div>
			              </li>
					</ul>
				</div>	
			</div>

			<div class="video-listing  pl-0">
				@if( $videos['total'] > 0 )
					@for( $i=0; $i<$videos['total']; $i++ )
						<div class="row video-list-card">
							<div class="col-sm-3 pl-0">
								<a href="{{ url( 'video/'.$videos[$i]['slug'] ) }}">
									@if( !empty( $video['images']['thumbnail']['src'] ) )
										<img src="{{ $videos[$i]['images']['thumbnail']['src'] }}" title="{{ $videos[$i]['name'] }}" alt="{{ $videos[$i]['name'] }}" />
									@else
			                            <img class="card-img-top" src="{{ asset( 'frontend/images/image_placeholder.png' ) }}" title="{{ $videos[$i]['name'] }}" alt="{{ $videos[$i]['name'] }}">
			                        @endif
								</a>
							</div>
							<div class="col-sm-8 video_id_{{ $videos[$i]['video_id'] }}">
								<h3 class="card-title">
									<a href="{{ url( 'video/'.$videos[$i]['slug'] ) }}" title="{{ $videos[$i]['name'] }}" alt="{{ $videos[$i]['name'] }}">
										{{ $videos[$i]['name'] }}
									</a>
								</h3>
								<p> {{ $videos[$i]['description']}} </p>
							</div>
						</div>
					@endfor
				@endif
			</div>
			{{ $paginate->links('pagination.video_search') }}
		</div>  
	@endsection