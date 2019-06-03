	@extends('frontend.layouts.video_detail_master')


	@section('content')
	
 <div class="container-fluid px-0">
  <div class="single-detail-video container" >
    @include('frontend.elements.message')
    <div class="alert alert-dismissible" id="msgDiv" style="display: none;"></div>
    <div class="card" id="divMainContainer">
     <div class="card-image" style="position:relative;">
       <div class="social_share_custom" id="social_share_custom" style="display: none;">
        <a class="social_close" id="social_close" title="Close" onclick="document.getElementById('social_share_custom').style.display='none';"> 
          <i class="fa fa-times"></i>
        </a>
        <ul class="social_share">
          <li>
            <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=<?php echo URL::current(); ?>&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">
              <img src="{{ asset( 'frontend/images/social/facebook.png' ) }}" alt="Facebook Share" title="Facebook Share" />
            </a>
          </li>
          <li>
            <a href="http://twitter.com/share?text={{ $video_detail['description'] }}&url=<?php echo URL::current(); ?>&twclid=true" target="_blank">
              <img src="{{ asset( 'frontend/images/social/twitter.png' ) }}" alt="Twitter Share" title="Twitter Share" />
            </a>
          </li>
          <li>
            <a target="_blank" href="fb-messenger://share/?link=<?php echo URL::current(); ?>&app_id=356489725165043" class="fb-xfbml-parse-ignore">
              <img src="{{ asset( 'frontend/images/social/messenger.png' ) }}" alt="Messenger Share" title="Messenger Share" />
            </a>
          </li> 
          <li>
            <a href="share?url=<?php echo URL::current(); ?>&ggclid=true" target="_blank">
              <img src="{{ asset( 'frontend/images/social/whatsapp.png' ) }}" alt="Whatsapp Share" title="Whatsapp Share" />
            </a>
          </li>
          <li>
           <a href="http://www.linkedin.com/shareArticle?mini=true&url=<?php echo urlencode( URL::current() ) ?>&liclid=true" target="_blank">
             <img src="{{ asset( 'frontend/images/social/linkedin.png' ) }}" alt="LinkedIn Share" title="LinkedIn Share" />
           </a>
         </li>
       </ul> 
       <div class="directLink"> 
        <span>Direct Link</span><br />
        <input type="text" name="direct_link" id="direct_link" value="<?php echo URL::current(); ?>" /> 
      </div>
    </div>
    <!-- <div class="embed-responsive embed-responsive-16by9"> -->
	                      	<!-- <iframe src="//players.brightcove.net/{{ $video_detail['account_id'] }}/oNgLTdNCH_default/index.html?videoId={{ $video_detail['video_id'] }}" 
							allowfullscreen 
							webkitallowfullscreen 
							mozallowfullscreen id="myPlayerID"></iframe> -->
							<div style="position: relative; display: block; max-width: 1090px;">
								<div style="padding-top: 56.25%;">
									<video  id="myPlayerID"
                  data-video-id="{{ $video_detail['video_id'] }}" 
                  data-player="oNgLTdNCH" 
                  data-embed="default" 
                  data-application-id 
                  class="video-js"
                  @if( null !== app('request')->input('fbclid') ) autoplay muted @endif
                  controls style="position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; width: 100%; height: 100%;"></video>
                  <script src="//players.brightcove.net/{{ $video_detail['account_id'] }}/oNgLTdNCH_default/index.min.js"></script>
                </div>
              </div>
              <!-- </div> -->
            </div>

            <p style="display: none;">video start cookie value = <span id="cookieDisplay1"></span></p>
            <p style="display: none;">current cookie value = <span id="cookieDisplay2"></span></p>

            <div class="row single-video-title-padding">
             <div class="card-content col-sm-9">       
               <h1 class="card-title">
                {{ $video_detail['name'] }}
              </h1>
              <p>{{ $video_detail['description'] }}</p>
            </div>

            @include('frontend.video_details.tag' )
          </div>
        </div>
      </div>
    </div>  
    <!-- Single detail-video Start Here -->
    <div class="container">
     <div class="speaker-comment-box card">
      <ul class="nav nav-pills mb-3 tabbing" id="pills-tab" role="tablist">
       <li class="nav-item">
        <a class="nav-link active" id="speaker-tab" data-toggle="tab" href="#tab-speaker" role="tab" aria-controls="tab-speaker" aria-selected="true">
         {{ __( 'messages.speakers') }}
       </a>
     </li>
     <li class="nav-item">
      <a class="nav-link" id="comment-tab" data-toggle="tab" href="#descriptions" role="tab" aria-controls="comment" aria-selected="false">
      {{ __( 'messages.description') }}</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="comment-tab" data-toggle="tab" href="#comments" role="tab" aria-controls="comment" aria-selected="false">Comments</a>
    </li>
  </ul>
  <div class="tab-content" id="pills-tabContent">
   <div class="tab-pane fade show active" id="tab-speaker" role="tabpanel" aria-labelledby="speaker-tab">
     @include('frontend.video_details.speaker', [ 'speakers' => $speakers])
   </div>
   <div class="tab-pane fade" id="descriptions" role="tabpanel" aria-labelledby="speaker-tab">
     {!! $video_detail['long_description'] !!}
   </div>
   <div class="tab-pane fade" id="comments" role="tabpanel" aria-labelledby="comment-tab">
    @guest
    <div class="not-login">
     <h5>{{ __( 'messages.join_conversation' ) }}</h5>
     <a href="" class="btn" data-toggle="modal" data-target="#user-login">
      {{ __( 'messages.login_comment' ) }}
    </a>
  </div>
  @else
  <!-- Comments box start-->
  <div class="alert alert-dismissable" id="msgComment" style="display: none;">
  </div>
  <div class="row comments-box">
    <textarea class="type-main-comment" placeholder="{{ __( 'messages.add_comment' ) }}" onclick="event.preventDefault();enableComment( 'main_comment' );" maxlength="{{ env( 'total_characters' ) }}" id="comment"></textarea>
  </div>
  <div class="word-counter">
    <label id="count-label">{{ env( 'total_characters' ) }}</label> 
    {{ __( 'messages.characters_remaining' ) }} 

  </div>
  <div class="float-right  comment-action-group" style="display: none;" id="main_comment">
    <input type="button" onclick="event.preventDefault();cancelComment( 'main_comment', 'comment', 'count-label' );" class="btn cancel-comment btn-secondary btn-sm " value="Cancel" />
    <input type="submit" disabled class="btn btn-secondary btn-sm" value="Comment" id="submitComment" />
  </div>
  @endguest

  <div class="row" id="commentListing"></div>
