<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});

Route::resource('/classes', 'ClassesInfoController'); //班級頁面_原XW08000

Route::resource('/students', 'StudentsInfoController'); //學生頁面_原BW01000
// Route::post('/classes/store', 'ClassesInfoController@store');