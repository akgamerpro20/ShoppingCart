<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Order;

class AdminController extends Controller
{
	public function __construct() {
		$this->middleware('backend');
	}

	public function index() {
        $orders = Order::where('admin_del', '0')->paginate(5);
        $orders->transform(function($order , $key) {
            $order->cart = unserialize($order->cart);
            return $order;
        });
		return view('backend.dashboard',compact('orders'));
	}

	public function update(Request $request,$id)
    {
        $confirm = Order::whereId($id)->FirstOrfail();
        $confirm->update([
            'admin_del' => $request->get('confirm')
        ]);
        return redirect()->route('dashboard')->with('success','Successfully deleted!');
    }

}
