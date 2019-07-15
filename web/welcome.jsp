<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/11
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <%pageContext.setAttribute("APP_PATH",request.getContextPath());%>
    <title>主界面</title>
    <script src="static/layui-v2.5.4/layui/layui.js"></script>
    <link rel="stylesheet" href="static/layui-v2.5.4/layui/css/layui.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">LTWO人事管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="employeeSelect.jsp">用户查询</a></li>
            <li class="layui-nav-item"><a href="NoticeServlet?type=gotoList">公告发布</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">文件上传</a>

            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                   <%

                       String uname = (String) session.getAttribute("uname");
                   %>
                    欢迎：<font color="#FF0000"><%=uname%></font>&nbsp;登录
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="loginForm.jsp">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
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
                <li class="layui-nav-item">

                </li>
                <li class="layui-nav-item"><a href="">百度</a></li>
                <li class="layui-nav-item"><a href="">谷歌</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>常规时间线</legend>
        </fieldset>
        <ul class="layui-timeline">
            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis"></i>
                <div class="layui-timeline-content layui-text">
                    <h3 class="layui-timeline-title">7月3日</h3>
                    <p>
                        7月11LTWO人事管理系统的一切准备工作似乎都已到位一触即发。
                        <br>不枉近半个月日日夜夜与之为伴。因小而大。
                        <br>无论它能过课设，抑或如何支撑？<i class="layui-icon"></i>
                    </p>
                </div>
            </li>
            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis"></i>
                <div class="layui-timeline-content layui-text">
                    <h3 class="layui-timeline-title">6月20日</h3>
                    <p>杜甫的思想核心是儒家的仁政思想，他有<em>“致君尧舜上，再使风俗淳”</em>的宏伟抱负。其名篇有：</p>
                    <ul>
                        <li>《登高》</li>
                        <li>《茅屋为秋风所破歌》</li>

                    </ul>
                </div>
            </li>
            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis"></i>
                <div class="layui-timeline-content layui-text">
                    <h3 class="layui-timeline-title">6月15日</h3>
                    <p>

                        <br>常常在想，尽管对这个国家有这样那样的抱怨，但我们的确生在了最好的时代
                        <br>铭记、感恩
                        <br>所有
                        <br>我们在大学时光付出自己的努力
                    </p>
                </div>
            </li>
            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis"></i>
                <div class="layui-timeline-content layui-text">
                    <div class="layui-timeline-title">过去</div>
                </div>
            </li>
        </ul>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>简约时间线：大事记</legend>
        </fieldset>
        <ul class="layui-timeline">
            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis"></i>
                <div class="layui-timeline-content layui-text">
                    <div class="layui-timeline-title">6月30，第三版肝成功。后台采用java的ssm框架前端改用BootStrap。但功能还是非常单一。<br>
                    对于一个真正的系统差距还是非常之大。 后续将会不断改造</div>
                </div>
            </li>
            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis"></i>
                <div class="layui-timeline-content layui-text">
                    <div class="layui-timeline-title">6月10号，LTWO对前端界面进行替换，使用了国内的layui前端框架.同时升级为第二代</div>
                </div>
            </li>
            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis"></i>
                <div class="layui-timeline-content layui-text">
                    <div class="layui-timeline-title">5月28号，LTWO完成第一版基于mvc的设计模式由简单的servlet+jsp完成，并上传至github</div>
                </div>
            </li>
            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis"></i>
                <div class="layui-timeline-content layui-text">
                    <div class="layui-timeline-title">5月20号，LTWO人事管理demo完成测试版，简单功能实现</div>
                </div>
            </li>
            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis"></i>
                <div class="layui-timeline-content layui-text">
                    <div class="layui-timeline-title">5月15号，完成对数据库 和对整个demo的构思</div>
                </div>
            </li>
            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis"></i>
                <div class="layui-timeline-content layui-text">
                    <div class="layui-timeline-title">5月10，LTWO人事管理demo 开始进行设想</div>
                </div>
            </li>
            <li class="layui-timeline-item">
                <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
                <div class="layui-timeline-content layui-text">
                    <div class="layui-timeline-title">更久前，轮子时代。学习java，数据库，web的开发，后台ssm框架等</div>
                </div>
            </li>
        </ul>


        <script src="//res.layui.com/layui/dist/layui.js" charset="utf-8"></script>
        <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
        <script>
        </script>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
</body>
</html>
