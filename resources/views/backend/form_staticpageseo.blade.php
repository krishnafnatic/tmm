@extends('backend.layouts.form_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        @if(isset($id))
          <i class="fa fa-edit"></i>
          {{ __( 'messages.edit' ) }}
        @else
          <i class="fa fa-plus"></i>
          {{ __( 'messages.add' ) }}
        @endif
        <small>{{ __( 'messages.staticpages' ) }}</small>
        <button type="button" class="btn btn-success btn-add-new" onclick="window.location='{{ url("admin/staticpages/") }}'">
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
          <a href="{{ route('admin.staticpages') }}">
            {{ __( 'messages.staticpages' ) }}
          </a>
        </li>
        <li class="active">
          @if(isset($id))
            {{ __( 'messages.edit' ) }}
          @else
            {{ __( 'messages.add' ) }}
          @endif
          {{ __( 'messages.staticpages' ) }}
        </li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content" style="margin: 0 auto; width:80%;">
      <div class="row">
        <!-- left column -->
        <div class="col-md-9 col-md-offset-1">
          <!-- general form elements -->
          @include('backend.elements.messages')
          <div class="box box-primary">
            <form class="form" role="form" method="POST" @if(isset($id)) action="{{ url("admin/staticpages/$id/edit") }}" @else action="{{ route('admin.staticpages.create.submit') }}" @endif>
              {{ csrf_field() }}
              <div class="box-body">
                <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                  <label for="name">{{ __( 'messages.page_name' ) }}</label>
                  <em style="color: red">( Website Page Name )</em>
                  <input type="text" class="form-control" id="name" name="name" placeholder="{{ __( 'messages.name' ) }}" @if(isset($id)) readonly value="{{ $staticPageDetails[0]->name }}" @else value="{{ old('name') }}" @endif maxlength="50" required autocomplete="off" />
                  @if ($errors->has('name'))
                    <span class="help-block">
                        <strong>{{ $errors->first('name') }}</strong>
                    </span>
                  @endif
                </div> 
              </div>

              <div class="box-body">
                <div class="form-group{{ $errors->has('route') ? ' has-error' : '' }}">
                  <label for="route">{{ __( 'messages.page_route' ) }}</label>
                  <em style="color: red">( Use For Mapping )</em>
                  <input type="text" class="form-control" id="route" name="route" placeholder="{{ __( 'messages.route' ) }}" @if(isset($id)) readonly value="{{ $staticPageDetails[0]->route }}" @else value="{{ old('route') }}" @endif maxlength="50" required autocomplete="off" />
                  @if ($errors->has('route'))
                    <span class="help-block">
                        <strong>{{ $errors->first('route') }}</strong>
                    </span>
                  @endif
                </div> 
              </div>

              <div class="box-body">
                <div class="form-group{{ $errors->has('meta_title') ? ' has-error' : '' }}">
                  <label for="meta_title">{{ __( 'messages.meta_title' ) }}</label>
                  <input type="text" class="form-control" id="meta_title" name="meta_title" placeholder="{{ __( 'messages.meta_title' ) }}" @if(isset($id)) value="{{ $staticPageDetails[0]->meta_title }}" @else value="{{ old('meta_title') }}" @endif maxlength="50" required autocomplete="off" />
                  @if ($errors->has('meta_title'))
                    <span class="help-block">
                        <strong>{{ $errors->first('meta_title') }}</strong>
                    </span>
                  @endif
                </div> 
              </div>

              <div class="box-body">
                <div class="form-group{{ $errors->has('meta_description') ? ' has-error' : '' }}">
                  <label for="meta_description">{{ __( 'messages.meta_description' ) }}</label>
                  <input type="text" class="form-control" id="meta_description" name="meta_description" placeholder="{{ __( 'messages.meta_description' ) }}" @if(isset($id)) value="{{ $staticPageDetails[0]->meta_description }}" @else value="{{ old('meta_description') }}" @endif maxlength="50" required autocomplete="off" />
                  @if ($errors->has('meta_description'))
                    <span class="help-block">
                        <strong>{{ $errors->first('meta_description') }}</strong>
                    </span>
                  @endif
                </div> 
              </div>

              <div class="box-body">
                <div class="form-group{{ $errors->has('meta_keyword') ? ' has-error' : '' }}">
                  <label for="meta_keyword">{{ __( 'messages.meta_keyword' ) }}</label>
                  <input type="text" class="form-control" id="meta_keyword" name="meta_keyword" placeholder="{{ __( 'messages.meta_keyword' ) }}" @if(isset($id)) value="{{ $staticPageDetails[0]->meta_keyword }}" @else value="{{ old('meta_keyword') }}" @endif maxlength="50" required autocomplete="off" />
                  @if ($errors->has('meta_keyword'))
                    <span class="help-block">
                        <strong>{{ $errors->first('meta_keyword') }}</strong>
                    </span>
                  @endif
                </div> 
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">{{ __( 'messages.submit' ) }}</button>
              </div>
            </form>
          </div> 
        </div>
      </div>
    </section>
  </div>
@endsection