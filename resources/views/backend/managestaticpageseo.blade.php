@extends('backend.layouts.form_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
          <i class="fa fa-video-camera"></i>
          {{ __( 'messages.manage_staticpagesseo' ) }}
        <small>{{ __( 'messages.manage_seotags' ) }}</small>
        <button type="button" class="btn btn-success btn-add-new" onclick="window.location='{{ url("admin/video") }}'">
          <i class="fa fa-arrow-circle-left"></i>
          {{ __( 'messages.back' ) }}
        </button>
      </h1>
      <ol class="breadcrumb">
        <li>
          <a href="{{ route('admin.dashboard') }}">
            <i class="fa fa-dashboard"></i> 
            {{ __( 'messages.dashboard' ) }}
          </a>
        </li>
        <li class="active">
          {{ __( 'messages.manage_seotags' ) }}
        </li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content" style="margin: 0 auto; width:80%;">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12 ">
          <!-- general form elements -->
          @include('backend.elements.messages')
          <div class="box box-primary">
            <div class="box-body">
              <table id="listing2" class="table table-bordered table-hover" width="100%">
                <thead>
                  <tr>
                    <th>
                      {{ __( 'messages.image_of_the_video' ) }}
                    </th>
                    <th>
                      {{ __( 'messages.brightcove_video_id' ) }} 
                    </th>
                    <th>
                      {{ __( 'messages.name_of_the_video' ) }} 
                    </th>
                  </tr>
                </thead>
                <tbody>  
                  <tr>
                    <td>
                      @if( !empty( $video->images['thumbnail']['src'] ) )
                        <img class="card-img-top img-fluid" src="{{  $video->images['thumbnail']['src'] }}" alt="{{ $video->name }}" title="{{ $video->name }}" width="120" height="80" />
                      @else
                        <img class="card-img-top img-fluid" src="{{ asset( 'frontend/images/image_placeholder.png' ) }}" alt="{{ $video->name }}" title="{{ $video->name }}" width="120" height="80" />
                      @endif
                    </td>
                    <td>{{ $video->id }}</td> 
                    <td><h3>{{ $video->name }}</h3></td> 
                  </tr> 
                </tbody> 
              </table> 
            </div>
            <form class="form" role="form" method="POST" @if( isset( $video->seoID ) && !empty( $video->seoID ) ) action="{{ route('admin.seoTagEdit') }}" @else action="{{ route('admin.seoTagAdd') }}" @endif  autocomplete="on">
              {{ csrf_field() }}
              <input type="hidden" name="video_id" id="video_id" value="{{ $video->id }}" />
              <div class="box-body">
                <div class="form-group{{ $errors->has('meta_title') ? ' was-validated' : '' }}">
                  <label class="col-12 pl-0" for="meta_title">
                      {{ __( 'messages.meta_title' ) }}
                  </label>
                  <input id="meta_title" type="text" name="meta_title" class="col-12 form-control" value="@if( isset( $video->mTitle ) && !empty( $video->mTitle ) ){{ $video->mTitle }}@else{{ old( 'meta_title' ) }}@endif" autocomplete="off" minlength="5" maxlength="100" required autofocus />
                  @if ($errors->has('meta_title'))
                      <span class="text-danger">
                          <strong>{{ $errors->first('meta_title') }}</strong>
                      </span>
                  @endif
                </div>  

                <div class="form-group{{ $errors->has('meta_description') ? ' was-validated' : '' }}">
                  <label class="col-12 pl-0" for="meta_description">
                      {{ __( 'messages.meta_description' ) }}
                  </label>
                  <input id="meta_description" type="text" name="meta_description" class="col-12 form-control is-invalid" value="@if( isset( $video->mDesc ) && !empty( $video->mDesc ) ){{ $video->mDesc }}@else{{ old( 'meta_description' ) }}@endif" autocomplete="off" minlength="5" required />
                  @if ($errors->has('meta_description'))
                      <span class="text-danger">
                          <strong>{{ $errors->first('meta_description') }}</strong>
                      </span>
                  @endif
                </div> 

                <div class="form-group{{ $errors->has('meta_keyword') ? ' was-validated' : ''}}">
                  <label class="col-12 pl-0" for="meta_keyword">
                      {{ __( 'messages.meta_keyword' ) }}
                  </label>
                  <textarea class="form-control" id="meta_keyword" name="meta_keyword" rows="2" cols="80">@if( isset( $video->mTag ) && !empty( $video->mTag ) ){{ $video->mTag }}@else{{ old( 'meta_keyword' ) }}@endif</textarea> 
                  @if ($errors->has('meta_keyword'))
                    <span class="text-danger">
                        <strong>{{ $errors->first('meta_keyword') }}</strong>
                    </span>
                  @endif
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                @if( isset( $video->seoID ) && !empty( $video->seoID ) )
                  <input type="hidden" name="seo_id" id="seo_id" value="{{ $video->seoID }}" />
                  <button type="submit" class="btn btn-primary float-right">{{ __( 'messages.edit' ) }}</button>
                @else
                  <button type="submit" class="btn btn-primary float-right">{{ __( 'messages.add' ) }}</button>
                @endif
              </div>
            </form>
          </div> 
        </div>
      </div>
    </section>
  </div>
@endsection