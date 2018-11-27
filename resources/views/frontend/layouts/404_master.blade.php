<!doctype html>
<html lang="{{ app()->getLocale() }}">
	@include('frontend.elements.404_meta')
<body>
	@include('frontend.elements.header')
		<main role="main">
			@yield('content')
		</main>
	@include('frontend.elements.footer')

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script type="text/javascript" src="{{ asset( 'frontend/js/subscribe_me.js' ) }}"></script>
	<script type="text/javascript" src="{{ asset( 'frontend/js/slick.min.js' ) }}"></script>
</body>
</html>