@extends('backend.layouts.listing_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-language"></i>
        {{ __( 'messages.language' ) }}
        <small>{{ __( 'messages.listing' ) }}</small>
        <button type="button" class="btn btn-success btn-add-new" onclick="window.location='{{ route("admin.language.create") }}'"><i class="fa fa-plus-circle"></i>  {{ __( 'messages.add_new' ) }}</button>
      </h1>
      <ol class="breadcrumb">
        <li>
          <a href="{{ route('admin.dashboard') }}">
            <i class="fa fa-dashboard"></i> 
            {{ __( 'messages.dashboard' ) }} 
          </a>
        </li>
        <li class="active">
          {{ __( 'messages.listing_lang' ) }}
        </li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-9 col-md-offset-1">
          @include('backend.elements.messages')
          <div class="box">
            <!-- <div class="box-header">
              <h3 class="box-title">Data Table With Full Features</h3>
            </div> -->
            <!-- /.box-header -->
            <div class="box-body">
              <table id="listing2" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th class="th-sm text-left">
                      {{ __( 'messages.name' ) }}
                    </th>
                    <th class="th-sm text-right">
                      {{ __( 'messages.code' ) }}
                    </th>
                     <!--<th class="th-sm text-right">
                      {{ __( 'messages.locale' ) }}
                    </th>-->
                     <th class="th-sm text-right">
                      {{ __( 'messages.status' ) }}
                    </th>
                    <th class="th-sm text-right">
                      {{ __( 'messages.action' ) }}
                    </th>
                  </tr>
                </thead>
                <tbody>
                  @foreach($languages as $lang)
                  <tr>
                    <td class="th-sm text-left">{{ $lang->name }} </td>
                    <td class="th-sm text-right">{{ $lang->code }} </td>
                    <td class="th-sm text-right">@if($lang->lacale) {{ $lang->lacale }} @else - @endif</td>
                    <!--<td class="th-sm text-right">@if($lang->status ==1) {{ __( 'messages.active' ) }} @else  {{ __( 'messages.inactive' ) }} @endif </td>-->
                    <td class="text-right"> 

                      <button type="button" class="btn bg-blue text-right edit" onclick="window.location='{{ url("admin/language/$lang->id/edit") }}'">
                        <i class="fa fa-edit float-left" aria-hidden="true"></i>
                        {{ __( 'messages.edit' ) }}
                      </button> 

                      <button type="button" class="btn bg-red text-right delete" onclick="return langDelete( '{{$lang->name}}', '{{ url("admin/language/$lang->id/delete") }}');">
                        <i class="fa fa-trash float-left" aria-hidden="true"></i>
                        {{ __( 'messages.delete' ) }}
                      </button>
                        
                    </td>
                  </tr>
                  @endforeach
                </tbody>
                <tfoot>
                  <tr>
                    <th class="th-sm text-left">
                      {{ __( 'messages.name' ) }}
                    </th>
                     <th class="th-sm text-right">
                      {{ __( 'messages.code' ) }}
                    </th>
                     <!--<th class="th-sm text-right">
                      {{ __( 'messages.locale' ) }}
                    </th>-->
                     <th class="th-sm text-right">
                      {{ __( 'messages.status' ) }}
                    </th>
                    <th class="th-sm text-right">
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
  <script type="text/javascript">
      function langDelete(  name, url ) {

        var txt;
        var confirmTxt = "{{ __( 'messages.confirm' ) }} {{ __( 'messages.language' ) }}";
        var r = confirm(confirmTxt+" - " + name);
        if (r == true) {
            window.location=url
        }
        return false;
      }
  </script>
@endsection