<footer class="container-fluid">
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col">
                <ul class="footer-nav">
                    @if( isset( $menu_footer ) &&count( $menu_footer ) > 0 )
                        @foreach( $menu_footer as $footer )
                            <li class="{{ $footer->icon_class }} nav-item {{ Request::is( $footer->slug ) ? 'active' : '' }}">
                                <a href="{{ url('/'.$footer->slug) }}" target="{{ $footer->target }}">
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
                <div class="form-inline my-2 my-lg-0 ml-auto {{ $errors->has('name') ? ' was-validated' : '' }}" role="subscribe">
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
                    <li> <a href="" target="_tab"> <i class="fab fa-youtube-square"></i>  </a> </li>
                    <li> <a href="" target="_tab"> <i class="fab fa-facebook-square"></i> </a> </li>
                    <li> <a href="" target="_tab"> <i class="fab fa-linkedin"></i> </a> </li>
                    <li> <a href="" target="_tab"> <i class="fab fa-twitter"></i> </a> </li>
                    <li> <a href="" target="_tab"> <i class="fab fa-google-plus-g"></i> </a> </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container-fluid copyright ">
        <div class="container"> 
            <div class="row">
                <ul class="ft-menu col-4">
                    @if( isset( $menu_cms_footer ) && count( $menu_cms_footer ) > 0 )
                        @foreach( $menu_cms_footer as $cms_footer )
                            <li class="{{ $cms_footer->icon_class }} {{ Request::is( $cms_footer->slug ) ? 'active' : '' }}">
                                <a href="{{  url('/'.$cms_footer->slug)  }}" target="{{ $cms_footer->target }}">
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
    <script type="text/javascript">
        var subscribeMeURL=  "{{ url( '/subscribe' ) }}",
            loader    =   "{{ asset( 'frontend/images/loader.png' ) }}";
    </script>
</footer>