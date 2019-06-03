@if( isset( $recommended_videos ) && count( $recommended_videos) > 0 )
  <section id="trending-videos">
   	<h2 class="bd-tranding no-bd-lft">
      @if( isset( $heading ) && !empty( $heading ) )
        {{ $heading }}
      @else
        {{ __( 'messages.recommended_videos' ) }}
      @endif
    </h2>  
  	<div class="slider responsive">
      @foreach( $recommended_videos as $next )
        <div class="card">
          <a href="{{ url('video/'.$next['slug']) }}">
            <img class="card-img-top img-fluid" src="{{  $next['images']['thumbnail']['src'] }}" alt="{{ $next['name'] }}" title="{{ $next['name'] }}" />
          </a>
          <div class="card-body">
            <h6 class="card-title">
              <a href="{{ url('video/'.$next['slug']) }}">
                {{ $next['name'] }}
              </a>
            </h6>
          </div>
        </div>
      @endforeach
    </div>
  </section>
@endif