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
		@if($products->count() > 0)
			@foreach($products as $product)
        		<div class="col-sm-6 col-md-3">
          		<!-- Product Start -->
            		<div id="product_card" class="thumbnail">
              			<h3 id="price">
                			<span id="span_price" class="label">
                    			${{$product->price}}
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
                  				<!-- <a href="{{route('product_addToCart',['id' => $product->id])}}" class="btn btn-info" id="addcart" role="button">Add to Cart</a> -->
								<button class="btn btn-info add-to-cart" data-id='{{$product->id}}'>Add To Cart</button>

                  				<a class="show-modal btn btn-danger pull-right" role="button" data-price="{{$product->price}}" data-title="{{$product->title}}" data-body="{{$product->description}}">View Detail</a> 
                			</p>
              			</div>
            		</div>
          		<!-- Product End -->
        		</div>
      		@endforeach
		@else
			<h2>No have product</h2>
		@endif
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
						<div class="col-sm-6">
							<span style="position:absolute; top:9px; left:27px;">$</span>
							<input type="name" class="form-control" style="background-color: #2e3338; border: 1px solid #2e3338; color: white; cursor:pointer; padding-left: 20px;" id="fid" disabled/>
						</div>
					</div>

					<div class="form-group row add">
						<label for="title" class="control-label col-sm-3 mt-2">Product Name :</label>
						<div class="col-sm-9">
							<input type="name" class="form-control" style="background-color: #2e3338; border: 1px solid #2e3338; color: white; cursor:pointer;" id="t" disabled />
						</div>
					</div>

					<div class="form-group row add">
						<label for="body" class="control-label col-sm-3 mt-2">Description :</label>
						<div class="col-sm-9">
							<textarea type="name" class="form-control rounded-0" rows=7 id="b" style="background-color: #2e3338; border: 1px solid #2e3338; color: white; cursor:pointer;" disabled /></textarea> 
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