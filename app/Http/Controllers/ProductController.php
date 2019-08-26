<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Category;

class ProductController extends Controller
{
    public function __construct() {
		$this->middleware('backend');
	}
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
		$products = Product::paginate(5);
    	return view('backend.product.index',compact('products'));
	}

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all();
        return view('backend.product.create',compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate(Product::$rules);
        $file = $request->file('photo');
        $filename = uniqid() . '_' . $file->getClientOriginalName();
        $file->move(public_path() . "/uploads/" , $filename);
        Product::create([
            'title' => $request->get('title'),
            'description' => $request->get('description'),
            'price' => $request->get('price'),
            'category_id' => $request->get('category_id'),
            'photo' => $filename
        ]);
        return redirect()->route('products.create')->with('success','Successfully...');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
		$product = Product::whereId($id)->FirstOrfail();
		$categories = Category::all();
		return view('backend.product.edit',compact('product','categories'));
	}

	public function update(Request $request,$id) {
		$request->validate(Product::$rules);
		$file = $request->file('photo');
        $filename = uniqid() . '_' . $file->getClientOriginalName();
        $file->move(public_path() . "/uploads/" , $filename);
		$product = Product::whereId($id)->FirstOrfail();
		$product->update([
			'title' => $request->get('title'),
			'description' => $request->get('description'),
			'price' => $request->get('price'),
			'category_id' => $request->get('category_id'),
			'photo' => $filename
		]);
		return redirect()->route('products.index')->with('success','Successfully');
	}
	
	public function destroy($id) {
		$product = Product::whereId($id)->FirstOrfail();
		$product->delete();
		return redirect()->route('products.index')->with('success','Successfully');
	}
}
