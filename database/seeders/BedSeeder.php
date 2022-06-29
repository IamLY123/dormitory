<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BedSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('beds')->insert([
            ['bed'=>1],
            ['bed'=>2],
            ['bed'=>3],
            ['bed'=>4],
            ['bed'=>5]
        ]);
    }
}
