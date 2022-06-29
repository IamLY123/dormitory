<?php

namespace App\Http\Controllers;

use App\Actions\Fortify\PasswordValidationRules;
use App\Models\Payment;
use App\Models\Room;
use App\Models\RoomRent;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redis;
use Laravel\Jetstream\Jetstream;

class RenterController extends Controller
{
    //
    use PasswordValidationRules;
    public function create(Request $request){
        $this->validate($request,[
            'fname'=>'required',
            'lname'=>'required',
            'address'=>'required',
            'phone'=>'required',
            'thai_id'=>'required',
            'status'=>'required',
            'dateofbirth'=>'required',
            'email'=>'required|email|max:255',
            'password'=>$this->passwordRules(),
            'room_id'=>'required',
            'terms'=>Jetstream::hasTermsAndPrivacyPolicyFeature()?['required','accepted']:'',
        ]);
        // dd($request);
        $user1=new User();
        $user1->fname=$request->fname;
        $user1->lname=$request->lname;
        $user1->address=$request->address;
        $user1->thai_id=$request->thai_id;
        $user1->phone=$request->phone;
        $user1->email=$request->email;
        $user1->dateofbirth=$request->dateofbirth;
        $user1->status=$request->status;
        $user1->password=Hash::make($request->password);
        $user1->save();
        $user=User::orderByDesc('created_at')->limit(1)->get();
        foreach($user as $u){
            $user_id=$u->id;
        }
        $room=Room::where('id',$request->room_id)->get();
        foreach($room as $r){
            $price=$r->price;
            $internet_price=$r->internet_price;
        }
        $payment=$price+$internet_price;
        $room_rent= new RoomRent();
        $room_rent->room_id=$request->room_id;
        $room_rent->user_id=$user_id;
        $room_rent->save();
        $payment1=RoomRent::orderByDesc('created_at')->limit(1)->get();
        foreach($payment1 as $p){
            $roomrent_id=$p->id;
        }
        $pay1=new Payment();
        $pay1->room_rent_id=$roomrent_id;
        $pay1->payment=$payment;
        $pay1->status_id=1;
        $pay1->save();
        Room::where('id',$request->room_id)->update(['status_id'=>'2']);
        return redirect()->route('option');
    }
    public function update(Request $request){
        $this->validate($request,[
            'room_rent_id'=>'required'
        ]);
        $roomrent1=RoomRent::where('id',$request->room_rent_id)->get();
        foreach($roomrent1 as $t){
            $roomid=$t->room_id;
        }
      
        $room=Room::where('id',$roomid)->get();
        foreach($room as $r){
            $pay=$r->price;
            $internet=$r->internet_price;
        }
        $total=$pay+$internet;
        $payment=new Payment();
        $payment->room_rent_id=$request->room_rent_id;
        $payment->payment=$total;
        $payment->status_id=2;
        $payment->save();
        return redirect()->route('option');
    }
    public function deletepayment(Request $request, Payment $id){
        // dd($id);
        Payment::find($id->id)->delete();
        return redirect()->route('showpayment');
    }
    public function editpayment(Request $request,Payment $id){
        $this->validate($request,[
            'status_id'=>'required',
            // 'payment'=>'required'
        ]);
        
        Payment::where('id',$id->id)->update(['status_id'=>$request->status_id]);
        return redirect()->route('showpayment');
    }
    public function editrenter(Request $request,RoomRent $id){
        $this->validate($request,[
            'timeout'=>'required',
            // 'payment'=>'required'
        ]);
        
        RoomRent::where('id',$id->id)->update(['timeout'=>$request->timeout]);
        return redirect()->route('showrenter');
    }
}
