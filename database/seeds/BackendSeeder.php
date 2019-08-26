<?php

use Illuminate\Database\Seeder;
use App\Backend;

class BackendSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Backend::create([
        	'name' => 'Admin',
        	'email' => 'admin@gmail.com',
        	'password' => \Hash::make("123456")
        ]);
    }
}
