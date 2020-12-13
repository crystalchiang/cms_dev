<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ClassesInfo;

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
        return view('classes.classLists')->with('classes', $classes);
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

        $class = new ClassesInfo();
        $class->name = $request->name;
        $class->period_start_date = $request->period_start_date;
        $class->period_end_date = $request->period_end_date;
        $class->calss_start_date = $request->calss_start_date;
        $class->class_schedule = $request->class_schedule;
        $class->save();

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
    public function update(Request $request, ClassesInfo $class)
    {
        //
        $class->name = $request->name;
        $class->period_start_date = $request->period_start_date;
        $class->period_end_date = $request->period_end_date;
        $class->calss_start_date = $request->calss_start_date;
        $class->class_schedule = $request->class_schedule;
        $class->save();

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
