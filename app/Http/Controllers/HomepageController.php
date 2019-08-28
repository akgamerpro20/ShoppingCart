<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Category;

class HomepageController extends Controller
{
    public function index()
    {
        $products = Product::all();
        $categories = Category::all();
        return view('homepage',compact('products','categories'));
    }

    public function showdetail(request $request) {
    	$products = Product::find($request->id);
    	return response()->json($products);
    }

    public function category($id) {
        $products = Product::all();
        $categories = Category::all();
        $category = Category::whereId($id)->FirstOrfail();
        return view('filterpage',compact('products','categories','category'));
    }

}
