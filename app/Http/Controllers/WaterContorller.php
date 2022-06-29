<?php

namespace App\Http\Controllers;

use App\Models\Water;
use Illuminate\Http\Request;

class WaterContorller extends Controller
{
    //
    public function create(Request $request){
        $this->validate($request,[
            'power_use'=>'required',
            'room_rent_id'=>'required'
        ]);
        $total=1*$request->power_use;
        $water=new Water();
        $water->room_rent_id=$request->room_rent_id;
        $water->power_use=$request->power_use;
        $water->total=$total;
        $water->status_id=2;
        $water->save();
        return redirect()->route('showwater');
    }
    public function edit(Request $request,Water $id){
        $this->validate($request,[
            'status_id'=>'required',
            // 'payment'=>'required'
        ]);
        
        Water::where('id',$id->id)->update(['status_id'=>$request->status_id]);
        return redirect()->route('showwater');
    }
    public function delete(Request $request, Water $id){
        // dd($id);
        Water::find($id->id)->delete();
        return redirect()->route('showwater');
    }
}
