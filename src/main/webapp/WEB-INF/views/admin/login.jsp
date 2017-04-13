<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/adminTaglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登陆</title>
    <%@ include file="/WEB-INF/views/include/adminHead.jsp" %>
    <script language="JavaScript">
        if (window != top)
            top.location.href = location.href;
    </script>
</head>

<body class="login-layout">
<div class="logintop">
    <span>欢迎使用校友信息管理系统</span>
    <ul>
        <li><a href="#">返回首页</a></li>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>
<div class="loginbody">
    <div class="login-container">
        <div class="center">
            <h1>
                <i class="icon-leaf green"></i>
                <span class="orange">湖南城市学院</span>
                <span class="white">校友信息管理系统</span>
            </h1>
            <h4 class="white">Alumni Information Management System</h4>
        </div>

        <div class="space-6"></div>

        <div class="position-relative">
            <div id="login-box" class="login-box widget-box no-border visible">
                <div class="widget-body">
                    <div class="widget-main">
                        <h4 class="header blue lighter bigger">
                            <i class="icon-coffee green"></i>
                            用户登陆
                            <span>${message}</span>
                        </h4>

                        <div class="login_icon"><img src="${ctxStatic}/images/login.png"/></div>


                        <form class="" action="${ctx}/login" method="post">
                            <fieldset>
                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="登录名"
                                                                   name="username">
															<i class="icon-user"></i>
														</span>
                                </label>

                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="密码"
                                                                   name="password">
															<i class="icon-lock"></i>
														</span>
                                </label>

                                <div class="space"></div>

                                <div class="clearfix">
                                    <label class="inline">
                                        <input type="checkbox" class="ace"
                                               name="rememberMe" ${rememberMe ? 'check' : ''}>
                                        <span class="lbl">保存密码</span>
                                    </label>

                                    <input class="width-35 pull-right btn btn-sm btn-primary" type="submit" value="登 录">
                                </div>

                                <div class="space-4"></div>
                            </fieldset>
                        </form>

                        <div class="social-or-login center">
                            <span class="bigger-110">通知</span>
                        </div>

                        <div class="social-login center">
                            本网站系统不再对IE8以下浏览器支持，请见谅。
                        </div>
                    </div><!-- /widget-main -->

                    <div class="toolbar clearfix">
                    </div>
                </div><!-- /widget-body -->
            </div><!-- /login-box -->
        </div><!-- /position-relative -->
    </div>
</div>
<div class="loginbm">版权所有 2016 <a href="">湖南城市学院版权所有</a></div>
</body>
</html>