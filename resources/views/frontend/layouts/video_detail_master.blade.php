<!doctype html>
<html lang="{{ app()->getLocale() }}">
	@include('frontend.elements.video_meta')
<body>
	<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-55GSLDJ"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
    <!-- Load Facebook SDK for JavaScript -->
  	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = 'https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v3.2';
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>
	@include('frontend.elements.header')
		<main>
			@yield('content')
		</main>
	@include('frontend.elements.footer')

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
	<!-- <script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="{{ asset( 'frontend/js/video.js' ) }}" defer="defer"></script>
	<script src="{{ asset( 'frontend/js/slick.min.js' ) }}" defer="defer"></script>
	<script>
		
		var hash = document.location.hash;
		if (hash) {
		    console.log(hash);
		    $(".tabbing a[href='"+hash+"']").tab('show');
		} 

		// Change hash for page-reload
		$('.tabbing a').on('shown.bs.tab', function (e) {
		    window.location.hash = e.target.hash;
		});

	    videojs("myPlayerID").ready(function () {
	      // Function to read the browser cookie
	      var read_cookie = function (key) {
	          var result;
	          return (result = new RegExp('(^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? result[2] : null;
	      }
	      // Initialize variables and read the browser cookie associated with the Brightcove video position
	      var myPlayer = this,
	          videoStart = 0,
	          currentPosition,
	          cookie = read_cookie("BC_position");
	      // If the cookie exists, then set the video start position to this value. Otherwise, start from the beginning of the video.
	      if(cookie != null){
	          videoStart = cookie;
	        } else {
	          videoStart = 0;
	        }
	        // Wait for when the player is ready.
	        myPlayer.on("loadedmetadata", function () {
	          // If video position is greater than zero, than start playback at that point.
	          if (cookie > 0) {
	            myPlayer.currentTime(parseInt(cookie));
	            myPlayer.play();
	          }
	        })
	        // Display the video start position
	        document.getElementById("cookieDisplay1").innerHTML = videoStart;
	        // Listen for when the current playback position has changed. This should be every 15-250 milliseconds.
	        myPlayer.on("timeupdate", function() {
	          currentPosition = myPlayer.currentTime();
	          // When the integer value changes, then update the cookie
	          if (Math.round(currentPosition) != videoStart) {
	              videoStart = Math.round(currentPosition);
	              document.cookie="BC_position=" + escape(videoStart) + ";";
	              // Display the current video position
	              document.getElementById("cookieDisplay2").innerHTML = read_cookie("BC_position");
	            }
	        });
	        // When video playback reaches the end, then reset the cookie value to zero
	        myPlayer.on("ended", function () {
	          videoStart = 0;
	          document.cookie="BC_position=;expires=0;";
	        })
	    });
	    
	</script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-131947227-1"></script>
	<script>
	  	window.dataLayer = window.dataLayer || [];
	  	function gtag(){dataLayer.push(arguments);}
	  	gtag('js', new Date());

	  	gtag('config', 'UA-131947227-1');
	</script>
	<script type="text/javascript">

$( document ).ready(function() {
   
var mouseX = 0;
var mouseY = 0;
var popupCounter = 0;

document.addEventListener("mousemove", function(e) {
   mouseX = e.clientX;
   mouseY = e.clientY;
   //document.getElementById("coordinates").innerHTML = "<br />X: " + e.clientX + "px<br />Y: " + e.clientY + "px";
});

$(document).mouseleave(function () {
   if (mouseY < 100) {
       if (popupCounter < 1) {
           //alert("Please don't close the tab!");
           $("#close_tab").modal();
       }
       popupCounter ++;
   }
});

});
   </script>
</body>
</html>
