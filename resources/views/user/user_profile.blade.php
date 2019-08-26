@extends('layouts.master')

@section('title','User Profile')

@section('content')

<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="well">
                <legend>My Orders</legend>
                @if($orders->count() > 0)
                    @foreach($orders as $order)
                        @if($order->user_del === 0)
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <form method="post" action="{{ route('user_update', $order->id) }}" style="text-align: right;">
                                        @csrf
                                        <span>Purchase Time : {{$order->created_at}}</span>&nbsp;
									    <input type="hidden" name="confirm" value="1"/>
                                        <button type="submit" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></button>
								    </form>
                                </div>
                                <div class="panel-body">
                                    <ul class="list-group">
                                        @foreach($order->cart->items as $item)
                                            <li class="list-group-item">
                                                <span class="badge">${{ $item['price'] }}</span>
                                                    {{ $item['item']['title'] }} 
                                                <span class="badge pull-left">{{ $item['qty'] }} Units</span>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                                <div class="panel-footer" style="text-align: right;">
                                    <strong>Total Price : $ {{ $order->cart->totalPrice }}</strong>
                                </div>
                            </div>
                        @endif
                    @endforeach
                @else
                    <hr/>
                    <h2>No have order</h2>
                @endif
            </div>
        </div>
    </div>
</div>

@endsection