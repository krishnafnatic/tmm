<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Tag Subcribers</title>
	<link rel="stylesheet" type="text/css" href="{{ asset( 'frontend/css/email.css' ) }}">
</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
	<table class="head-wrap" bgcolor="#999999">
		<tr>
			<td></td>
			<td class="header container" align="center">
				<div class="content">
					<table bgcolor="#999999">
						<tr>
	                        <td class="header" style="font-family: Avenir, Helvetica, sans-serif;box-sizing: border-box; padding: 25px 0; text-align: center;">
	                            <a href="{{ url('/') }}">
	                                <img src="{{ asset( 'frontend/images/the_money_mile_logo.png' ) }}" width="220" height="30" title="{{ config('app.name', 'TheMoneyMile') }}" alt="{{ config('app.name', 'TheMoneyMile') }}" />
	                            </a>
	                        </td>
	                    </tr>
					</table>
				</div>
			</td>
			<td></td>
		</tr>
	</table>
	<table class="body-wrap" bgcolor="">
		<tr>
			<td></td>
			<td class="container" align="" bgcolor="#FFFFFF">
				@if(isset( $videos ) && count( $videos ) )
					@foreach( $videos as $video )
						<div class="content">
							<table bgcolor="">
								<tr>
									<td class="small" width="20%" style="vertical-align: top; padding-right:10px;">
										<img src="{{ $video['images']['thumbnail']['src'] }}" alt="{{ $video['name'] }}" title="{{ $video['name'] }}" />
									</td>
									<td>
										<h4>{{ $video['name'] }}</h4>
										<p class="">{{ $video['description'] }}</p>
										<a class="btn" href="{{ url( '/video', $video['slug'] ) }}"> Click Video &raquo;</a>
									</td>
								</tr>
							</table>
						</div>
					@endforeach
				@endif
			</td>
			<td></td>
		</tr>
	</table>
</body>
</html>