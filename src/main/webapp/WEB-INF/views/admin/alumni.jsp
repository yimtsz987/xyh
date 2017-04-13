<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/adminTaglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>校友花名册</title>
        <%@ include file="/WEB-INF/views/include/adminHead.jsp" %>
		<style type="text/css">
			.custom-select {
				width: 163px;
				margin-left: 10px;
				display: inline-block;
				line-height: 28px !important;
				height: 28px !important;
				padding: 0px 6px !important;
			}
			
			.form-input-width-200 {
				width: 180px !important;
			}
			
			.form-button-width-90 {
				width: 90px !important;
			}
			
			.input-width {
				width: 250px;
				margin-left: 10px;
			}
			.select-margin-left-10 {
				margin-left: 10px !important;
			}
			.layui-layer-btn input {
				height: 36px;
				line-height: 36px;
				margin: 0 6px;
				padding: 0 15px;
				border: 1px solid #dedede;
				background-color: #f1f1f1;
				color: #333;
				border-radius: 2px;
				font-weight: 400;
				cursor: pointer;
				text-decoration: none;
			}
			.department-active {
				color: #f90 !important;
			}
		</style>
	</head>

	<body>

		<div class="search_style" style="margin: 1% 1%;">
			<div class="title_names">搜索查询</div>
			<form:form method="post" action="${ctx}/alumni" id="alumni-form" modelAttribute="user">
                <ul class="search_content clearfix">
                    <li>
						<label class="l_f">学号</label>
						<form:input path="no" cssClass="text_add form-input-width-200" placeholder="输入学号" />
					</li>
                    <li>
						<label class="l_f">名字</label>
						<form:input path="name" cssClass="text_add form-input-width-200" placeholder="输入名字" />
					</li>
                    <li>
						<label class="l_f">所属分会</label>
						<form:select path="branch.id" cssClass="text_add form-input-width-200 select-margin-left-10" id="">
							<form:option value="" label="----选择分会----" />
							<form:options items="${xyh:getBranchList()}" itemLabel="name" itemValue="id" />
						</form:select>
					</li>
                    <li><label class="l_f">专业</label>
						<form:select path="major.id" cssClass="text_add form-input-width-200 select-margin-left-10" id="">
							<form:option value="" label="----选择专业----" />
							<form:options items="${xyh:getMajorList()}" itemLabel="name" itemValue="id" />
						</form:select>
					</li>
                    <li>
						<label class="l_f">班级</label>
						<form:select path="classes" cssClass="text_add form-input-width-200 select-margin-left-10" id="">
							<form:option value="" label="----选择班级----" />
							<form:options items="${xyh:getClassesList()}" itemLabel="classId" itemValue="classId" />
						</form:select>
					</li>
                    <li>
						<label class="l_f">入学年份</label>
						<form:input path="enrollmentYear" cssClass="text_add form-input-width-200" placeholder="输入入学年份" />
					</li>
                    <li>
						<input id="alumni-search" type="submit" class="btn_search form-button-width-90" value="查询">
					</li>
                </ul>
            </form>
			</form:form>
		</div>
        <script type="text/javascript">

			$("#alumni-search").click(function (){

				var jsonuserinfo = JSON.stringify($("#alumni-form").serializeObject());
                $.ajax({
                    type: "POST",
                    url: "${ctx}/admin/queryAlumni",
					contentType: 'application/json',
                    dataType: "json",
                    data: jsonuserinfo,
                    success: function (data) {
						$("#alumni-content").html("<tr class='odd'><td valign='top' colspan='10' class='dataTables_empty'>没有相关记录</td></tr>");
						$('#sample-table').dataTable();
						var j = 0;
                        $.each(data, function (i, user) {
							var sex;
							var mobile;
							if ( user.sex == '0'){
								sex = '男';
							} else if ( user.sex == '1'){
								sex = '女';
							} else {
								sex = '保密';
							}
							if ( user.secrecyFlag == "0"){
								mobile = "保密";
							} else {
								mobile = user.mobile;
							}
							if(j>=1){
								$("#alumni-content").append("<tr>"+
										"								<td><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>"+
										"								<td>"+user.no+"</td>"+
										"								<td>"+user.name+"</td>"+
										"								<td>"+sex+"</td>"+
										"								<td>"+user.enrollmentYear+"</td>"+
										"								<td>"+user.major.name+"</td>"+
										"								<td>"+user.classes+"</td>"+
										"								<td>"+user.branch.name+"</td>"+
										"								<td>"+mobile+"</td>"+
										"								<td class='td-status'><span class='label label-success radius'>显示</span></td>"+
										"                                <shiro:hasPermission name='xyh:alumni:edit'>"+
										"                                    <td class='td-manage'>"+
										"                                        <a onClick='member_stop(this,'10001')' href='javascript:void(0);' title='停用' class='btn btn-xs btn-success'><i class='fa fa-check  bigger-120'></i></a>"+
										"                                        <a title='编辑' onclick='member_edit(this,"+ user.id +")' href='javascript:void(0);' class='btn btn-xs btn-info'><i class='fa fa-edit bigger-120'></i></a>"+
										"                                        <a title='删除' href='javascript:void(0);' onclick='member_del(this,'1')' class='btn btn-xs btn-warning'><i class='fa fa-trash  bigger-120'></i></a>"+
										"                                        <a title='重置密码' href='javascript:void(0);' onclick='reset_password(this,'1')' class='btn btn-xs btn-danger'><i class='fa fa-refresh bigger-120'></i></a>"+
										"                                    </td>"+
										"                                </shiro:hasPermission>"+
										"							</tr>");
							}else {
								$("#alumni-content").html("<tr>"+
										"								<td><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>"+
										"								<td>"+user.no+"</td>"+
										"								<td>"+user.name+"</td>"+
										"								<td>"+sex+"</td>"+
										"								<td>"+user.enrollmentYear+"</td>"+
										"								<td>"+user.major.name+"</td>"+
										"								<td>"+user.classes+"</td>"+
										"								<td>"+user.branch.name+"</td>"+
										"								<td>"+mobile+"</td>"+
										"								<td class='td-status'><span class='label label-success radius'>显示</span></td>"+
										"                                <shiro:hasPermission name='xyh:alumni:edit'>"+
										"                                    <td class='td-manage'>"+
										"                                        <a onClick='member_stop(this,'10001')' href='javascript:void(0);' title='停用' class='btn btn-xs btn-success'><i class='fa fa-check  bigger-120'></i></a>"+
										"                                        <a title='编辑' onclick='member_edit(this,"+ user.id +")' href='javascript:void(0);' class='btn btn-xs btn-info'><i class='fa fa-edit bigger-120'></i></a>"+
										"                                        <a title='删除' href='javascript:void(0);' onclick='member_del(this,'1')' class='btn btn-xs btn-warning'><i class='fa fa-trash  bigger-120'></i></a>"+
										"                                        <a title='重置密码' href='javascript:void(0);' onclick='reset_password(this,'1')' class='btn btn-xs btn-danger'><i class='fa fa-refresh bigger-120'></i></a>"+
										"                                    </td>"+
										"                                </shiro:hasPermission>"+
										"							</tr>");
							}
							j++;
							$('#sample-table').dataTable();
                        });
						//var table = $('#sample-table').dataTable();
						//table.page('next').draw( false );
                    }
                })
            })
        </script>
		<div class=" clearfix" id="advertising">
			<div id="scrollsidebar" class="left_Treeview">
				<div class="show_btn" id="rightArrow"><span></span></div>
				<div class="widget-box side_content">
					<div class="side_title">
						<a title="隐藏" class="close_btn"><span></span></a>
					</div>
					<div class="side_list">
						<div class="widget-header header-color-green2">
							<h4 class="lighter smaller">校友花名册</h4>
						</div>
						<div class="widget-body">
							<ul class="b_P_Sort_list">
								<li><i class="orange  fa fa-user-secret"></i>
									<a href="${ctx}/admin/alumni">全部校友(${alumniCount})</a>
								</li>
								<c:forEach items="${departmentList}" var="department" varStatus="dt">
									<c:if test="${(dt.index + 1) != departmentNo}">
										<li><i class="fa fa-star pink "></i>
											<a href="${ctx}/admin/queryAlumniByDepartment?dNo=${department.dNo}">${department.name}(${department.count})</a>
										</li>
									</c:if>
									<c:if test="${(dt.index + 1) == departmentNo}">
										<li><i class="fa fa-star pink department-active"></i>
											<a class="department-active" href="${ctx}/admin/queryAlumniByDepartment?dNo=${department.dNo}">${department.name}(${department.count})</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="Ads_list">
                <shiro:hasPermission name='xyh:alumni:edit'>
					<div class="border clearfix">
						<span class="l_f">
							<a href="javascript:void(0)" id="ads_add" class="btn btn-warning"><i class="fa fa-plus"></i> 添加校友</a>
						</span>
					</div>
				</shiro:hasPermission>
                <shiro:hasPermission name='xyh:alumni:edit'>
					<div class="alert alert-block alert-success">
						<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
						<i class="icon-ok green"></i><strong>消息：${msg}</strong>
					</div>
				</shiro:hasPermission>
				<div class="Ads_lists">
					<table class="table table-striped table-bordered table-hover" id="sample-table">
						<thead>
							<tr>
								<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
								<th>学号</th>
								<th>名字</th>
								<th>性别</th>
								<th>入学年份</th>
								<th>专业</th>
								<th>班级</th>
								<th>所属工会</th>
								<th>电话</th>
								<th width="70">状态</th>
                                <shiro:hasPermission name="xyh:alumni:edit">
								  <th width="250">操作</th>
                                </shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="alumni-content">
                          <c:forEach items="${userList}" var="alumni">
							<tr>
								<td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
								<td>${alumni.no}</td>
								<td>${alumni.name}</td>
								<td>${alumni.sex eq '0' ? '男' : '女'}</td>
								<td>${alumni.enrollmentYear}</td>
								<td>${alumni.major.name}</td>
								<td>${alumni.classes}</td>
								<td>${empty alumni.branch.name ? '暂未加入分会' : alumni.branch.name}</td>
								<td>${alumni.secrecyFlag eq '0' ? '保密':alumni.mobile}</td>
								<td class="td-status"><span class="label label-success radius">显示</span></td>
                                <shiro:hasPermission name="xyh:alumni:edit">
                                    <td class="td-manage">
                                        <a title="编辑" onclick="member_edit(this,${alumni.id})" href="javascript:void(0);" class="btn btn-xs btn-info"><i class="fa fa-edit bigger-120"></i></a>
                                        <a title="删除" href="javascript:void(0);" onclick="member_del(this,${alumni.id})" class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>
                                        <a title="重置密码" href="javascript:void(0);" onclick="reset_password(this,'1')" class="btn btn-xs btn-danger"><i class="fa fa-refresh bigger-120"></i></a>
                                    </td>
                                </shiro:hasPermission>
							</tr>
                          </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!--添加样式-->
		<div id="add_ads_style" style="display:none">
			<form:form action="${ctx}/admin/insertAlumni" method="post" id="form-admin-add" modelAttribute="user">
				<div class="add_adverts">
					<div class="form-group">
						<label class="form-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号： </label>
						<div class="formControls">
							<form:input path="no" id="no" cssClass="input-text" datatype="*2-16" nullmsg="学号不能为空"/>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名： </label>
						<div class="formControls">
							<form:input path="name" cssClass="input-text" id="name" datatype="*2-16" nullmsg="姓名不能为空"/>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label ">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
						<div class="formControls  skin-minimal">
							<label>
								<form:radiobutton path="sex" cssClass="ace" value="2" /><span class="lbl">保密</span>
							</label>&nbsp;&nbsp;
							<label>
								<form:radiobutton path="sex" cssClass="ace" value="0" /><span class="lbl">男</span>
							</label>&nbsp;&nbsp;
							<label>
								<form:radiobutton path="sex" cssClass="ace" value="1" /><span class="lbl">女</span>
							</label>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">身&nbsp;&nbsp;份&nbsp;&nbsp;证：</label>
						<div class="formControls">
							<form:input path="idCard" id="idCard" cssClass="input-text" datatype="/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/|/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/" nullmsg="身份证不能为空" />
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">入学年份： </label>
						<div class="formControls">
							<form:input path="enrollmentYear" id="enrollmentYear" class="input-text" datatype="n" nullmsg="请输入入学年份"/>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系：</label>
						<div class="formControls ">
							<form:select path="department.dNo" id="department" cssClass="select input-width" datatype="*" nullmsg="请选择院系">
								<form:option value="" label="--请选择院系--"/>
								<form:options items="${departmentList}" itemLabel="name" itemValue="dNo" />
							</form:select>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
						<div class="formControls ">
							<form:select path="major.id" id="major" cssClass="select input-width" datatype="*" nullmsg="请选择专业">
								<form:option value="" label="--请选择专业--"/>
								<form:options items="${majorList}" itemLabel="name" itemValue="id" />
							</form:select>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</label>
						<div class="formControls ">
							<form:select path="classes" id="classes" cssClass="select input-width" datatype="*" nullmsg="请选择班级">
								<form:option value="" label="--请选择班级--"/>
								<form:options items="${classesList}" itemLabel="classId" itemValue="classId" />
							</form:select>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">所属分会：</label>
						<div class="formControls ">
							<form:select path="branch.id" cssClass="select input-width" id="branch">
								<form:option value="" label="--请选择分会（选填）--"/>
								<form:options items="${branchList}" itemLabel="name" itemValue="id" />
							</form:select>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话： </label>
						<div class="formControls">
							<form:input path="mobile" cssClass="input-text" id="name"/>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="layui-layer-btn">
						<input type="submit" class="layui-layer-btn0" value="提交">
						<a href="javascript:void(0);" class="layui-layer-btn1" onclick="this.layer.close()">取消</a>
					</div>
				</div>
			</form:form>
		</div>
		<!--修改样式-->
		<div id="alter_ads_style" style="display:none">
			<form action="${ctx}/admin/saveAlumni" method="post" id="form-admin-alter">
				<div class="add_adverts" id="alter_app">
					<div class="form-group">
						<label class="form-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号： </label>
						<div class="formControls">
							<input type="text" id="website-title" value="{{ node }}" class="input-text input-width" datatype="*2-16" nullmsg="学号不能为空">
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名： </label>
						<div class="formControls">
							<input type="text" class="input-text input-width" value="{{ name }}" placeholder="" id="name" name="name" datatype="*2-16" nullmsg="姓名不能为空">
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label ">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
						<div class="formControls  skin-minimal">
							<label><input name="sex" type="radio" class="ace" checked="checked">&nbsp;&nbsp;&nbsp;&nbsp;<span class="lbl">保密</span></label>&nbsp;&nbsp;
							<label><input name="sex" type="radio" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;
							<label><input name="sex" type="radio" class="ace"><span class="lbl">女</span></label>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">身&nbsp;&nbsp;份&nbsp;&nbsp;证：</label>
						<div class="formControls">
							<input type="text" id="website-title" value="{{ idCard }}" class="input-text input-width" datatype="/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/|/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/" nullmsg="身份证不能为空">
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">入学年份： </label>
						<div class="formControls">
							<input type="text" name="enrollmentYear" id="enrollmentYear" class="input-text input-width" value="{{ enrollmentYear }}" datatype="n" nullmsg="请输入入学年份"/>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系：</label>
						<div class="formControls ">
							<select class="select input-width" name="department" size="1" v-model="department" datatype="*" nullmsg="请选择院系">
								<option v-for="option in departmentValue" v-bind:value="option.value">
									{{ option.text }}
								</option>
							</select>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
						<div class="formControls ">
							<select class="select input-width" name="major" size="1" v-model="major" datatype="*" nullmsg="请选择专业">
								<option v-for="option in majorValue" v-bind:value="option.value">
									{{ option.text }}
								</option>
							</select>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</label>
						<div class="formControls ">
							<select class="select input-width" name="classes" size="1" v-model="classes" datatype="*" nullmsg="请选择班级">
								<option v-for="option in classesValue" v-bind:value="option.value">
									{{ option.text }}
								</option>
							</select>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label">所属分会：</label>
						<div class="formControls ">
							<select class="select input-width" name="" size="1" v-model="branch">
								<option v-for="option in branchValue" v-bind:value="option.value">
									{{ option.text }}
								</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话： </label>
						<div class="formControls">
							<input type="text" name="mobile" class="input-text input-width" value="{{ mobile }}" id="mobile" datatype="m" nullmsg="请输入电话！"/>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
					<div class="form-group">
						<label class="form-label ">是否显示：</label>
						<div class="formControls  skin-minimal">
							<label><input name="loginFlag" type="radio" class="ace" checked="checked" value="0">&nbsp;&nbsp;&nbsp;&nbsp;<span class="lbl">是</span></label>&nbsp;&nbsp;
							<label><input name="loginFlag" type="radio" class="ace" value="1"><span class="lbl">否</span></label>
						</div>
						<div class="col-4"> <span class="Validform_checktip"></span></div>
					</div>
				</div>
			</form>
		</div>
	</body>

