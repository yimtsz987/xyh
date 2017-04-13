<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/adminTaglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>个人信息</title>
	<%@ include file="/WEB-INF/views/include/adminHead.jsp" %>
	<style type="text/css">
		.content_wrap .content_info {
			min-width: 1200px;
			height: 300px;
			margin: 1% 1% 0 1%;
			border: 1px solid #ccc;
			background: #fff;
		}
		
		.content_wrap .content_info .con_info {
			height: 40px;
			font-size: 20px;
			line-height: 40px;
			background: #eee;
			border-bottom: 1px solid #ccc;
			padding-left: 20px;
		}
		
		.content_wrap .content_info .con_main {
			min-width: 790px;
			margin: 30px;
			height: 202px;
			position: relative;
		}
		
		.content_wrap .content_info .con_main .con_tx {
			width: 180px;
			height: 180px;
			float: left;
			border-radius: 50%;
			overflow: hidden;
			margin-left: 30px;
			border: 1px solid #e3e3e3;
			box-sizing: border-box;
			display: inline-block;
		}
		
		.content_wrap .content_info .con_main .con_tx img {
			width: 200px;
			height: 200px;
		}
		
		.content_wrap .content_info .con_main .con_xx {
			padding: 0px 30px 0px 30px;
			position: absolute;
			float: left;
			display: inline-block;
			margin-left: 10px;
		}
		
		.content_wrap .content_info .con_main .con_xx h2 {
			font-size: 20px;
			line-height: 40px;
		}
		
		.content_wrap .content_info .con_main .con_xx p {
			line-height: 25px;
			font-size: 16px;
		}
		
		.content_wrap .content_info .con_main .con_zl p:nth-child(1) {
			margin-top: 50px;
		}
		
		.content_wrap .content_info .con_main .con_zl p {
			line-height: 50px;
		}
		.input-width{
			width: 250px;
			margin-left: 10px;
		}
		.label-text{
			line-height: 30px;
            font-size: 14px;
            margin-left: 15px;
		}
	</style>
</head>
<body>
<div class="alert alert-block alert-success">
	<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
	<i class="icon-ok green"></i>消息：${msg}
</div>
<div class="content_wrap">
	<div class="content_info">
		<div class="con_info">个人信息</div>
		<div class="con_main">
			<div class="con_tx">
				<img src="${headerPic}${user.headerPic}">
			</div>
			<div class="con_xx">
				<div style="float: left;margin-top: 30px;">
					<c:if test="${user.role.id eq 2}">
						<h2>${user.name}，同学</h2>
						<div>
							<p>专业：${user.major.name}</p>
							<p>入学年份：${user.enrollmentYear}</p>
							<p>所在班级：${user.classes}</p>
							<p>所在分会：${user.branch.name ne null ? user.branch.name : '未加入'}</p>
						</div>
					</c:if>
					<c:if test="${user.role.id eq 1}">
						<h2>${user.name}</h2>
						<div>
							<p>用户名：${user.loginName}</p>
						</div>
					</c:if>
					<c:if test="${user.role.id eq 3}">
						<h2>${user.name},管理员</h2>
						<div>
							<p>用户名：${user.loginName}</p>
						</div>
					</c:if>
				</div>
				<div style="float: left;margin-top: 20px;margin-left: 30px;">
					<div class="easy-pie-chart percentage" data-percent="30" data-color="#62a8d1">
						<span class="percent">30</span>%</div>
				</div>
			</div>

		</div>
	</div>
</div>

