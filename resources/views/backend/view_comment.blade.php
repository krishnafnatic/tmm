@extends('backend.layouts.form_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-comment-o"></i>
        {{ __( 'messages.view' ) }}
        <small>{{ __( 'messages.comment' ) }}</small> 
        <button type="button" class="btn btn-success btn-add-new" onclick="window.location='{{ url("admin/comment/") }}'">
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
        <li>
          <a href="{{ route('admin.comment') }}">
            {{ __( 'messages.comment' ) }}
          </a>
        </li>
        <li class="active">
          {{ __( 'messages.comment' ) }}
        </li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content" style="margin: 0 auto; width:80%;">
      <div class="row">
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active">
                <a href="#detail" data-toggle="tab" aria-expanded="false">
                  {{ __( 'messages.detail' ) }}
                </a>
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="detail">
                <form class="form-horizontal">
                  <div class="form-group">
                    <label for="status" class="col-sm-2 control-label">{{ __( 'messages.parent' ) }}</label>
                    <div class="col-sm-10">
                      <input  class="form-control" value="{{ $user_comment['parent'] }}" readonly="readonly" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">{{ __( 'messages.username' ) }}</label>

                    <div class="col-sm-10">
                      <input  class="form-control" value="{{ $user_comment['user_name'] }}" readonly="readonly" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">{{ __( 'messages.videoname' ) }}</label>

                    <div class="col-sm-10">
                      <input class="form-control" value="{{ $user_comment['video_name'] }}" readonly="readonly" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="role" class="col-sm-2 control-label">{{ __( 'messages.language' ) }}</label>

                    <div class="col-sm-10">
                      <input class="form-control" value="{{ $user_comment['lang_name'] }}" readonly="readonly" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="mobile" class="col-sm-2 control-label">{{ __( 'messages.comment' ) }}</label>

                    <div class="col-sm-10">
                      <textarea class="form-control" readonly="readonly">{{ $user_comment['comment'] }}</textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="status" class="col-sm-2 control-label">{{ __( 'messages.status' ) }}</label>
                    <div class="col-sm-10">
                      <input class="form-control" value="{{ $user_comment['status'] }}" readonly="readonly" />
                    </div>
                  </div>
                </form>
              </div>
              <div class="tab-pane" id="social">
                
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
      </div>
    </section>
  </div>
@endsection