@if( isset( $trending_videos ) && count( $trending_videos) > 0 )
    <section id="trending-videos">
        <h2 class="bd-tranding">
            @if( isset( $heading ) && !empty( $heading ) )
                {{ $heading }}
            @else
                {{ __( 'messages.recommended_videos' ) }}
            @endif
        </h2>  
        <div class="slider responsive">
            @foreach( $trending_videos as $trending )
                <div class="card">
                    <a href="{{ url('trending/'.$trending['slug']) }}" title="{{ $trending['name'] }}">
                        @if( !empty( $trending['images']['thumbnail']['src'] ) )
                            <img class="card-img-top img-fluid" src="{{  $trending['images']['thumbnail']['src'] }}" alt="{{ $trending['name'] }}" title="{{ $trending['name'] }}" width="248" height="140" />
                        @else
                            <img class="card-img-top img-fluid" src="{{ asset( 'frontend/images/image_placeholder.png' ) }}" alt="{{ $trending['name'] }}" title="{{ $trending['name'] }}" width="248" height="140" />
                        @endif
                    </a>
                    <div class="card-body">
                        <h6 class="card-title">
                            <a href="{{ url('trending/'.$trending['slug']) }}" title="{{ $trending['name'] }}">
                                {{ ucfirst( $trending['name'] ) }}
                            </a>
                        </h6>
                    </div>
                </div>
            @endforeach
        </div>
    </section>
@endif