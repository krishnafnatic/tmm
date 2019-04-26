<!doctype html>
<html lang="{{ app()->getLocale() }}">
	@include('frontend.elements.meta')
<body>
	<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-55GSLDJ"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
	@include('frontend.elements.header')
		<main>
			@yield('content')
		</main>
	@include('frontend.elements.footer')

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script type="text/javascript">
		var addEvent = function(obj, evt, fn) {
		  	if (obj.addEventListener) {
		    	obj.addEventListener(evt, fn, false);
		  	} else if (obj.attachEvent) {
		    	obj.attachEvent("on" + evt, fn);
		  	}
		};

		addEvent(document, "mouseout", function(event) {
		  	event = event ? event : window.event;
		  	var from = event.relatedTarget || event.toElement;
		  	if ( (!from || from.nodeName == "HTML") && event.clientY <= 100 ) {
		    	$("#subscribePopup").modal('show');
		  	}
		});
	</script>
	<script src="{{ asset( 'frontend/js/subscribe_me.js' ) }}" defer="defer"></script>
	<script src="{{ asset( 'frontend/js/slick.min.js' ) }}" defer="defer"></script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-131947227-1"></script>
	<script>
	  	window.dataLayer = window.dataLayer || [];
	  	function gtag(){dataLayer.push(arguments);}
	  	gtag('js', new Date());

	  	gtag('config', 'UA-131947227-1');
	</script>
</body>
</html>
