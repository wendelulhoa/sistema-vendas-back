<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelCompras extends Model
{
    use HasFactory;
    protected $fillable =['id', 'cod_produto','preco_produto', 'cpf'];
    public $timestamps = false;
    public $table = "tb_compras";
}