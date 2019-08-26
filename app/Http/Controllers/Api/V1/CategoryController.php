<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Category;
use App\Http\Resources\Category as CategoryResource;

class CategoryController extends Controller
{
    public function __construct() 
    {
        $this->middleware('auth:api')->except(['index','search']);
    }

    public function index() {
        $categories = Category::all();
        return CategoryResource::collection($categories);
    }

    public function search($id) {
        $category = Category::findOrFail($id);
        return new CategoryResource($category);
    }

    public function store(Request $request) {
        $category = new Category();
        $category->name = $request->name;
        
        if($category->save()) {
            return response()->json([
                'result' => 1,
                'message' => 'successfully created',
                'data' => new CategoryResource($category)
            ]);

        }
    }

    public function destroy($id) {
        $category = Category::findOrFail($id);

        if($category->delete()) {
            return response()->json([
                'result' => 1,
                'message' => 'successfully deleted',
                'data' => new CategoryResource($category)
            ]);
        }
    }
}
