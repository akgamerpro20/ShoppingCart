@extends('layouts.master')

@section('title','Cart')

@section('content')

<div class="container col-md-4 col-md-offset-4">
    <div class="well">
        <legend>Checkout</legend>
        <hr style="border: 0.1px solid #6D4E4D;"/>
		<h4>Your Total Price : ${{$total}}</h4>
		<div id="charge-error" class="alert alert-danger {{ !Session::has('error') ? 'hidden' : '' }}">
			{{ Session::get('error') }}
		</div>
        <br>
        <form action="{{route('checkout')}}" method="post" id="checkout-form">
        	@csrf
            <div class="form-group">
    			<label for="name">Name</label>
    			<input type="text" class="form-control" name="name" id="name" placeholder="Please fill your name..." value="{{old('name')}}" autofocus />

				@if($errors->has('name'))
    				<small class="form-text text-danger">
						{{$errors->first('name')}}
					</small>
    			@endif
  			</div>

            <div class="form-group">
    			<label for="address">Address</label>
    			<input type="text" class="form-control" name="address" id="address" placeholder="Please fill your address..." value="{{old('address')}}" />

				@if($errors->has('address'))
    				<small class="form-text text-danger">
						{{$errors->first('address')}}
					</small>
    			@endif
  			</div>

            <div class="form-group">
    			<label for="card-name">Card Holder Name</label>
    			<input type="text" class="form-control" name="card_name" id="card-name" placeholder="Please fill your card holder name..." value="{{old('card_name')}}" />

				@if($errors->has('card_name'))
    				<small class="form-text text-danger">
						{{$errors->first('card_name')}}
					</small>
    			@endif
  			</div>

            <div class="form-group">
    			<label for="card-number">Credit Card Number</label>
    			<input type="text" class="form-control" name="card_number" id="card-number" placeholder="Please fill your card number..." value="{{old('card_number')}}" />

				@if($errors->has('card_number'))
    				<small class="form-text text-danger">
						{{$errors->first('card_number')}}
					</small>
    			@endif
  			</div>

            <div class="row">

  				<div class="col-md-6">
                    <div class="form-group">
    			        <label for="card-expiry-month">Expiration Month</label>
    			        <input type="text" class="form-control" name="exp_month" id="card-expiry-month" placeholder="Please fill your card expiry month..." value="{{old('exp_month')}}" />

						@if($errors->has('exp_month'))
    						<small class="form-text text-danger">
								{{$errors->first('exp_month')}}
							</small>
    					@endif
  			        </div>
  				</div>

  				<div class="col-md-6">
                    <div class="form-group">
    			        <label for="card-expiry-year">Expiration Year</label>
    			        <input type="text" class="form-control" name="exp_year" id="card-expiry-year" placeholder="Please fill your card expiry year..." value="{{old('exp_year')}}" />

						@if($errors->has('exp_year'))
    						<small class="form-text text-danger">
								{{$errors->first('exp_year')}}
							</small>
    					@endif
  			        </div>
  				</div>

  			</div>

            <div class="form-group">
    			<label for="card-cvc">CVC</label>
    			<input type="text" class="form-control" name="cvc" id="card-cvc" placeholder="Please fill your card cvc..." value="{{old('cvc')}}" />

				@if($errors->has('cvc'))
    				<small class="form-text text-danger">
						{{$errors->first('cvc')}}
					</small>
    			@endif
  			</div>
            <button type="submit" class="btn btn-default">Buy now</button>

        </form>
    </div>
</div>

@endsection

@section('script')
<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
<script src="{{asset('js/checkout.js')}}"></script>
@endsection