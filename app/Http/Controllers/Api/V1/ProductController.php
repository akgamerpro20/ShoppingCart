<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Product;
use App\Http\Resources\Product as ProductResource;

class ProductController extends Controller
{
    public function index() {
        $products = Product::all();
        return ProductResource::collection($products);
    }

    public function search($id) {
        $product = Product::findOrFail($id);
        return new ProductResource($product);
    }
}
