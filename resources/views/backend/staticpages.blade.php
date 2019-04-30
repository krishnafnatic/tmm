@extends('backend.layouts.listing_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-file"></i>
        {{ __( 'messages.staticpagesseo' ) }}
        <small>{{ __( 'messages.listing' ) }}</small> 
        <!-- onclick="window.location='{{ route("admin.staticpages.create") }}'" -->
        <button type="button" class="btn btn-success btn-add-new" onclick="javascript:alert('Please Ask Administrator to add page');" ><i class="fa fa-plus-circle"></i>&nbsp;&nbsp;{{ __( 'messages.add_new' ) }}</button>
      </h1>
      <ol class="breadcrumb">
        <li>
          <a href="{{ route('admin.dashboard') }}">
            <i class="fa fa-dashboard"></i> 
            {{ __( 'messages.dashboard' ) }} 
          </a>
        </li>
        <li class="active">
          {{ __( 'messages.listing_stps' ) }}
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
                      {{ __( 'messages.page_name' ) }} 
                    </th>
                    <th>
                      {{ __( 'messages.page_route' ) }} 
                    </th>
                    <th>
                      {{ __( 'messages.action' ) }}
                    </th>
                  </tr>
                </thead>
                <tbody> 
                  @foreach($StaticPageSeo as $page)
                  <tr>
                    <td>{{ $page->name }}</td>
                    <td>{{ $page->route }}</td>
                    <td>
                       <button type="button" class="btn bg-blue text-right edit" onclick="window.location='{{ url("admin/staticpages/$page->id/edit") }}'">
                          <i class="fa fa-edit float-left" aria-hidden="true"></i>
                          {{ __( 'messages.edit' ) }}
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