<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ComprarController;
use App\Http\Controllers\ProdutosController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;

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

// rotas relacionadas a login
Route::group([
    'prefix' => 'auth',
], function () {
    Route::any('refresh', [AuthController::class, 'refresh'])->name('refresh');
    Route::any('logout', [AuthController::class, 'logout'])->name('logout');
    Route::post('me', [AuthController::class, 'me'])->name('me');
    Route::any('login', [AuthController::class, 'login'])->name('login');
    Route::any('auto_login', [AuthController::class, 'autoLogin'])->name('auto_login');
});

// rota para cadastro
Route::group(['prefix'=>'admin/cad'], function(){
    Route::post('categoria', [ProdutosController::class, 'createCategoria']);
    Route::post('produto', [ProdutosController::class, 'createProduto']);
    Route::post('user', [UserController::class, 'create']);
    Route::get('promocao');
});

// rota para procurar itens
Route::group(['prefix'=>'find'], function(){
    Route::get('produtos', [ProdutosController::class, 'index']);
    Route::get('compras', [ComprarController::class, 'index']);
});

// rota para pagamento
    Route::post('payout', [ComprarController::class, 'create']);


// rota que acessa as fotos salvas
Route::get('produtos/{args}', function ($args)
{
    $file = Storage::disk('local')->get("produtos/$args");
    if(strpos($args, 'pdf')){
        return response()->make($file,200,[ 'Content-Type' => 'application/pdf']);
    }else if(strpos($args, 'jpeg')){
        return response()->make($file,200,[ 'Content-Type' => 'image/jpeg']);
    }else {
        return response()->make($file,200,[ 'Content-Type' => 'image/png']);
    }
    
});
