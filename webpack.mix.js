const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/app.js', 'public/js')
    .sass('resources/sass/app.scss', 'public/css');

mix.styles([
	"resources/css/all.min.css",
	"resources/css/icheck-bootstrap.min.css",
	"resources/css/adminlte.min.css",	
], "public/css/LTE.css");

mix.styles([
	"resources/js/jquery.min.js",
	"resources/js/bootstrap.bundle.min.js",	
	"resources/js/adminlte.js",	
	"resources/js/Chart.min.js",	
	"resources/js/demo.js",	
	"resources/js/dashboard3.js",	
], "public/js/LTE.js");
