@extends('backend.layouts.form_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-user-plus"></i>
        {{ __( 'messages.view' ) }} {{ $user->name }}
        <small>{{ __( 'messages.profile' ) }}</small> 
        <button type="button" class="btn btn-success btn-add-new" onclick="window.location='{{ url("admin/user/") }}'">
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
          <a href="{{ route('admin.user') }}">
            {{ __( 'messages.user' ) }}
          </a>
        </li>
        <li class="active">
          {{ __( 'messages.profile' ) }}
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
              <li class="">
                <a href="#social" data-toggle="tab" aria-expanded="false">
                  {{ __( 'messages.social' ) }}
                </a>
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="detail">
                <form class="form-horizontal">
                  <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">{{ __( 'messages.name' ) }}</label>

                    <div class="col-sm-10">
                      <input  class="form-control" value="{{ $user->name }}" readonly="readonly" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">{{ __( 'messages.email' ) }}</label>

                    <div class="col-sm-10">
                      <input class="form-control" value="{{ $user->email }}" readonly="readonly" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="role" class="col-sm-2 control-label">{{ __( 'messages.role' ) }}</label>

                    <div class="col-sm-10">
                      <input class="form-control" value="{{ App\Models\Role::where( 'id', $user->role_id )->first()->name }}" readonly="readonly" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="mobile" class="col-sm-2 control-label">{{ __( 'messages.mobile' ) }}</label>

                    <div class="col-sm-10">
                      <input class="form-control" value="{{ $user->mobile }}" readonly="readonly" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="status" class="col-sm-2 control-label">{{ __( 'messages.status' ) }}</label>

                    <div class="col-sm-10">
                      <select class="form-control" readonly>
                        @if($user->status == 1)
                          <option>{{ __( 'messages.user_created' ) }}</option>
                        @else
                          <option>{{ __( 'messages.user_verified' ) }}</option>
                        @endif
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="age" class="col-sm-2 control-label">{{ __( 'messages.age_group' ) }}</label>

                    <div class="col-sm-10">
                      <input class="form-control" value="{{ $user_social['age'] }}" readonly="readonly" />
                    </div>
                  </div> 

                  <div class="form-group">
                    <label for="tag" class="col-sm-2 control-label">{{ __( 'messages.user_tags' ) }}</label>

                    <div class="col-sm-10">
                      <input class="form-control" value="{{ $user_social['tag'] }}" readonly="readonly" />
                    </div>
                  </div> 
                </form>
              </div>
              <div class="tab-pane" id="social">
                <form class="form-horizontal">
                  <div class="form-group">
                    <label for="facebook" class="col-sm-2 control-label">{{ __( 'messages.facebook' ) }}</label>

                    <div class="col-sm-10">
                      <input  class="form-control" value="{{ $user_social['facebook'] }}" readonly="readonly" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="linkedin" class="col-sm-2 control-label">{{ __( 'messages.linkedin' ) }}</label>

                    <div class="col-sm-10">
                      <input class="form-control" value="{{ $user_social['linkedin'] }}" readonly="readonly" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="google" class="col-sm-2 control-label">{{ __( 'messages.google' ) }}</label>

                    <div class="col-sm-10">
                      <input class="form-control" value="{{ $user_social['google'] }}" readonly="readonly" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="twitter" class="col-sm-2 control-label">{{ __( 'messages.twitter' ) }}</label>

                    <div class="col-sm-10">
                      <input class="form-control" value="{{ $user_social['twitter'] }}" readonly="readonly" />
                    </div>
                  </div>
                </form>
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