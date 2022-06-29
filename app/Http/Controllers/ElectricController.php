<?php

namespace App\Http\Controllers;

use App\Models\Electricity;
use Illuminate\Http\Request;

class ElectricController extends Controller
{
    //
    public function create(Request $request){
        $this->validate($request,[
            'power_use'=>'required',
            'room_rent_id'=>'required'
        ]);
        $total=3*$request->power_use;
        $electric=new Electricity();
        $electric->room_rent_id=$request->room_rent_id;
        $electric->power_use=$request->power_use;
        $electric->total=$total;
        $electric->status_id=2;
        $electric->save();
        return redirect()->route('showelectric');
    }
    public function delete(Request $request, Electricity $id){
        // dd($id);
        Electricity::find($id->id)->delete();
        return redirect()->route('showelectric');
    }
    public function edit(Request $request,Electricity $id){
        $this->validate($request,[
            'status_id'=>'required',
            // 'payment'=>'required'
        ]);
        
        Electricity::where('id',$id->id)->update(['status_id'=>$request->status_id]);
        return redirect()->route('showelectric');
    }
}
