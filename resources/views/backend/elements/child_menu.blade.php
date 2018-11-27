
@foreach($childs as $child)
	    {{ $child->title }}
	@if(count($child->childs))
        @include('manageChild',['childs' => $child->childs])
    @endif
@endforeach
