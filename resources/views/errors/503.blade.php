@extends('errors::layout')

@section('title', 'Website Under Maintenance Mode | The MoneyMile')

@section('content')
    <img src="{{ asset( 'frontend/images/the_money_mile_logo.png' ) }}" width="220" height="30" title="{{ config('app.name', 'The MoneyMile') }}" alt="{{ config('app.name', 'The MoneyMile') }}" />
@stop
@section('message', ' Website Under Maintenance. Be right back. ')
