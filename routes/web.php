<?php

use App\Http\Controllers\ElectricController;
use App\Http\Controllers\RenterController;
use App\Http\Controllers\RoomController;
use App\Http\Controllers\RuleController;
use App\Http\Controllers\WaterContorller;
use App\Http\Resources\RoomResource;
use App\Models\Bed;
use App\Models\Electricity;
use App\Models\Floor;
use App\Models\Payment;
use App\Models\Room;
use App\Models\RoomRent;
use App\Models\Rule;
use App\Models\Size;
use App\Models\Status;
use App\Models\StatusPaid;
use App\Models\User;
use App\Models\Water;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->name('dashboard');

Route::middleware(['auth:sanctum', 'verified'])->get('/option', function () {
    return Inertia::render('Option');
})->name('option');
// add electric
Route::middleware(['auth:sanctum', 'verified'])->get('/add/electric', function () {
    return Inertia::render('AddOption/AddElectric',[
        'roomrents'=>RoomRent::with('room')->get(),]);
})->name('addelectric');
// store electric
Route::middleware(['auth:sanctum','verified'])->post('/electric/store',[ElectricController::class,'create'])->name('electric.store');
// show electric
Route::middleware(['auth:sanctum','verified'])->get('/show/electric/mange',function(){
    return Inertia::render('Show/ShowElectric',[
        'electric'=>Electricity::with('roomrent.room','statuspaid')->get(),]);
    })->name('showelectric');
// add update electric
Route::middleware(['auth:sanctum','verified'])->get('/update/electric/${id}',function($id){
    return Inertia::render('Edit/EditElectric',[
    'electric'=>Electricity::where('id',$id)->with('roomrent.room','statuspaid')->get(),
    'statuspaid'=>StatusPaid::all(),]);
})->name('update.electric');
// update electric
Route::middleware(['auth:sanctum','verified'])->post('/electric/edit/${id}',[ElectricController::class,'edit'])->name('electric.edit');
// delete electric
Route::middleware(['auth:sanctum','verified'])->delete('/delete/electric/${id}',[ElectricController::class,'delete'])->name('delete.electric');
// show my electric
Route::middleware(['auth:sanctum','verified'])->get('/show/myelectric/{id}',function($id){
    $roomrent=RoomRent::where('user_id',$id)->get();
    foreach($roomrent as $r){
        $roomrent_id=$r->id;
    }
    return Inertia::render('Show/ShowElectricRenter',[
        'electric'=>Electricity::where('room_rent_id',$roomrent_id)->with('roomrent.room','statuspaid')->get(),
    ]);
})->name('showmyelectric');
// add water
Route::middleware(['auth:sanctum', 'verified'])->get('/add/water', function () {
    return Inertia::render('AddOption/AddWater',[
        'roomrents'=>RoomRent::with('room')->get(),]);
})->name('addwater');
// store water
Route::middleware(['auth:sanctum','verified'])->post('/water/store',[WaterContorller::class,'create'])->name('water.store');
// show water
Route::middleware(['auth:sanctum','verified'])->get('/show/water/mange',function(){
    return Inertia::render('Show/ShowWater',[
        'water'=>Water::with('roomrent.room','statuspaid')->get(),]);
    })->name('showwater');
// add update water
Route::middleware(['auth:sanctum','verified'])->get('/update/water/${id}',function($id){
    return Inertia::render('Edit/EditWater',[
    'water'=>Water::where('id',$id)->with('roomrent.room','statuspaid')->get(),
    'statuspaid'=>StatusPaid::all(),]);
})->name('update.water');

// update water
Route::middleware(['auth:sanctum','verified'])->post('/water/edit/${id}',[WaterContorller::class,'edit'])->name('water.edit');
// delete water
Route::middleware(['auth:sanctum','verified'])->delete('/delete/water/${id}',[WaterContorller::class,'delete'])->name('delete.water');
// show water for renter
Route::middleware(['auth:sanctum','verified'])->get('/show/mywater/{id}',function($id){
    $roomrent=RoomRent::where('user_id',$id)->get();
    foreach($roomrent as $r){
        $roomrent_id=$r->id;
    }
    return Inertia::render('Show/ShowWaterRenter',[
        'water'=>Water::where('room_rent_id',$roomrent_id)->with('roomrent.room','statuspaid')->get(),
    ]);
})->name('showmywater');
// add room
Route::middleware(['auth:sanctum', 'verified'])->get('/add/room', function () {
    return Inertia::render('AddOption/AddRoom',[
        'sizes'=>Size::all(),
        'floors'=>Floor::all(),
        'beds'=>Bed::all(),
        'statuses'=>Status::all(),'']);
    })->name('addroom');

// store room
Route::middleware(['auth:sanctum', 'verified'])->post('/store/room',[RoomController::class,'create'])->name('storeroom');
// show room
Route::get('/show/room',function(){
    return Inertia::render('Show/ShowRoom',[
        'rooms'=>Room::where('status_id','1')->with('floor','size','bed')->get(),
    ]);
})->name('showroom');
// show room guest
Route::get('/show/roomguest',function(){
    return Inertia::render('Show/ShowRoomGuest',[
        'rooms'=>Room::where('status_id','1')->with('floor','size','bed')->get(),
    ]);
})->name('showroomguest');
// show room manage
Route::get('/show/room/manage',function(){
    return Inertia::render('Show/ShowRoomManage',[
        'rooms'=>Room::with('floor','size','bed')->get(),
    ]);
})->name('showroom.manage');
// showruleguest
Route::get('/show/ruleguest',function(){
    return Inertia::render('Show/ShowRuleGuest',[
        'rules'=>Rule::all(),
    ]);
})->name('showruleguest');
// add update room
Route::middleware(['auth:sanctum','verified'])->get('/room/update/{id}',function($id){
    return Inertia::render('Edit/EditRooom',[
    'rooms'=>Room::where('id',$id)->with("floor","size","bed","status")->get(),
    'floors'=>Floor::all(),
    'sizes'=>Size::all(),
    'beds'=>Bed::all(),
    'statuses'=>Status::all(),
    ]);
})->name('update.room');
// update room
Route::middleware(['auth:sanctum','verified'])->post('/room/edit/${id}',[RoomController::class,'edit'])->name('room.edit');
// delete room
Route::middleware(['auth:sanctum','verified'])->delete('/delete/room/${id}',[RoomController::class,'delete'])->name('delete.room');

