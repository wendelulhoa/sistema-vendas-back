<?php

namespace App\Http\Controllers;

use App\Models\ModelEndereco;
use App\Models\ModelUser;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    public function index(){

    }
    public function create(Request $request){
        try{
            DB::transaction(function () use($request){
                ModelUser::create([
                    'user_name'=>$request->nome,
                    'cpf'=>$request->cpf
                ]);
                User::create([
                    'cpf'=>$request->cpf,
                    'password'=>$request->senha,
                    'adm'=>0
                ]);
                ModelEndereco::create([
                    'endereco'=>$request->endereco,
                    'cep'=>$request->rua,
                    'cidade'=>$request->cidade,
                    'uf'=>$request->uf,
                    'cpf'=>$request->cpf
                ]);
            });
            return response()->json(['success'], 200);
        }catch(Exception $e){
            return response()->json(['message'=>$e], 400);
        }
    }
}
