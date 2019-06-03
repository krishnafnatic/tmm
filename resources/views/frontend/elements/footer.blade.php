<footer class="container-fluid">
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col">
                <ul class="footer-nav">
                    @if( isset( $menu_footer ) &&count( $menu_footer ) > 0 )
                        @foreach( $menu_footer as $footer )
                            <li class="{{ $footer->icon_class }} nav-item {{ Request::is( $footer->slug ) ? 'active' : '' }}">
                                <a href="{{ url('/'.$footer->slug) }}" @if( !empty( $footer->target ) ) target="{{ $footer->target }}" @endif title="{{ $footer->title }}">
                                    {{ $footer->title }}
                                </a> 
                            </li>
                        @endforeach
                    @endif
                </ul>
            </div>
            <div class="col-md-auto footer-subscribe" id="divSubscribeMe">
                <h5>{{ __( 'messages.subscribe_newsletter' ) }}</h5>
                <div class="alert alert-dismissible" id="msgSubscribMe" style="display: none;"></div>
                <div class="form-inline my-2 my-lg-0 ml-auto {{ $errors->has('name') ? ' was-validated' : '' }}" style="margin-bottom: 20px !important;">
                    <input type="text" name="subscribe_name" id="subscribe_name" placeholder="{{ __( 'messages.name' ) }}" autocomplete="off" required />
                    <input type="email" name="subscribe_email" id="subscribe_email" placeholder="{{ __( 'messages.email' ) }}" autocomplete="off" required />
                    <button type="submit" onclick="subscribeMe();" id="subscribeMe">{{ __( 'messages.subscribe' ) }}</button>
                    @if ($errors->has('name'))
                        <span class="help-block">
                            <strong>{{ $errors->first('name') }}</strong>
                        </span>
                    @endif
                    <h6>{{ __( 'messages.never_span' ) }}</h6> 
                </div>
            </div>
            <div class="col footer-social">
                <h5>{{ __( 'messages.find_on_social' ) }}</h5>
                <ul class="">
                    <!-- <li> <a href="" target="_blank"> <i class="fab fa-youtube-square"></i>  </a> </li> -->
                    <li> 
                        <a href="https://www.facebook.com/TheMoneyMile/" target="_blank" title="Find us on Facebook">
                            <i class="fab fa-facebook-square"></i> 
                        </a> 
                    </li>
                    <li>
                        <a href="https://www.linkedin.com/company/themoneymile/" target="_blank" title="Find us on Linkedin">
                            <i class="fab fa-linkedin"></i> 
                        </a> 
                    </li>
                    <li>
                        <a href="https://twitter.com/themoney_mile" target="_blank" title="Find us on Twitter">
                            <i class="fab fa-twitter"></i> 
                        </a> 
                    </li>
                    <li> <a href="https://www.youtube.com/channel/UC73_eY1weV0FiplMNhzCWXQ" target="_blank"> <i class="fab fa-youtube-square"></i> </a> </li>
                </ul>
        </div>
    </div>
    <div class="container-fluid copyright ">
        <div class="container"> 
            <div class="row">
                <ul class="ft-menu col-4">
                    @if( isset( $menu_cms_footer ) && count( $menu_cms_footer ) > 0 )
                        @foreach( $menu_cms_footer as $cms_footer )
                            <li class="{{ $cms_footer->icon_class }} {{ Request::is( $cms_footer->slug ) ? 'active' : '' }}">
                                <a href="{{  url('/'.$cms_footer->slug)  }}" @if( !empty( $cms_footer->target ) ) target="{{ $cms_footer->target }}" @endif title="{{ $cms_footer->title }}">
                                    {{ $cms_footer->title }}
                                </a> 
                            </li>
                        @endforeach
                    @endif
                </ul>
                <div class="col-8 copy-note"> 
                    &copy; Copyright {{ \Carbon\Carbon::now()->format('Y') }}.
                    {{ __( 'messages.all_right_reserved' ) }}
                </div>
            </div>
        </div> 
    </div>
      <!-- Modal Login Start -->
  <div class="modal fade" id="close_tab" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title text-center" id="exampleModalCenterTitle"><b>{{ __( 'messages.subscribe_popup' ) }}</b></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #000;">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body"> 
          <div class="alert alert-danger alert-block" id="danger" style="display: none;">

          </div>
          <div class="alert alert-success alert-dismissable" id="success" style="display: none;">
            
          </div>
          <div class="row justify-content-md-center">
            <div class="col pr-0">
                  <a href="https://m.me/TheMoneyMile" target="_blank"> <img src="/frontend/images/close_tab_fb.png" class="img-fluid"> </a>
                
            </div> 
            <div class="col p-0 mr-3"> 
                <a href="" target="_blank"> <img src="/frontend/images/close_tab_whatsapp.png" class="img-fluid"> </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<!-- Modal Login End --> 

    <script>
        var subscribeMeURL=  "{{ url( '/subscribe' ) }}",
            loader    =   "{{ asset( 'frontend/images/loader.png' ) }}";
    </script>
    <script type="text/javascript">

$( document ).ready(function() {
   
var mouseX = 0;
var mouseY = 0;
var popupCounter = 0;

document.addEventListener("mousemove", function(e) {
   mouseX = e.clientX;
   mouseY = e.clientY;
   //document.getElementById("coordinates").innerHTML = "<br />X: " + e.clientX + "px<br />Y: " + e.clientY + "px";
});

$(document).mouseleave(function () {
   if (mouseY < 100) {
       if (popupCounter < 1) {
           //alert("Please don't close the tab!");
            $("#close_tab").modal();
       }
       popupCounter ++;
   }
});

});
   </script>
</footer>