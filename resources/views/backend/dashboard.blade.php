@extends('backend.layouts.master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        {{ __( 'messages.dashboard' ) }}
        <small>{{ __( 'messages.control_panel' ) }}</small>
      </h1>
      <ol class="breadcrumb">
        <li class="active">
          <i class="fa fa-dashboard"></i>&nbsp;&nbsp;
          {{ __( 'messages.dashboard' ) }}
        </li>
      </ol>
    </section>
    
    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      @include('backend.elements.messages')
      <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-video-camera"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">{{ __( 'messages.videos' ) }}</span>
              <span class="info-box-number">{{ App\Models\Video::all()->count() }}</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-th-list"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">{{ __( 'messages.playlists' ) }}</span>
              <span class="info-box-number">{{ App\Models\Playlist::all()->count() }}</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-tags"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">{{ __( 'messages.tags' ) }}</span>
              <span class="info-box-number">{{ App\Models\Tag::all()->count() }}</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-play-circle"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">{{ __( 'messages.players' ) }}</span>
              <span class="info-box-number">{{ App\Models\Player::all()->count() }}</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>

      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">  
              <i class="fa fa-video-camera"></i>&nbsp;&nbsp;&nbsp;&nbsp;{{ __( 'messages.add_update_videos' ) }}
            </div> 
            <a href="{{ route( 'admin.video' ) }}" class="small-box-footer">
              {{ __( 'messages.manually' ) }} <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div> 
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <i class="fa fa-th-list"></i>&nbsp;&nbsp;&nbsp;&nbsp;{{ __( 'messages.add_update_playlists' ) }}
            </div>
            <a href="{{ route( 'admin.playlist' ) }}" class="small-box-footer">
              {{ __( 'messages.manually' ) }} <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <i class="fa fa-tags"></i>&nbsp;&nbsp;&nbsp;&nbsp;{{ __( 'messages.add_update_tags' ) }}
            </div>
            <a href="{{ route( 'admin.tag' ) }}" class="small-box-footer">
              {{ __( 'messages.manually' ) }} <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          
          <div class="small-box bg-red">
            <div class="inner">
              <i class="fa fa-play-circle"></i>&nbsp;&nbsp;&nbsp;&nbsp;{{ __( 'messages.add_update_player' ) }}
            </div>
            <a href="{{ route('admin.player') }}" class="small-box-footer">
              {{ __( 'messages.manually' ) }} <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
      </div>

      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>{{ App\Models\User::where('role_id', 2)->count() }}</h3>

              <p>{{ __( 'messages.user_registrations' ) }}</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="{{ route('admin.user') }}" class="small-box-footer">
              {{ __( 'messages.more_info' ) }} <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div> 
      </div>
      <!-- /.row --> 

    </section>
    <!-- /.content -->
  </div>
@endsection