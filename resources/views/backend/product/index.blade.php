@extends('layouts.adminlte')

@section('script')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
@endsection

@section('content')

<style>
    .content-header {
        padding: 5px .5rem;
    }
</style>

<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            @if(session('success'))
				<div class="alert alert-success" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<strong>{{session('success')}}</strong>
				</div>
            @endif
            <a href="{{route('products.create')}}" class="btn btn-info">Create Product</a>
        </div>

        <div class="card-body p-0">
            @if($products->count() > 0)
            <table class="table">
                <tr>
                    <!-- <th style="width: 10px">#</th> -->
                    <th style="width: 10px; text-align:center;">Image</th>
                    <th style="width: 10px">Category</th>
                    <th style="width: 10px">Price</th>
                    <th style="width: 10px; text-align:center;">title</th>
                    <th style="text-align:center;">Description</th>
                    <th></th>
                    <th></th>
                </tr>
                @foreach($products as $product)
                    <tr>
                        <!-- <td>{{$product->id}}</td> -->
                        <td>
                            <img src="{{asset('/uploads/' . $product->photo)}}" style="width:119px; height:130px;" alt="no have photo" onclick="Swal.fire({
        						imageUrl: '{{asset('/uploads/' . $product->photo)}}',
                                imageAlt: 'A tall image',
                                imageHeight: '380px',
                                imageWidth: '500px'
    						})" />
                        </td>
                        <td>{{$product->category->name}}</td>
                        <td>${{$product->price}}</td>
                        <td>{{$product->title}}</td>
                        <!-- <td><span class="badge bg-danger">55%</span></td> -->
                        <td>{{$product->description}}</td>
                        <td>
                            <a href="{{route('products.edit',$product->id)}}">
                                <button class="btn btn-success">Edit</button>
                            </a>
                        </td>
                        <td>
                            <form method="post" action="{{route('products.destroy',$product->id)}}">
                                @method('delete')
                                @csrf
                                <button type="submit" class="btn btn-danger" onclick="return myFunction();">Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </table>
            <div class="clearfix float-right mr-2">
                    {{ $products->links() }}
            </div>
                
            @else
                <h2 style="margin-left: 10px;">No have product</h2>
            @endif
        </div>
        <!-- /.card-body -->
    </div>
    <!-- /.card -->

</div>

<script>

// Alert Box start
window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
    	$(this).remove(); 
    });
}, 1000);
// Alert Box end

// Confirm Delete Box start
function myFunction() {
    	if(!confirm("Are You Sure to delete this"))
    	event.preventDefault();
 	};
// Confirm Delete Box end

</script>

@endsection