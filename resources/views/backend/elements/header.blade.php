<header class="main-header">
  <!-- Logo -->
  <a href="{{ route('admin.dashboard') }}" class="logo">
    <!-- mini logo for sidebar mini 50x50 pixels -->
    <span class="logo-mini">T<b>M</b>M</span>
    <!-- logo for regular state and mobile devices -->
    <span class="logo-lg"><b>{{ config('app.name') }}</b></span>
  </a>
  <!-- Header Navbar: style can be found in header.less -->
  <nav class="navbar navbar-static-top">
    <!-- Sidebar toggle button-->
    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
      <span class="sr-only">{{ __( 'messages.toggle_navigation' ) }}</span>
    </a>

    <div class="navbar-custom-menu">
      <ul class="nav navbar-nav">
        <!-- User Account: style can be found in dropdown.less -->
          
        @auth("admin")
            <li class="dropdown user user-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img src="{{ asset('backend/dist/img/avatar5.png')}}" class="user-image" alt="{{ __( 'messages.user_image' ) }}">
                <span class="hidden-xs">{{Auth::guard('admin')->user()->name}}</span>
              </a>
              <ul class="dropdown-menu">
                <!-- User image -->
                <li class="user-header">
                  <img src="{{ asset('backend/dist/img/avatar5.png')}}" class="img-circle" alt="{{ __( 'messages.user_image' ) }}">

                  <p>
                    {{Auth::guard('admin')->user()->name}}
                    <small>{{ __( 'messages.member_since' ) }}  {{ \Carbon\Carbon::parse(Auth::guard('admin')->user()->created_at)->format('M, d Y') }}</small>
                  </p>
                </li>
                <li class="user-footer">  
                  <div class="pull-right">
                    <a href="#" class="btn btn-default btn-flat"
                        onclick="event.preventDefault();
                                 document.getElementById('logout-form').submit();">{{ __( 'messages.sign_out' ) }}</a>
                    <form id="logout-form" action="{{ route('admin.logout') }}" method="POST" style="display: none;">
                        {{ csrf_field() }}
                    </form>
                  </div>
                </li>
              </ul>
            </li> 
        @endauth
      </ul>
    </div>
  </nav>
</header>