</html>
<script>
	//初始化宽度、高度  
	$(".widget-box").height($(window).height());
	$(".Ads_list").width($(window).width() - 220);
	//当文档窗口发生改变时 触发  
	$(window).resize(function() {
		$(".widget-box").height($(window).height());
		$(".Ads_list").width($(window).width() - 220);
	});
	$(function() {
		$("#advertising").fix({
			float: 'left',
			//minStatue : true,
			skin: 'green',
			durationTime: false,
			stylewidth: '220',
			spacingw: 30, //设置隐藏时的距离
			spacingh: 250, //设置显示时间距
			set_scrollsidebar: '.Ads_style',
			table_menu: '.Ads_list'
		});
	});

	var vm = new Vue({
		el: '#alter_app',
		data: {
			node: '',
			name: '',
			idCard: '',
			enrollmentYear: '',
			department: '',
			departmentValue:[
				<c:forEach items="${departmentList}" var="department">
				{
					text: '${department.name}',
					value: '${department.dNo}'
				},
				</c:forEach>
			],
			major: '',
			majorValue: [
				<c:forEach items="${majorList}" var="major">
				{
					text: '${major.name}',
					value: '${major.id}'
				},
				</c:forEach>
			],
			classes: '',
			classesValue: [
				<c:forEach items="${classesList}" var="classes" >
				{
					text: '${classes.classId}',
					value: '${classes.classId}'
				},
				</c:forEach>],
			branch: '',
			branchValue: [
				<c:forEach items="${branchList}" var="branch">
				{
					text: '${branch.name}',
					value: '${branch.id}'
				},
				</c:forEach>
			],
			mobile: ''
		},
		methods: {
			showData : function (id) {
				var _data = this;
				$.ajax({
					type: "post",
					url: "${ctx}/admin/queryAlumniById",
					data: {
						"id": id
					},
					success: function(data) {
						_data.node = data.no;
						_data.name = data.name;
						_data.idCard = data.idCard;
						_data.enrollmentYear = data.enrollmentYear;
						_data.department = data.department.id;
						_data.major = data.major.id;
						_data.classes = data.classes;
						_data.branch = data.branch.id;
						_data.mobile = data.mobile;
					}
				});
			}
		}
	});

	/*编辑*/
	function member_edit(obj, id) {
		vm.showData(id);
		layer.open({
			type: 1,
			title: '修改校友信息',
			maxmin: true,
			shadeClose: false, //点击遮罩关闭层
			area: ['800px', ''],
			content: $('#alter_ads_style'),
			btn: ['提交', '取消'],
			yes: function(index, layero) {
				//alert(id);
				//填写提交URL
				layer.alert('修改成功',{
					title: '提示框',
					icon: 1,
				});
				layer.close(index);
			},
			btn2: function(index, layero) {
				//alert(2);
				//按钮2的方法
			}
		});
	}
	/*重置密码*/
	function reset_password(obj, id) {
		layer.confirm('确认要重置密码？', {
			icon: 0,
		}, function(index) {
			//调用controller层
			layer.msg('重置成功!', {
				icon: 1,
				time: 1000
			});
		});
	}
	/*删除*/
	function member_del(obj, id) {
		layer.confirm('确认要删除吗？', {
			icon: 0,
		}, function(index) {
			window.location.href = "${ctx}/admin/deleteAlumni?id="+id;
			//$(obj).parents("tr").remove();
			/*layer.msg('已删除!', {
				icon: 1,
				time: 1000
			});*/
		});
	}

	/*******添加校友*********/
	$('#ads_add').on('click', function() {
		layer.open({
			type: 1,
			title: '添加校友',
			maxmin: true,
			shadeClose: false, //点击遮罩关闭层
			area: ['800px', '650px'],
			content: $('#add_ads_style'),
		});
	})

	/*******修改校友信息*********/
	$('#ads_alter').on('click', function() {
		layer.open({
			type: 1,
			title: '添加校友',
			maxmin: true,
			shadeClose: false, //点击遮罩关闭层
			area: ['800px', ''],
			content: $('#add_ads_style'),
			btn: ['提交', '取消'],
			yes: function(index, layero) {
				var num = 0;
				var str = "";
				$(".add_adverts input[type$='text']").each(function(n) {
					if($(this).val() == "") {

						layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
							title: '提示框',
							icon: 0,
						});
						num++;
						return false;
					}
				});
				if(num > 0) {
					return false;
				} else {
					layer.alert('添加成功！', {
						title: '提示框',
						icon: 1,
					});
					layer.close(index);
				}
			}
		});
	});

	//表单验证提交
	$("#form-admin-add").Validform({

		tiptype: 2,

		callback: function(data) {
			//form[0].submit();
			if(data.status == 1) {
				layer.msg(data.info, {
					icon: data.status,
					time: 1000
				}, function() {
					location.reload(); //刷新页面
				});
			} else {
				layer.msg(data.info, {
					icon: data.status,
					time: 3000
				});
			}
			var index = parent.$("#iframe").attr("src");
			parent.layer.close(index);
			//
		}

	});

	//表单验证提交
	$("#form-admin-alter").Validform({

		tiptype: 2,

		callback: function(data) {
			//form[0].submit();
			if(data.status == 1) {
				layer.msg(data.info, {
					icon: data.status,
					time: 1000
				}, function() {
					location.reload(); //刷新页面 
				});
			} else {
				layer.msg(data.info, {
					icon: data.status,
					time: 3000
				});
			}
			var index = parent.$("#iframe").attr("src");
			parent.layer.close(index);
			//
		}

	});
</script>
<script>
	jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable({
			"aaSorting": [
				[1, "desc"]
			], //默认第几个排序
			"bStateSave": true, //状态保存
			"aoColumnDefs": [
				//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
				{
					"orderable": false,
					"aTargets": [0, 2, 3, 4, 5, 6, 7, 8, 9<shiro:hasPermission name="xyh:alumni:edit">,10</shiro:hasPermission>]
				} // 制定列不参与排序
			]
		});

		$('table th input:checkbox').on('click', function() {
			var that = this;
			$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function() {
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});

		});

		$('[data-rel="tooltip"]').tooltip({
			placement: tooltip_placement
		});

		function tooltip_placement(context, source) {
			var $source = $(source);
			var $parent = $source.closest('table')
			var off1 = $parent.offset();
			var w1 = $parent.width();

			var off2 = $source.offset();
			var w2 = $source.width();

			if(parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
			return 'left';
		}
	})
</script>