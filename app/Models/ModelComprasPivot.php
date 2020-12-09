<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelComprasPivot extends Model
{
    use HasFactory;
    protected $fillable =['cpf', 'cod_pedido', 'data_compra'];
    public $timestamps = false;
    public $table = "tb_compras_pivot";
}