<div class="margin clearfix" style="min-width:1150px">
	<div class="stystems_style">
		<div class="tabbable">
			<ul class="nav nav-tabs" id="myTab">
				<li class="active">
					<a data-toggle="tab" href="#1">基本设置</a>
				</li>
				<li class="">
					<a data-toggle="tab" href="#2">详细资料</a>
				</li>
				<li class="">
					<a data-toggle="tab" href="javascript:void(0);" onclick="change_Password()">修改密码</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="1" class="tab-pane active">
						<form:form action="${ctx}/sys/saveUserBaseInfo" id="form-admin-add" modelAttribute="user" method="post">
						<input type="hidden" value="${user.id}">
						<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" for="form-field-1"><i>*</i>真实姓名： </label>
							<label class="label-text">${user.name}</label>
							<div class="col-4"> <span class="Validform_checktip"></span></div>
						</div>
						<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" for="form-field-1"><i>*</i>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号： </label>
							<div class="formControls">
								<label class="label-text">${user.no}</label>
							</div>
							<div class="col-4"> <span class="Validform_checktip"></span></div>
						</div>
						<div class="form-group"><label class="col-sm-1 control-label no-padding-right" for="form-field-1"><i>*</i>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别： </label>
							<div class="col-sm-9">
								<span class="cont_style">&nbsp;&nbsp;
									<label><form:radiobutton path="sex" cssClass="ace" value="0" /><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;
									<label><form:radiobutton path="sex" cssClass="ace" value="1" /><span class="lbl">女</span></label> &nbsp;&nbsp;&nbsp;
									<label><form:radiobutton path="sex" cssClass="ace" value="2" /><span class="lbl">保密</span></label> &nbsp;&nbsp;&nbsp;
								</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" for="form-field-1"><i>*</i>身&nbsp;&nbsp;份&nbsp;&nbsp;证：</label>
							<div class="formControls">
								<label class="label-text">${user.idCard}</label>
							</div>
							<div class="col-4"> <span class="Validform_checktip"></span></div>
						</div>
						<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" for="form-field-1"><i>*</i>所在班级： </label>
							<div class="formControls">
								<label class="label-text">${user.classes}</label>
							</div>
							<div class="col-4"> <span class="Validform_checktip"></span></div>
						</div>
						<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" for="form-field-1">入学年份：</label>
							<div class="formControls ">
								<label class="label-text">${user.enrollmentYear}</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" for="form-field-1">所属专业：</label>
							<div class="formControls ">
								<label class="label-text">${user.major.name}</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" for="form-field-1"><i>*</i>所属分会： </label>
							<div class="formControls">
								<label class="label-text">${user.branch.name ne null ? user.branch.name : '未加入'}</label>
							</div>
							<div class="col-4"> <span class="Validform_checktip"></span></div>
						</div>
						<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" for="form-field-1">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机： </label>
							<div class="formControls">
								<form:input path="mobile" cssClass="input-text" placeholder="请输入电话" id="mobile" datatype="m" nullmsg="请输入电话！" />
							</div>
							<div class="col-4"> <span class="Validform_checktip"></span></div>
						</div>
						<div class="form-group"><label class="col-sm-1 control-label no-padding-right" for="form-field-1"><i>*</i>手机保密： </label>
							<div class="col-sm-9">
										<span class="cont_style">
						                     <label><form:radiobutton path="secrecyFlag" cssClass="ace" value="0" /><span class="lbl">是</span></label>&nbsp;&nbsp;&nbsp;
										     <label><form:radiobutton path="secrecyFlag" cssClass="ace" value="1" /><span class="lbl">否</span></label>
										</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" for="form-field-1">微&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信： </label>
							<div class="formControls">
								<form:input path="wechat" cssClass="input-text" placeholder="请输入微信" id="wechat" datatype="*" nullmsg="请输入微信！" />
							</div>
							<div class="col-4"> <span class="Validform_checktip"></span></div>
						</div>
						<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" for="form-field-1"><i>*</i>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
							<div class="formControls">
								<form:input path="email" cssClass="input-text" placeholder="@" id="email" datatype="@" nullmsg="请输入邮箱！" />
							</div>
							<div class="col-4"> <span class="Validform_checktip"></span></div>
						</div>
						<div class="Button_operation">
							<input class="btn btn-primary radius" type="submit" value="保存" />
						</div>
						</form:form>
				</div>
				<div id="2" class="tab-pane ">
					<form:form action="${ctx}/sys/saveUserDetailInfo" id="form-admin-add-1" modelAttribute="user" method="post">
						<input type="hidden" value="${user.id}">
						<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" for="form-field-1">籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯： </label>
							<div class="formControls">
								<form:input path="nativePleace" cssClass="input-text input-width" placeholder="请输入籍贯" id="nativePleace" datatype="*" nullmsg="请输入籍贯！" />
							</div>
							<div class="col-4"> <span class="Validform_checktip"></span></div>
						</div>
						<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" for="form-field-1">Q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q： </label>
							<div class="formControls">
								<form:input path="qq" cssClass="input-text input-width" placeholder="请输入QQ" id="qq" datatype="/^\d{5,10}$/" nullmsg="请输入QQ！" />
							</div>
							<div class="col-4"> <span class="Validform_checktip"></span></div>
						</div>
						<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" for="form-field-1">邮政编码： </label>
							<div class="formControls">
								<form:input path="postcode" cssClass="input-text input-width" placeholder="请输入邮政编码" id="postcode" datatype="p" nullmsg="请输入邮政编码！" />
							</div>
							<div class="col-4"> <span class="Validform_checktip"></span></div>
						</div>
						<div class="form-group"><label class="col-sm-1 control-label no-padding-right" for="form-field-1">通讯地址： </label>
							<div class="col-sm-9">
								<form:input path="address" cssClass="input-text input-width" placeholder="请输入通讯地址" id="address" />
							</div>
						</div>
						<div class="form-group"><label class="col-sm-1 control-label no-padding-right" for="form-field-1">家庭电话： </label>
							<div class="col-sm-9">
								<form:input path="homephone" cssClass="input-text input-width" placeholder="请输入家庭电话" id="homephone" />
							</div>
						</div>
						<div class="form-group"><label class="col-sm-1 control-label no-padding-right" for="form-field-1">所在单位： </label>
							<div class="col-sm-9">
								<form:input path="enterpriseAddress" cssClass="input-text input-width" placeholder="请输入所在单位" id="enterpriseAddress" />
							</div>
						</div>
						<div class="form-group"><label class="col-sm-1 control-label no-padding-right" for="form-field-1">行业类别： </label>
							<div class="col-sm-9">
								<form:input path="industryCategory" cssClass="input-text input-width" placeholder="请输入行业类别" id="industryCategory" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" for="form-field-1">个人简介：</label>
							<div class="formControls">
								<form:textarea path="introduction" cols="5" rows="5" cssClass="textarea" placeholder="说点什么...100个字符以内" />
							</div>
						</div>
						<div class="Button_operation">
							<input class="btn btn-primary radius" type="submit" value="保存"/>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!--修改密码样式-->
	<div class="change_Pass_style" id="change_Pass">
		<ul class="xg_style">
			<li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="原密码" type="password" class="" id="password"></li>
			<li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="新密码" type="password" class="" id="Nes_pas"></li>
			<li><label class="label_name">确认密码</label><input name="再次确认密码" type="password" class="" id="c_mew_pas"></li>

		</ul>
		<!--       <div class="center"> <button class="btn btn-primary" type="button" id="submit">确认修改</button></div>-->
	</div>
