@extends('backend.layouts.listing_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-video-camera"></i>
        {{ __( 'messages.video' ) }}
        <small>{{ __( 'messages.listing' ) }}</small> 
      </h1>
      <ol class="breadcrumb">
        <li>
          <a href="{{ route('admin.dashboard') }}">
            <i class="fa fa-dashboard"></i> 
            {{ __( 'messages.dashboard' ) }} 
          </a>
        </li>
        <li class="active">
          {{ __( 'messages.listing_video' ) }}
        </li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          @include('backend.elements.messages')
          <div class="box">
            <div class="box-body">
              <table id="listing2" class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <th>
                      {{ __( 'messages.brightcove_video_id' ) }} 
                    </th>
                    <th>
                      {{ __( 'messages.name_of_the_video' ) }} 
                    </th>
                    <th>
                      {{ __( 'messages.action' ) }}
                    </th>
                  </tr>
                </thead>
                <tbody> 
                  @foreach($videos as $video)
                  <tr>
                    <td>{{ $video['id'] }}</td>
                    <td>{{ $video['name'] }}</td>
                    <td> 
                      @php
                          $videoID = $video['id'];
                          $color = '';
                          if( isset( $video['seoID'] ) && !empty( $video['seoID'] ) ) {
                            $color = 'bg-green';
                            $fa = 'fa fa-edit';
                          } else {
                            $color = 'bg-red';
                            $fa = 'fa fa-plus-circle';
                          }
                      @endphp
                      <button type="button" class="btn {{ $color }} text-right view" onclick="window.location='{{ url("admin/video/$videoID/manageSeoTag") }}'">
                        <i class="{{ $fa }}" aria-hidden="true"></i>
                        {{ __( 'messages.meta_tags' ) }}
                      </button> 
                    </td>
                  </tr>
                  @endforeach
                </tbody>
                <tfoot>
                  <tr>
                    <th>
                      {{ __( 'messages.name' ) }}
                    </th>
                    <th>
                      {{ __( 'messages.name_of_the_video' ) }} 
                    </th>
                    <th>
                      {{ __( 'messages.action' ) }}
                    </th>
                  </tr>
                </tfoot>
              </table> 
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <style type="text/css">
     .sorting_asc, .sorting_desc {
      float: left;
      width: 80px !important;
    }
  </style>
@endsection