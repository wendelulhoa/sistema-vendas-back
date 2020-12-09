<?php

namespace App\Http\Controllers;

use App\Models\ModelCategoria;
use App\Models\ModelProduto;
use Exception;
use Illuminate\Http\Request;

class ProdutosController extends Controller
{
    //function para busca de produtos e categorias
    public function index(Request $request){
        switch($request['tipo']){
            case 'produto':
                return ModelProduto::all();
            break;
            case 'categoria':
                return ModelCategoria::all();
            break;
            case 'categoriaFind':
                return ModelProduto::where([['cod_categoria', $request->value]])->get();
            break;
            case 'produtoFind':
                return ModelProduto::where([['nome_produto', 'like','%'.$request->value.'%']])->get();
        }
    }
    // function criacao de produto
    public function createProduto(Request $request){
        try{
            if (isset($request['file'])){
                $path = $request->file->store('produtos');
            } else{
                $path ='';
            }
            ModelProduto::create([
                'nome_produto'=>$request->nome,
                'preco_produto'=>$request->preco,
                'cod_categoria'=>$request->codCategoria,
                'path_img'=>'http://localhost:8000/api/'.$path
            ]);
        }
        catch(Exception $e){
            return response()->json(['message'=>$e], 400);
        }
        
    }
    public function createCategoria(Request $request){
        ModelCategoria::create([
            'nome'=>$request->nome
        ]);
    }
}
