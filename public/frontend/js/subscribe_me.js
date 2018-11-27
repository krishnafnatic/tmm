$(document).ready(function() {
	$('.responsive').slick({
	  	dots: false,
	  	infinite: false,
	  	speed: 300,
	  	slidesToShow: 4,
	 	slidesToScroll: 1,
	  	responsive: [
		    {
		      	breakpoint: 1024,
		      	settings: {
		        	slidesToShow: 3,
		        	slidesToScroll: 3,
		        	infinite: true,
		        	dots: true
		      	}
		    },
		    {
		      	breakpoint: 600,
		      	settings: {
		        	slidesToShow: 2,
		        	slidesToScroll: 2
		      	}
		    },
		    {
		      	breakpoint: 480,
		      	settings: {
		        	slidesToShow: 1,
		        	slidesToScroll: 1
		      	}
		    }
	  	]
	});
});

$.ajaxSetup({
  	headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
  	}
});

/**
 * validate email using regex
 */
var validateEmail = function ( email ) {
  	var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  	return re.test(String(email).toLowerCase());
}

/*
  @FUNCTION: showStatus( status, message )
  @prams: status, message
  @Description: This function show message status with status: succes|error and message
*/
var showStatus = function ( status, id, message ) {

  	//$("html, body").animate({ scrollTop: 0 }, "slow");
  	$( "#"+id ).show();
  	$( "#"+id ).addClass( 'alert-'+status );
  	$( "#"+id ).html( '<button type="button" class="close" data-dismiss="alert">×</button><strong>'+message+'</strong>' );

}
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

var subscribeMe = function() {
	var name 	= document.getElementById( 'subscribe_name' ),
		email 	= document.getElementById( 'subscribe_email' ),
		msgSubscribMe 	= document.getElementById( 'msgSubscribMe' ),
		loader    =   "{{ asset( 'frontend/images/loader.png' ) }}",
		ck_name = /^[A-Za-z ]{3,25}$/;

	if( !isDefined( msgSubscribMe ) ) {
		$( "#divSubscribeMe h5" ).after('<div class="alert alert-dismissible" id="msgSubscribMe" style="display: none;"></div>');
	}


	if( !isDefined( name.value ) ) {
	    showStatus( 'danger', 'msgSubscribMe', "Please enter your name!");
	    name.focus();
	    return false;
	}

	if (!ck_name.test( name.value )) {
		showStatus( 'danger', 'msgSubscribMe', "Please enter valid name!");
	    name.focus();
	    return false;
	}

	if( !isDefined( email.value ) ) {
	    showStatus( 'danger', 'msgSubscribMe', "Please enter your email!");
	    email.focus();
	    return false;
	}

	if( email.value != '' ) {
	    if ( !validateEmail( email.value ) ) {
	      showStatus( 'danger', 'msgSubscribMe', "Please enter valid email!");
	      return false;
	    }
	}

	$.ajax({
	    type: 'post',
	    dataType: 'json',
	    url:subscribeMeURL,
	    data:{ name:name.value, email:email.value },
	    beforeSend: function() {

	    	$( "#subscribeMe" ).attr( 'disabled', true );
	      	$( '#subscribeMe' ).after( '&nbsp;<img src="'+loader+'" alt="loading" class="wait" style="position: absolute; top: 14px;" />' );
	    },
	    complete: function() {
	    	$( "#subscribeMe" ).attr( 'disabled', false );
	      	$( '.wait' ).remove();
	    },
	    success:function(data) {

	    	switch( data.status ) {
	    		case "error":
	    			showStatus( 'danger', 'msgSubscribMe', data.message);
	    		break;

	    		case "warning":
	    			showStatus( 'warning', 'msgSubscribMe', data.message);
	    		break;

	    		case "success":
	    			showStatus( 'success', 'msgSubscribMe', data.message);
	    		break;

	    		default:
	    			showStatus( 'danger', 'msgSubscribMe', data.message);
	    		break;

	    	}
	    }
	});
}