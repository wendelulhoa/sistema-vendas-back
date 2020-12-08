<?php

namespace App\Http\Controllers;

use App\Models\ModelCompras;
use Illuminate\Http\Request;

class ComprarController extends Controller
{
  public function index(){
       return ['a'];
   }
   public function create(Request $request){
       ModelCompras::create([
         'cod_produto'=>$request->cod,
         'preco_produto'=>$request->preco,
         'cpf'=>$request->cpf
       ]);
   }
}
