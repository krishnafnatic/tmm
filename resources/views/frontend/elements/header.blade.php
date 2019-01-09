<header>
  <nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="{{ url('/') }}" title="{{ config('app.name', 'The MoneyMile') }}"> 
      <img src="{{ asset( 'frontend/images/the_money_mile_logo.png' ) }}" width="220" height="30" title="{{ config('app.name', 'The MoneyMile') }}" alt="{{ config('app.name', 'The MoneyMile') }}" />
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <form class="form-inline my-2 my-lg-0 ml-auto" action="{{ route( 'search' ) }}" method="post" role="search">
        {{ csrf_field() }}
        <div class="input-group">
          <input class="form-control py-2 border-right-0 border" type="text" placeholder="{{ __( 'messages.search' ) }}" id="search" name="q" />
          <span class="input-group-append">
            <button class="btn btn-outline-secondary border-left-0 border" type="submit">
              <i class="fa fa-search"></i>
            </button>
          </span>
        </div>
      </form>
      <ul class="navbar-nav ml-auto">
        @if( isset( $menu_header) && count( $menu_header ) > 0 )
          @foreach( $menu_header as $header )
            @if(count($header->child_menu_items) == 0 )
              <li class="nav-item {{ Request::is( $header->slug ) ? 'active' : '' }}">
                <a class="nav-link" href="{{ url( $header->slug ) }}" title="{{ $header->title }}" alt="{{ $header->title }}">
                  {{ $header->title }}
                  <span class="sr-only">(current)</span>
                </a>
              </li>
            @else 
              <li class="nav-item dropdown {{ Request::is('speaker*') ? 'active' : '' }}">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="{{ $header->title }}" alt="{{ $header->title }}">
                  {{ $header->title }}
                </a>
                <div class="dropdown-menu master-speaker" aria-labelledby="navbarDropdown">
                  @foreach( $header->child_menu_items as $child )
                    <a class="dropdown-item" href="{{ url( $child->slug ) }}" title="{{ $child->title }}" alt="{{ $child->title }}">{{ $child->title }}</a>
                  @endforeach
                </div>
              </li>
            @endif
          @endforeach
        @endif
        @guest
          <li class="nav-item active">
            <a class="nav-link" href="{{ route('login') }}" title="{{ __( 'messages.log_in' ) }}" alt="{{ __( 'messages.log_in' ) }}">
              {{ __( 'messages.log_in' ) }}
            </a>
          </li>
        @else
          <li class="nav-item dropdown dropleft">
            <a class="nav-link dropdown-toggle user-login-initials" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="{{ Auth::user()->name }}" alt="{{ Auth::user()->name }}" style="color: #fff !important; background: #666 !important; ">
              {{ substr( Auth::user()->name, 0, 1) }}
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              @if( isset( $menu_profile ) && count( $menu_profile ) > 0 )
                @foreach( $menu_profile as $profile )
                  <a href="{{ url( $profile->slug ) }}" target="{{ $profile->target }}" class="dropdown-item {{ $profile->icon_class}}" title="{{ $profile->title }}" alt="{{ $profile->title }}">
                      {{ $profile->title }}
                  </a>
                @endforeach
              @endif
              <div class="dropdown-divider"></div> 
              <a href="#" class="btn btn-default btn-flat"
                        onclick="event.preventDefault();
                           document.getElementById('logout-form').submit();" title="{{ __( 'messages.logout' ) }}" alt="{{ __( 'messages.logout' ) }}">
                {{ __( 'messages.logout' ) }}
              </a>
              <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                  {{ csrf_field() }}
              </form>
            </div>
          </li>
        @endguest
      </ul>
    </div>
  </nav>  
</header>