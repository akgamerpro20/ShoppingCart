@extends('layouts.adminlte')

@section('content')
<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            @if(session('success'))
				<div class="alert alert-success" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<strong>{{session('success')}}</strong>
				</div>
            @endif
            <h3 class="card-title">Orders</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            @if($orders->count() > 0)
                <table class="table table-bordered">
                    <tr>
                        <th style="width: 10px">#</th>
                            <th>User Name</th>
                            <th>User Email</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total Price</th>
                            <th>Purchase Time</th>
                            <th style="width: 40px"></th>
                    </tr>
                    @foreach($orders as $order)
                            <tr>
                                <td><i class="fas fa-user"></i></td>
                                <td>{{$order->name}}</td>
                                <td>{{$order->user->email}}</td>
                                <td>
                                    @foreach($order->cart->items as $item)
                                        {{ $item['item']['title'] }}<br/>
                                    @endforeach
                                </td>
                                    <td>
                                        @foreach($order->cart->items as $item)
                                            <span class="badge bg-success">{{ $item['qty'] }} Units</span><br/>
                                        @endforeach
                                    </td>
                                    <td>
                                        @foreach($order->cart->items as $item)
                                            <span class="badge bg-info">${{ $item['price'] }}</span><br/>
                                        @endforeach
                                    </td>
                                    <td><span class="badge bg-primary">$ {{ $order->cart->totalPrice }}</span></td>
                                    <td>{{$order->created_at}}</td>
                                <td>
                                    <form method="post" action="{{ route('admin_update', $order->id) }}">
									    @csrf
									    <input type="hidden" name="confirm" value="1"/>
                                        <button type="submit" class="btn btn-danger btn-sm" onclick="return myFunction();"><i class="fas fa-trash-alt"></i></button>
								    </form>
                                </td>
                            </tr>
                    @endforeach
                </table>
                <br/>
                {{ $orders->links() }}
            @else
                <hr/>
                <h2>No have order</h2>
            @endif
        </div>
        <!-- /.card-body -->
        <!-- <div class="card-footer clearfix">
            <ul class="pagination pagination-sm m-0 float-right">
                <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
            </ul>
        </div> -->
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

// Confirm Delete Box start
function myFunction() {
    if(!confirm("Are You Sure to delete this"))
    event.preventDefault();
 };
 // Confirm Delete Box end

</script>

@endsection