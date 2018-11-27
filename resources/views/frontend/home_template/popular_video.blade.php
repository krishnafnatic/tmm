@if( isset( $popular_videos ) && count( $popular_videos) > 0 )
    <section id="popular-videos">
        <h2 class="bd-magenta">
            @if( isset( $heading ) && !empty( $heading ) )
                {{ $heading }}
            @else
                {{ __( 'messages.recommended_videos' ) }}
            @endif
        </h2>  
        <div class="slider responsive">
            @foreach( $popular_videos as $popular )
                <div class="card">
                    <a href="{{ url('popular/'.$popular['slug']) }}">
                        <img class="card-img-top" src="{{  $popular['images']['thumbnail']['src'] }}" alt="{{ $popular['name'] }}" title="{{ $popular['name'] }}" />
                    </a>
                    <div class="card-body">
                        <h6 class="card-title">
                            <a href="{{ url('popular/'.$popular['slug']) }}">
                                {{ $popular['name'] }}
                            </a>
                        </h6>
                    </div>
                </div>
            @endforeach
        </div>
    </section>
@endif