@extends('backend.layouts.listing_master')

@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-comments"></i>
        {{ __( 'messages.comment' ) }}
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
          {{ __( 'messages.listing_comment' ) }}
        </li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-9 col-md-offset-1">
          @include('backend.elements.messages')
          <div class="alert alert-dismissible" id="msgCommentSuccess" style="display: none;"></div>
          <div class="box" id="comment_msg">
            <!-- <div class="box-header">
              <h3 class="box-title">Data Table With Full Features</h3>
            </div> -->
            <!-- /.box-header -->
            <div class="box-body">
              <table id="listing1" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th class="th-sm text-left">
                      {{ __( 'messages.username' ) }} 
                    </th>
                    <th class="text-left">
                      {{ __( 'messages.videoname' ) }} 
                    </th>
                    <th class="text-left">
                      {{ __( 'messages.comment' ) }} 
                    </th>
                    <!-- <th class="text-left">
                      {{ __( 'messages.status' ) }} 
                    </th> -->
                    <th class="text-right">
                      {{ __( 'messages.action' ) }}
                    </th>
                  </tr>
                </thead>
                <tbody>
                  @foreach($comments as $comment)
                    @php
                      $id = $comment['id'];
                      $user_id = $comment['user_id'];
                      $is_status = $comment['is_status'];
                    @endphp
                  <tr>
                    <td class="text-left">
                      <u>
                        <i>
                          <a href="{{ url("admin/user/$user_id/view") }}" target="_blank">
                            <b style="font-size: 20px;">
                              {{ $comment['user_name'] }}
                            </b>
                          </a>
                        </i>
                      </u>
                    </td>
                    <td class="text-left">{{ $comment['video_name'] }} </td>
                    <td class="text-left">{{ $comment['comment'] }} </td> 
                    <!-- <td class="text-left">{{ $comment['status'] }} </td>  -->
                    <td class="text-right" style="position: relative;">
                        <button type="button" class="btn bg-blue text-right view" onclick="window.location='{{ url("admin/comment/$id/view") }}'">
                          <i class="fa fa-eye float-left" aria-hidden="true"></i>
                          {{ __( 'messages.view' ) }}
                        </button>
                        @if( $comment['is_status'] == 0)
                          <button id="user_{{ $id }}" type="button" class="btn bg-green text-right view" onclick="statusComment( '{{ $id }}', '{{ $is_status }}', 'active' )">
                            <i class="fa fa-check float-left" aria-hidden="true"></i>
                            {{ __( 'messages.active_comment' ) }}
                          </button>
                        @else
                          <button id="user_{{ $id }}" type="button" class="btn bg-red text-right view" onclick="statusComment( '{{ $id }}', '{{ $is_status }}', 'inactive')">
                            <i class="fa fa-close float-left" aria-hidden="true"></i>
                            {{ __( 'messages.inactive_comment' ) }}
                          </button>
                        @endif
                    </td>
                  </tr>
                  @endforeach
                </tbody>
                <tfoot>
                  <tr>
                    <th class="th-sm text-left">
                      {{ __( 'messages.username' ) }} 
                    </th>
                    <th class="text-left">
                      {{ __( 'messages.videoname' ) }} 
                    </th>
                    <th class="text-left">
                      {{ __( 'messages.comment' ) }} 
                    </th>
                    <!-- <th class="text-left">
                      {{ __( 'messages.status' ) }} 
                    </th> -->
                    <th class="text-right">
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

      /**
       * tests for all the ways a variable might be undefined or not have a value
       * @param {String|Number} x the variable to test
       * @return {Boolean} true if variable is defined and has a value
       */
      var isDefined = function ( x ) {
        if (x === "" || x === null || x === undefined || x === NaN) {
          return false;
        }
        return true;
      }

      /*
        Activate & Inactivate User Comments
      */
      function statusComment( comment_id, status_id, state) {

        
        console.log(comment_id +'-'+ status_id +'-'+ state);

        var loader    =   "{{ asset( 'frontend/images/loader.png' ) }}",
        commentState =  "{{ route( 'admin.commentState' ) }}",
        msgCommentSuccess   = document.getElementById( 'msgCommentSuccess' );

        if( !isDefined( msgCommentSuccess ) ) {
          $( "#comment_msg" ).before('<div class="alert alert-dismissible" id="msgCommentSuccess" style="display: none;"></div>');
        }

        $( '#msgCommentSuccess').hide();

        $.ajax({
          type: 'GET',     // http method
          dataType: 'json', // type of response data
          url:commentState,
          data:{ 'comment_id': comment_id, 'status_id': status_id, 'state': state },
          beforeSend: function() {
            $( '#user_'+comment_id ).attr( 'disabled', true );
            $( '#user_'+comment_id ).after( '<img src="'+loader+'" alt="loading" class="wait" style="position: absolute; top: 4px; right: 120px" />' );
          },
          complete: function() {
            $( '#user_'+comment_id ).attr( 'disabled', false );
            $( '.wait' ).remove();
          },
          success:function(data) {
            
            var onlick = "statusComment( '"+data.comment_id+"', '"+data.status_id+"', '"+data.state+"');";

            if( data.status == 'inactive' ) {
                var iTag = '<i class="fa fa-close float-left" aria-hidden="true"></i>';
                $( '#user_'+data.comment_id ).removeClass( 'bg-green' );
                $( '#user_'+data.comment_id ).addClass( 'bg-red' );
            } else {
                iTag = '<i class="fa fa-check float-left" aria-hidden="true"></i>';
                $( '#user_'+data.comment_id ).removeClass( 'bg-red' );
                $( '#user_'+data.comment_id ).addClass( 'bg-green' );
            }
            $( '#user_'+data.comment_id ).html( iTag+' '+data.title );


            $( '#user_'+data.comment_id ).attr( 'onclick', onlick );
            $( '#msgCommentSuccess' ).addClass('alert-success');
            $( '#msgCommentSuccess' ).html( '<strong>Success!</strong><button type="button" class="close" data-dismiss="alert">×</button><strong>'+data.message+'</strong>' );
            $( '#msgCommentSuccess' ).show();
          }
        });
      }
  </script>
@endsection