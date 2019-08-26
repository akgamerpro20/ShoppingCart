<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::namespace('Api\V1')
->prefix('v1')
->group(function() {
    // For Login and Register
    Route::post('/register','AuthController@register');
    Route::post('/login','AuthController@login');

    // for Product
    Route::get('/product','ProductController@index');
    Route::get('/search_product/{id}','ProductController@search');

    // for Category
    Route::get('/category','CategoryController@index');
    Route::get('/search_category/{id}','CategoryController@search');
    Route::post('/create_category','CategoryController@store');
    Route::delete('/delete/{id}','CategoryController@destroy');

});
