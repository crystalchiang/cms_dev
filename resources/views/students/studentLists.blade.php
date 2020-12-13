@extends('layouts.layout')

@section('content')
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li>
                    <a href="BW.html">班級經營</a>
                </li>
                <li class="active">學生基本資料</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    學生基本資料
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-md-10 text-left">
                    <select class="form-control filter" id="form-field-select-1">
                        <option value="">班級名稱</option>
                    </select>
                </div>
                <div class="col-md-2 text-right">
                    <a href="#addform" class="btn btn-primary btn-add">
                        <i class="ace-icon fa fa-plus bigger-120"></i>
                        新增
                    </a>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="table-wrapper">
                    <table id="simple-table" class="table table-bordered table-hover table-scroll">
                        <thead>
                            <tr>
                                <th>編號</th>
                                <th style="width: 100px;">學生姓名</th>
                                <th style="width: 100px;">入學日</th>
                                <th>學生信箱</th>
                                <th>學生Line</th>
                                <th style="width: 100px;">家長姓名1</th>
                                <th style="width: 100px;">家長姓名2</th>
                                <th>家長信箱1</th>
                                <th>家長信箱2</th>
                                <th>家長LINE1</th>
                                <th>家長LINE2</th>
                                <th style="width: 100px;">家長電話1</th>
                                <th style="width: 100px;">家長電話2</th>
                                <th style="width: 100px;">退學日</th>
                                <th>備註</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach($students as $student)
                                <tr>
                                    <td>{{ $student['student']->id }}</td>
                                    <td><a href="#editform_{{$student['student']->id}}" class="blue btn-add">{{ $student['student']->chinese_name }}</a></td>
                                    <td>{{ $student['student']->start_date }}</td>
                                    <td>{{ $student['student']->email }}</td>
                                    <td>{{ $student['student']->line }}</td>
                                    <td>{{ $student['parents'][0]->name }}</td>
                                    <td>{{ $student['parents'][1]->name }}</td>
                                    <td>{{ $student['parents'][0]->email }}</td>
                                    <td>{{ $student['parents'][1]->email}}</td>
                                    <td>{{ $student['parents'][0]->line }}</td>
                                    <td>{{ $student['parents'][1]->line }}</td>
                                    <td>{{ $student['parents'][0]->telephone }}</td>
                                    <td>{{ $student['parents'][1]->telephone }}</td>
                                    <td>{{ $student['student']->expire_date }}</td>
                                    <td>{{ $student['student']->other }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    </div>
                </div><!-- /.span -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<div class="popup" id="addform">
    <h3>新增學生資料</h3>
    <hr />
    <form class="form-horizontal" role="form" action="{{ route('students.store')}}" method="post">
        @csrf
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 學生姓名 </label>
            <div class="col-sm-9">
                <input type="text" name="chinese_name" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 學生英文名 </label>
            <div class="col-sm-9">
                <input type="text" name="english_name" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 入學日 </label>
            <div class="col-sm-9">
                <input type="date" name="start_date" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 學生帳號 </label>
            <div class="col-sm-9">
                <input type="text" name="name" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 學生密碼 </label>
            <div class="col-sm-9">
                <input type="password" name="password" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 學生信箱 </label>
            <div class="col-sm-9">
                <input type="email" name="email" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 學生Line </label>
            <div class="col-sm-9">
                <input type="text" name="line" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長姓名1 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_a_name" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長帳號1 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_a_username" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長密碼1 </label>
            <div class="col-sm-9">
                <input type="password" name="parent_a_password" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長信箱1 </label>
            <div class="col-sm-9">
                <input type="email" name="parent_a_email" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長LINE1 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_a_line" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長電話1 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_a_telephone" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長姓名2 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_b_name" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長帳號2 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_b_username" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長密碼2 </label>
            <div class="col-sm-9">
                <input type="password" name="parent_b_password" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長信箱2 </label>
            <div class="col-sm-9">
                <input type="email" name="parent_b_email" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長LINE2 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_b_line" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長電話2 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_b_telephone" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 退學日 </label>
            <div class="col-sm-9">
                <input type="date" name="expire_date" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 備註 </label>
            <div class="col-sm-9">
                <input type="text" name="other" id="form-field-1" class="form-control" required />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-3 col-md-9">
                <button class="btn btn-info" type="submit">
                    <i class="ace-icon fa fa-check bigger-110"></i>
                    儲存
                </button>
                &nbsp; &nbsp; &nbsp;
                <button class="btn" onclick="$.fancybox.close()" type="reset">
                    <i class="ace-icon fa fa-times bigger-110"></i>
                    關閉
                </button>
            </div>
        </div>
    </form>
</div>

@foreach($students as $student)
<div class="popup" id="editform_{{$student['student']->id}}">
    <h3>修改班級</h3>
    <hr />
    <form class="form-horizontal" role="form" action="{{ route('students.update',$student['student']->id)}}" method="post">
        @csrf
        @method('PUT')
        <input type="hidden" name="parent_a_user_id" id="form-field-1" value="{{ $student['parents'][0]->user_id }}" class="form-control" required />
        <input type="hidden" name="parent_a_id" id="form-field-1" value="{{ $student['parents'][0]->id }}" class="form-control" required />
        <input type="hidden" name="parent_b_user_id" id="form-field-1" value="{{ $student['parents'][1]->user_id }}" class="form-control" required />
        <input type="hidden" name="parent_b_id" id="form-field-1" value="{{ $student['parents'][1]->id }}" class="form-control" required />
        <input type="hidden" name="student_id" id="form-field-1" value="{{ $student['student']->id }}" class="form-control" required />
        <input type="hidden" name="student_user_id" id="form-field-1" value="{{ $student['student']->user_id }}" class="form-control" required />

        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 學生姓名 </label>
            <div class="col-sm-9">
                <input type="text" name="chinese_name" id="form-field-1" value="{{ $student['student']->chinese_name }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 學生英文名 </label>
            <div class="col-sm-9">
                <input type="text" name="english_name" id="form-field-1" value="{{ $student['student']->english_name }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 入學日 </label>
            <div class="col-sm-9">
                <input type="date" name="start_date" id="form-field-1" value="{{ $student['student']->start_date }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 學生帳號 </label>
            <div class="col-sm-9">
                <input type="text" name="name" id="form-field-1" value="{{ $student['student']->name }}" class="form-control" required disabled/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 學生密碼 </label>
            <div class="col-sm-9">
                <input type="password" name="password" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 學生信箱 </label>
            <div class="col-sm-9">
                <input type="email" name="email" id="form-field-1" value="{{ $student['student']->email }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 學生Line </label>
            <div class="col-sm-9">
                <input type="text" name="line" id="form-field-1" value="{{ $student['student']->line }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長姓名1 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_a_name" id="form-field-1" value="{{ $student['parents'][0]->name }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長帳號1 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_a_username" id="form-field-1" value="{{ $student['parents'][0]->account }}" class="form-control" required disabled/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長密碼1 </label>
            <div class="col-sm-9">
                <input type="password" name="parent_a_password" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長信箱1 </label>
            <div class="col-sm-9">
                <input type="email" name="parent_a_email" id="form-field-1" value="{{ $student['parents'][0]->email }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長LINE1 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_a_line" id="form-field-1" value="{{ $student['parents'][0]->line }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長電話1 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_a_telephone" id="form-field-1" value="{{ $student['parents'][0]->telephone }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長姓名2 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_b_name" id="form-field-1" value="{{ $student['parents'][1]->name}}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長帳號2 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_b_username" id="form-field-1" value="{{ $student['parents'][1]->account}}" class="form-control" required disabled/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長密碼2 </label>
            <div class="col-sm-9">
                <input type="password" name="parent_b_password" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長信箱2 </label>
            <div class="col-sm-9">
                <input type="email" name="parent_b_email" id="form-field-1" value="{{ $student['parents'][1]->email}}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長LINE2 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_b_line" id="form-field-1" value="{{ $student['parents'][1]->line}}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 家長電話2 </label>
            <div class="col-sm-9">
                <input type="text" name="parent_b_telephone" id="form-field-1" value="{{ $student['parents'][1]->telephone}}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 退學日 </label>
            <div class="col-sm-9">
                <input type="date" name="expire_date" id="form-field-1" value="{{ $student['student']->expire_date }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 備註 </label>
            <div class="col-sm-9">
                <input type="text" name="other" id="form-field-1" value="{{ $student['student']->other }}" class="form-control" required />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-3 col-md-9">
                <button class="btn btn-info" type="submit">
                    <i class="ace-icon fa fa-check bigger-110"></i>
                    儲存
                </button>
                &nbsp; &nbsp; &nbsp;
                <button class="btn" onclick="$.fancybox.close()" type="reset">
                    <i class="ace-icon fa fa-times bigger-110"></i>
                    關閉
                </button>
            </div>
        </div>
    </form>
</div>
@endforeach

@endsection