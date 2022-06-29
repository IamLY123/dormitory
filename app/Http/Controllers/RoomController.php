<?php

namespace App\Http\Controllers;

use App\Models\Room;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class RoomController extends Controller
{
    //
    public function create(Request $request)
    {
        $this->validate($request,[
            'room_number'=>'required',
            'size_id'=>'required',
            'floor_id'=>'required',
            'bed_id'=>'required',
            'price'=>'required',
            'detail'=>'required',
            'photo'=>'required|image|max:2048',
            'status_id'=>'required',
        ]);
        if($request->hasFile('photo')){
            // storefile
            // easy
            // $path = Storage::putFile('room_cover', $request->file('photo'));
            $file=$request->file('photo');
            $name=$file->getClientOriginalName();
            $extension=$file->getClientOriginalExtension();
            $filename=pathinfo($name,PATHINFO_FILENAME);
            $filetostore=$filename.'_'.time().'.'.$extension;
            $path=$file->storeAs('public/room_cover',$filetostore);
        }else{
            $filename="nophoto.jpeg";
        }
        $size_id=$request->size_id;
        $floor_id=$request->floor_id;
        $bed_id=$request->bed_id;
        $room=new Room();
        $room->room_number=$request->room_number;
        $room->size_id=$size_id;
        $room->floor_id=$floor_id;
        $room->bed_id=$bed_id;
        $room->price=$request->price;
        $room->detail=$request->detail;
        $room->photo=$filetostore;
        $room->status_id=$request->status_id;
        $room->save();
        return redirect()->route('showroom.manage');
    }
    public function edit(Request $request,Room $id){
        $this->validate($request,[
            'price'=>'required',
            'internet_price'=>'required',
            'status_id'=>'required',
            'bed_id'=>'required',
            'floor_id'=>'required',
            'detail'=>'required',
            'size_id'=>'required'

          
        ]);
        
        Room::where('id',$id->id)->update([
            'price'=>$request->price,
            'internet_price'=>$request->internet_price,
            'status_id'=>$request->status_id,
            'bed_id'=>$request->bed_id,
            'floor_id'=>$request->floor_id,
            'detail'=>$request->detail,
            'size_id'=>$request->size_id
        ]);
        return redirect()->route('showroom.manage');
    }
    public function delete(Request $request, Room $id){
        // dd($id);
        $photo=Room::where('id',$id->id)->get();
        foreach($photo as $p ){
            $img=$p->photo;
        }
        unlink(storage_path('app/public/room_cover/'.$img));
        Room::find($id->id)->delete();
        return redirect()->route('showroom.manage');
    }
}
