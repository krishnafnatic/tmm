	@extends('frontend.layouts.master')

	@section('content')
		<div class="container my-list">
			<div class="alert alert-dismissible" id="msgDiv" style="display: none;"></div>
			<section id="my-list">
               	<h2 class="bd-tranding no-bd-lft">{{ __( 'messages.my_list' ) }}</h2>
               	<div class="row card-deck">
	               	@if( isset( $wishlist ) && count( $wishlist) > 0 )
	               		@foreach( $wishlist as $wish )
			               	<div class="card col-sm-3" style="position: relative;" id="wishlist_id_{{ $wish['video_id'] }}">
			               		<a class="remove_to_wishlist" id="remove_to_wishlist" onclick="user_list('remove', '{{ $wish["video_id"] }}')" title="Remove to list">
		               				<i class="fab fa-gratipay fa-2x"></i>
							    </a>
			                    <a href="{{ url('video/'.$wish['slug']) }}">
			                    	<img class="card-img-top img-fluid" src="{{  $wish['images']['thumbnail']['src'] }}" alt="{{ $wish['name'] }}" title="{{ $wish['name'] }}" />
			                    </a>
			                    <div class="card-body">
			                    	<a href="{{ url('video/'.$wish['slug']) }}" class="card-title">
			                            {{ $wish['name'] }}
			                        </a>
			                    </div>
			                </div>
			            @endforeach
	               	@else 
	               		<p>{{ __( 'messages.wishlist_found' ) }}</p>
	               	@endif
		    	</div>
            </section>
		</div>  	

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
			  	Add Video to User List using userId
			*/
			function user_list( action, video_id ) {

			  	var msgDiv		= 	document.getElementById( 'msgDiv' ),
					loader		=   "{{ asset( 'frontend/images/loader.png' ) }}",
					wishListURL   =  "{{ url( '/wishList' ) }}";

			  	if( !isDefined( msgDiv ) ) {
			    	$( "#my-list" ).before('<div class="alert alert-dismissible" id="msgDiv" style="display: none;"></div>');
			  	}

			  	if( isDefined( video_id ) ) {
			    	data = { 'video_id': video_id, 'target': action};
			    	$.ajax({
					    type: "POST",
					    dataType: "json",
					    url:wishListURL,
					    data:data,
					    beforeSend: function() {
					      	//$( '#'+divID ).after( '<img src="'+loader+'" alt="loading" class="wait" style="position: absolute; top: 14px;" />' );
					    },
					    complete: function() {
					      	//$( '.wait' ).remove();
					    },
					    success:function(data) {
					      	AjaxSuccess( data, 'msgDiv' );
					    }
					});
			  	}
			}

			/*
			    show ajax success output;
			*/
			function AjaxSuccess( data, divID ) {
			  /*
			    if status is success and type is wishlist
			  */
			  if( data.status == 'success' && data.type == 'wishlist-remove' ) {
			    showStatus( data.status, divID, data.message); 
			    $( "#wishlist_id_"+data.wishlist_id).remove();


			    var totalDiv = data.leftWish;
			    if( totalDiv == 0 ){
			    	$( '.card-deck').html('<p>No list of video found</p>');
			    }
			  }
			}


			/*
			  	@FUNCTION: showStatusshowStatus( status, message )
			  	@prams: status, message
			  	@Description: This function show message status with status: succes|error and message
			*/
			var showStatus = function ( className, divID, message ) {
			  	$( "#"+divID ).show();
			  	$( "#"+divID ).addClass( 'alert-'+className );
			  	$( "#"+divID ).html( '<button type="button" class="close" data-dismiss="alert">×</button><strong>'+message+'</strong>' );
			  	return false;

			}
		</script>
	@endsection