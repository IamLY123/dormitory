<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Water extends Model
{
    use HasFactory;
    protected $fillable=[
        'power_use',
        'unit',
        'total',
        'status',
    ];
    public function roomrent(){
        return $this->belongsTo(RoomRent::class,'room_rent_id','id');
    }
    public function statuspaid(){
        return $this->belongsTo(StatusPaid::class,'status_id','id');
    }
}
