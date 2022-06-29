<?php

namespace App\Http\Controllers;

use App\Models\Rule;
use Illuminate\Http\Request;
use Whoops\Run;

class RuleController extends Controller
{
    //
    public function create(Request $request){
        $this->validate($request,['content'=>'required']);
        Rule::create(['content'=>$request->content]);
        return redirect()->route('show.rule.manage');
    }
    public function edit(Request $request,Rule $id){
        $this->validate($request,[
            'content'=>'required',
          
        ]);
        
        Rule::where('id',$id->id)->update(['content'=>$request->content]);
        return redirect()->route('show.rule.manage');
    }
    public function delete(Request $request, Rule $id){
        // dd($id);
        Rule::find($id->id)->delete();
        return redirect()->route('show.rule.manage');
    }
}
