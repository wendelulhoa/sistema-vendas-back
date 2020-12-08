<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelEndereco extends Model
{
    use HasFactory;
    protected $fillable =['id', 'endereco', 'cep', 'rua', 'cidade', 'uf', 'cpf'];
    public $timestamps = false;
    public $table = "tb_endereco";
}
