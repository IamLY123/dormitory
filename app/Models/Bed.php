<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bed extends Model
{
    use HasFactory;
    protected $fillable=[];
    public function room(){
        return $this->hasMany(Room::class,'bed_id','id');
    }
    
}
