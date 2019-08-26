<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use Auth;
use App\Order;

class UserController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index() {
        $categories = Category::all();
        $orders = Auth::user()->orders;
        $orders->transform(function($order , $key) {
            $order->cart = unserialize($order->cart);
            return $order;
        });
        return view('user.user_profile',compact('categories','orders'));
    }

    public function update(Request $request,$id)
    {
        $confirm = Order::whereId($id)->FirstOrfail();
        $confirm->update([
            'user_del' => $request->get('confirm')
        ]);
        return redirect()->route('user_profile');
    }
}
