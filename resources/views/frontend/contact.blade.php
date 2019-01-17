	@extends('frontend.layouts.master')

	@section('content')
		<div class="container">
			<br /><br /> @include('frontend.elements.message')
			@if(Session::has('flashMessage'))
			  	<div class="alert alert-danger alert-block">
					<button type="button" class="close" data-dismiss="alert">×</button>	
			        <strong>{{ Session::get('flashMessage') }}</strong>
				</div>
			@endif
			<div class="row contact-us">
			 	<div class="col-sm-5">
		 	  		<h1> 
		 	  			<span> India’s premier </span> 
		 	  			<br> money, investment and personal finance offering.
		 	  		</h1>
			 	</div>
		 	  	<div class="col-sm-2">
		 	  		<div class="vl"> </div>
		 	  	</div>
		 	  	<div class="col-sm-5">
		 	  		<h5> Email us </h5>	
		 	  		<a href="mailto:hello@themoneymile.com" target="_top">hello@themoneymile.com</a>
		 	  		<br> <hr> <br>
		 	  		<h5>Send us a message</h5>
		 	  		<form class="col-12 contact-us-from pl-0" action="{{ route( 'contact_us' ) }}" method="get">
		 	  			<div class="form-group{{ $errors->has('name') ? '' : '' }}">
			 	  			<label>Name</label>
			 	  			<input type="text" name="name" id="name" class="form-control" value="{{ old( 'name' )}}" placeholder="{{ __('messages.enter_name') }}" autocomplete="off" required>
			 	  			@if ($errors->has('name'))
			                    <span class="text-danger">
			                        {{ $errors->first('name') }}
			                    </span>
		                  	@endif
		                </div>

		                <div class="form-group {{ $errors->has('email') ? '' : '' }}">
			 	  			<label>Email</label>
			 	  			<input type="text" name="email" id="email" class="form-control {{ $errors->has('email') ? 'is-invalid' : '' }}" value="{{ old( 'email' )}}" placeholder="{{ __('messages.enter_email') }}" autocomplete="off" required>
			 	  			@if ($errors->has('email'))
			                    <span class="text-danger">
			                        {{ $errors->first('email') }}
			                    </span>
		                  	@endif
		                </div>

		                <div class="form-group{{ $errors->has('message') ? '' : '' }}">
			 	  			<label>Message</label>
			 	  			<textarea class="col" name="message" id="message" placeholder="{{ __('messages.enter_message') }}" style="border: 1px solid #ced4da;" required>{{ old( 'message' ) }}</textarea>
			 	  			<input type="submit" name="send" value="{{ __('messages.send') }}">
			 	  			@if ($errors->has('message'))
			                    <span class="text-danger">
			                        {{ $errors->first('message') }}
			                    </span>
		                  	@endif
			 	  		</div>
		 	  		</form>
		 	 	</div>
			</div>	
		</div>
	@endsection