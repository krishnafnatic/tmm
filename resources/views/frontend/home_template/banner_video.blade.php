<div class="container-fluid px-0">
    <div class="carousel-inner home-prime-video">
        <div class="container">
           <div class="card">
	            <div class="card-image">
	                <!-- <div class="embed-responsive embed-responsive-16by9"> -->
                		<div style="position: relative; display: block; max-width: 1090px;">
							<div style="padding-top: 56.25%;">
								<video id="myPlayerID"
								  data-video-id="{{ $banner['video_id'] }}" 
								  data-account="{{ $banner['account_id'] }}" 
								  data-player="oNgLTdNCH" 
								  data-embed="default" 
								  data-application-id 
								  class="video-js" 
								  controls style="position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; width: 100%; height: 100%;"></video>
								<script src="//players.brightcove.net/{{ $banner['account_id'] }}/oNgLTdNCH_default/index.min.js"></script>
							</div>
						</div>
					<!-- </div> -->
	            </div>
	            
	            <div class="card-body text-left">       
	                <h1 class="card-title">{{ $banner['name'] }}</h1>
	                <p>{{ $banner['description'] }}</p>
	            </div>
        	</div>
        </div>
    </div>
</div>