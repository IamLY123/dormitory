<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Size extends Model
{
    use HasFactory;
    protected $fillable=[];
    public function room(){
        return $this->hasMany(Size::class,'size_id','id');
    }
}
