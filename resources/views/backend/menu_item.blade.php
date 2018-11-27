@extends('backend.layouts.listing_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-th"></i>
        {{ __( 'messages.menu_item' ) }}
        <small>{{ __( 'messages.listing' ) }}</small>
        <button type="button" class="btn btn-success btn-add-new" onclick="window.location='{{ url("admin/menu/item/$id/create") }}'"><i class="fa fa-plus-circle"></i>&nbsp;&nbsp;{{ __( 'messages.add_new_menu_item' ) }}</button>
        <button type="button" class="btn btn-success btn-add-new" onclick="window.location='{{ url("admin/menu/") }}'">
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
          <a href="{{ route('admin.menu') }}">
            {{ __( 'messages.menu' ) }}
          </a>
        </li>
        <li class="active">
          {{ __( 'messages.builder_listing' ) }}
        </li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-9 col-md-offset-1">
          @include('backend.elements.messages')
          <div class="box">
           <!--  <div class="box-header">
              <h3 class="box-title">Data Table With Full Features</h3>
            </div> -->
            <!-- /.box-header -->
            <div class="box-body">
              <table id="listing2" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th class="th-sm text-left">
                      {{ __( 'messages.title' ) }} 
                    </th> 
                    <th class="th-sm text-left">
                      {{ __( 'messages.slug' ) }}
                    </th>
                    <th class="th-sm text-center">
                      {{ __( 'messages.action' ) }}
                    </th>
                  </tr>
                </thead>
                <tbody>
                  @foreach($menu_items as $menu)
                  <tr>
                    <td>{{ $menu->title }} </td>
                    <td class="th-sm text-left">{{ $menu->slug }}</td>
                    <td class="text-center">  
                        <button type="button" class="btn bg-blue text-right edit" onclick="window.location='{{ url("admin/menu/item/$id/$menu->id/edit") }}'">
                          <i class="fa fa-edit float-left" aria-hidden="true"></i>
                          {{ __( 'messages.edit' ) }}
                        </button> 
                        <button type="button" class="btn bg-red text-right delete" onclick="return menuDelete( '{{$menu->title}}', '{{ url("admin/menu/item/$id/$menu->id/delete") }}');">
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
                      {{ __( 'messages.title' ) }}
                    </th>
                    <th class="th-sm text-left">
                      {{ __( 'messages.slug' ) }}
                    </th>
                    <th class="th-sm text-center">
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
      function menuDelete(  name, url ) {

        var txt;
         var confirmTxt = "{{ __( 'messages.confirm' ) }} {{ __( 'messages.menu_item' ) }}";
        var r = confirm(confirmTxt+" - " + name);
        if (r == true) {
            window.location=url
        }
        return false;
      }
  </script>
@endsection