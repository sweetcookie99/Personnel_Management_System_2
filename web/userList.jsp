<%@ page import="java.util.List" %>
<%@ page import="com.li.entil.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/12
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
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
        }else{
            location.href="";
        }
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
                <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="">发布商品</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-row">
            <div class="layui-col-md10">
               <h1 align="center" >管理员用户信息</h1>
            </div>
            <div class="layui-col-md2">
            <a href="userAdd.jsp" class="layui-btn layui-btn-primary">添加管理员</a>
            </div>
        </div>


        <table class="layui-table">
            <thead>
            <th >序号</th>
            <th >登录名</th>
            <th >用户名</th>
            <th>注册日期</th>
            <th>密码</th>
            <th >删除</th>
            <th >修改</th>
            </thead>
            <%
                List<User> userList = (List<User>) request.getAttribute("userList");
                for (int i = 0;i<userList.size();i++){
                    User user = userList.get(i);
                    if(i%2==0){
            %>
            <tr class="a1">
                <td class="SortCLASS"></td>
                <th><%=user.getLoginname()%></th>
                <th><%=user.getUsername()%></th>
                <th><%=user.getCreate_date()%></th>
                <th><%=user.getPassword()%></th>
                <th><a onclick="fn()"  href="UserServlet?type=delete&id=<%=user.getId()%>">
                    <i class="layui-icon layui-icon-delete" style="font-size: 25px"></i></a></th>
                <th><a href="UserServlet?type=gotoUpdate&id=<%=user.getId()%>">
                    <i class="layui-icon layui-icon-edit" style="font-size: 25px;"></i>
                </a></th>
            </tr>
            <%
                }
                if (i%2!=0){%>
            <tr>
                <td class="SortCLASS"></td>
                <th><%=user.getLoginname()%></th>
                <th><%=user.getUsername()%></th>
                <th><%=user.getCreate_date()%></th>
                <th><%=user.getPassword()%></th>
                <th><a onclick="fn()" href="UserServlet?type=delete&id=<%=user.getId()%>">
                    <i class="layui-icon layui-icon-delete" style="font-size: 25px"></i></a></th>
                <th><a href="UserServlet?type=gotoUpdate&id=<%=user.getId()%>"><i class="layui-icon layui-icon-edit" style="font-size: 25px;"></i></a></th>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
</body>
<%--导航栏--%>

<%--表的正式部分--%>
<%--
</br>
<form action="userAdd.jsp">
    <div style="text-align: center">
    <button  type="submit" class="button">添加管理员用户</button>
    </div>
</form>
<form action="welcome.jsp">
    <div style="text-align: right">
        <button  type="submit" class="button">返回主界面</button>
    </div>
</form>
</body>--%>
</html>
