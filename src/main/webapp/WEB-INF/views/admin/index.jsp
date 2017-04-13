<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/adminTaglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>网站后台管理系统 </title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="${ctxStatic}/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ctxStatic}/assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="${ctxStatic}/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="${ctxStatic}/assets/css/ace.min.css" />
		<link rel="stylesheet" href="${ctxStatic}/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="${ctxStatic}/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="${ctxStatic}/css/style.css" />
		<link rel="stylesheet" href="${ctxStatic}/css/custom.css" />
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${ctxStatic}/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="${ctxStatic}/assets/js/ace-extra.min.js"></script>
		<!--[if lt IE 9]>
		<script src="${ctxStatic}/assets/js/html5shiv.js"></script>
		<script src="${ctxStatic}/assets/js/respond.min.js"></script>
		<![endif]-->
		<!--[if !IE]> -->
		<script src="${ctxStatic}/js/jquery-1.11.2.min.js"></script>
		<!-- <![endif]-->
		<!--[if IE]>
         <script type="text/javascript">window.jQuery || document.write("<script src='${ctxStatic}/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");</script>
        <![endif]-->
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${ctxStatic}/assets/js/jquery.mobile.custom.min.js'>" + "<" + "script>");
		</script>
		<script src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
		<script src="${ctxStatic}/assets/js/typeahead-bs2.min.js"></script>
		<!--[if lte IE 8]>
		  <script src="${ctxStatic}/assets/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="${ctxStatic}/assets/js/ace-elements.min.js"></script>
		<script src="${ctxStatic}/assets/js/ace.min.js"></script>
		<script src="${ctxStatic}/assets/layer/layer.js" type="text/javascript"></script>
		<script src="${ctxStatic}/assets/laydate/laydate.js" type="text/javascript"></script>

		<script type="text/javascript">
			$(function() {
				var cid = $('#nav_list> li>.submenu');
				cid.each(function(i) {
					$(this).attr('id', "Sort_link_" + i);

				})
			})
			jQuery(document).ready(function() {
				$.each($(".submenu"), function() {
					var $aobjs = $(this).children("li");
					var rowCount = $aobjs.size();
					var divHeigth = $(this).height();
					$aobjs.height(divHeigth / rowCount);
				});
				//初始化宽度、高度    
				$("#main-container").height($(window).height() - 100);
				$("#iframe").height($(window).height() - 140);

				$(".sidebar").height($(window).height() - 99);
				var thisHeight = $("#nav_list").height($(window).outerHeight() - 191);
				$(".submenu").height();
				$("#nav_list").children(".submenu").css("height", thisHeight);

				var win_width = $(window).width();
				//alert(win_width);
				if(win_width <= 1016) {
					$("#time-box").hide();
				} else if(win_width <= 772) {
					$("#time-box").hide();
					$("#purple-box").hide();
				} else {
					$("#time-box").show();
					$("#purple-box").show();
				}

				//当文档窗口发生改变时 触发  
				$(window).resize(function() {
					$("#main-container").height($(window).height() - 100);
					$("#iframe").height($(window).height() - 140);
					$(".sidebar").height($(window).height() - 99);

					var win_width = $(window).width();
					//alert(win_width);
					if(win_width <= 1016) {
						$("#time-box").hide();
					} else if(win_width <= 772) {
						$("#time-box").hide();
						$("#purple-box").hide();
					} else {
						$("#time-box").show();
						$("#purple-box").show();
					}
					var thisHeight = $("#nav_list").height($(window).outerHeight() - 191);
					$(".submenu").height();
					$("#nav_list").children(".submenu").css("height", thisHeight);
				});
				$(".iframeurl").click(function() {
					var cid = $(this).attr("name");
					var cname = $(this).attr("title");
					$("#iframe").attr("src", cid).ready();
					$("#Bcrumbs").attr("href", cid).ready();
					$(".Current_page a").attr('href', cid).ready();
					$(".Current_page").attr('name', cid);
					$(".Current_page").html(cname).css({
						"color": "#333333",
						"cursor": "default"
					}).ready();
					$("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
					$("#parentIfour").html('').css("display", "none").ready();
				});

			});


			/*********************点击事件*********************/
			$(document).ready(function() {
				$('#nav_list').find('li.home').click(function() {
					$('#nav_list').find('li.home').removeClass('active');
					$(this).addClass('active');
				});

				//时间设置
				function currentTime() {
					var d = new Date(),
						str = '';
					str += d.getFullYear() + '年';
					str += d.getMonth() + 1 + '月';
					str += d.getDate() + '日';
					str += d.getHours() + '时';
					str += d.getMinutes() + '分';
					str += d.getSeconds() + '秒';
					return str;
				}
				setInterval(function() {
					$('#time').html(currentTime)
				}, 1000);
				//修改密码
				$('.change_Password').on('click', function() {
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
				});
				$('#Exit_system').on('click', function() {
					layer.confirm('是否确定退出系统？', {
							btn: ['是', '否'], //按钮
							icon: 2,
						},
						function() {
							location.href = "${ctx}/logout";

						});
				});
			})
		</script>
	</head>

	<body>
		<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try {
					ace.settings.check('navbar', 'fixed')
				} catch(e) {}
			</script>
			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>					
						<img src="${ctxStatic}/images/logo2.png">
						</small>
					</a>
					<!-- /.brand -->
				</div>
				<!-- /.navbar-header -->
				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<span class="time" id="time-box"><em id="time"></em></span><span class="user-info"><small>欢迎光临,</small>${xyh:getUser().name}</span>
								<i class="icon-caret-down"></i>
							</a>
							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="javascript:void(0)" class="change_Password"><i class="icon-cog"></i>修改密码</a>
								</li>
								<li>
									<a href="javascript:void(0)" name="个人信息.html" title="个人信息" class="iframeurl"><i class="icon-user"></i>个人资料</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="javascript:void(0)" id="Exit_system"><i class="icon-off"></i>退出</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try {
					ace.settings.check('main-container', 'fixed')
				} catch(e) {}
			</script>
			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>
				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try {
							ace.settings.check('sidebar', 'fixed')
						} catch(e) {}
					</script>
					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							校友信息管理系统
						</div>
						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>
							<span class="btn btn-info"></span>
							<span class="btn btn-warning"></span>
							<span class="btn btn-danger"></span>
						</div>
					</div>
					<!-- #sidebar-shortcuts -->
					<ul class="nav nav-list" id="nav_list">
						<li class="home">
							<a href="javascript:void(0)" name="${ctx}/sys/home" class="iframeurl" title=""><i class="icon-desktop"></i><span class="menu-text"> 系统首页 </span></a>
						</li>
						<li>
							<a href="#" class="dropdown-toggle"><i class="icon-user"></i><span class="menu-text"> 个人中心 </span><b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
								<li class="home">
									<a href="javascript:void(0)" name="${ctx}/sys/info" title="个人信息" class="iframeurl"><i class="icon-double-angle-right"></i>个人信息</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#" class="dropdown-toggle"><i class="icon-edit "></i><span class="menu-text"> 校友录 </span><b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
								<li class="home">
									<a href="javascript:void(0)" name="${ctx}/admin/alumni" title="校友花名册" class="iframeurl"><i class="icon-double-angle-right"></i>校友花名册</a>
								</li>
								<li class="home">
									<a href="javascript:void(0)" name="alumniOutstanding.html" title="校友风采" class="iframeurl"><i class="icon-double-angle-right"></i>校友风采</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#" class="dropdown-toggle"><i class="icon-calendar"></i><span class="menu-text"> 分会管理 </span><b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
								<li class="home">
									<a href="javascript:void(0)" name="branchMembers.html" title="分会成员" class="iframeurl"><i class="icon-double-angle-right"></i>分会成员</a>
								</li>
								<li class="home">
									<a href="javascript:void(0)" name="branchActivity.html" title="分会活动" class="iframeurl"><i class="icon-double-angle-right"></i>分会活动</a>
								</li>
								<li class="home">
									<a href="javascript:void(0)" name="branchApply.html" title="入会申请" class="iframeurl"><i class="icon-double-angle-right"></i>入会申请</a>
								</li>
								<shiro:hasPermission name="xyh:admission">
									<li class="home">
										<a href="javascript:void(0)" name="branchApprove.html" title="入会批准" class="iframeurl"><i class="icon-double-angle-right"></i>入会批准</a>
									</li>
								</shiro:hasPermission>
								<shiro:hasPermission name="xyh:branch:edit">
									<li class="home">
										<a href="javascript:void(0)" name="branchManage.html" title="分会管理" class="iframeurl"><i class="icon-double-angle-right"></i>分会管理</a>
									</li>
								</shiro:hasPermission>
							</ul>
						</li>
						<li>
							<a href="#" class="dropdown-toggle"><i class="icon-group"></i><span class="menu-text"> 班级管理 </span><b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
								<li class="home">
									<a href="javascript:void(0)" name="classMembers.html" title="班级成员" class="iframeurl"><i class="icon-double-angle-right"></i>班级成员</a>
								</li>
								<li class="home">
									<a href="javascript:void(0)" name="classActivity.html" title="班级活动" class="iframeurl"><i class="icon-double-angle-right"></i>班级活动</a>
								</li>
								<shiro:hasPermission name="xyh:class-manage">
									<li class="home">
										<a href="javascript:void(0)" name="classManage.html" title="班级管理" class="iframeurl"><i class="icon-double-angle-right"></i>班级管理</a>
									</li>
								</shiro:hasPermission>
							</ul>
						</li>
						<li>
							<a href="#" class="dropdown-toggle"><i class="icon-money"></i><span class="menu-text"> 发展基金会 </span><b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
								<li class="home">
									<a href="javascript:void(0)" name="foundationAbout.html" title="基金会简介" class="iframeurl"><i class="icon-double-angle-right"></i>基金会简介</a>
								</li>
								<li class="home">
									<a href="javascript:void(0)" name="foundationDonation.html" title="捐赠动态" class="iframeurl"><i class="icon-double-angle-right"></i>捐赠动态</a>
								</li>
								<li class="home">
									<a href="javascript:void(0)" name="foundationRegulation.html" title="章程法规" class="iframeurl"><i class="icon-double-angle-right"></i>章程法规</a>
								</li>
								<li class="home">
									<a href="javascript:void(0)" name="foundationMethod.html" title="在线捐赠" class="iframeurl"><i class="icon-double-angle-right"></i>捐赠方法</a>
								</li>
								<li class="home">
									<a href="javascript:void(0)" name="foundationStatistics.html" title="捐赠统计" class="iframeurl"><i class="icon-double-angle-right"></i>捐赠统计</a>
								</li>
							</ul>
						</li>
						<shiro:hasPermission name="xyh:system">
							<li>
								<a href="#" class="dropdown-toggle"><i class="icon-book"></i><span class="menu-text">系统管理</span><b class="arrow icon-angle-down"></b></a>
								<ul class="submenu">
									<li class="home">
										<a href="javascript:void(0)" name="contentManage.html" title="内容管理" class="iframeurl"><i class="icon-double-angle-right"></i>内容管理</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="departmentManage.html" title="院系管理" class="iframeurl"><i class="icon-double-angle-right"></i>院系管理</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="majorManage.html" title="专业管理" class="iframeurl"><i class="icon-double-angle-right"></i>专业管理</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="classMenu.html" title="班级菜单管理" class="iframeurl"><i class="icon-double-angle-right"></i>班级菜单管理</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="branchMenu.html" title="分会菜单管理" class="iframeurl"><i class="icon-double-angle-right"></i>分会菜单管理</a>
									</li>
								</ul>
							</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="xyh:role">
							<li>
								<a href="#" class="dropdown-toggle"><i class="icon-cogs"></i><span class="menu-text"> 角色管理 </span><b class="arrow icon-angle-down"></b></a>
								<ul class="submenu">

									<li class="home">
										<a href="javascript:void(0)" name="adminPermission.html" title="权限管理" class="iframeurl"><i class="icon-double-angle-right"></i>权限管理</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="adminList.html" title="管理员列表" class="iframeurl"><i class="icon-double-angle-right"></i>管理员列表</a>
									</li>
								</ul>
							</li>
						</shiro:hasPermission>
					</ul>
					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
					<script type="text/javascript">
						try {
							ace.settings.check('sidebar', 'collapsed')
						} catch(e) {}
					</script>
				</div>
				<div class="main-content">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch(e) {}
					</script>
					<div class="breadcrumbs" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="index.jsp">首页</a>
							</li>
							<li class="active"><span class="Current_page iframeurl"></span></li>
							<li class="active" id="parentIframe"><span class="parentIframe iframeurl"></span></li>
							<li class="active" id="parentIfour"><span class="parentIfour iframeurl"></span></li>
						</ul>
					</div>

					<!-- iframe注释 -->
					<iframe id="iframe" style="border:0; width:100%; background-color:#FFF;" name="iframe" frameborder="0" src="${ctx}/sys/home">  </iframe>

					<!-- /.page-content -->
				</div>
				<!-- /.main-content -->
			</div>
			<!-- /.main-container-inner -->

		</div>
		<!--底部样式-->

		<div class="footer_style" id="footerstyle">
			<p class="l_f">版权所有：湖南城市学院校友会</p>
			<p class="r_f">地址：湖南省益阳市银城南路湖南城市学院办公楼323室 技术支持：刘佳乐、陈立帆</p>
		</div>
		<!--修改密码样式-->
		<div class="change_Pass_style" id="change_Pass">
			<ul class="xg_style">
				<li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="原密码" type="password" class="" id="password"></li>
				<li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="新密码" type="password" class="" id="Nes_pas"></li>
				<li><label class="label_name">确认密码</label><input name="再次确认密码" type="password" class="" id="c_mew_pas"></li>

			</ul>
		</div>
		<!-- /.main-container -->
		<!-- basic scripts -->

	</body>

</html>