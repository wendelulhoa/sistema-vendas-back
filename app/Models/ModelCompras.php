<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelCompras extends Model
{
    use HasFactory;
    protected $fillable =['id', 'cod_produto','preco_compra', 'cpf', 'num_pedido', 'quantidade', 'data_compra'];
    public $timestamps = false;
    public $table = "tb_compras";
}
