<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/adminTaglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>系统首页</title>
        <%@ include file="/WEB-INF/views/include/adminHead.jsp" %>
	</head>
	<style>
		.shouye_top_left {
			float: left;
			width: 100%;
			position: relative;
			min-height: 320px;
		}
		
		.shouye_top_left .left_top {
			background: #f5f5f5;
			background-size: cover;
			min-height: 175px;
		}
		
		.shouye_top_left .left_buttom {
			padding: 1.5em 2em;
			position: relative;
			background: #fff;
		}
		
		.shouye_top_left .left_buttom .malorum-pro {
			width: 90px;
			height: 90px;
			display: inline-block;
			position: absolute;
			top: -60px;
			left: calc(100%/2 - 45px);
			border: 2px solid #ccc;
			border-radius: 63px;
			-webkit-border-radius: 63px;
            overflow: hidden;
		}

        .shouye_top_left .left_buttom .malorum-pro img{
            width: 90px;
            height: 90px;
        }
		
		.shouye_top_left .left_buttom h1 {
			margin-top: 20px;
			font-size: 1.5em;
			color: #337AB7;
			text-align: center;
			margin-bottom: 20px;
		}
		
		.shouye_top_left .left_buttom p {
			font-size: 1em;
			color: #000;
			line-height: 120%;
			text-align: center;
			margin: 0 auto;
		}
	</style>

	<body>
		<div class="page-content clearfix">
			<div class="alert alert-block alert-success">
				<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
				<i class="icon-ok green"></i>欢迎使用<strong class="green">湖南城市学院校友信息管理系统<small>(v1.2)</small></strong>,你本次登陆时间为${nowDate}，登陆IP:${loginIp}.
			</div>
			<div class="clearfix">
				<div class="t_Record">
						<div class="shouye_top_left">
							<div class="left_top"></div>
							<div class="left_buttom">
								<h1>亲爱的${xyh:getUser().name}</h1>
								<p>欢迎使用校友管理系统</p>
								<span class="malorum-pro"><img src="${ctxStatic}/images/${xyh:getUser().sex eq '0' ? 'alumni.jpg' : 'alumna.jpg'}"></span>
							</div>
						</div>
				</div>
				<div class="news_style">
					<div class="title_name">最新消息</div>
					<ul class="list">
						<li><i class="icon-bell red"></i>
							<a href="#">后台系统找那个是开通了。</a>
						</li>
						<li><i class="icon-bell red"></i>
							<a href="#">6月共处理订单3451比，作废为...</a>
						</li>
						<li><i class="icon-bell red"></i>
							<a href="#">后台系统找那个是开通了。</a>
						</li>
						<li><i class="icon-bell red"></i>
							<a href="#">后台系统找那个是开通了。</a>
						</li>
						<li><i class="icon-bell red"></i>
							<a href="#">后台系统找那个是开通了。</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="state-overview clearfix">
				<div class="col-lg-3 col-sm-6">
					<section class="panel">
							<div class="symbol terques">
								<i class="icon-user"></i>
							</div>
							<div class="value">
								<h1>34522</h1>
								<p>系统用户</p>
							</div>
					</section>
				</div>
				<div class="col-lg-3 col-sm-6">
					<section class="panel">
						<div class="symbol red">
							<i class="icon-tags"></i>
						</div>
						<div class="value">
							<h1>140</h1>
							<p>校友活动</p>
						</div>
					</section>
				</div>
				<div class="col-lg-3 col-sm-6">
					<section class="panel">
						<div class="symbol yellow">
							<i class="icon-user"></i>
						</div>
						<div class="value">
							<h1>345</h1>
							<p>在校学生</p>
						</div>
					</section>
				</div>
				<div class="col-lg-3 col-sm-6">
					<section class="panel">
						<div class="symbol blue">
							<i class="icon-user"></i>
						</div>
						<div class="value">
							<h1>34,500</h1>
							<p>毕业校友</p>
						</div>
					</section>
				</div>
			</div>

			<script type="text/javascript">
				$(document).ready(function() {

					$(".t_Record").width($(window).width() - 320);
					//当文档窗口发生改变时 触发  
					$(window).resize(function() {
						$(".t_Record").width($(window).width() - 320);
					});
				});
			</script>
		</div>
	</body>

</html>