</div>
</div>
</div>
<!-- Remaning Ad and Page with Videos Start-->
<div class="tmm-image-ad d-none" id="home-ad-1">
  <a href="#">
    <img src="{{ asset( 'frontend/images/tmm-ad.jpg' ) }}" class="img-fluid"  title="Advertisment" alt="Advertisment" /> 
  </a>
</div>  
@if( isset( $watch_next ) && count( $watch_next) > 0 )
@include('frontend.video_details.watch_next')
@endif

@if( isset( $playlist_watch_next ) && count( $playlist_watch_next) > 0 )
@foreach( $playlist_watch_next as $home)
@include('frontend.video_details.playlist_video', [ 'playlist_videos' => $home ])
@endforeach
@endif

@if( isset( $folder_watch_next ) && count( $folder_watch_next) > 0 )
@foreach( $folder_watch_next as $home)
@include('frontend.video_details.folder_video', [ 'folder_videos' => $home ])
@endforeach
@endif

@if (Auth::check())
@include('frontend.video_details.my_list')
@endif
</div>
@guest
<input type="hidden" value="0" id="logged_user_id" />
@else
<input type="hidden" value="{{ Auth::user()->id }}" id="logged_user_id" />
@endguest
@include('frontend.video_details.login_popup')

<script>
 var account_id 	= 	"{{ $video_detail['account_id'] }}",
 playlist_id = "{{ $playlist_watch_next['playlist']['playlist_id'] }}",
 video_id 	= 	"{{ $video_detail['video_id'] }}",
 analyticsURL =  "{{ url( 'bc/analytics' ) }}",
 loginURL 	 =  "{{ url( '/loginAjax' ) }}",
 commentListURL 	 =  "{{ url( '/commentList' ) }}",
 commentURL 	 =  "{{ url( '/comment' ) }}",
 wishListURL   =  "{{ url( '/wishList' ) }}",
 msg       =   "{{ __( 'messages.error_ajax' ) }}",
 requiredEmail  = "{{ __( 'validation.required', ['attribute' => 'Email' ] ) }}",
 requiredPWD  = "{{ __( 'validation.required', ['attribute' => 'Password' ] ) }}",
 emailValid  = "{{ __( 'validation.email', ['attribute' => 'Email' ] ) }}",
 pwdValid	= "{{ __( 'messages.pwdVaild', ['attribute' => 'Password']) }}",
 limitCharacters = "{{ env( 'total_characters' ) }}",
 charactersRemaining = "{{ __( 'messages.characters_remaining' ) }}",
 checkIsWhishListURL = "{{ url( '/checkIsWhishList' ) }}",
 heart_normal = "{{ asset( 'frontend/images/social/heart_normal.png' ) }}",
 heart_red = "{{ asset( 'frontend/images/social/heart_red.png' ) }}";
