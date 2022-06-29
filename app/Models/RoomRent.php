<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoomRent extends Model
{
    use HasFactory;
    protected $table="room_rent";
    protected $fillable=[];
    public function room(){
        return $this->belongsTo(Room::class,'room_id','id');
    }
    public function user(){
        return $this->belongsTo(User::class,'user_id','id');
    }
    public function electric(){
        return $this->hasMany(Electricity::class,'room_rent_id','id');
    }
    public function water(){
        return $this->hasMany(Water::class,'room_rent_id','id');
    }
    public function payment(){
        return $this->hasMany(Payment::class,'room_rent_id','id');
    }
}
