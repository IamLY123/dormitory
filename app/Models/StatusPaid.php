<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StatusPaid extends Model
{
    use HasFactory;
    protected $fillable=[];
    public function electric(){
        return $this->hasMany(Electricity::class,'status_id','id');
    }
    public function water(){
        return $this->hasMany(Water::class,'status_id','id');
    }
    public function payment(){
        return $this->hasMany(Payment::class,'status_id','id');
    }
}
