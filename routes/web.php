<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// For Homepage
Route::get('/', 'HomepageController@index')->name('homepage');
Route::get('category/{id}/filter', 'HomepageController@category')->name('category_filter');
// ......................

// For Cart and Checkout
Route::post('/add-to-cart/{id}','CartController@getAddToCart')->name('product_addToCart');
Route::get('/increase/{id}','CartController@getIncreaseByOne')->name('product_increaseByOne');
Route::get('/reduce/{id}','CartController@getReduceByOne')->name('product_reduceByOne');
Route::get('/remove/{id}','CartController@getRemoveItem')->name('product_remove');
Route::get('/shopping-cart','CartController@getCart')->name('product_shoppingCart');
Route::get('/checkout','CartController@getCheckout')->name('checkout')->middleware('auth');
Route::post('/checkout','CartController@postCheckout')->name('checkout')->middleware('auth');
// ..................

// For User Profile
Route::get('/user-profile','UserController@index')->name('user_profile');
Route::post('/user-remove-order/{id}','UserController@update')->name('user_update');
// ...................

// For Backend

    Route::get('N5jryMkE8jjMFyh4yAi9Cb4Cqr4TTabtjMi3pbYa','BackLoginController@getLogin')->name('backend.get');
    Route::post('N5jryMkE8jjMFyh4yAi9Cb4Cqr4TTabtjMi3pbYa','BackLoginController@postLogin')->name('backend.post');
    Route::get('backend/logout','BackLoginController@logout')->name('backend.logout');

    Route::get('dashboard','AdminController@index')->name('dashboard');
    Route::post('/admin-remove-order/{id}','AdminController@update')->name('admin_update');

    // For Product
    Route::resource('products','ProductController');
    // ......

    // For Category
    Route::resource('categories','CategoryController');
    // ........

// ........


Auth::routes();

Route::get('user/logout','Auth\LoginController@logout')->name('user.logout');

Route::get('/home', 'HomeController@index')->name('home');
