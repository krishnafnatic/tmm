@if( isset( $wishlist ) && count( $wishlist) > 0 )
    <section id="popular-videos">
     	<h2 class="bd-magenta no-bd-lft">{{ __( 'messages.my_list' ) }}</h2>  
        <div class="slider responsive">
            @foreach( $wishlist as $wish )
                <div class="card">
                    <a href="{{ url('video/'.$wish['slug']) }}" class="card-title" title="{{ $wish['name'] }}">
                        @if( !empty( $wish['images']['thumbnail']['src'] ) )
                            <img class="card-img-top img-fluid" src="{{  $wish['images']['thumbnail']['src'] }}" alt="{{ $wish['name'] }}" title="{{ $wish['name'] }}" width="248" height="140" />
                        @else
                            <img class="card-img-top img-fluid" src="{{ asset( 'frontend/images/image_placeholder.png' ) }}" alt="{{ $wish['name'] }}" title="{{ $wish['name'] }}" width="248" height="140" />
                        @endif
                    </a>
                    <div class="card-body">
                        <h6 class="card-title">
                            <a href="{{ url('video/'.$wish['slug']) }}" class="card-title" title="{{ $wish['name'] }}">
                                {{ ucfirst( $wish['name'] ) }}
                            </a>
                        </h6>
                    </div>
                </div>
            @endforeach
        </div>
    </section>
@endif