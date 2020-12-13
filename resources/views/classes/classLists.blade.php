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
                    <a href="XW.html">校務管理</a>
                </li>
                <li class="active">班級新增、修改或查詢</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    班級新增、修改或查詢
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-10 text-left">
                    <select class="form-control filter">
                        <option value="">分校名稱</option>
                    </select>
                </div>
                <div class="col-xs-2 text-right">
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
                                <th>班級編號</th>
                                <th>班級名稱</th>
                                <th>帶班教師姓名</th>
                                <th>助教姓名</th>
                                <th>代課老師</th>
                                <th>使用教材1</th>
                                <th>使用教材2</th>
                                <th>使用教材3</th>
                                <th>使用教材4</th>
                                <th>本期起始日</th>
                                <th>本期結束日</th>
                                <th>上課日</th>
                                <th>上課時段</th>
                                <th>編輯</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach($classes as $class)
                                <tr>
                                    <td>{{ $class->id }}</td>
                                    <td>{{ $class->name }}</td>
                                    <td>{{ $class->teacher_id }}</td>
                                    <td>{{ $class->teacher_assistant_id }}</td>
                                    <td>{{ $class->substitute_teacher_id }}</td>
                                    <td>{{ $class->teaching_material_1 }}</td>
                                    <td>{{ $class->teaching_material_2 }}</td>
                                    <td>{{ $class->teaching_material_3 }}</td>
                                    <td>{{ $class->teaching_material_4 }}</td>
                                    <td>{{ $class->period_start_date }}</td>
                                    <td>{{ $class->period_end_date }}</td>
                                    <td>{{ $class->class_start_date }}</td>
                                    <td>{{ $class->class_schedule }}</td>
                                    <td>
                                        <a href="#editform_{{$class->id}}" class="blue btn-add">
                                            <i class="ace-icon fa fa-edit bigger-180"></i>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    </div>
                    <div class="btn-group" style="float: right;">
                        <a href="#" class="btn">1</a>
                        <a href="#" class="btn">2</a>
                        <a href="#" class="btn">3</a>
                        <a href="#" class="btn">4</a>
                        <a href="#" class="btn">5</a>
                    </div>
                </div><!-- /.span -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<div class="popup" id="addform">
    <h3>新增班級</h3>
    <hr />
    <form class="form-horizontal" role="form" action="{{ route('classes.store')}}" method="post">
        @csrf
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 班級名稱 </label>
            <div class="col-sm-9">
                <input type="text" name="name" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 帶班老師姓名 </label>
            <div class="col-sm-9">
                <select name="teacher_id" class="form-control" required id="form-field-select-1">
                    <option value="">請選擇</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 助教姓名 </label>
            <div class="col-sm-9">
                <select name="teacher_assistant_id" class="form-control" required id="form-field-select-1">
                    <option value="">請選擇</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 代課老師 </label>
            <div class="col-sm-9">
                <select name="substitute_teacher_id" class="form-control" required id="form-field-select-1">
                    <option value="">請選擇</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材1</label>
            <div class="col-sm-9">
            <select name="teaching_material_1" class="form-control" required id="form-field-select-1">
                <option value="">請選擇</option>
            </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材2</label>
            <div class="col-sm-9">
            <select name="teaching_material_2" class="form-control" required id="form-field-select-1">
                <option value="">請選擇</option>
            </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材3</label>
            <div class="col-sm-9">
            <select name="teaching_material_3" class="form-control" required id="form-field-select-1">
                <option value="">請選擇</option>
            </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材4</label>
            <div class="col-sm-9">
            <select name="teaching_material_4" class="form-control" required id="form-field-select-1">
                <option value="">請選擇</option>
            </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 本期開始日 </label>
            <div class="col-sm-9">
                <input type="date" name="period_start_date" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 本期結束日 </label>
            <div class="col-sm-9">
                <input type="date" name="period_end_date" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上課日 </label>
            <div class="col-sm-9">
                <input type="date" name="calss_start_date" id="form-field-1" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上課時段 </label>
            <div class="col-sm-9">
                <input type="text" name="class_schedule" id="form-field-1" class="form-control" required />
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

@foreach($classes as $class)
<div class="popup" id="editform_{{$class->id}}">
    <h3>修改班級</h3>
    <hr />
    <form class="form-horizontal" role="form" action="{{ route('classes.update',$class->id)}}" method="post">
        @csrf
        @method('PUT')
        
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 班級名稱 </label>
            <div class="col-sm-9">
                <input type="text" name="name" id="form-field-1" value="{{ $class->name }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 帶班老師姓名 </label>
            <div class="col-sm-9">
                <select name="teacher_id" class="form-control" required value="{{ $class->teacher_id }}" id="form-field-select-1">
                    <option value="">請選擇</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 助教姓名 </label>
            <div class="col-sm-9">
                <select name="teacher_assistant_id" class="form-control" required value="{{ $class->teacher_assistant_id }}" id="form-field-select-1">
                    <option value="">請選擇</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 代課老師 </label>
            <div class="col-sm-9">
                <select name="substitute_teacher_id" class="form-control" required value="{{ $class->substitute_teacher_id }}" id="form-field-select-1">
                    <option value="">請選擇</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材1</label>
            <div class="col-sm-9">
            <select name="teaching_material_1" class="form-control" required value="{{ $class->teaching_material_1 }}" id="form-field-select-1">
                <option value="">請選擇</option>
            </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材2</label>
            <div class="col-sm-9">
            <select name="teaching_material_2" class="form-control" required value="{{ $class->teaching_material_2 }}" id="form-field-select-1">
                <option value="">請選擇</option>
            </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材3</label>
            <div class="col-sm-9">
            <select name="teaching_material_3" class="form-control" required value="{{ $class->teaching_material_3 }}" id="form-field-select-1">
                <option value="">請選擇</option>
            </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材4</label>
            <div class="col-sm-9">
            <select name="teaching_material_4" class="form-control" required value="{{ $class->teaching_material_4 }}" id="form-field-select-1">
                <option value="">請選擇</option>
            </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 本期開始日 </label>
            <div class="col-sm-9">
                <input type="date" name="period_start_date" id="form-field-1" value="{{ $class->period_start_date }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 本期結束日 </label>
            <div class="col-sm-9">
                <input type="date" name="period_end_date" id="form-field-1" value="{{ $class->period_end_date }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上課日 </label>
            <div class="col-sm-9">
                <input type="date" name="calss_start_date" id="form-field-1" value="{{ $class->class_start_date }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上課時段 </label>
            <div class="col-sm-9">
                <input type="text" name="class_schedule" id="form-field-1" value="{{ $class->class_schedule }}" class="form-control" required />
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