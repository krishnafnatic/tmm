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
        <small>{{ __( 'messages.speaker' ) }}</small>
        <button type="button" class="btn btn-primary text-right" onclick="event.preventDefault();
                                 document.getElementById('speaker-form').submit();">
          @if(isset($id))
            <i class="fa fa-edit"></i>
            {{ __( 'messages.edit' ) }}
          @else
             <i class="fa fa-plus-circle"></i>
            {{ __( 'messages.add' ) }}
          @endif
        </button>
        <button type="button" class="btn btn-success btn-add-new" onclick="window.location='{{ url("admin/speaker") }}'">
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
          <a href="{{ route('admin.speaker') }}">
            {{ __( 'messages.speaker' ) }}
          </a>
        </li>
        <li class="active">
          @if(isset($id))
            {{ __( 'messages.edit' ) }}
          @else
            {{ __( 'messages.add' ) }}
          @endif
          {{ __( 'messages.speaker' ) }}
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
                    <li class="active">
                      <a href="#general" data-toggle="tab">
                        {{ __( 'messages.general' ) }}
                      </a>
                    </li>
                    <li class="">
                      <a href="#extra" data-toggle="tab">
                        {{ __( 'messages.extra' ) }}
                      </a>
                    </li>
                    <li class="">
                      <a href="#social" data-toggle="tab">
                        {{ __( 'messages.social' ) }}
                      </a>
                    </li>
                  </ul>
                  <form class="form" id="speaker-form" role="form" method="POST" @if(isset($id)) action="{{ url("admin/speaker/$id/edit") }}" @else action="{{ route('admin.speaker.create.submit') }}" @endif enctype="multipart/form-data">
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
                              <input type="hidden" id="language_id" name="speaker_description[{{ $lang->id }}][language_id]" value="{{ $lang->id }}" />
                              <div class="tab-pane @if($loop->first) active @endif"  id="{{ strtolower( $lang->name ) }}">
                                <div class="box-body">
                                  <div class="form-group{{ $errors->has('speaker_description.'.$lang->id.'.name') ? ' has-error' : '' }}">
                                    <label for="name">{{ __( 'messages.name' ) }}</label>
                                    <input type="text" class="form-control" id="name" name="speaker_description[{{ $lang->id }}][name]" placeholder="{{ __( 'messages.enter_name' ) }}" @if(isset($id)) value="{{ $speak[$lang->id]['name'] }}" @else value="{{ old('speaker_description.'.$lang->id.'.name') }}" @endif maxlength="100" required autofocus autocomplete="off">
                                    @if ($errors->has('speaker_description.'.$lang->id.'.name'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('speaker_description.'.$lang->id.'.name') }}</strong>
                                      </span>
                                    @endif
                                  </div>

                                  <div class="form-group{{ $errors->has('speaker_description.'.$lang->id.'.designation') ? ' has-error' : '' }}">
                                    <label for="designation">{{ __( 'messages.designation' ) }}</label>
                                    <input type="text" class="form-control" id="designation" name="speaker_description[{{ $lang->id }}][designation]" placeholder="{{ __( 'messages.enter_designation' ) }}" @if(isset($id)) value="{{ $speak[$lang->id]['designation'] }}" @else value="{{ old('speaker_description.'.$lang->id.'.designation') }}" @endif maxlength="100" required autofocus autocomplete="off">
                                    @if ($errors->has('speaker_description.'.$lang->id.'.designation'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('speaker_description.'.$lang->id.'.designation') }}</strong>
                                      </span>
                                    @endif
                                  </div>

                                  <div class="form-group{{ $errors->has('speaker_description.'.$lang->id.'.short_description') ? ' has-error' : '' }}">
                                    <label for="short_description">{{ __( 'messages.short_description' ) }}</label>
                                    <input type="text" class="form-control" id="short_description" name="speaker_description[{{ $lang->id }}][short_description]" placeholder="{{ __( 'messages.enter_short_description' ) }}" @if(isset($id)) value="{{ $speak[$lang->id]['short_description'] }}" @else value="{{ old('speaker_description.'.$lang->id.'.short_description') }}" @endif maxlength="255" required autofocus autocomplete="off">
                                    @if ($errors->has('speaker_description.'.$lang->id.'.short_description'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('speaker_description.'.$lang->id.'.short_description') }}</strong>
                                      </span>
                                    @endif
                                  </div>

                                  <div class="form-group">
                                    <label for="description">{{ __( 'messages.description' ) }}</label>
                                    <textarea id="form_editor_{{ $lang->id }}" name="speaker_description[{{ $lang->id }}][description]" rows="10" cols="80">
                                      @if(isset($id)) {{ $speak[$lang->id]['description'] }} @else {{ old('speaker_description.'.$lang->id.'.description')  }} @endif
                                    </textarea> 
                                    @if ($errors->has('description'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('description') }}</strong>
                                      </span>
                                    @endif
                                  </div>

                                  <div class="form-group">
                                    <label for="biography">{{ __( 'messages.biography' ) }}</label>
                                    <textarea class="form-control" id="form_editor_{{ $lang->id }}" name="speaker_description[{{ $lang->id }}][biography]" rows="10" cols="80">@if(isset($id)) {{ $speak[$lang->id]['biography'] }} @else {{ old('speaker_description.'.$lang->id.'.biography')  }} @endif
                                    </textarea> 
                                    @if ($errors->has('biography'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('biography') }}</strong>
                                      </span>
                                    @endif
                                  </div>

                                  <div class="form-group{{ $errors->has('speaker_description.'.$lang->id.'.meta_title') ? ' has-error' : '' }}">
                                    <label for="meta_title">{{ __( 'messages.meta_title' ) }}</label>
                                    <input type="text" class="form-control" id="meta_title" name="speaker_description[{{ $lang->id }}][meta_title]" placeholder="{{ __( 'messages.enter_meta_title' ) }}" @if(isset($id)) value="{{ $speak[$lang->id]['meta_title'] }}" @else value="{{ old('speaker_description.'.$lang->id.'.meta_title') }}" @endif maxlength="100"  autocomplete="off" />
                                    @if ($errors->has('speaker_description.'.$lang->id.'.meta_title'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('speaker_description.'.$lang->id.'.meta_title') }}</strong>
                                      </span>
                                    @endif
                                  </div>

                                  <div class="form-group{{ $errors->has('speaker_description.'.$lang->id.'.meta_description') ? ' has-error' : '' }}">
                                    <label for="meta_description">{{ __( 'messages.meta_description' ) }}</label>
                                    <input type="text" class="form-control" id="meta_description" name="speaker_description[{{ $lang->id }}][meta_description]" placeholder="{{ __( 'messages.enter_meta_desc' ) }}" @if(isset($id)) value="{{ $speak[$lang->id]['meta_description'] }}" @else value="{{ old('speaker_description.'.$lang->id.'.meta_description') }}" @endif maxlength="155"  autocomplete="off" />
                                    @if ($errors->has('speaker_description.'.$lang->id.'.meta_description'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('speaker_description.'.$lang->id.'.meta_description') }}</strong>
                                      </span>
                                    @endif
                                  </div>
                                  
                                  <div class="form-group{{ $errors->has('speaker_description.'.$lang->id.'.meta_keyword') ? ' has-error' : '' }}">
                                    <label for="meta_keyword">{{ __( 'messages.meta_keyword' ) }}</label>
                                    <textarea class="form-control" id="meta_keyword" name="speaker_description[{{ $lang->id }}][meta_keyword]" rows="10" cols="80">@if(isset($id)) {{ $speak[$lang->id]['meta_keyword'] }} @else {{ old('speaker_description.'.$lang->id.'.meta_keyword') }} @endif
                                    </textarea> 
                                    @if ($errors->has('speaker_description.'.$lang->id.'.meta_keyword'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('speaker_description.'.$lang->id.'.meta_keyword') }}</strong>
                                      </span>
                                    @endif
                                  </div>
                                </div>
                              </div>
                            @endforeach
                          @endif
                        </div>
                      </div>  
                      <div class="tab-pane" id="extra">
                        <div class="box-body">
                          <div class="form-group{{ $errors->has('slug') ? ' has-error' : '' }}">
                            <label for="slug">{{ __( 'messages.slug' ) }}</label>
                            <input type="text" class="form-control" id="name" name="slug" placeholder="{{ __( 'messages.enter_slug' ) }}" @if(isset($id)) value="{{ $speak['slug'] }}" @else value="{{ old('slug') }}" @endif maxlength="100" required autofocus autocomplete="off">
                            @if ($errors->has('slug'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('slug') }}</strong>
                              </span>
                            @endif
                          </div>
                        </div>
                        <div class="box-body">
                          <div class="form-group{{ $errors->has('bc_speaker_name') ? ' has-error' : '' }}">
                            <label for="bc_speaker_name">{{ __( 'messages.bc_speaker_name' ) }}</label>
                            <input type="text" class="form-control" id="name" name="bc_speaker_name" placeholder="{{ __( 'messages.enter_bc_speaker_name' ) }}" @if(isset($id)) value="{{ $speak['bc_speaker_name'] }}" @else value="{{ old('bc_speaker_name') }}" @endif maxlength="100" required autofocus autocomplete="off">
                            @if ($errors->has('bc_speaker_name'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('bc_speaker_name') }}</strong>
                              </span>
                            @endif
                          </div>
                        </div>
                        <div class="box-body">
                          <div class="form-group{{ $errors->has('avatar') ? ' has-error' : '' }}">
                            @if( isset( $speak['avatar'] ) && $speak['avatar'] != '')
                              <p><img src="{{ $speak['avatar'] }}" height="50px" width="50px" /></p>
                            @endif
                            <label for="avatar">{{ __( 'messages.select_avatar' ) }}</label>
                            <input type="file" class="form-control" id="avatar" name="avatar" placeholder="{{ __( 'messages.enter_avatar' ) }}" value="{{ old('avatar') }}"  />
                            @if ($errors->has('avatar'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('avatar') }}</strong>
                              </span>
                            @endif
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" id="social">
                        <div class="box-body">
                          <div class="form-group{{ $errors->has('facebook') ? ' has-error' : '' }}">
                            <label for="facebook">{{ __( 'messages.facebook' ) }}</label>
                            <input type="text" class="form-control" id="facebook" name="facebook" placeholder="{{ __( 'messages.enter_fb_url' ) }}" @if(isset( $social['facebook'] )) value="{{ $social['facebook'] }}" @else value="{{ old('facebook') }}" @endif maxlength="100" required autofocus autocomplete="off">
                            @if ($errors->has('facebook'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('facebook') }}</strong>
                              </span>
                            @endif
                          </div>
                          <div class="form-group{{ $errors->has('linkedin') ? ' has-error' : '' }}">
                            <label for="linkedin">{{ __( 'messages.linkedin' ) }}</label>
                            <input type="text" class="form-control" id="linkedin" name="linkedin" placeholder="{{ __( 'messages.enter_li_url' ) }}" @if(isset( $social['linkedin'] )) value="{{ $social['linkedin'] }}" @else value="{{ old('linkedin') }}" @endif maxlength="100" required autofocus autocomplete="off">
                            @if ($errors->has('linkedin'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('linkedin') }}</strong>
                              </span>
                            @endif
                          </div>
                          <div class="form-group{{ $errors->has('google') ? ' has-error' : '' }}">
                            <label for="google">{{ __( 'messages.google' ) }}</label>
                            <input type="text" class="form-control" id="google" name="google" placeholder="{{ __( 'messages.enter_gg_url' ) }}" @if(isset( $social['google'] )) value="{{ $social['google'] }}" @else value="{{ old('google') }}" @endif maxlength="100" required autofocus autocomplete="off">
                            @if ($errors->has('google'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('google') }}</strong>
                              </span>
                            @endif
                          </div>
                          <div class="form-group{{ $errors->has('twitter') ? ' has-error' : '' }}">
                            <label for="twitter">{{ __( 'messages.twitter' ) }}</label>
                            <input type="text" class="form-control" id="twitter" name="twitter" placeholder="{{ __( 'messages.enter_tw_url' ) }}" @if(isset( $social['twitter'] )) value="{{ $social['twitter'] }}" @else value="{{ old('twitter') }}" @endif maxlength="100" required autofocus autocomplete="off">
                            @if ($errors->has('twitter'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('twitter') }}</strong>
                              </span>
                            @endif
                          </div>
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