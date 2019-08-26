<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = ['category_id','price','photo','title','description'];

    public static $rules = [
    	'price' => 'required | MIN:1',
    	'photo' => 'required',
    	'title' => 'required | min:2 | max:19',
    	'description' => 'required | min:2'
	];
	
	public function category() {
		return $this->belongsTo('App\Category');
	}
}
