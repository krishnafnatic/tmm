@extends('backend.layouts.form_editor_master')

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
        <small>{{ __( 'messages.information' ) }}</small>
        <button type="button" class="btn btn-primary text-right" onclick="event.preventDefault();
                                 document.getElementById('information-form').submit();">
          @if(isset($id))
            <i class="fa fa-edit"></i>
            {{ __( 'messages.edit' ) }}
          @else
            <i class="fa fa-plus-circle"></i>
            {{ __( 'messages.add' ) }}
          @endif
        </button>
        <button type="button" class="btn btn-success btn-add-new" onclick="window.location='{{ url("admin/information") }}'">
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
          <a href="{{ route('admin.information') }}">
            {{ __( 'messages.information' ) }}
          </a>
        </li>
        <li class="active">
          @if(isset($id))
            {{ __( 'messages.edit' ) }}
          @else
            {{ __( 'messages.add' ) }}
          @endif
          {{ __( 'messages.information' ) }}
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
            <div class="row">
              <div class="col-md-12">
                <!-- Custom Tabs -->
                <div class="nav-tabs-custom">
                  <ul class="nav nav-tabs">
                    <li class="active"><a href="#general" data-toggle="tab">{{ __( 'messages.general' ) }}</a></li>
                  </ul>
                  <form class="form" id="information-form" role="form" method="POST" @if(isset($id)) action="{{ url("admin/information/$id/edit") }}" @else action="{{ route('admin.information.create.submit') }}" @endif>
                    {{ csrf_field() }}
                    <div class="tab-content">
                      <div class="tab-pane active" id="general">
                        <ul class="nav nav-tabs">
                          @if($languages) 
                            @foreach($languages as $lang)
                              <li class=" @if($loop->first) active @endif ">
                                <a href="#{{ strtolower( $lang->name ) }}" data-toggle="tab">{{ $lang->name }}</a>
                              </li>
                            @endforeach
                          @endif
                        </ul>
                        <div class="tab-content">
                          @if($languages) 
                            @foreach($languages as $lang)
                              <input type="hidden" id="language_id" name="information_description[{{ $lang->id }}][language_id]" value="{{ $lang->id }}" />
                              <div class="tab-pane @if($loop->first) active @endif"  id="{{ strtolower( $lang->name ) }}">
                                <div class="box-body">
                                  <div class="form-group{{ $errors->has('information_description.'.$lang->id.'.title') ? ' has-error' : '' }}">
                                    <label for="title">{{ __( 'messages.title' ) }}</label>
                                    <input type="text" class="form-control" id="title" name="information_description[{{ $lang->id }}][title]" placeholder="{{ __( 'messages.enter_title' ) }}" @if(isset($id)) value="{{ $info[$lang->id]['title'] }}" @else value="{{ old('information_description.'.$lang->id.'.title') }}" @endif maxlength="100" required autofocus autocomplete="off">
                                    @if ($errors->has('information_description.'.$lang->id.'.title'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('information_description.'.$lang->id.'.title') }}</strong>
                                      </span>
                                    @endif
                                  </div> 

                                  <div class="form-group{{ $errors->has('information_description.'.$lang->id.'.short_description') ? ' has-error' : '' }}">
                                    <label for="short_description">{{ __( 'messages.short_description' ) }}</label>
                                    <input type="text" class="form-control" id="short_description" name="information_description[{{ $lang->id }}][short_description]" placeholder="{{ __( 'messages.enter_short_description' ) }}" @if(isset($id)) value="{{ $info[$lang->id]['short_description'] }}" @else value="{{ old('information_description.'.$lang->id.'.short_description') }}" @endif maxlength="100" required autofocus autocomplete="off">
                                    @if ($errors->has('information_description.'.$lang->id.'.short_description'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('information_description.'.$lang->id.'.short_description') }}</strong>
                                      </span>
                                    @endif
                                  </div>

                                  <div class="form-group">
                                    <label for="description">{{ __( 'messages.description' ) }}</label>
                                    <textarea id="form_editor_{{ $lang->id }}" name="information_description[{{ $lang->id }}][description]" rows="10" cols="80">
                                      @if(isset($id)) {{ $info[$lang->id]['description'] }} @else {{ old('information_description.'.$lang->id.'.description')  }} @endif
                                    </textarea> 
                                    @if ($errors->has('description'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('description') }}</strong>
                                      </span>
                                    @endif
                                  </div>
                                  <!-- <div class="form-group{{ $errors->has('information_description.'.$lang->id.'.status') ? ' has-error' : '' }}">
                                    <label for="order">Status</label>
                                    <select name="information_description[{{ $lang->id }}][status]" id="status" class="form-control">
                                      <option value="1" @if(isset($info[$lang->id]['status']) && $info[$lang->id]['status'] == 1) selected="selected" @endif>{{ __( 'messages.active' ) }}</option>
                                      <option value="0" @if(isset($info[$lang->id]['status']) && $info[$lang->id]['status'] == 0) selected="selected" @endif>{{ __( 'messages.inactive' ) }}</option>
                                    </select>
                                    @if ($errors->has('information_description.'.$lang->id.'.status'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('information_description.'.$lang->id.'.status') }}</strong>
                                      </span>
                                    @endif
                                  </div> -->
                                  <div class="form-group{{ $errors->has('information_description.'.$lang->id.'.meta_title') ? ' has-error' : '' }}">
                                    <label for="meta_title">{{ __( 'messages.meta_title' ) }}</label>
                                    <input type="text" class="form-control" id="meta_title" name="information_description[{{ $lang->id }}][meta_title]" placeholder="{{ __( 'messages.enter_meta_title' ) }}" @if(isset($id)) value="{{ $info[$lang->id]['meta_title'] }}" @else value="{{ old('information_description.'.$lang->id.'.meta_title') }}" @endif maxlength="100"  autocomplete="off" />
                                    @if ($errors->has('information_description.'.$lang->id.'.meta_title'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('information_description.'.$lang->id.'.meta_title') }}</strong>
                                      </span>
                                    @endif
                                  </div>

                                  <div class="form-group{{ $errors->has('information_description.'.$lang->id.'.meta_description') ? ' has-error' : '' }}">
                                    <label for="meta_description">{{ __( 'messages.meta_description' ) }}</label>
                                    <input type="text" class="form-control" id="meta_description" name="information_description[{{ $lang->id }}][meta_description]" placeholder="{{ __( 'messages.enter_meta_desc' ) }}" @if(isset($id)) value="{{ $info[$lang->id]['meta_description'] }}" @else value="{{ old('information_description.'.$lang->id.'.meta_description') }}" @endif maxlength="155"  autocomplete="off" />
                                    @if ($errors->has('information_description.'.$lang->id.'.meta_description'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('information_description.'.$lang->id.'.meta_description') }}</strong>
                                      </span>
                                    @endif
                                  </div>
                                  
                                  <div class="form-group{{ $errors->has('information_description.'.$lang->id.'.meta_keyword') ? ' has-error' : '' }}">
                                    <label for="meta_keyword">{{ __( 'messages.meta_keyword' ) }}</label>
                                    <textarea id="meta_keyword" name="information_description[{{ $lang->id }}][meta_keyword]" rows="10" cols="80">@if(isset($id)) {{ $info[$lang->id]['meta_keyword'] }} @else {{ old('information_description.'.$lang->id.'.meta_keyword') }} @endif
                                    </textarea> 
                                    @if ($errors->has('information_description.'.$lang->id.'.meta_keyword'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('information_description.'.$lang->id.'.meta_keyword') }}</strong>
                                      </span>
                                    @endif
                                  </div>
                                </div>
                              </div>
                            @endforeach
                          @endif
                        </div>
                      </div>  
                      <!-- /.tab-pane -->
                    </div>
                  </form>
                  <!-- /.tab-content -->
                </div>
                <!-- nav-tabs-custom -->
              </div>
              <!-- /.col -->
            </div>
              <!-- /.box-body -->
          </div> 
        </div>
      </div>
    </section>
  </div>
@endsection