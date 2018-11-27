@extends('frontend.layouts.master')

@section('content')
<div class="container">
	<div class="row about-us">
		<div style="width: 100%;padding-bottom:25px;">
			<h1>{{ $cms['title'] }}
			</h1>
		</div>
		<br />
		{!!  $cms['description']  !!}
	</div>	
</div>  	
<style type="text/css">
	.about-us h2 {
		width: 100%;
	}
</style>
@endsection