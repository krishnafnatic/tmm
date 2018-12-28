<section id="trending-videos">
 	<h2 class="bd-tranding no-bd-lft">
    {{ __( 'messages.watch_next' ) }}
  </h2>  
	<div class="slider responsive">
    @foreach( $watch_next as $next )
      <div class="card">
        <a href="{{ url($type.'/'.$next['slug']) }}">
          @if( !empty( $next['images']['thumbnail']['src'] ) )
            <img class="card-img-top" src="{{  $next['images']['thumbnail']['src'] }}" alt="{{ $next['name'] }}" title="{{ $next['name'] }}" />
          @else
              <img class="card-img-top" src="{{ asset( 'frontend/images/image_placeholder.png' ) }}" alt="{{ $next['name'] }}" title="{{ $next['name'] }}">
          @endif
        </a>
        <div class="card-body">
          <h6 class="card-title">
            <a href="{{ url($type.'/'.$next['slug']) }}">
              {{ ucfirst( $next['name'] ) }}
            </a>
          </h6>
        </div>
      </div>
    @endforeach
  </div>
</section>