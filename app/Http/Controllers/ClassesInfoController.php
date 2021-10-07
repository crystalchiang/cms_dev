<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\ClassesInfo;
use App\SchoolBranch;

use Validator;

class ClassesInfoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $classes = ClassesInfo::all();
        $branch_schools = SchoolBranch::all();

        foreach($classes as $key => $item){
            $teacher = DB::table('users')->where('users.id', $item->teacher_id)->value('name');
            $assistant = DB::table('users')->where('users.id', $item->assistant_id)->value('name');
            $supply_teacher = DB::table('users')->where('users.id', $item->supply_teacher_id)->value('name');
            $material_1 = DB::table('myway_first_category')->where('myway_first_category.id', $item->teaching_material_1)->value('name');
            $material_2 = DB::table('myway_first_category')->where('myway_first_category.id', $item->teaching_material_2)->value('name');
            $material_3 = DB::table('myway_first_category')->where('myway_first_category.id', $item->teaching_material_3)->value('name');
            $material_4 = DB::table('myway_first_category')->where('myway_first_category.id', $item->teaching_material_4)->value('name');
            $class_day = json_decode($item->class_day);
            
            $classes[$key]->teacher = $teacher;
            $classes[$key]->assistant = $assistant;
            $classes[$key]->supply_teacher = $supply_teacher;
            $classes[$key]->material_1 = $material_1;
            $classes[$key]->material_2 = $material_2;
            $classes[$key]->material_3 = $material_3;
            $classes[$key]->material_4 = $material_4;
            $classes[$key]->class_day_text = '';
            if($class_day){
                foreach($class_day as $value){
                    $text = array('零', '一', '二', '三', '四', '五', '六', '日');
                    $classes[$key]->class_day_text .= $text[$value] . " ";
                }
            }else{
                $classes[$key]->class_day_text = '';
            }
            
            $s_text = array('上午', '下午', '晚上');
            $classes[$key]->class_schedule_name = $s_text[$item->class_schedule];
        }

        // 以下尚未篩選學校旗下的老師功能
        $teachers = DB::table('users')
                    ->where('menuroles', 'teacher')
                    ->get()
                    ->toArray();
        $assistants = DB::table('users')
                    ->where('menuroles', 'assistant')
                    ->get()
                    ->toArray();
        $supplyTeachers = DB::table('users')
                    ->where('menuroles', 'supplyTeacher')
                    ->get()
                    ->toArray();
        $material = DB::table('myway_first_category')
                    ->get()
                    ->toArray();

        $class_schedule = ['上午','下午','晚上'];
        
        return view('classes.classLists', compact('classes', 'branch_schools', 'teachers', 'assistants', 'supplyTeachers', 'material', 'class_schedule'));
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
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:30',
            'teacher_id' => 'required',
            'teaching_material_1' => 'required',
        ]);

        if($validator->fails()){
            return redirect(route('classes.index'));
        }

        try {
            DB::beginTransaction();

            $class = DB::table('class_infos')->insert([
                'branch_school_id' => $request->input('branch_school_id'),
                'name' => $request->input('name'),
                'teacher_id' => $request->input('teacher_id'),
                'assistant_id' => $request->input('assistant_id'),
                'supply_teacher_id' => $request->input('supply_teacher_id'),
                'teaching_material_1' => $request->input('teaching_material_1'),
                'teaching_material_2' => $request->input('teaching_material_2'),
                'teaching_material_3' => $request->input('teaching_material_3'),
                'teaching_material_4' => $request->input('teaching_material_4'),
                'period_start_date' => $request->input('period_start_date'),
                'period_end_date' => $request->input('period_end_date'),
                'class_day' => json_encode($request->input('class_day')),
                'class_schedule' => $request->input('class_schedule'),
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s'),
                'status' => 1,
            ]);
            DB::commit();

        } catch(\Exception $e) {
            DB::rollBack();
        }

        return redirect(route('classes.index'));

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
        $validatedData = $request->validate([
            'name' => 'required|string|between:2,100',
            'teacher_id' => 'required',
            'teaching_material_1' => 'required',
        ]);

        $class = ClassesInfo::find($id);

        try {
            DB::beginTransaction();

            //更新班級資料
            $class->name                = $request->input('name');
            $class->teacher_id          = $request->input('teacher_id');
            $class->assistant_id        = $request->input('assistant_id');
            $class->supply_teacher_id   = $request->input('supply_teacher_id');
            $class->teaching_material_1 = $request->input('teaching_material_1');
            $class->teaching_material_2 = $request->input('teaching_material_2');
            $class->teaching_material_3 = $request->input('teaching_material_3');
            $class->teaching_material_4 = $request->input('teaching_material_4');
            $class->period_start_date   = $request->input('period_start_date');
            $class->period_end_date     = $request->input('period_end_date');
            $class->class_day           = json_encode($request->input('class_day'));
            $class->class_schedule      = $request->input('class_schedule');
            $class->status              = 1;
            $class->updated_at  = date('Y-m-d H:i:s');
            $class->save();

            DB::commit();
            $request->session()->flash('message', '成功修改');

        } catch(\Exception $e) {
            DB::rollBack();
        }

        return redirect(route('classes.index'));
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
