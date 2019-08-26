@extends('layouts.adminlte')

@section('content')

<div class="col-md-6 offset-md-3">
    <div class="card">
        <div class="card-header">
            @if(session('success'))
				<div class="alert alert-success" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<strong>{{session('success')}}</strong>
				</div>
            @endif
            <a href="{{route('categories.create')}}" class="btn btn-info">Create Category</a>
        </div>

        <div class="card-body p-0">
            @if($categories->count() > 0)
                <table class="table">
                    <tr>
                        <th style="width: 10px; text-align:center;">#</th>
                        <th style="text-align:center">Name</th>
                        <th style="width: 10px;"></th>
                        <th style="width: 10px;"></th>
                    </tr>
                    @foreach($categories as $category)
                        <tr>
                            <td><i class="fab fa-artstation"></i></td>
                            <td style="text-align:center">{{$category->name}}</td>
                            <td><a href="{{route('categories.edit',$category->id)}}" class="btn btn-success">Edit</a></td>
                            <td>
                                <form method="post" action="{{route('categories.destroy',$category->id)}}">
                                    @csrf
                                    @method('delete')
                                    <button class="btn btn-danger" onclick="return myFunction()">Delete</button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </table>
                <div class="clearfix float-right mr-2">
                    {{ $categories->links() }}
                </div>
                
            @else
                <h2>No have Category</h2>
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