@if( isset( $playlist_videos ) && count( $playlist_videos) > 0 )
    <section class="open-house-videos">
        <h2 class="bd-cyan no-bd-lft">{{ $playlist_videos['playlist_name'] }}</h2>  
        <div class="slider responsive">
            @foreach( $playlist_videos['playlist_videos'] as $video )
                <div class="card">
                    <a href="{{ url('playlist/'.$playlist_videos['playlist_slug'].'/'.$video['slug']) }}" title="{{ $video['name'] }}">
                        @if( !empty( $video['images']['thumbnail']['src'] ) )
                            <img class="card-img-top" src="{{  $video['images']['thumbnail']['src'] }}" alt="{{ $video['name'] }}" title="{{ $video['name'] }}" width="248" height="140" />
                        @else
                            <img class="card-img-top" src="{{ asset( 'frontend/images/image_placeholder.png' ) }}" alt="{{ $video['name'] }}" title="{{ $video['name'] }}" width="248" height="140" />
                        @endif
                    </a>
                    <div class="card-body">
                        <h6 class="card-title">
                            <a href="{{ url('playlist/'.$playlist_videos['playlist_slug'].'/'.$video['slug']) }}" title="{{ $video['name'] }}" alt="{{ $video['name'] }}">
                                {{ ucfirst( $video['name'] ) }}
                            </a>
                        </h6>
                    </div>
                </div>
            @endforeach
        </div>
    </section>
@endif