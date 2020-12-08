<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelFornecedor extends Model
{
    use HasFactory;
    protected $fillable =['id', 'nome_produto', 'preco_produto', 'cod_categoria'];
    public $timestamps = false;
    public $table = "tb_produtos";
}
