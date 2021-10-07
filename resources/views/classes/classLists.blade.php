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
                    <select id="branch_school_id" v-model="branch_school_id" class="form-control filter">
                        @foreach($branch_schools as $item)
                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                        @endforeach
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
                            <tr v-for='item in classes' :key='item.id' v-if="item.branch_school_id == branch_school_id">
                                <td>@{{ item.id }}</td>
                                <td>@{{ item.name }}</td>
                                <td>@{{ item.teacher }}</td>
                                <td>@{{ item.assistant }}</td>
                                <td>@{{ item.supply_teacher }}</td>
                                <td>@{{ item.material_1 }}</td>
                                <td>@{{ item.material_2 }}</td>
                                <td>@{{ item.material_3 }}</td>
                                <td>@{{ item.material_4 }}</td>
                                <td>@{{ item.period_start_date }}</td>
                                <td>@{{ item.period_end_date }}</td>
                                <td>@{{ item.class_day_text }}</td>
                                <td>@{{ item.class_schedule_name }}</td>
                                <td>
                                    <a :href="'#editform_' + item.id" class="blue btn-add">
                                        <i class="ace-icon fa fa-edit bigger-180"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                    <!-- <div class="btn-group" style="float: right;">
                        <a href="#" class="btn">1</a>
                        <a href="#" class="btn">2</a>
                        <a href="#" class="btn">3</a>
                        <a href="#" class="btn">4</a>
                        <a href="#" class="btn">5</a>
                    </div> -->
                </div><!-- /.span -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div>
    <!-- Inside -->
    <div class="popup" id="addform">
        <h3>新增班級</h3>
        <hr />
        <form class="form-horizontal" role="form" action="{{ route('classes.store')}}" method="post">
            @csrf
            <input type="hidden" v-model="branch_school_id" name="branch_school_id">
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 班級名稱 </label>
                <div class="col-sm-9">
                    <input type="text" name="name" id="form-field-1" class="form-control" required />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 帶班老師姓名 </label>
                <div class="col-sm-9">
                    <select name="teacher_id" class="form-control" required>
                        @foreach($teachers as $item)
                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 助教姓名 </label>
                <div class="col-sm-9">
                    <select name="teacher_assistant_id" class="form-control">
                        @foreach($assistants as $item)
                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 代課老師 </label>
                <div class="col-sm-9">
                    <select name="supply_teacher_id" class="form-control">
                        @foreach($supplyTeachers as $item)
                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材1</label>
                <div class="col-sm-9">
                    <select name="teaching_material_1" class="form-control" required>
                        @foreach($material as $item)
                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材2</label>
                <div class="col-sm-9">
                    <select name="teaching_material_2" class="form-control">
                        @foreach($material as $item)
                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材3</label>
                <div class="col-sm-9">
                    <select name="teaching_material_3" class="form-control">
                        @foreach($material as $item)
                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材4</label>
                <div class="col-sm-9">
                    <select name="teaching_material_4" class="form-control">
                        @foreach($material as $item)
                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 本期開始日 </label>
                <div class="col-sm-9">
                    <input type="date" name="period_start_date" id="form-field-1" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 本期結束日 </label>
                <div class="col-sm-9">
                    <input type="date" name="period_end_date" id="form-field-1" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上課日 </label>
                <div class="col-sm-9" style="display: inline-flex;">
                    <div class="form-check form-check-inline mr-3">
                        <input class="form-check-input" type="checkbox" name="class_day[]" value="1">
                        <label class="form-check-label" for="inline-checkbox1">星期一</label>
                    </div>
                    <div class="form-check form-check-inline mr-3">
                        <input class="form-check-input" type="checkbox" name="class_day[]" value="2">
                        <label class="form-check-label" for="inline-checkbox2">星期二</label>
                    </div>
                    <div class="form-check form-check-inline mr-3">
                        <input class="form-check-input" type="checkbox" name="class_day[]" value="3">
                        <label class="form-check-label" for="inline-checkbox3">星期三</label>
                    </div>
                    <div class="form-check form-check-inline mr-3">
                        <input class="form-check-input" type="checkbox" name="class_day[]" value="4">
                        <label class="form-check-label" for="inline-checkbox4">星期四</label>
                    </div>
                    <div class="form-check form-check-inline mr-3">
                        <input class="form-check-input" type="checkbox" name="class_day[]" value="5">
                        <label class="form-check-label" for="inline-checkbox5">星期五</label>
                    </div>
                    <div class="form-check form-check-inline mr-3">
                        <input class="form-check-input" type="checkbox" name="class_day[]" value="6">
                        <label class="form-check-label" for="inline-checkbox6">星期六</label>
                    </div>
                    <div class="form-check form-check-inline mr-3">
                        <input class="form-check-input" type="checkbox" name="class_day[]" value="7">
                        <label class="form-check-label" for="inline-checkbox7">星期日</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上課時段 </label>
                <div class="col-sm-9">
                    <select name="class_schedule" class="form-control">
                        @foreach($class_schedule as $key => $item)
                            <option value="{{ $key }}">{{ $item }}</option>
                        @endforeach
                    </select>
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
    <!-- Inside -->
