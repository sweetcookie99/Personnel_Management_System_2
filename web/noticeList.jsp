<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/8
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>

<%@ page import="com.li.entil.Notice" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    tbody {
        counter-reset:sectioncounter;
    }
    .SortCLASS:before {
        content:counter(sectioncounter);
        counter-increment:sectioncounter;

    }
</style>
<head>
    <title>用户信息</title>
    <script src="static/layui-v2.5.4/layui/layui.js"></script>
    <link rel="stylesheet" href="static/layui-v2.5.4/layui/css/layui.css"/>
    <link rel="stylesheet" href="static/layui-v2.5.4/layui/css/layui.mobile.css"/>
</head>
<script>
    function confirmOper(){
        window.onmessage('真的要删除该用户吗');
    }
    function fn(){
        if(confirm("确定删除吗")){
            location.href="";
        }
    }
    function confirmAct()
    {
        if(confirm('确定要执行此操作吗?'))
        {
            return true;
        }
        return false;
    }
</script>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">LTWO人事管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">用户查询</a></li>
            <li class="layui-nav-item"><a href="">公告发布</a></li>
            <li class="layui-nav-item"><a href="">文件上传</a></li>
            <li class="layui-nav-item">

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
                    <%

                        String uname = (String) session.getAttribute("uname");
                    %>
                    欢迎：<font color="#FF0000"><%=uname%></font>&nbsp;登录
                </a>
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
                    <a  href="welcome.jsp">所有信息</a>
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
        <div class="layui-row">
            <div class="layui-col-md10">
                <h1 align="center" >公告信息</h1>
            </div>
            <div class="layui-col-md2">
                <a href="noticeAdd.jsp" class="layui-btn layui-btn-normal">发布新公告</a>
            </div>
        </div>
        <table class="layui-table">
            <thead>
            <th >序号</th>
            <th >编号</th>
            <th >标题</th>
            <th >正文</th>
            <th>发布日期</th>
            <th>发布人</th>
            <th >删除</th>
            <th >修改</th>
            </thead>
            <%
                List<Notice> notices = (List<Notice>) request.getAttribute("allNotice");
                for (int i = 0;i<notices.size();i++){
                    Notice notice = notices.get(i);
            %>
            <tr class="a1">
                <td class="SortCLASS"></td>
                <th><%=notice.getId()%></th>
                <th><%=notice.getTitle()%></th>
                <th><%=notice.getContext()%></th>
                <th><%=notice.getCreateDate()%></th>
                <th><%=notice.getUserId()%></th>
                <th><a   href="?type=delete&id=<%=notice.getId()%>">
                    <i class="layui-icon layui-icon-delete" style="font-size: 25px"></i></a></th>
                <th><a href="NoticeServlet?type=gotoUpdate&id=<%=notice.getId()%>">
                    <i class="layui-icon layui-icon-edit" style="font-size: 25px;"></i>
                </a></th>
            <%
                    }
            %>

        </table>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © LTWO.com - 底部固定区域
    </div>
</div>
</body>
</html>
