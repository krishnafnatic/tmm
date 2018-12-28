@if( isset( $folder_videos ) && count( $folder_videos) > 0 )
    <section id="open-house-videos">
        <h2 class="bd-cyan no-bd-lft">{{ $folder_videos['folder_name'] }}</h2>  
        <div class="slider responsive">
            @foreach( $folder_videos['folder_videos'] as $video )
                <div class="card">
                    <a href="{{ url('category/'.$folder_videos['folder_name'].'/'.$video['slug']) }}" title="{{ $video['name'] }}">
                        @if( !empty( $video['images']['thumbnail']['src'] ) )
                            <img class="card-img-top" src="{{  $video['images']['thumbnail']['src'] }}" alt="{{ $video['name'] }}" title="{{ $video['name'] }}" />
                        @else
                            <img class="card-img-top" src="{{ asset( 'frontend/images/image_placeholder.png' ) }}" alt="{{ $video['name'] }}" title="{{ $video['name'] }}">
                        @endif
                    </a>
                    <div class="card-body">
                        <h6 class="card-title">
                            <a href="{{ url('category/'.$folder_videos['folder_name'].'/'.$video['slug']) }}" title="{{ $video['name'] }}">
                                {{ ucfirst( $video['name'] ) }}
                            </a>
                        </h6>
                    </div>
                </div>
            @endforeach
        </div>
    </section>
@endif