// add rule
Route::middleware(['auth:sanctum', 'verified'])->get('/add/rule', function () {
    return Inertia::render('AddOption/AddRule',[]);})->name('addrule');
//store rule
Route::middleware(['auth:sanctum','verified'])->post('/store/rule',[RuleController::class,'create'])->name('storerule');
// show rule
Route::middleware(['auth:sanctum','verified'])->get('/show/rule',function(){
    return Inertia::render('Show/ShowRule',[
        'rules'=>Rule::all(),]);
})->name('showrule');
// add update rule
Route::middleware(['auth:sanctum','verified'])->get('/update/rule/${id}',function($id){
    return Inertia::render('Edit/EditRule',[
    'rules'=>Rule::where('id',$id)->get(),
    ]);
})->name('update.rule');
// update rule
Route::middleware(['auth:sanctum','verified'])->post('/rule/edit/${id}',[RuleController::class,'edit'])->name('rule.edit');
// delete rule
Route::middleware(['auth:sanctum','verified'])->delete('/delete/rule/${id}',[RuleController::class,'delete'])->name('delete.rule');
// show rule manage
Route::middleware(['auth:sanctum','verified'])->get('/show/rule/manage',function(){
    return Inertia::render('Show/ShowRuleManage',[
        'rules'=>Rule::all()]);
})->name('show.rule.manage');

// add renter
Route::middleware(['auth:sanctum','verified'])->get('/add/renter',function(){
    return Inertia::render('AddOption/AddRenter',[
        'rooms'=>Room::where('status_id','1')->get(),]);
})->name('addrenter');
// store renter
Route::middleware(['auth:sanctum','verified'])->post('/store/renter',[RenterController::class,'create'])->name('storerenter');
// show renter
Route::middleware(['auth:sanctum','verified'])->get('/show/renter',function(){
    return Inertia::render('Show/ShowRenter',[
        'roomrents'=>RoomRent::with('user','room')->get(),]);
})->name('showrenter');

// show graph
Route::middleware(['auth:sanctum'])->get('/show/graph',function(){
    return Inertia::render('Show/ShowGraph',[
    'electric'=>app('db')->select("select MONTHNAME(electricities.created_at)as month,sum(electricities.total) as data FROM electricities group by MONTHNAME(electricities.created_at) ;"),
    'users'=>app('db')->select(" select MONTHNAME(users.created_at)as month,count(*) as data FROM users where users.status='renter' group by MONTHNAME(users.created_at) "),
    'waters'=>app('db')->select("select MONTHNAME(waters.created_at)as month,sum(waters.total) as data FROM waters group by MONTHNAME(waters.created_at) "),
    'payments'=>app('db')->select("select MONTHNAME(payments.created_at)as month,sum(payments.payment) as data FROM payments group by MONTHNAME(payments.created_at) "),
]);
})->name('showgraph');
// add payment
Route::middleware(['auth:sanctum','verified'])->get('/add/payment',function(){
    return Inertia::render('AddOption/AddPayment',[
        'roomrents'=>RoomRent::with('room')->get(),]);
})->name('addpayment');
// update payment
Route::middleware(['auth:sanctum','verified'])->post('/store/payment',[RenterController::class,'update'])->name('store.payment');
// show payment
Route::middleware((['auth:sanctum','verified']))->get('/show/payment',function(){
    return Inertia::render('Show/ShowPayment',[
        'payments'=>Payment::with('roomrent.room','statuspaid')->get(),]);
})->name('showpayment');
// delete payment
Route::middleware(['auth:sanctum','verified'])->delete('/delete/${id}',[RenterController::class,'deletepayment'])->name('delete.payment');
// add updata payment page
Route::middleware(['auth:sanctum','verified'])->get('/update/payment/${id}',function($id){
    return Inertia::render('Edit/EditPayment',[
    'payments'=>Payment::where('id',$id)->with('roomrent.room','statuspaid')->get(),
    'statuspaid'=>StatusPaid::all(),]);
})->name('update.payment');
// edit payment next
Route::middleware(['auth:sanctum','verified'])->post('/payment/edit/${id}',[RenterController::class,'editpayment'])->name('payment.edit');
// show my payment
Route::middleware(['auth:sanctum','verified'])->get('/show/mypayment/{id}',function($id){
    $roomrent=RoomRent::where('user_id',$id)->get();
    foreach($roomrent as $r){
        $roomrent_id=$r->id;
    }
    return Inertia::render('Show/ShowPaymentRenter',[
        'payments'=>Payment::where('room_rent_id',$roomrent_id)->with('roomrent.room','statuspaid')->get(),
    ]);
})->name('showmypayment');
// add update renter
Route::middleware(['auth:sanctum','verified'])->get('/update/renter/{id}',function($id){
    // print($id);
    return Inertia::render('Edit/EditRenter',[
        'roomrent'=>RoomRent::where('id',$id)->with('user','room')->get(),
    ]);
})->name('update.renter');
// edit renter
Route::middleware(['auth:sanctum','verified'])->post('/Renter/edit/{id}',[RenterController::class,'editrenter'])->name('renter.edit');

