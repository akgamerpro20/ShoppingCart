<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
	protected $fillable = ['user_del','admin_del'];

    public function user() {
        return $this->belongsTo('App\User');
    }

    public static $rules = [
    	'name' => 'required',
    	'address' => 'required',
    	'card_name' => 'required',
    	'card_number' => 'required | min:4 | max:20',
    	'exp_month' => 'required | min:1',
    	'exp_year' => 'required | min:4 | max:4',
    	'cvc' => 'required | min:3 | max:6',
	];
}
