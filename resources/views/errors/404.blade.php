	@extends('frontend.layouts.404_master')
	
	@section('content')
		<div class="container signup-body" style="text-align:center">
			<img src="{{ asset( 'frontend/images/404_error.png' ) }}" alt="404 - Page Not Found" title="404 - Page Not Found" />
			<h1>{{ __( 'messages.page_not_found' ) }}</h1>
			<h6>{{ __( 'messages.requred_url_server' ) }}</h6>
			<button type="submit" class="btn-secondary" value="{{ __( 'messages.contact_us' ) }}" onclick="location.href='{{ url('contact') }} '">
                                {{ __( 'messages.contact_us' ) }}
            </button> &nbsp; &nbsp;
            <input type="submit" class="" value="{{ __( 'messages.go_to_homepage' ) }}" onclick="location.href='{{ url('/') }} '" />
		</div>
	@endsection