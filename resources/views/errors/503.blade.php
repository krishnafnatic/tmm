@extends('frontend.layouts.down')

@section('title')

	<title>503 - Website Under Maintenance | {{ config('app.name') }} | {{ config('app.message') }}</title>
@stop

@section('logo')
    <img src="{{ asset( 'frontend/images/the_money_mile_logo.png' ) }}" width="220" height="30" title="{{ config('app.name', 'The MoneyMile') }}" alt="{{ config('app.name', 'The MoneyMile') }}" />
@stop

@section('message', ' Website Under Maintenance. Be right back. ')
