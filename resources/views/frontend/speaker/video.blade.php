@if(isset($videos)&& !empty($videos))
<section id="open-house-videos">
    <h2 class="bd-cyan">{{ $video_title }}</h2>  
    <div class="slider responsive">
        @foreach( $videos as $video )
            <div class="card">
                <a href="{{ url('video/'.$video['slug']) }}">
                    <img class="card-img-top" src="{{  $video['images']['thumbnail']['src'] }}" alt="{{ $video['name'] }}" title="{{ $video['name'] }}" />
                </a>
                <div class="card-body">
                    <h6 class="card-title">
                        <a href="{{ url('video/'.$video['slug']) }}">
                            {{ $video['name'] }}
                        </a>
                    </h6>
                </div>
            </div>
        @endforeach
    </div>
</section>
@endif