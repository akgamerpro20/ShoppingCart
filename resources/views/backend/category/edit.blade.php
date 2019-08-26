@extends('layouts.adminlte')

@section('content')

<div class="col-md-7 offset-md-2">
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Edit Category</h3>
        </div>

        <div class="card-body p-3">
            <form method="post" action="{{route('categories.update',$category->id)}}"> 
            @csrf
			@method('patch')

                <div class="form-group">
    				<label for="name">Category Name</label>

                    @if($errors->has('name'))
                        <input type="text" class="form-control" name="name" id="name" placeholder="Please fill category name..." value="{{old('name')}}" />
    					<small class="form-text text-danger">
							{{$errors->first('name')}}
                        </small>
                    @else
                    <input type="text" class="form-control" name="name" id="name" placeholder="Please fill category name..." value="{{$category->name}}" />
    				@endif
                </div>

                <button type="submit" class="btn btn-primary float-right">Submit</button>
            </form>
        </div>
    </div>
</div>

@endsection