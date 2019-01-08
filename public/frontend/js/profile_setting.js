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

var resize = $('#upload-demo').croppie({
    enableExif: true,
    enableOrientation: true,
    /*
    	viewport options
    */
    viewport: { 
        width: 150,
        height: 150,
        type: 'square'
    },
    /*
    	boundary options
    */
    // boundary: {
    //     width: 200,
    //     height: 200
    // },
    enableZoom: false,
    /*
    	image zoom with mouse wheel
    */
    mouseWheelZoom: true,

});


$('#image').on('change', function () {
  	var reader = new FileReader();
    reader.onload = function (e) {
      	resize.croppie('bind',{
        url: e.target.result
      	}).then(function(){
        	console.log('jQuery bind complete');
      	});
    }
    reader.readAsDataURL(this.files[0]);
});

$('.upload-image').on('click', function (ev) {
  	resize.croppie('result', {
    	type: 'canvas',
    	size: 'viewport'
	}).then(function (img) { 

	    $.ajax({
	      	url: route_profile,
	      	type: "POST",
	      	dataType: 'json',
	      	data: {"key": "picture", "value":img, "label": profile_image_upload},
	      	success: function ( data ) {

	      		$( "#profile_msg" ).hide();
	      		$( "#profile_msg" ).addClass( 'alert-success' );
	      		if( data.status == 'success' && data.type == 'picture' ) {
		        	// html = '<img src="' + img + '" />';
		        	// $( "#preview-crop-image" ).html( html );
		        	$( "#profile_msg" ).show();
		        	$( "#profile_msg" ).addClass( 'alert-success' );
		        	$( "#profile_msg" ).html( data.message );

					$( ".upload-image" ).attr( 'disabled', true );
					 setTimeout(function(){ window.location = window.location.href; }, 2000);
	      		}
	      	}
	    });
	});
});

function UpdateUserProfileButton( key, url ) {


	var onClickEventSave = "UpdateUserProfile('"+key+"', '"+url+"')";

	if( key == 'biography') {
		var buttonName = save_biography;
	} else if( key == 'designation' ) {
		var buttonName = save_designation;
	}



	$( '#profile_msg' ).hide();

	$( '#'+key ).show();
	$( "#"+key ).attr( 'disabled', false );
	$( "#"+key ).focus();

	$( '#content_'+key ).hide();

	$( "#edit_"+key ).remove();
	$( '#content_'+key ).after( "<button class='btn btn-primary btn-sm btn-biography float-left' id='save_"+key+"_button'> "+buttonName+" </button>" );
	$( "#save_"+key+"_button" ).attr( 'onclick', onClickEventSave );
}

function UpdateUserProfile( key, url ) {

	var keyChars = $( "#"+key ).val(),
	 	keyTotalChars = $( "#"+key ).val().length;

	if( key == 'biography') {
		var buttonName = edit_biography;
	} else if( key == 'designation' ) {
		var buttonName = edit_designation;
	}

	/*
		key has length more than 0;
	*/
	if( keyTotalChars > 0 ) {

		$.ajax({
	      	url: url,
	      	type: "POST",
	      	dataType: 'json',
	      	data: {"key":key, "value": keyChars, "label": key},
	      	beforeSend: function() {
	      		$( '#save_'+key+'_button' ).attr( 'disabled', true );
		      	$( '#save_'+key+'_button' ).after( '&nbsp;<img src="'+loader+'" alt="loading" class="wait" style="position: absolute; top: 190px;" />' );
		    },
		    complete: function() {
		    	$( '#save_'+key+'_button' ).attr( 'disabled', false );
		      	$( '.wait' ).remove();
		    },
	      	success: function ( data ) {

	      		if( data.status == 'success' && data.type == key ) {

	      			var onClickEventSave = "UpdateUserProfileButton('"+data.type+"', '"+url+"')";

		        	$( '#'+data.type ).hide();

		      		$( '#content_'+data.type ).show();
		      		$( '#content_'+data.type ).html( keyChars );


		      		$( '#profile_msg' ).show();
		      		$( '#profile_msg' ).addClass( 'alert-success' );
		      		$( '#profile_msg' ).html( '<button type="button" class="close" data-dismiss="alert">×</button><strong>'+data.message+'</strong>' );

		        	$( "#save_"+data.type+"_button" ).remove();
					$( "#content_"+data.type ).after( "<button class='btn btn-sm btn-primary float-left btn-biography' id='edit_"+key+"'> "+buttonName+" </button>" );
					$( "#edit_"+data.type ).attr( 'onclick', onClickEventSave );
		      	}

	      	}
	    }); 
	} else {
		$('.dwait').remove();
		$("#designation").after( '<p class="dwait">Please Enter your Designation</p>');
	}
}

function uploadImage() {
    $( '#image' ).trigger( 'click' );
    $( ".upload-image" ).attr( 'disabled', false );
}