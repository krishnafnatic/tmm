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
            <style type="text/css">
              .vjs-overlay.vjs-overlay-top-left {
                top: 0 !important;
   left: 0 !important;
   border-radius: 0 none !important;
                width: 100% !important;
                height: 28%;
                color: red;
                background-color: rgba(0,0,0,0.5) !important;
                text-align: left !important;
                font-family: 'Roboto', sans-serif;
                font-size: 16px;
              }
            </style> <!--  <script src="https://players.brightcove.net/videojs-overlay/2/videojs-overlay.min.js"></script> -->
<link href="https://players.brightcove.net/videojs-overlay/2/videojs-overlay.css" rel='stylesheet'>
<script src="https://players.brightcove.net/videojs-overlay/2/videojs-overlay.min.js"></script>

            <script type="text/javascript">
              videojs.getPlayer('myPlayerID').ready(function() {
                var myPlayer = this;
                var global;
                myPlayer.play();
                myPlayer.on('loadstart',function(){
                 global = parseInt(myPlayer.mediainfo.duration-10);
                 console.log(global);
                 myPlayer.overlay({
                  overlays: [{
                    content: '<ul class="social_share"><br><br><br>   <li>              <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=<?php echo URL::current(); ?>&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">                <img src="{{ asset( 'frontend/images/social/facebook.png' ) }}" alt="Facebook Share" title="Facebook Share" />              </a>            </li>            <li>              <a href="http://twitter.com/share?text=home&url=<?php echo URL::current(); ?>&twclid=true" target="_blank">                <img src="{{ asset( 'frontend/images/social/twitter.png' ) }}" alt="Twitter Share" title="Twitter Share" />              </a>            </li>           <li>              <a target="_blank" href="fb-messenger://share/?link=<?php echo URL::current(); ?>&app_id=356489725165043" class="fb-xfbml-parse-ignore">                <img src="{{ asset( 'frontend/images/social/messenger.png' ) }}" alt="Messenger Share" title="Messenger Share" />              </a>            </li>             <li>              <a href="share?url=<?php echo URL::current(); ?>&ggclid=true" target="_blank">                <img src="{{ asset( 'frontend/images/social/whatsapp.png' ) }}" alt="Whatsapp Share" title="Whatsapp Share" />              </a>            </li>            <li>              <a href="http://www.linkedin.com/shareArticle?mini=true&url=<?php echo urlencode( URL::current() ) ?>&liclid=true" target="_blank">                 <img src="{{ asset( 'frontend/images/social/linkedin.png' ) }}" alt="LinkedIn Share" title="LinkedIn Share" />              </a>            </li>          </ul>                     <div class="directLink">                         <span>Direct Link</span><br />                        <input type="text" name="direct_link" id="direct_link" style="color:black;" value="<?php echo URL::current(); ?>" />                     </div>',
                    start: global ,
                    end: 'ended',
                    align: 'top-left'
                  }]
                });
               })

              });

            </script>
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