</script>
<!-- <script src="//players.brightcove.net/{{ $video_detail['account_id'] }}/oNgLTdNCH_default/index.min.js"></script> -->
<link href="https://players.brightcove.net/videojs-overlay/2/videojs-overlay.css" rel='stylesheet'>
<script src="https://players.brightcove.net/videojs-overlay/2/videojs-overlay.min.js"></script>
<style type="text/css">
  .vjs-overlay.vjs-overlay-top-left {
   top: 0 !important;
   left: 0 !important;
   border-radius: 0 none !important;
    width: 100%;
    height: 28%;
    color: red;
    background-color: rgba(0,0,0,0.5);
    text-align: left !important;
    font-family: 'Roboto', sans-serif;
                font-size: 16px;
  }
</style>
<script type="text/javascript">
  videojs.getPlayer('myPlayerID').ready(function() {
    var myPlayer = this;
    var global;
    myPlayer.play();
    myPlayer.on('loadstart',function(){
     global = parseInt(myPlayer.mediainfo.duration-10);
     console.log(global);
     myPlayer.overlay({
      overlays: [{          content: '<ul class="social_share"> <br><br><br> <li>              <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=<?php echo URL::current(); ?>&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">                <img src="{{ asset( 'frontend/images/social/facebook.png' ) }}" alt="Facebook Share" title="Facebook Share" />              </a>            </li>            <li>              <a href="http://twitter.com/share?text={{ $video_detail['description'] }}&url=<?php echo URL::current(); ?>&twclid=true" target="_blank">                <img src="{{ asset( 'frontend/images/social/twitter.png' ) }}" alt="Twitter Share" title="Twitter Share" />              </a>            </li>           <li>              <a target="_blank" href="fb-messenger://share/?link=<?php echo URL::current(); ?>&app_id=356489725165043" class="fb-xfbml-parse-ignore">                <img src="{{ asset( 'frontend/images/social/messenger.png' ) }}" alt="Messenger Share" title="Messenger Share" />              </a>            </li>             <li>              <a href="share?url=<?php echo URL::current(); ?>&ggclid=true" target="_blank">                <img src="{{ asset( 'frontend/images/social/whatsapp.png' ) }}" alt="Whatsapp Share" title="Whatsapp Share" />              </a>            </li>            <li>              <a href="http://www.linkedin.com/shareArticle?mini=true&url=<?php echo urlencode( URL::current() ) ?>&liclid=true" target="_blank">                 <img src="{{ asset( 'frontend/images/social/linkedin.png' ) }}" alt="LinkedIn Share" title="LinkedIn Share" />              </a>            </li>          </ul>                     <div class="directLink">                         <span>Direct Link</span><br />                        <input type="text" name="direct_link" id="direct_link" style="color:black;" value="<?php echo URL::current(); ?>" />                     </div>',
      start: global ,
      end: 'ended',
      align: 'top-left'
    }]
  });
   })
    
  });
  
</script>
@endsection
