<section class="sidebar">
  <!-- Sidebar user panel -->
  <div class="user-panel">
    <div class="pull-left image">
      <img src="{{ asset('backend/dist/img/avatar5.png')}}" class="img-circle" alt="{{ __( 'messages.user_image' ) }}" />
    </div>
    <div class="pull-left info">
      <p>{{ config('app.name') }}</p>
      <a href="#"><i class="fa fa-circle text-success"></i> 
        {{ __( 'messages.online' ) }}
      </a>
    </div>
  </div>
  <!-- sidebar menu: : style can be found in sidebar.less -->
  <ul class="sidebar-menu" data-widget="tree">
    <li class="header"> {{ __( 'messages.main_navigation' ) }}</li>

    <li class="active">
      <a href="{{ route('admin.dashboard') }}">
        <i class="fa fa-dashboard"></i>
        <span>{{ __( 'messages.dashboard' ) }}</span>
      </a>
    </li>
    <li class="treeview">
      <a href="#">
        <i class="fa fa-th"></i>
        <span>{{ __( 'messages.manage_menu' ) }}</span>
        <span class="pull-right-container">
          <i class="fa fa-angle-left pull-right"></i>
        </span>
      </a>
      <ul class="treeview-menu">
        <li class="active">
          <a href="{{ route('admin.menu') }}">
            <i class="fa fa-list"></i>
            {{ __( 'messages.listing_menu' ) }}
          </a>
        </li>
        <li>
          <a href="{{ route('admin.menu.create') }}">
            <i class="fa  fa-plus"></i>
            {{ __( 'messages.create_menu' ) }}
          </a>
        </li>
      </ul>
    </li>
    <li class="treeview">
      <a href="{{ route('admin.video') }}">
        <i class="fa fa-volume-up"></i>
        <span>{{ __( 'messages.manage_video' ) }}</span>
        <span class="pull-right-container">
          <i class="fa fa-angle-left pull-right"></i>
        </span>
      </a>
      <!-- <ul class="treeview-menu">
        <li class="active">
          <a href="{{ route('admin.video') }}">
            <i class="fa fa-list"></i>
            {{ __( 'messages.listing_video' ) }}
          </a>
        </li>
      </ul> -->
    </li>
    <li class="treeview">
      <a href="#">
        <i class="fa fa-info"></i>
        <span>{{ __( 'messages.manage_info' ) }}</span>
        <span class="pull-right-container">
          <i class="fa fa-angle-left pull-right"></i>
        </span>
      </a>
      <ul class="treeview-menu">
        <li class="active">
          <a href="{{ route('admin.information') }}">
            <i class="fa fa-list"></i>
            {{ __( 'messages.listing_info' ) }}
          </a>
        </li>
        <li>
          <a href="{{ route('admin.information.create') }}">
            <i class="fa  fa-plus"></i>
            {{ __( 'messages.create_info' ) }}
          </a>
        </li>
        <li>
          <a href="{{ route('admin.staticpages') }}">
            <i class="fa fa-file"></i>
            <span>{{ __( 'messages.manage_staticpages' ) }}</span>
          </a>
        </li>
      </ul>
    </li>
    <li class="treeview">
      <a href="#">
        <i class="fa fa-volume-up"></i>
        <span>{{ __( 'messages.manage_speaker' ) }}</span>
        <span class="pull-right-container">
          <i class="fa fa-angle-left pull-right"></i>
        </span>
      </a>
      <ul class="treeview-menu">
        <li class="active">
          <a href="{{ route('admin.speaker') }}">
            <i class="fa fa-list"></i>
            {{ __( 'messages.listing_speaker' ) }}
          </a>
        </li>
        <li>
          <a href="{{ route('admin.speaker.create') }}">
            <i class="fa  fa-plus"></i>
            {{ __( 'messages.create_speaker' ) }}
          </a>
        </li>
      </ul>
    </li>
    <li class="treeview">
      <a href="#">
        <i class="fa fa-language"></i>
        <span>{{ __( 'messages.manage_lang' ) }}</span>
        <span class="pull-right-container">
          <i class="fa fa-angle-left pull-right"></i>
        </span>
      </a>
      <ul class="treeview-menu">
        <li class="active">
          <a href="{{ route('admin.language') }}">
            <i class="fa fa-list"></i>
            {{ __( 'messages.listing_lang' ) }}
          </a>
        </li>
        <li>
          <a href="{{ route('admin.language.create') }}">
            <i class="fa  fa-plus"></i>
            {{ __( 'messages.create_lang' ) }}
          </a>
        </li>
      </ul>
    </li>
    <li>
      <a href="{{ route('admin.user') }}">
        <i class="fa fa-users"></i>
        <span>{{ __( 'messages.manage_user' ) }}</span>
      </a>
    </li>
    <li>
      <a href="{{ route('admin.comment') }}">
        <i class="fa fa-comments"></i>
        <span>{{ __( 'messages.manage_comment' ) }}</span>
      </a>
    </li>
    <li>
      <a href="{{ route('admin.password.change') }}">
        <i class="fa fa-lock"></i>
        <span>{{ __( 'messages.change_password' ) }}</span>
      </a>
    </li> 
    <li>
      <a href="{{ route('admin.setting') }}">
        <i class="fa fa-gears"></i>
        <span>{{ __( 'messages.setting' ) }}</span>
      </a>
    </li>
  </ul>
</section>