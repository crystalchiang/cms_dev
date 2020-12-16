<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UsersStudentInfo extends Model
{
    //
    protected $table = 'users_student_infos';
    
        /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id','name','line','telephone','created_at','update_at','email'
    ];
}
