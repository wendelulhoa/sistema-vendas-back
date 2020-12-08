<?php

namespace App\Http\Controllers;

use App\Models\ModelCategoria;
use App\Models\ModelProduto;
use Illuminate\Http\Request;

class ProdutosController extends Controller
{
    public function index(){

    }
    public function createProduto(Request $request){
        ModelProduto::create([
            'nome_produto'=>$request->nome,
            'preco_produto'=>$request->preco,
            'cod_categoria'=>1

        ]);
    }
    public function createCategoria(Request $request){
        ModelCategoria::create($request->all());
    }
}
