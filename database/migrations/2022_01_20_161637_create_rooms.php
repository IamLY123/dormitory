<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRooms extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Schema::create('rooms', function (Blueprint $table) {
        //     $table->id();
        //     $table->string('room_number');
        //     $table->foreignId('size_id')->constrained()->onDelete('cascade');
        //     $table->foreignId('bed_id')->constrained()->onDelete('cascade');
        //     $table->foreignId('floor_id')->constrained()->onDelete('cascade');
        //     $table->text('detail');
        //     $table->integer('price');
        //     $table->integer('internet_price');
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
        // Schema::dropIfExists('rooms');
    }
}
