<?php

namespace App\Http\Controllers;

use App\Models\ModelCompras;
use App\Models\ModelComprasPivot;
use Exception;
use Illuminate\Http\Request;

class ComprarController extends Controller
{
  // function que busca por pedidos e compras efetuadas
  public function index(Request $request){
       switch($request['tipo']){
        case 'pedidos':
          return ModelComprasPivot::where([['cpf', $request->cpf]])->get();
        break;
        case 'compras':
          return ModelCompras::
          join('tb_produtos', 'tb_compras.cod_produto', '=', 'tb_produtos.id')
          ->where([['tb_compras.num_pedido', $request->cod], ['tb_compras.cpf', $request->cpf]])
        ->get();
        break;
       }
   }

   // function que cria o pedido e gera o numero do pedido
   public function create(Request $request){
     try{
      $pedido = rand(0, 100000000); 
      date_default_timezone_set('America/Sao_Paulo');
      $dataLocal = date('d/m/Y H:i:s', time());
      if(ModelCompras::where('num_pedido', $pedido)->get()->count() > 0){
        $pedido = rand(0, 100000000); 
        if(ModelCompras::where('num_pedido', $pedido)->get()->count() > 0){
          return response()->json(['erro'], 400);
        }
      }else{
         foreach($request->all() as $item=> $value){
           $cpf = $value['cpf'];
            ModelCompras::create([
              'cod_produto'=>$value['codProduto'],
              'preco_compra'=>$value['precoProduto'],
              'cpf'=>$value['cpf'],
              'quantidade'=>$value['quantidade'],
              'num_pedido'=>$pedido,
              'data_compra'=>$dataLocal
            ]);
         }
         ModelComprasPivot::create([
           'cpf'=> $cpf,
           'cod_pedido'=>$pedido,
           'data_compra'=>$dataLocal
         ]);
        }
     }catch(Exception $e){
        return response()->json(['message'=>$e], 400);
     }
    
   }
}
