@extends('backend.layouts.setting_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
          <i class="fa fa-gear"></i>
          {{ __( 'messages.change' ) }}
        <small>{{ __( 'messages.setting' ) }}</small>
        <button type="button" class="btn btn-success btn-add-new" onclick="window.location='{{ url("admin/dashboard") }}'">
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
          {{ __( 'messages.setting' ) }}
        </li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="container" style="margin: 0 auto; width:80%;">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="alert alert-danger print-error-msg" style="display:none">
            <ul></ul>
          </div>

          <div class="alert alert-success print-success-msg" style="display:none">
            <ul></ul>
          </div>

          @if (count($errors) > 0)
          <div class="alert alert-danger">
            <strong>Whoops!</strong> 
            There were some problems with your input.<br><br>
            <ul>
              @foreach ($errors->all() as $error)
                  <li>{{ $error }}</li>
              @endforeach
            </ul>
          </div>
          @endif
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active">
                <a href="#home_page" data-toggle="tab">
                  <b>{{ __( 'messages.home_setting' ) }}</b>
                </a>
              </li>
              <li>
                <a href="#contact_us" data-toggle="tab">
                  <b>{{ __( 'messages.contact_setting' ) }}</b>
                </a>
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="home_page">
                <!-- <div class="box box-primary"> -->
                  <form name="add_name" id="add_name" enctype="multipart/form-data" action="{{ route('admin.setting.store.submit') }}" method="POST" role="setting"> 
                    {{ csrf_field() }}
                    <!-- /.box-body --> 
                    <div class="table-responsive">  
                      <table class="table table-bordered" id="dynamic_field">
                          <thead>
                            <tr>
                                <th>Type</th>
                                <th>Heading</th>
                                <th>Order</th>
                                <th>Action</th>
                            </tr>
                          </thead>
                          <tbody>
                            @if( isset( $setting ) && count( $setting ) > 0 )
                              @for( $i=0; $i < count( $setting ); $i++ )
                                <tr id="row_{{$i}}">
                                  <input type="hidden" name="setting[{{$i}}][id]" value="{{ $setting[$i]['id'] }}" />
                                  @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == 'ads') 
                                    <input type="hidden" name="setting[{{$i}}][type_id]" value="{{ $setting[$i]['type_id'] }}" />
                                  @endif
                                  <td style="width: 55px; ">
                                    <select name="setting[{{$i}}][type]" id="type_{{$i}}" class="form-control select_type_{{$i}}" onchange="getval(this, {{$i}});">
                                      <option value="0"> Select</option>
                                      <optgroup label="Default" id="default">
                                        <option value="ads" @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == 'ads') selected="selected" @endif> Advertisement</option>
                                        <option value="tag" @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == 'tag') selected="selected" @endif>Recommend</option>
                                        <option value="popular" @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == 'popular') selected="selected" @endif>Popular</option>
                                        <option value="trending" @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == 'trending') selected="selected" @endif>Most Viewed</option>
                                      </optgroup>
                                      <optgroup label="Playlist" id="playlist">
                                        @if( isset( $playlist ) && count( $playlist ) > 0 )
                                          @foreach( $playlist as $listing )
                                              <option value="{{ $listing['slug'] }} " @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == $listing['slug'] ) selected="selected" @endif>
                                                {{ $listing['name'] }} 
                                              </option>
                                          @endforeach
                                        @endif
                                      </optgroup>
                                      <optgroup label="Folder" id="folder">
                                        <option value="5bdfe38abda6bb0ce8e60d8c" @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == '5bdfe38abda6bb0ce8e60d8c' ) selected="selected" @endif>Ask Surya</option>
                                        <option value="5bdfe37b7f25347d9823a146" @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == '5bdfe37b7f25347d9823a146' ) selected="selected" @endif>Be Safe Be Insured</option>
                                        <option value="5bdfe3707e881b4ae4fdc688" @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == '5bdfe3707e881b4ae4fdc688' ) selected="selected" @endif>ELSS Sahi Hai</option>
                                        <option value="5bdfe3b046e02e118e78ea03" @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == '5bdfe3b046e02e118e78ea03' ) selected="selected" @endif>Equity Sahi Hai</option>
                                        <option value="5bdfe39d82aca467d2b66f05" @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == '5bdfe39d82aca467d2b66f05' ) selected="selected" @endif>Nivesh Kar Befikar</option>
                                        <option value="5bdfe3a622224851c58db127" @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == '5bdfe3a622224851c58db127' ) selected="selected" @endif>Nivesh Kar Befikar - 4th Generation ULIPs</option>
                                        <option value="5bdfe3930332284b34ff63e5" @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == '5bdfe3930332284b34ff63e5' ) selected="selected" @endif>The Law of Money</option>
                                        <option value="5bdfe3647f25347d9823a139" @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == '5bdfe3647f25347d9823a139' ) selected="selected" @endif>The Money Chef</option>
                                      </optgroup>
                                    </select>
                                    <span class="help-block" id="type_error_{{ $i }}"></span>
                                  </td>
                                  <td style="width: 30px; "> 
                                      <input type="text" name="setting[{{$i}}][heading]" id="heading_{{$i}}" class="form-control" value="{{ $setting[$i]['heading'] }}" placeholder="Add heading" autofocus required /> 
                                  </td>
                                  @if(isset( $setting[$i]['type'] ) && $setting[$i]['type'] == 'ads') 
                                  <td style="width: 100px; ">  
                                      <img src="{{ asset( $setting[$i]['image']) }}" width="40" height="40" />
                                      <input type="file" name="setting[{{$i}}][image]" id="image_{{$i}}" class="form-control" />
                                     
                                      <input type="text" name="setting[{{$i}}][order]" id="order_{{$i}}" placeholder="Add Order" class="form-control" value="{{ $setting[$i]['order'] }}" autocomplete="off" required />
                                      
                                    <!--<div class="col-xs-3"> 
                                      <input type="text" name="setting[{{$i}}][height]" id="height_{{$i}}" placeholder="Add height of image" class="form-control" value="{{ $setting[$i]['height'] }}" autocomplete="off" required /> 
                                    </div> -->
                                  </td>
                                  @else 
                                  <td style="width: 100px; "> 
                                      <input name="setting[{{$i}}][order]" type="text" placeholder="Add Order" class="form-control" style="" value="{{ $setting[$i]['order'] }}" required />
                                      <span class="help-block" id="order_error_{{$i}}"></span> 
                                  </td> 
                                  @endif
                                  <td style="width: 75px; ">
                                    <select name="setting[{{$i}}][status]" id="status_{{$i}}" class="form-control select_status_{{$i}}">
                                      <option value="active" @if(isset( $setting[$i]['status'] ) && $setting[$i]['status'] == 'active') selected="selected" @endif>Active</option>
                                      <option value="inactive" @if(isset( $setting[$i]['status'] ) && $setting[$i]['status'] == 'inactive') selected="selected" @endif>In Active</option>
                                    </select>
                                  </td> 
                                </tr>
                              @endfor
                            @else 
                              <tr id="row_0">  
                                <td>
                                  <select name="setting[0][type]" id="type_0" class="form-control select_0" onchange="getval(this, 0);">
                                    <option value="0"> Select</option>
                                    <option value="ads">Advertisement</option>
                                    <option value="tag">Recommend</option>
                                    <option value="popular">Popular</option>
                                    <option value="most">Most Viewed</option>
                                  </select>
                                </td>
                                <td class="text-center" id="order_0">
                                  <input type="text" name="setting[0][order]" placeholder="Add Order" class="form-control" autocomplete="off" autofocus required />
                                </td>
                                <td class="text-center">
                                  <button type="button" class="btn btn-danger remove">
                                    <i class="glyphicon glyphicon-remove-sign"></i>
                                  </button>
                                </td>
                              </tr> 
                            @endif
                          <script type="text/javascript">
                            var count = {{ count( $setting ) }};
                          </script>
                          </tbody>
                      </table> 
                      <div class=" text-right">
                        <input type="submit" name="submit" id="submit" class="btn btn-info" value="Submit" />  
                        <button type="button" name="add" id="add" class="btn btn-success">Add More</button>
                      </div>
                        
                    </div>
                  </form>
                <!-- </div>  -->
              </div>
              <div class="tab-pane" id="contact_us">
                <div class="box-body">
                  <div class="form-group{{ $errors->has('contact_email') ? ' has-error' : '' }}">
                    <label for="contact_email">{{ __( 'messages.email' ) }}</label>
                     <input type="text" class="form-control" id="contact_email" name="contact_email" placeholder="{{ __( 'messages.enter_email' ) }}" @if(isset( $social['contact_email'] )) value="{{ $social['contact_email'] }}" @else value="{{ old('contact_email') }}" @endif maxlength="100" required autocomplete="off">
                    @if ($errors->has('contact_email'))
                      <span class="help-block">
                          <strong>{{ $errors->first('contact_email') }}</strong>
                      </span>
                    @endif
                  </div>
                  <div class=" text-right">
                    <input type="submit" name="submit" id="submit" class="btn btn-info" value="Submit" />  
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
@endsection
