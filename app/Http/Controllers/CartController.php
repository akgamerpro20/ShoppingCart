<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Category;
use App\Cart;
use App\Order;
use Auth;
use Session;

class CartController extends Controller
{

    public function getAddToCart(Request $request,$id) {
        if($request->ajax()) {
            $product = Product::find($id);
            $oldCart = Session::has('cart') ? Session::get('cart') : null;
            $cart = new Cart($oldCart);
            $cart->add($product,$product->id);

            $request->session()->put('cart',$cart);
            // $request->session()->flush();
            return response()->json(['success' => 1, 'msg' => 'Successsfully Added.', 'req_id' => $id, 'product_id' => $product->id]);
        }
    }

    public function getIncreaseByOne($id) {
        $oldCart = Session::has('cart') ? Session::get('cart') : null;
        $cart = new Cart($oldCart);
        $cart->increaseByOne($id);

        Session::put('cart',$cart);
        
        return redirect()->route('product_shoppingCart');
    }

    public function getReduceByOne($id) {
        $oldCart = Session::has('cart') ? Session::get('cart') : null;
        $cart = new Cart($oldCart);
        $cart->reduceByOne($id);

        if(count($cart->items) > 0) {
            Session::put('cart',$cart);
        } else {
            Session::forget('cart');
        }

        return redirect()->route('product_shoppingCart');
    }

    public function getRemoveItem($id) {
        $oldCart = Session::has('cart') ? Session::get('cart') : null;
        $cart = new Cart($oldCart);
        $cart->removeItem($id);

        if(count($cart->items) > 0) {
            Session::put('cart',$cart);
        } else {
            Session::forget('cart');
        }

        return redirect()->route('product_shoppingCart');
    }

    public function getCart() {
        $categories = Category::all();
        if(!Session::has('cart')) {
            return view('cart',compact('categories'));
        }
        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart);
        return view('cart',['products' => $cart->items,'totalPrice' => $cart->totalPrice],compact('categories'));
    }

    public function getCheckout() {
        $categories = Category::all();
        if(!Session::has('cart')) {
            return view('cart',compact('categories'));
        }
        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart);
        $total = $cart->totalPrice;
        return view('checkout',['total' => $total],compact('categories'));
    }

    public function postCheckout(Request $request) {
        $request->validate(Order::$rules);
        if(!Session::has('cart')) {
            return redirect()->route('product_shoppingCart');
        }
        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart);

        $order = new Order();
        $order->cart = serialize($cart);
        $order->name = $request->get('name');        
        $order->address = $request->get('address');        
        $order->card_name = $request->get('card_name');        
        $order->card_number = $request->get('card_number');        
        $order->exp_month = $request->get('exp_month');        
        $order->exp_year = $request->get('exp_year');        
        $order->cvc = $request->get('cvc');   
        
        Auth::user()->orders()->save($order);

        Session::forget('cart');
        return redirect()->route('product_shoppingCart')->with('success','Successfully purchased products!');
    }
        
}
