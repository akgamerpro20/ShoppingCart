@extends('layouts.master')

@section('title','Home')

@section('link')
<link rel="stylesheet" type="text/css" href="{{asset('css/home.css')}}">
@endsection

@section('script')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
@endsection

@section('content')

<div class="container-fluid">
	<div class="row">

		<div class="col-md-12">
		  @foreach($products as $product)
            @if($category->id === $product->category_id)
                <div class="col-sm-6 col-md-3">
                    <!-- Product Start -->
                    <div id="product_card" class="thumbnail">
                        <h3 id="price">
                            <span id="span_price" class="label">
                                {{$product->price}}
                            </span>
                        </h3>
                        <img id="product_img" src="{{asset('/uploads/' . $product->photo)}}" alt="No have photo" onclick="Swal.fire({
                        imageUrl: '{{asset('/uploads/' . $product->photo)}}',
                        imageAlt: 'A tall image'
                        })"; />
                        <div class="caption">
                            <h3 id="card_title">{{$product->title}}</h3>
                            <p id="cart_body">
                                {{ strrpos(substr(strip_tags($product->description), 200, 200),' ') 
                                              ?  
                                substr(substr(strip_tags($product->description), 0, 200),0,strrpos(substr(strip_tags($product->description), 0, 200),' ')) 
                                              : 
                                substr(substr(strip_tags($product->description), 0, 200),0) 
                                }}
                                {{ strlen(strip_tags($product->description)) > 200 ? "..." : "" }}
                            </p>
                            <p>
                                <!-- <a href="{{route('product_addToCart',['id' => $product->id])}}" class="btn btn-info" role="button">Add to Cart</a> -->
								<button class="btn btn-info add-to-cart" data-id='{{$product->id}}'>Add To Cart</button>
                                <a class="show-modal btn btn-danger pull-right" role="button" data-price="{{$product->price}}" data-title="{{$product->title}}" data-body="{{$product->description}}">View Detail</a> 
                            </p>
                        </div>
                    </div>
                    <!-- Product End -->
                </div>
            @endif
        @endforeach
		</div>	

	</div>
</div>

<!-- Show Detail -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"></h4>
				<button type="button" class="close" data-dismiss="modal" style="outline: none;">&times;</button>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="modal">

            		<div class="form-group row add">
						<label for="price" class="control-label col-sm-3 mt-2">Price :</label>
						<div class="col-sm-9">
							<input type="name" class="form-control" style="background-color: #2e3338; border: 1px solid #2e3338; color: white;" id="fid">
						</div>
					</div>

					<div class="form-group row add">
						<label for="title" class="control-label col-sm-3 mt-2">Book Title :</label>
						<div class="col-sm-9">
							<input type="name" class="form-control" style="background-color: #2e3338; border: 1px solid #2e3338; color: white;" id="t">
						</div>
					</div>

					<div class="form-group row add">
						<label for="body" class="control-label col-sm-3 mt-2">Description :</label>
						<div class="col-sm-9">
							<textarea type="name" class="form-control rounded-0" rows=7 id="b" style="background-color: #2e3338; border: 1px solid #2e3338; color: white;"></textarea> 
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" data-dismiss="modal">
					<span class="fas fa-times"></span>&nbsp;close
				</button>
			</div>
		</div>
	</div>
</div>

<script>
$(function() {
	// Show details function
	$(document).on('click','.show-modal',function() {
		$('.modal-title').text('Details');
		$('.form-horizontal').show();
		$('#fid').val($(this).data('price'));
		$('#t').val($(this).data('title'));
		$('#b').val($(this).data('body'));
		$('#myModal').modal('show');
	});

	$(".add-to-cart").click(function() {
		var id = $(this).data('id');
		$.post(`/add-to-cart/${id}`, { '_token': "{{csrf_token()}}" }, function(res) {
			var cart_count = $('.cart-count');
			var current_cart_count = parseInt(cart_count.data('cart-count'));
			cart_count.data('cart-count', current_cart_count + 1);
			cart_count.html(current_cart_count + 1);

			// alert(res.msg);
		});
	});
});
</script>

@endsection