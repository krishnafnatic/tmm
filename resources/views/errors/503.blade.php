@extends('frontend.layouts.500_master')
@section('title', 'Website Under Maintenance Mode')
@section('content')
	<div class="container signup-body" align="center">
		<img src="{{ asset( 'frontend/images/500_error.png' ) }}" />
		<h1>{{ __( 'messages.internal_server_error' ) }}</h1>
		<p>{{ __( 'messages.internal_server_error_msg' ) }}</p>
		<button type="submit" class="btn-secondary" value="{{ __( 'messages.contact_us' ) }}" onclick="location.href='{{ url('contact') }} '">
                            {{ __( 'messages.contact_us' ) }}
        </button> &nbsp; &nbsp;
        <input type="submit" class="" value="{{ __( 'messages.go_to_homepage' ) }}" onclick="location.href='{{ url('/') }} '" />
	</div>
@endsection