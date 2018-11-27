@if( isset( $speakers ) && count( $speakers ) > 0 )
	<ul class="video-speaker-profile">
		@foreach( $speakers as $speaker )
		  	<li> 
		        <a href="{{ url( 'speaker/'.$speaker['slug'] ) }}" class="profile-pic float-left">
		        	<img src="{{ asset( $speaker['avatar'] ) }}" alt="{{ $speaker['name'] }} " title="{{ $speaker['name'] }} " />
		        </a>
		        <a href="{{ url( 'speaker/'.$speaker['slug'] ) }}" class="title" title="{{ $speaker['name'] }} ">
		        	{{ $speaker['name'] }} 
		        </a>
		        <div class="designation">
 		        	{{ $speaker['designation'] }}
		        </div>
		        <p>
		        	{{ $speaker['short_description'] }}
		        </p>
		    </li>
		@endforeach
	</ul>
@else
	<ul class="video-speaker-profile">
		<p>{{ __( 'messages.speaker_found' ) }}</p>
	</ul>
@endif