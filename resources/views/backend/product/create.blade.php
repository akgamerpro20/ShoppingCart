@extends('layouts.adminlte')

@section('title','Create Product')

@section('content')

<style>
    .content-header {
        padding: 5px .5rem;
    }
</style>

<div class="col-md-7 offset-md-2">
    <div class="card">
        <div class="card-header">
			@if(session('success'))
          		<p class="alert alert-success">
            		{{session('success')}}
          		</p>
        	@endif
            <h3 class="card-title">Add A New Product</h3>
        </div>

        <div class="card-body p-3">
			<form method="post" action="{{route('products.store')}}" enctype="multipart/form-data"> 
				@csrf

  				<div class="form-group">
    				<label for="title">Title</label>
    				<input type="text" class="form-control" name="title" id="title" placeholder="Please fill product title..." value="{{old('title')}}" autofocus />

    				@if($errors->has('title'))
    					<small class="form-text text-danger">
							{{$errors->first('title')}}
						</small>
    				@endif
  				</div>

  				<div class="form-group">
    				<label for="description">Description</label>
    				<textarea class="form-control" name="description" id="description" rows="2" placeholder="Please fill product description">{{old('description')}}</textarea>
  					@if($errors->has('description'))
  						<small class="form-text text-danger">
  							{{$errors->first('description')}}
  						</small>
  					@endif
  				</div>

  				<div class="row">
  					<div class="col-md-6">
  						<div class="form-group">
    						<label for="price">Price $</label>
    						<input type="number" class="form-control" name="price" placeholder="Please fill product price..." value="{{old('price')}}" MIN="1"/>

    						@if($errors->has('price'))
    							<small class="form-text text-danger">
    								{{$errors->first('price')}}
    							</small>
    						@endif
  						</div>
  					</div>
  					<div class="col-md-6">
  						<div class="form-group">
    						<label for="category_id">Choose Category</label>
    						<select class="form-control" name="category_id">
    							@foreach($categories as $category)
  									<option value="{{$category->id}}">{{$category->name}}</option>
  								@endforeach
							</select>
  						</div>
  					</div>
  				</div>

  				<div class="form-group">
    				<label for="photo">Product Photo</label><br />
    				<input type="file" name="photo" id="photo">

    				@if($errors->has('photo'))
    					<small class="form-text text-danger">
    						{{$errors->first('photo')}}
    					</small>
    				@endif
					<div id="preview"></div>   				
  				</div>
				<br />
				<a href="{{route('products.index')}}" class="btn btn-danger">View All Products</a>
  				<button type="submit" class="btn btn-success float-right">Add Product</button>
			</form>
        </div>
    </div>
</div>

  <script>
  $(function() {
	// Alert Box start
	window.setTimeout(function() {
        $('.alert').fadeTo(500,0).slideUp(500,function() {
          $(this).remove();
        });
      },1000);
    // Alert Box end

	$('#photo').change(function() {
		if(document.getElementById('photo').files.length) {
			$('#preview').html(`
				<img src="${URL.createObjectURL(event.target.files[0])}" width="100px" class="img-responsive" style="margin-top: 8px" />
			`);
		}
	});
  });
  </script>

@endsection