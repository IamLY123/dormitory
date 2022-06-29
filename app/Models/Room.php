<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;
    protected $fillable=[
        'room_number',
        'price',
        'detail',
        'photo',
        
    ];
    public function size(){
        return $this->belongsTo(Size::class,'size_id','id');
    }
    public function floor(){
        return $this->belongsTo(Floor::class,'floor_id','id');
    }
    public function bed(){
        return $this->belongsTo(Bed::class,'bed_id','id');
    }
    public function status(){
        return $this->belongsTo(Status::class,'status_id','id');
    }
    public function roomrent(){
        return $this->hasMany(RoomRent::class,'room_id','id');
    }

}
