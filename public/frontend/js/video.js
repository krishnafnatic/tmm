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


var loginAjax   =   document.getElementById('loginAjax');

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
  @FUNCTION: showStatusshowStatus( status, message )
  @prams: status, message
  @Description: This function show message status with status: succes|error and message
*/
var showStatus = function ( errorStatus, divID, message ) {

  if( divID != 'msgSubscribMe' ) {
    $("html, body").animate({ scrollTop: 0 }, "slow");
  }
  
  $( "#"+divID ).show();
  $( "#"+divID ).addClass( 'alert-'+errorStatus );
  $( "#"+divID ).html( '<button type="button" class="close" data-dismiss="alert">×</button><strong>'+message+'</strong>' );
  return false;

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

/*
  cancle button
*/
function cancel() {
  window.location.href='/';
}

/*
  this function call ajax;
*/
function callAjax( ajaxMethod, ajaxDataType, ajaxURL, ajaxData, divID ) {

  $.ajax({
    type: ajaxMethod,
    dataType: ajaxDataType,
    url:ajaxURL,
    data:ajaxData,
    beforeSend: function() {
      $( '#'+divID ).after( '<img src="'+loader+'" alt="loading" class="wait" style="position: absolute; top: 14px;" />' );
    },
    complete: function() {
      $( '.wait' ).remove();
    },
    success:function(data) {
      AjaxSuccess( data, divID );
    }
  });

}

/*
    show ajax success output;
*/
function AjaxSuccess( data, divID ) {
  
  /*
    if status is success and type is view
  */ 
  if(data.status == 'success' && data.type == 'views' ) {
    $( '#'+divID ).html( data.view.alltime_video_views );
  }

  /*
    if status is success and type is login
  */
  if( data.status == 'success' && data.type == 'login' ) {
    $( '#danger' ).hide();
    $( '#success' ).show();
    $( '#success' ).html( data.message );
    $( '#user-login' ).modal('toggle');
    location.reload();
  }

  /*
    if status is error and type is login
  */
  if( data.status == 'error' && data.type == 'login' ) {
    $( '#success' ).hide();
    $( '#danger' ).show();
    $( '#danger' ).html( data.message );
  }

  /*
    if status is success and type is saveComment
  */
  if(  data.status == 'success' && data.type == 'saveComment' ) { 
    showMessage( 'msgComment', 'alert-success', data.message );
    $( '#commentListing' ).html( data.comments );
  }

  /*
    if status is success and type is commentListing
  */
  if( data.status == 'success' && data.type == 'commentListing' ) {
    $( '#commentListing' ).html( data.comments );
  }

  /*
    if status is success and type is wishlist
  */
  if( data.status == 'success' && data.type == 'wishlist-remove' ) {
    showStatus( 'success', 'msgDiv', data.message);

    $( "#remove_to_list" ).remove();
    var onclick = "user_list('add')";
    $( "#view-video").before('<a class="add-to-wishlist" name="add_to_list" id="add_to_list" onclick="'+onclick+'" title="Add to my list"><img src="'+heart_normal+'" alt="Add to my list" title="Add to my list" /></a>');

  }

  /*
    if status is success and type is wishlist
  */
  if( data.status == 'success' && data.type == 'wishlist-add' ) {
    showStatus( 'success', 'msgDiv', data.message);
    $( "#add_to_list" ).remove();
    var onclick = "user_list('remove')";
    $( "#view-video").before('<a class="remove-to-wishlist" name="remove_to_list" id="remove_to_list" onClick="'+onclick+'" title="Remove to my list"><img src="'+heart_red+'" alt="Remove to my list" title="Remove to my list" /></a>');
  }

  /*
    if status is error and type is wishlist
  */
  if( data.status == 'error' && data.type == 'wishlist' ) {
    showStatus( 'danger', 'msgDiv', data.message);
  }

  /*
    if status is error and type is wishlist
  */
  if( data.status == 'success' && data.type == 'newsletter' ) {
    showStatus( 'success', 'msgSubscribMe', data.message);
  }

  /*
    if status is error and type is UnLogged
  */
  if( data.status == 'error' && data.type == 'UnLogged' ) {
    //Unused; Silence is Golden;
  }

  /*
    if status is success and type is Already
  */
  if( data.status == 'success' && data.type == 'Already' ) {
    //Change add_to_list to remove_to_list
    $( "#add_to_list" ).remove();
    var onclick = "user_list('remove')";
    $( "#view-video").before('<a class="remove-to-wishlist" name="remove_to_list" id="remove_to_list" onClick="'+onclick+'" title="Remove to list"><img src="'+heart_red+'" alt="Remove to list" title="Remove to list" /></a>');
  }

  /*
    if status is success and type is Already
  */
  if( data.status == 'success' && data.type == 'NotYet' ) {
    //Unused; Silence is Golden;
  }

  //data.type is login;
}

/*
  Get Video Views Using Analiytics API
  using video_id;
*/
if( isDefined( video_id ) ) {
  data = { 'video_id': video_id };
  callAjax( 'POST', 'json', analyticsURL, data, 'viewcount' );
} 

/*
  Check if video id is already in db;
  using video_id;
*/
if( isDefined( video_id ) ) {
  data = { 'video_id': video_id };
  callAjax( 'POST', 'json', checkIsWhishListURL, data, 'Unused' );
}

/*
  Login using Ajax;
*/
function login() {

  var email = document.getElementById( 'email' ).value,
      pwd   = document.getElementById( 'password' ).value,
      msgEmail  = document.getElementById( 'msg_email' ),
      msgPWD    = document.getElementById( 'msg_password' ),
      regexPWD = /^(?=\S*[a-z])(?=\S*[A-Z])(?=\S*\d)(?=\S*[^\w\s])\S{8,}$/;


  $( '#div_email' ).removeClass( 'was-validated' );
  $( '#password' ).removeClass( 'is-invalid' );

  if( !isDefined( email ) ) {
    $( '#div_email' ).addClass( 'was-validated' );
    msgEmail.innerHTML = requiredEmail;
    return false;
  }

  if( email != '' ) {
    if ( !validateEmail( email ) ) {
      $( '#div_email' ).addClass( 'was-validated' );
      msgEmail.innerHTML = emailValid;
      return false;
    }
  }

  if( !isDefined( pwd ) ) {
    $( '#password' ).addClass( 'is-invalid' );
    msgPWD.innerHTML = requiredPWD;
  }

  if( isDefined( pwd ) ) {
    if( !regexPWD.test( pwd ) ) {
      $( '#password' ).addClass( 'is-invalid' );
      msgPWD.innerHTML = pwdValid;
    }
  }

  data = { 'email': email, 'pwd': pwd };
  callAjax( 'POST', 'json', loginURL, data, 'loginAjax' );

}

/*
  Create a new comment;
*/
$( "#submitComment" ).click(function() {
  
  commentChars = $("#comment").val();
  commentLength = commentChars.length;

  if( commentLength> 0 ) {

    data = { 'video_id': video_id, 'comment': commentChars, 'parent_id': 0 };
    callAjax( 'POST', 'json', commentURL, data, 'submitComment' );
  }
  
});

function replyCommentSubmit( comment_id, user_id, video_id ) {

  var replyComment = $( '#replyComment_'+comment_id ).val();
  var replyCommentLength = $( '#replyComment_'+comment_id ).val().length;

  if ( $("#logged_user_id").val() == 0) {
    alert("Please login first to make a comment.");
    return false;
  }

  if( replyCommentLength> 0) {
    data = { 'video_id': video_id, 'parent_id': comment_id, 'comment': replyComment };
    callAjax( 'POST', 'json', commentURL, data, 'viewcount' ); 
  }
}

/*
  Get comment listing;
*/
function initCommentListing() {
  data = { 'video_id': video_id};
  callAjax( 'POST', 'json', commentListURL, data, 'commentListing' ); 
}

initCommentListing();


/*
  Add Video to User List using userId
*/
function user_list( target ) {

  var msgDiv   = document.getElementById( 'msgDiv' );
  console.log(msgDiv);

  if( !isDefined( msgDiv ) ) {
    $( "#divMainContainer" ).before('<div class="alert" id="msgDiv" style="display: none;"></div>');
  }

  if ( $("#logged_user_id").val() == 0) {
    showStatus( 'danger', 'msgDiv', 'Please login to add the video to your list.'); 
    return false;
  }

  if( isDefined( video_id ) ) {
    data = { 'video_id': video_id, 'target': target};
    callAjax( 'POST', 'json', wishListURL, data, 'Unused' ); 
  }

}

function subscribeMe() {
  var name  = document.getElementById( 'subscribe_name' ),
    email   = document.getElementById( 'subscribe_email' ),
    msgSubscribMe   = document.getElementById( 'msgSubscribMe' ),
    loader    =   "{{ asset( 'frontend/images/loader.png' ) }}",
    ck_name = /^[A-Za-z ]{3,25}$/;

  if( !isDefined( msgSubscribMe ) ) {
    $( "#divSubscribeMe h5" ).after('<div class="alert alert-dismissible" id="msgSubscribMe" style="display: none;"></div>');
  }

  $( '#msgSubscribMe' ).hide();


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

  console.log(email.value);

    data = { name:name.value, email:email.value };
    callAjax( 'POST', 'json', subscribeMeURL, data, 'subscribeMe' );
}

/*
  Enable Cancel Button & Submit Button 
  on textaread onClick
*/

function enableComment( divID ) {
  $( "#"+divID ).show();
}

/*
  Cancel / Hide button
*/
function cancelComment( divID, textarea, count) {

  $( "#"+divID ).hide();
  $( "#"+textarea ).val('');
  $( '#'+count ).html(limitCharacters);

  $( '#submitComment' ).removeClass( 'btn-primary' );
  $( '#submitComment' ).addClass( 'btn-secondary' );

}

function showMessage( divID, className, msg, type ) {

  $( '#'+divID ).show();
  $( '#'+divID ).addClass( className );
  cancelComment( 'main_comment', 'comment', 'count-label' );
  $( '#'+divID ).html( msg );

}

function showHideButton( length, buttonID, label ) {

  if(length > 0) {
    $( '#'+buttonID ).addClass( 'btn-primary' );
    $( '#'+buttonID ).removeClass( 'btn-secondary' );
    $( '#'+buttonID ).attr( 'disabled', false );
  } else {
    $( '#'+buttonID ).addClass( 'btn-secondary' );
    $( '#'+buttonID ).removeClass( 'btn-primary' );
    $( '#'+buttonID ).attr( 'disabled', true );
  }

  $( '#'+label ).html(limitCharacters - length);
}



function replyCommentArea( commentID ) {
  var replyCommentLength = $( '#replyComment_'+commentID ).val().length;
  showHideButton( replyCommentLength, 'submitReplyComment_'+commentID, 'reply-count-label_'+commentID );
}


$("#comment").keyup(function () {

  commentChars = $(this).val();
  commentLength = commentChars.length;

  showHideButton( commentLength, 'submitComment', 'count-label' );

  return false;

});


function socialURL( url ) {
  window.location.href=url;
}