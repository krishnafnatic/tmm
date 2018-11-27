@if(isset($success) || Session::has('success') )
	<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		<strong>{{ __( 'messages.success' ) }}</strong> {{ isset($success) ? $info : Session::get('success') }}
	</div>
@endif

@if ($message = Session::get('error'))
<div class="alert alert-danger alert-block">
	<button type="button" class="close" data-dismiss="alert">×</button>	
        <strong>{{ $message }}</strong>
</div>
@endif


@if ($message = Session::get('warning'))
<div class="alert alert-warning alert-block">
	<button type="button" class="close" data-dismiss="alert">×</button>	
	<strong>{{ __( 'messages.warning' ) }}</strong>{{ $message }}
</div>
@endif


@if ($message = Session::get('info'))
<div class="alert alert-info alert-block">
	<button type="button" class="close" data-dismiss="alert">×</button>	
	<strong>{{ __( 'messages.info' ) }}</strong>{{ $message }}
</div>
@endif


@if ($message = Session::get('status'))
<div class="alert alert-success alert-dismissable">
	<button type="button" class="close" data-dismiss="alert">×</button>	
	<strong>{{ $message }}</strong>
</div>
@endif

@if ($errors->any())
    <div class="alert alert-danger">
    	{{ __( 'messages.error_msg' ) }}
    	<button type="button" class="close" data-dismiss="alert">×</button>
     
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul> 
    </div>
@endif