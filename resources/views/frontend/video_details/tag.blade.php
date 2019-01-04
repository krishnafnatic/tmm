<div class="col-sm-3 views-tags" id="view-tags">
    <a class="social_media" id="social_media" title="Social Share" onclick="document.getElementById('social_share_custom').style.display='block';"> 
        <img src="{{ asset( 'frontend/images/social/share.png' ) }}" alt="Social Share" title="Social Share" />
    </a>
    <a class="add-to-wishlist" id="add_to_list" title="Add to my list" onclick="user_list('add')"> 
        <img src="{{ asset( 'frontend/images/social/heart_normal.png' ) }}" alt="Add to my list" title="Add to my list" />
    </a>
	<div class="video-views" id="view-video">
    	<div class="viewcount" id="viewcount"></div>
        <div class="viewlabel">{{ __( 'messages.views' ) }}</div>
	</div>
	<div class="video-related-tags">
    	@if(count($video_detail['tags']) > 0)
            <h6>{{ __( 'messages.realated_tags' ) }}</h6>
    		@foreach( $video_detail['tags'] as $tag ) 
    			@if($loop->last)
    				<a href="{{ url( '/tag/'. $tag) }}">{{ ucfirst ( $tag ) }}</a> 
    			@else 
    				<a href="{{ url( '/tag/'. $tag) }}">{{ ucfirst ( $tag ) }}</a>,
    			@endif 
    		@endforeach
    	@endif
	</div>
</div>