@if( isset( $advertisment ) && !empty( $advertisment ) )
	<div class="tmm-image-ad" id="home-ad-1">
	 	<a href="https://www.paisabazaar.com/" target="_tab">
	 		<img src="{{ asset( $advertisment['image']  ) }}" width="{{ $advertisment['width'] }}" height="{{ $advertisment['height'] }}"  class="img-fluid" />
	 	</a>
	</div>
@endif