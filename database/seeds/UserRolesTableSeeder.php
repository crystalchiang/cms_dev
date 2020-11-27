<?php

use Illuminate\Database\Seeder;

class UserRolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('user_roles')->insert( Array(
            ['name' => '超級管理員'],
            ['name' => '管理員'],
            ['name' => '會員']
        ));
    }
}
