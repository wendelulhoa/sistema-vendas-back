<?php

use App\Http\Controllers\ComprarController;
use App\Http\Controllers\ProdutosController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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


Route::group(['prefix'=>'admin/cad'], function(){
    Route::post('categoria', [ProdutosController::class, 'createCategoria']);
    Route::post('produto', [ProdutosController::class, 'createProduto']);
    Route::get('promocao');
});

Route::group(['prefix'=>''], function(){
    Route::get('produtos', [ComprarController::class, 'index']);
    Route::get('payout', [ComprarController::class, 'index']);
});
