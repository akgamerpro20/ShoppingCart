@extends('layouts.master')

@section('title','Cart')

@section('content')

<div class="container-fluid">
	@if(Session::has('success'))
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4 col-sm-offset-3">
				<div id="charge-message" class="alert alert-success">
					{{ Session::get('success') }}
				</div>
			</div>
		</div>
	@endif
    <div class="row">
        <div class="col-md-12">
			@if(Session::has('cart'))
            <table id="cart" class="table table-hover table-condensed">
    			<thead>
					<tr>
						<th style="width:30%; text-align:center;">Product Name</th>
						<th style="width:22%" class="text-center"></th>
						<th style="width:10%; text-align:center;">Quantity</th>
						<th style="width:20%; text-align:center;">Price</th>
						<th style="width:10%"></th>
					</tr>
				</thead>
				<tbody class="form-group">
                    @foreach($products as $product)
						<tr>
							<td>
								<div class="row">
									<div class="col-sm-2">
										<span class="badge" style="margin-top:10px;">${{$product['item']['price']}}</span>
									</div>
									<div class="col-sm-10">
										<h4 class="nomargin">{{$product['item']['title']}}</h4>
									</div>
								</div>
							</td>
							<!-- <td class="text-center">
								<div class="btn-group">
									<button type="button" class="btn btn-primary btn-xs dropdown-toogle" data-toggle="dropdown">Action<span class="caret"></span></button>
									<ul class="dropdown-menu">
										<li><a href="{{ route('product_increaseByOne', ['id' => $product['item']['id']]) }}">Increase by 1</a></li>
										<li><a href="{{ route('product_reduceByOne', ['id' => $product['item']['id']]) }}">Reduce by 1</a></li>
										<li><a href="{{ route('product_remove', ['id' => $product['item']['id']]) }}">Reduce All</a></li>
									</ul>
								</div>
							</td> -->
							<td></td>
							<td style="text-align: center;">
								<a href="{{ route('product_reduceByOne', ['id' => $product['item']['id']]) }}" class="btn btn-success btn-sm"><i class="fas fa-minus-circle"></i></a>
								&nbsp;<span class="badge count" data-count="{{ $product['qty'] }}">{{ $product['qty'] }}</span>&nbsp;
								<a href="{{ route('product_increaseByOne', ['id' => $product['item']['id']]) }}" class="btn btn-success btn-sm"><i class="fas fa-plus-circle"></i></a>
							</td>
							<td style="text-align:center;">${{$product['price']}}</td>
							<td>
								<a href="{{ route('product_remove', ['id' => $product['item']['id']]) }}" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></a>
							</td>
						</tr>
                    @endforeach
				</tbody>
				<tfoot class="form-group">
					<tr>
						<td><a href="{{route('homepage')}}" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
						<td colspan="2" class="hidden-xs"></td>
						<td class="hidden-xs"><strong style="padding-left: 3em;">Total Price : ${{$totalPrice}}</strong></td>
						<td><a href="{{route('checkout')}}" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
					</tr>
				</tfoot>
			</table>
			@else
			 <h2>No have cart item</h2>
			@endif
        </div>
    </div>
</div>

<script>
// Alert Box start
window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
    	$(this).remove(); 
    });
}, 2000);
// Alert Box end
</script>

@endsection