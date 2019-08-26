@extends('layouts.adminlte')

@section('content')

<div class="col-md-7 offset-md-2">
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Edit Products</h3>
        </div>

        <div class="card-body p-3">
            <form method="post" action="{{route('products.update',$product->id)}}" enctype="multipart/form-data"> 
            @csrf
			@method('patch')

                <div class="form-group">
    				<label for="title">Title</label>

                    @if($errors->has('title'))
                        <input type="text" class="form-control" name="title" id="title" placeholder="Please fill product title..." value="{{old('title')}}" />
    					<small class="form-text text-danger">
							{{$errors->first('title')}}
                        </small>
                    @else
                    <input type="text" class="form-control" name="title" id="title" placeholder="Please fill product title..." value="{{$product->title}}" />
    				@endif
                </div>

                <div class="form-group">
    				<label for="description">Description</label>
                    @if($errors->has('description'))
                        <textarea class="form-control" name="description" id="description" rows="2" placeholder="Please fill movie description">{{old('description')}}</textarea>
  						<small class="form-text text-danger">
  							{{$errors->first('description')}}
                        </small>
                    @else
                        <textarea class="form-control" name="description" id="description" rows="4" placeholder="Please fill movie description">{{$product->description}}</textarea>
  					@endif
                </div>
                  
                <div class="row">
  					<div class="col-md-6">
  						<div class="form-group">
    						<label for="price">Price $</label>	

                            @if($errors->has('price'))
                                <input type="number" class="form-control" name="price" placeholder="Please fill product price..." value="{{old('price')}}" MIN="1"/>
    							<small class="form-text text-danger">
    								{{$errors->first('price')}}
                                </small>
                            @else
                                <input type="number" class="form-control" name="price" placeholder="Please fill product price..." value="{{$product->price}}" MIN="1"/>
    						@endif
  						</div>
  					</div>
  					<div class="col-md-6">
  						<div class="form-group">
    						<label for="category_id">Choose Category</label>
    						<select class="form-control" name="category_id">
    							@foreach($categories as $category)
  									<option value="{{$category->id}}" 
									  @if($category->id == $product->category_id)
									  	selected
									  @endif
									  >{{$category->name}}</option>
  								@endforeach
							</select>
  						</div>
  					</div>
  				</div>
                  

                <div class="form-group">
    				<label for="photo">Product Photo</label><br/>
    				<input type="file" name="photo" id="photo">

    				@if($errors->has('photo'))
    					<small class="form-text text-danger">
    						{{$errors->first('photo')}}
    					</small>
    				@endif  
					<div id="preview"></div>   				
  				</div>
                <button type="submit" class="btn btn-primary float-right">Submit</button>
            </form>
        </div>
    </div>
</div>

<script>
  $(function() {
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