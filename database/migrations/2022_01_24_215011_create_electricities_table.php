<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateElectricitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Schema::create('electricities', function (Blueprint $table) {
        //     $table->id();
        //     $table->integer('power_use');
        //     $table->integer('unit');
        //     $table->foreignId('room_rent_id')->constrained()->onDelete('cascade');
        //     $table->integer('total');
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
        // Schema::dropIfExists('electricities');
    }
}
