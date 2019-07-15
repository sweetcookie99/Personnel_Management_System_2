<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/13
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户添加界面</title>
    <link href="css/demo.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <!--Framework-->
    <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <!--End Framework-->
    <script src="js/jquery.ffform.js" type="text/javascript"></script>
    <script src="static/layui-v2.5.4/layui/layui.js"></script>
    <link rel="stylesheet" href="static/layui-v2.5.4/layui/css/layui.css"/>
    <link rel="stylesheet" href="static/layui-v2.5.4/layui/css/layui.mobile.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">LTWO人事管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">用户查询</a></li>
            <li class="layui-nav-item"><a href="">公告发布</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    User
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="welcome.jsp">所有信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="DeptServlet?type=gotoList">部门信息</a></dd>
                        <dd><a href="JobServlet?type=gotoList">职位信息</a></dd>
                        <dd><a href="EmployeeServlet?type=gotoList">员工信息</a></dd>
                        <dd><a href="UserServlet?type=gotoList">管理员信息</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <section id="getintouch" class="fadeIn animated">
            <div class="container" style="border-bottom: 0;">
                <h1>
                    <span>请添加管理员用户信息</span>
                </h1>
            </div>
            <div class="container">
                <form class="contact" action="UserServlet?type=gotoInsert" method="post" id="form">
                    <div class="row clearfix">
                        <div class="lbl">
                            <label for="name">
                                Id</label>
                        </div>
                        <div class="ctrl">
                            <input type="text" id="name" name="id" data-required="true" data-validation="text"
                                   data-msg="Invalid Name" placeholder="请输入Id">
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="lbl">
                            <label for="email">
                                LoginName</label>
                        </div>
                        <div class="ctrl">
                            <input type="text" id="email" name="loginName" data-required="true" data-validation="email"
                                   data-msg="Invalid E-Mail" placeholder="请输入登录名">
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="lbl">
                            <label for="email">
                                UserName</label>
                        </div>
                        <div class="ctrl">
                            <input type="text" id="phone" name="userName" data-required="true" data-validation="custom"
                                   data-msg="Invalid Phone #" placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="lbl">
                            <label for="subject">
                                CreatTime</label>
                        </div>
                        <div class="ctrl">
                            <input type="text" name="creatTime" id="subject" placeholder="请输入注册时间">
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="lbl">
                            <label for="subject">
                                Password</label>
                        </div>
                        <div class="ctrl">
                            <input type="text" name="password"  placeholder="请输入用户名密码">
                        </div>
                    </div>
                    <div class="row  clearfix">
                        <div class="span10 offset2">
                            <input type="submit" name="submit" id="submit" class="submit" value="提交">
                            <input type="reset" name="submit" class="submit" value="重置">

                            <form action="UserServlet?type=gotoList">
                                <input type="submit" name="submit" class="submit" value="取消">
                            </form>
                        </div>
                    </div>
                </form>
                <div id="validation">
                </div>
            </div>
        </section>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © LTWO.com - 底部固定区域
    </div>
</div>
</body>

</html>
