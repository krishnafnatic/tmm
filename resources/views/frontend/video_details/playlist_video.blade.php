@if( isset( $playlist_videos ) && count( $playlist_videos) > 0 )
    <section id="open-house-videos">
        <h2 class="bd-cyan no-bd-lft">{{ $playlist_videos['playlist_name'] }}</h2>  
        <div class="slider responsive">
            @foreach( $playlist_videos['playlist_videos'] as $video )
                <div class="card">
                    <a href="{{ url('playlist/'.$playlist_videos['playlist_slug'].'/'.$video['slug']) }}" title="{{ $video['name'] }}">
                        <img class="card-img-top" src="{{  $video['images']['thumbnail']['src'] }}" alt="{{ $video['name'] }}" title="{{ $video['name'] }}" />
                    </a>
                    <div class="card-body">
                        <h6 class="card-title">
                            <a href="{{ url('playlist/'.$playlist_videos['playlist_slug'].'/'.$video['slug']) }}" title="{{ $video['name'] }}">
                                {{ $video['name'] }}
                            </a>
                        </h6>
                    </div>
                </div>
            @endforeach
        </div>
    </section>
@endif