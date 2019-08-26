@extends('layouts.adminlte')

@section('title','Create Category')

@section('content')

<style>
    .content-header {
        padding: 50px .5rem;
    }
</style>

<div class="col-md-5 offset-md-3">
    <div class="card">
        <div class="card-header">
			@if(session('success'))
          		<p class="alert alert-success">
            		{{session('success')}}
          		</p>
        	@endif
            <h3 class="card-title">Add A New Category</h3>
        </div>

        <div class="card-body p-3">
			<form method="post" action="{{route('categories.store')}}"> 
				@csrf

  				<div class="form-group">
    				<label for="name">Category Name</label>
    				<input type="text" class="form-control" name="name" id="name" placeholder="Please fill category name..." value="{{old('name')}}" autofocus />

    				@if($errors->has('name'))
    					<small class="form-text text-danger">
							{{$errors->first('name')}}
						</small>
    				@endif
  				</div>

  				<button type="submit" class="btn btn-success float-right">Add Category</button>
			</form>
        </div>

		<div class="card-footer">
			<a href="{{route('categories.index')}}" class="btn btn-danger">View All Category</a>
        </div>
    </div>
</div>

<script>

// Alert Box start
window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
    	$(this).remove(); 
    });
}, 1000);
// Alert Box end

</script>

@endsection