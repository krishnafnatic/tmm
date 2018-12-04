@extends('backend.layouts.listing_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-user"></i>
        {{ __( 'messages.user' ) }}
        <small>{{ __( 'messages.listing' ) }}</small> 
      </h1>
      <ol class="breadcrumb">
        <li>
          <a href="{{ route('admin.dashboard') }}">
            <i class="fa fa-dashboard"></i> 
            {{ __( 'messages.dashboard' ) }} 
          </a>
        </li>
        <li class="active">
          {{ __( 'messages.listing_user' ) }}
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
                      {{ __( 'messages.name' ) }} 
                    </th>
                    <th>
                      {{ __( 'messages.email' ) }} 
                    </th>
                    <th>
                      {{ __( 'messages.action' ) }}
                    </th>
                  </tr>
                </thead>
                <tbody> 
                  @foreach($users as $user)
                  <tr>
                    <td>{{ $user->name }} </td>
                    <td>{{ $user->email }} </td>
                    <td>
                        <button type="button" class="btn bg-blue text-right view" onclick="window.location='{{ url("admin/user/$user->id/view") }}'">
                          <i class="fa fa-eye float-left" aria-hidden="true"></i>
                          {{ __( 'messages.view' ) }}
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
                      {{ __( 'messages.email' ) }} 
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
  <script type="text/javascript">
      function userDelete(  name, url ) {

        var txt;
        var confirmTxt = "{{ __( 'messages.confirm' ) }} {{ __( 'messages.user' ) }}";
        var r = confirm(confirmTxt+" - " + name);
        if (r == true) {
            window.location=url
        }
        return false;
      }
  </script>
@endsection