</div><!-- /.main-content -->


@foreach($classes as $class)
<div class="popup" id="editform_{{$class->id}}">
    <h3>修改班級</h3>
    <hr />
    <form class="form-horizontal" role="form" action="{{ route('classes.update',$class->id)}}" method="post">
        @csrf
        @method('PUT')
        <input type="hidden" v-model="branch_school_id" name="branch_school_id">
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 班級名稱 </label>
            <div class="col-sm-9">
                <input type="text" name="name" id="form-field-1" value="{{ $class->name }}" class="form-control" required />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 帶班老師姓名 </label>
            <div class="col-sm-9">
                <select name="teacher_id" class="form-control" required value="{{ $class->teacher_id }}">
                    @foreach($teachers as $item)
                        @if($item->id == $class->teaching_material_4)
                        <option value="{{ $item->id }}" selected>{{ $item->name }}</option>
                            @else 
                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                        @endif
                    @endforeach
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 助教姓名 </label>
            <div class="col-sm-9">
                <select name="teacher_assistant_id" class="form-control" value="{{ $class->teacher_assistant_id }}">
                    @foreach($assistants as $item)
                        @if($item->id == $class->teaching_material_4)
                        <option value="{{ $item->id }}" selected>{{ $item->name }}</option>
                            @else 
                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                        @endif
                    @endforeach
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 代課老師 </label>
            <div class="col-sm-9">
                <select name="supply_teacher_id" class="form-control" value="{{ $class->supply_teacher_id }}">
                    @foreach($supplyTeachers as $item)
                        @if($item->id == $class->teaching_material_4)
                        <option value="{{ $item->id }}" selected>{{ $item->name }}</option>
                            @else 
                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                        @endif
                    @endforeach
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材1</label>
            <div class="col-sm-9">
            <select name="teaching_material_1" class="form-control" required value="{{ $class->teaching_material_1 }}">
                @foreach($material as $item)
                    @if($item->id == $class->teaching_material_1)
                    <option value="{{ $item->id }}" selected>{{ $item->name }}</option>
                        @else 
                        <option value="{{ $item->id }}">{{ $item->name }}</option>
                    @endif
                @endforeach
            </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材2</label>
            <div class="col-sm-9">
            <select name="teaching_material_2" class="form-control" value="{{ $class->teaching_material_2 }}">
                @foreach($material as $item)
                    @if($item->id == $class->teaching_material_2)
                    <option value="{{ $item->id }}" selected>{{ $item->name }}</option>
                        @else 
                        <option value="{{ $item->id }}">{{ $item->name }}</option>
                    @endif
                @endforeach
            </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材3</label>
            <div class="col-sm-9">
            <select name="teaching_material_3" class="form-control" value="{{ $class->teaching_material_3 }}">
                @foreach($material as $item)
                    @if($item->id == $class->teaching_material_3)
                    <option value="{{ $item->id }}" selected>{{ $item->name }}</option>
                        @else 
                        <option value="{{ $item->id }}">{{ $item->name }}</option>
                    @endif
                @endforeach
            </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-select-1">使用教材4</label>
            <div class="col-sm-9">
            <select name="teaching_material_4" class="form-control" value="{{ $class->teaching_material_4 }}">
                @foreach($material as $item)
                    @if($item->id == $class->teaching_material_4)
                    <option value="{{ $item->id }}" selected>{{ $item->name }}</option>
                        @else 
                        <option value="{{ $item->id }}">{{ $item->name }}</option>
                    @endif
                @endforeach
            </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 本期開始日 </label>
            <div class="col-sm-9">
                <input type="date" name="period_start_date" id="form-field-1" value="{{ $class->period_start_date }}" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 本期結束日 </label>
            <div class="col-sm-9">
                <input type="date" name="period_end_date" id="form-field-1" value="{{ $class->period_end_date }}" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上課日 </label>
            <div class="col-sm-9" style="display: inline-flex;">
                <div class="form-check form-check-inline mr-3">
                    <input class="form-check-input" type="checkbox" name="class_day[]" value="1" {{ (in_array('1', json_decode($class->class_day)) ? 'checked' : '')}}>
                    <label class="form-check-label" for="inline-checkbox1">星期一</label>
                </div>
                <div class="form-check form-check-inline mr-3">
                    <input class="form-check-input" type="checkbox" name="class_day[]" value="2" {{ (in_array('2', json_decode($class->class_day)) ? 'checked' : '')}}>
                    <label class="form-check-label" for="inline-checkbox2">星期二</label>
                </div>
                <div class="form-check form-check-inline mr-3">
                    <input class="form-check-input" type="checkbox" name="class_day[]" value="3" {{ (in_array('3', json_decode($class->class_day)) ? 'checked' : '')}}>
                    <label class="form-check-label" for="inline-checkbox3">星期三</label>
                </div>
                <div class="form-check form-check-inline mr-3">
                    <input class="form-check-input" type="checkbox" name="class_day[]" value="4" {{ (in_array('4', json_decode($class->class_day)) ? 'checked' : '')}}>
                    <label class="form-check-label" for="inline-checkbox4">星期四</label>
                </div>
                <div class="form-check form-check-inline mr-3">
                    <input class="form-check-input" type="checkbox" name="class_day[]" value="5" {{ (in_array('5', json_decode($class->class_day)) ? 'checked' : '')}}>
                    <label class="form-check-label" for="inline-checkbox5">星期五</label>
                </div>
                <div class="form-check form-check-inline mr-3">
                    <input class="form-check-input" type="checkbox" name="class_day[]" value="6" {{ (in_array('6', json_decode($class->class_day)) ? 'checked' : '')}}>
                    <label class="form-check-label" for="inline-checkbox6">星期六</label>
                </div>
                <div class="form-check form-check-inline mr-3">
                    <input class="form-check-input" type="checkbox" name="class_day[]" value="7" {{ (in_array('7', json_decode($class->class_day)) ? 'checked' : '')}}>
                    <label class="form-check-label" for="inline-checkbox7">星期日</label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上課時段 </label>
            <div class="col-sm-9">
                <select name="class_schedule" class="form-control" value="{{ $class->class_schedule }}">
                    @foreach($class_schedule as $key => $item)
                        @if($key == $class->class_schedule)
                        <option value="{{ $key }}" selected>{{ $item }}</option>
                            @else 
                            <option value="{{ $key }}">{{ $item }}</option>
                        @endif
                    @endforeach
                </select>
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


@section('javascript')
<script src="{{mix('js/app.js')}}"></script>
<script>
  new Vue({
    el: '.main-content',
    data: {
      branch_school_id: 0,
      schools: {},
      classes: []
    },
    computed: {
    },
    created() {
      this.classes = @json($classes);
      this.schools = @json($branch_schools);
      this.branch_school_id = this.schools[0].id;
      console.log(this.classes)
    },
  });
</script>
@endsection