</div>
</body>
<script type="text/javascript">
    laydate({
        elem: '#start',
        event: 'focus'
    });
</script>
<script type="text/javascript">
    swfobject.addDomLoadEvent(function() {
        var swf = new fullAvatarEditor("swfContainer", {
            id: 'swf',
            upload_url: 'asp/Upload.asp',
            src_upload: 2
        }, function(msg) {
            switch(msg.code) {
                case 1:
                    break;
                case 2:
                    alert("已成功加载默认指定的图片到编辑面板。");
                    break;
                case 3:
                    if(msg.type == 0) {
                        alert("摄像头已准备就绪且用户已允许使用。");
                    } else if(msg.type == 1) {
                        alert("摄像头已准备就绪但用户未允许使用！");
                    } else {
                        alert("摄像头被占用！");
                    }
                    break;
                case 5:
                    if(msg.type == 0) {
                        if(msg.content.sourceUrl) {
                            alert("原图已成功保存至服务器，url为：\n" + 　msg.content.sourceUrl);
                        }
                        alert("头像已成功保存至服务器，url为：\n" + msg.content.avatarUrls.join("\n"));
                    }
                    break;
            }
        });
        document.getElementById("upload").onclick = function() {
            swf.call("upload");
        };
    });
</script>
<script>
    //初始化宽度、高度
    $(".hide_style").height($(".hide_style").height());
    var heights = $(".hide_style").outerHeight(true) + 90;
    $(".widget-box").height($(window).height() - heights);
    $(".table_menu_list").width($(window).width() - 250);
    $(".table_menu_list").height($(window).height() - heights);
    //当文档窗口发生改变时 触发
    $(window).resize(function() {
        $(".widget-box").height($(window).height() - heights);
        $(".table_menu_list").width($(window).width() - 250);
        $(".table_menu_list").height($(window).height() - heights);
    })
    //比例
    var oldie = /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase());
    $('.easy-pie-chart.percentage').each(function() {
        $(this).easyPieChart({
            barColor: $(this).data('color'),
            trackColor: '#e3e3e3',
            scaleColor: false,
            lineCap: 'butt',
            lineWidth: 10,
            animate: oldie ? false : 1000,
            size: 140
        }).css('color', $(this).data('color'));
    });

    $('[data-rel=tooltip]').tooltip();
    $('[data-rel=popover]').popover({
        html: true
    });
</script>
<script>
    //修改密码
    function change_Password() {
        layer.open({
            type: 1,
            title: '修改密码',
            area: ['300px', '300px'],
            shadeClose: true,
            content: $('#change_Pass'),
            btn: ['确认修改'],
            yes: function(index, layero) {
                if($("#password").val() == "") {
                    layer.alert('原密码不能为空!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                }
                if($("#Nes_pas").val() == "") {
                    layer.alert('新密码不能为空!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                }

                if($("#c_mew_pas").val() == "") {
                    layer.alert('确认新密码不能为空!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                }
                if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val()) {
                    layer.alert('密码不一致!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                } else {
                    layer.alert('修改成功！', {
                        title: '提示框',
                        icon: 1,
                    });
                    layer.close(index);
                }
            }
        });
    }
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
    $("#form-admin-add-1").Validform({

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
</html>