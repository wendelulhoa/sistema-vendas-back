<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelCategoria extends Model
{
    use HasFactory;
    protected $fillable =['id', 'nome'];
    public $timestamps = false;
    public $table = "tb_categoria";
}
