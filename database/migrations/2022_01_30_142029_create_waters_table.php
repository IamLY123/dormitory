<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWatersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Schema::create('waters', function (Blueprint $table) {
        //     $table->id();
        //     $table->integer('power_use');
        //     $table->integer('unit');
        //     $table->foreignId('room_rent_id')->constrained()->onDelete('cascade');
        //     $table->float('total',8);
        //     $table->enum('status',['paid','unpaid']);
        //     $table->timestamps();
        // });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Schema::dropIfExists('waters');
    }
}
