@if(isset($videos)&& !empty($videos))
<section id="open-house-videos">
    <h2 class="bd-cyan">{{ $video_title }}</h2>  
    <div class="slider responsive">
        @foreach( $videos as $video )
            <div class="card">
                <a href="{{ url('video/'.$video['slug']) }}">
                    @if( !empty( $video['images']['thumbnail']['src'] ) )
                        <img class="card-img-top" src="{{  $video['images']['thumbnail']['src'] }}" alt="{{ $video['name'] }}" title="{{ $video['name'] }}" width="248" height="140" />
                    @else
                        <img class="card-img-top" src="{{ asset( 'frontend/images/image_placeholder.png' ) }}" alt="{{ $video['name'] }}" title="{{ $video['name'] }}" width="248" height="140" />
                    @endif
                </a>
                <div class="card-body">
                    <h6 class="card-title">
                        <a href="{{ url('video/'.$video['slug']) }}">
                            {{ ucfirst( $video['name'] ) }}
                        </a>
                    </h6>
                </div>
            </div>
        @endforeach
    </div>
</section>
@endif