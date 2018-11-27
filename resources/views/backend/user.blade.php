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
        <div class="col-md-9 col-md-offset-1">
          @include('backend.elements.messages')
          <div class="box">
            <!-- <div class="box-header">
              <h3 class="box-title">Data Table With Full Features</h3>
            </div> -->
            <!-- /.box-header -->
            <div class="box-body">
              <table id="listing1" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th class="th-sm text-left">
                      {{ __( 'messages.name' ) }} 
                    </th>

                    <th class="text-left">
                      {{ __( 'messages.email' ) }} 
                    </th>
                    <th class="text-left">
                      {{ __( 'messages.mobile' ) }} 
                    </th>
                    <th class="text-right">
                      {{ __( 'messages.action' ) }}
                    </th>
                  </tr>
                </thead>
                <tbody>
                  @foreach($users as $user)
                  <tr>
                    <td class="text-left">{{ $user->name }} </td>
                    <td class="text-left">{{ $user->email }} </td>
                    <td class="text-left">
                      @if($user->mobile)
                        {{ $user->mobile }}
                      @else
                        -
                      @endif
                    </td>
                    <!-- <td>{{ App\Models\Role::where( 'id', $user->role_id )->first()->name }} </td> -->
                    <td class="text-right">
                        <button type="button" class="btn bg-blue text-right view" onclick="window.location='{{ url("admin/user/$user->id/view") }}'">
                          <i class="fa fa-street-view float-left" aria-hidden="true"></i>
                          {{ __( 'messages.view' ) }}
                        </button> 

                        <!-- <button type="button" class="btn bg-red text-right delete" onclick="return userDelete( '{{$user->name}}', '{{ url("admin/user/$user->id/delete") }}');">
                          <i class="fa fa-trash float-left" aria-hidden="true"></i>
                          {{ __( 'messages.delete' ) }}
                        </button> -->

                    </td>
                  </tr>
                  @endforeach
                </tbody>
                <tfoot>
                  <tr>
                    <th class="th-sm text-left">
                      {{ __( 'messages.name' ) }}
                    </th>
                    <th class="th-sm text-left">
                      {{ __( 'messages.email' ) }} 
                    </th>
                    <th class="th-sm text-left">
                      {{ __( 'messages.mobile' ) }} 
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