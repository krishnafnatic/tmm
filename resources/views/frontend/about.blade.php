@extends('frontend.layouts.master')

@section('content')
<div class="container">
	<div class="row about-us">
		<div class="col-sm-6">
		 	<!--<iframe width="100%" height="100%" src="https://www.youtube.com/embed/9prd9nCNQXI?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>-->
		 	<video width="100%" height="100%" controls>
  <source src="{{ asset( 'frontend/video/WHATSAP_MONEYMILE_PROMO.mp4' ) }}" type="video/mp4">
Your browser does not support the video tag.
</video>
		</div>
	 	<div class="col-sm-1">
	 		<div class="vl"> </div>
	 	</div>

	 	<div class="col-sm-5 about-right">
		 	<br>
		 	<div class="row">
			 	<div class="col-sm-4 text-center p-0">
			 		<img src="{{ asset( 'frontend/images/tmm-logo2.png' ) }}" class="tmm-profile-logo ">
			 	</div>
		 	
                <div class="col-sm-8 text-center"><br>
                	<h3>Money Mile</h3>     
                 	<ul class="user-profile-social-ico">
                   		<li> <a href=""> <i class="fab fa-facebook fa-2x"></i> </a> </li>
                   		<li> <a href=""> <i class="fab fa-linkedin fa-2x"></i> </a> </li>
                   		<li> <a href=""> <i class="fab fa-google fa-2x"></i> </a> </li>
                   		<li> <a href=""> <i class="fab fa-twitter-square fa-2x"></i> </a> </li>
                 	</ul>
             	</div>
		    </div>  
		    <br><br><br>
		    <h1>Your Money's Best Friend</h1>
		    <p>India’s premier money, investment and personal finance offering. Founded by veteran business journalists Vivek Law, Mitali Mukherjee, finance guru Surya Bhatia and content creator Sumit Sabharwal that cuts across digital, TV and other mediums.</p>
		</div>
	</div>	
</div>  	
@endsection