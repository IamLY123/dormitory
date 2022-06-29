<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class FloorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('floors')->insert([
            ['floor_name'=>'ground_floor'],
            ['floor_name'=>'first_floor'],
            ['floor_name'=>'second_floor'],
            ['floor_name'=>'third_floor'],
            ['floor_name'=>'fourth_floor'],
            ['floor_name'=>'fifth_floor'],
            ['floor_name'=>'sixth_floor']
        ]);
    }
}
