<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\UsersStudentInfo;
use App\UsersParentInfo;
use App\User;

use Validator;

class StudentsInfoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $students = DB::table('users_student_infos as s')
        ->join('users as u', 'u.id', '=', 's.user_id')
        ->select('u.email', 'u.name', 's.*')
        ->get()
        ->toArray();

        $data = [];
        // dd($students);
        foreach($students as $key => $value){
            $parent_a = DB::table('users_parent_infos as p')
            ->join('users as u', 'u.id', '=', 'p.user_id')
            ->where('p.id',$value->parent_1_id)
            ->select('u.name as account', 'p.*')
            ->get()
            ->first();

            $data[$key]['student'] = $value; 
            $data[$key]['parents'][] = $parent_a; 

            if($value->parent_2_id){
                $parent_b = DB::table('users_parent_infos as p')
                ->join('users as u', 'u.id', '=', 'p.user_id')
                ->where('p.id',$value->parent_2_id)
                ->select('u.name as account', 'p.*')
                ->get()
                ->first();
                $data[$key]['parents'][] = $parent_b;
            }
        }
        
// echo "<pre>";
// print_r($data);
// echo "<pre>";
        return view('students.studentLists')->with('students', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // $data = $this->validate($request, [
        //     'name' => 'required|string|max:30',
        //     'period_start_date' => 'required',
        //     'period_end_date' => 'required',
        //     'calss_start_date' => 'required',
        //     'class_schedule' => 'required|string|max:30',
        // ]);
        $userAccount = User::whereIn('name', [$request->name,$request->parent_a_username,$request->parent_b_username])
            ->first();

        // $member = $this->getMemberByEmail($email);

        if (!empty($userAccount)) {
            return redirect(route('students.index'));
        }

        $validator = Validator::make($request->all(), [
            'parent_a_username' => 'required|string|between:2,100|unique:users,name',
            'parent_a_name' => 'required|string|max:100',
            'parent_a_email' => 'required|string|email|max:100|unique:users,email',
            'parent_a_password' => 'required|string|min:6',
            'parent_a_line' => 'required|string|max:100',
            'parent_b_username' => 'required|string|between:2,100|unique:users,name',
            'parent_b_name' => 'required|string|max:100',
            'parent_b_email' => 'required|string|email|max:100|unique:users,email',
            'parent_b_password' => 'required|string|min:6',
            'parent_b_line' => 'required|string|max:100',
            'name' => 'required|string|between:2,100|unique:users,name',
            'chinese_name' => 'required|string|max:100',
            'english_name' => 'required|string|max:100',
            'email' => 'required|string|email|max:100|unique:users,email',
            'password' => 'required|string|min:6',
            'line' => 'required|string|max:100',
            'start_date' => 'required',
            'expire_date' => 'required',
            'other' => 'required|string|max:100',
        ]);

        if($validator->fails()){
            return redirect(route('students.index'));
        }

        try {
            DB::beginTransaction();
            
            $parent_a_id = DB::table('users')->insertGetId([ 
                'name' => $request->parent_a_username,
                'email' => $request->parent_a_email,
                'password' => bcrypt($request->parent_a_password), 
                'menuroles' => 'parent',
                'status' => 1,
                'created_at' => date('Y-m-d H:i:s')
            ]);
  
            $parent_info_a = DB::table('users_parent_infos')->insertGetId([ 
                'user_id' => $parent_a_id,
                'name' => $request->parent_a_name,
                'telephone' => $request->parent_a_telephone,
                'line' => $request->parent_a_line,
                'email' => $request->parent_a_email,
                'created_at' => date('Y-m-d H:i:s')
            ]);

            $parent_b_id = DB::table('users')->insertGetId([ 
                'name' => $request->parent_b_username,
                'email' => $request->parent_b_email,
                'password' => bcrypt($request->parent_b_password), 
                'menuroles' => 'parent',
                'status' => 1,
                'created_at' => date('Y-m-d H:i:s')
            ]);

            $parent_info_b = DB::table('users_parent_infos')->insertGetId([ 
                'user_id' => $parent_b_id,
                'name' => $request->parent_b_name,
                'telephone' => $request->parent_b_telephone,
                'line' => $request->parent_b_line,
                'email' => $request->parent_b_email,
                'created_at' => date('Y-m-d H:i:s')
            ]);

            $student_id = DB::table('users')->insertGetId([ 
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password), 
                'menuroles' => 'student',
                'status' => 1,
                'created_at' => date('Y-m-d H:i:s')
            ]);

            $student = DB::table('users_student_infos')->insert([
                'user_id' => $student_id,
                'class_id' => $request->class_id ? $request->class_id : null,
                'chinese_name' => $request->chinese_name,
                'english_name' => $request->english_name,
                'line' => $request->line,
                'parent_1_id' => $parent_info_a,
                'parent_2_id' => $parent_info_b ? $parent_info_b : null,
                'other' => $request->other,
                'start_date' => $request->start_date,
                'expire_date' => $request->expire_date,
                'created_at' => date('Y-m-d H:i:s')
            ]);

            DB::commit();

        } catch(\Exception $e) {
            DB::rollBack();
        }

        return redirect(route('students.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'parent_a_name' => 'required|string|max:100',
            'parent_a_email' => 'required|string|email|max:100',
            'parent_a_line' => 'required|string|max:100',
            'parent_b_name' => 'required|string|max:100',
            'parent_b_email' => 'required|string|email|max:100',
            'parent_b_line' => 'required|string|max:100',
            'chinese_name' => 'required|string|max:100',
            'english_name' => 'required|string|max:100',
            'email' => 'required|string|email|max:100',
            'line' => 'required|string|max:100',
            'start_date' => 'required',
            'expire_date' => 'required',
            'other' => 'required|string|max:100',
        ]);

        if($validator->fails()){
            return redirect(route('students.index'));
        }

        if($request->password){
            $validator = Validator::make($request->password, [
                'password' => 'required|string|min:6',
            ]);

            if($validator->fails()){
                return redirect(route('students.index'));
            }
        }

        if($request->parent_a_password){
            $validator = Validator::make($request->parent_a_password, [
                'parent_a_password' => 'required|string|min:6',
            ]);

            if($validator->fails()){
                return redirect(route('students.index'));
            }
        }

        if($request->parent_b_password){
            $validator = Validator::make($request->parent_b_password, [
                'parent_b_password' => 'required|string|min:6',
            ]);

            if($validator->fails()){
                return redirect(route('students.index'));
            }
        }

        try {
            DB::beginTransaction();
            
            //更新父母Ａ資料
            $parent_a_data['email'] = $request->parent_a_email;

            if($request->parent_a_password){
                $parent_a_data['password'] = bcrypt($request->parent_a_password);
            }

            DB::table('users')
            ->where('id', $request->parent_a_user_id)
            ->update($parent_a_data);

            $parent_a_data['name'] = $request->parent_a_name;
            $parent_a_data['line'] = $request->parent_a_line;
            $parent_a_data['telephone'] = $request->parent_a_telephone;

            DB::table('users_parent_infos')
            ->where('id', $request->parent_a_id)
            ->update($parent_a_data);

            //更新父母B資料
            $parent_b_data['email'] = $request->parent_b_email;

            if($request->parent_b_password){
                $parent_b_data['password'] = bcrypt($request->parent_b_password);
            }

            DB::table('users')
            ->where('id', $request->parent_b_user_id)
            ->update($parent_b_data);

            $parent_b_data['name'] = $request->parent_b_name;
            $parent_b_data['line'] = $request->parent_b_line;
            $parent_b_data['telephone'] = $request->parent_b_telephone;

            DB::table('users_parent_infos')
            ->where('id', $request->parent_b_id)
            ->update($parent_b_data);

            //更新學生
            $student_data = [
                'chinese_name' => $request->chinese_name,
                'english_name' => $request->english_name,
                'line' => $request->line,
                'other' => $request->other,
                'start_date' => $request->start_date,
                'expire_date' => $request->expire_date,
            ];

            $studentAccount = [];
            $studentAccount['email'] = $request->email;

            if($request->password){
                $studentAccount['password'] = bcrypt($request->password);
            }

            DB::table('users')
            ->where('id', $request->student_user_id)
            ->update($studentAccount);

            DB::table('users_student_infos')
            ->where('id', $request->student_id)
            ->update($student_data);

            DB::commit();

        } catch(\Exception $e) {
            DB::rollBack();
        }

        return redirect(route('students.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
