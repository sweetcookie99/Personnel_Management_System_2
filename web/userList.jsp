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
    body,table{
        font-size:12px;
    }
    table{
        table-layout:fixed;
        empty-cells:show;
        border-collapse: collapse;
        margin:0 auto;
    }
    td{
        height:20px;
    }
    h1,h2,h3{
        font-size:12px;
        margin:0;
        padding:0;
    }

    .title { background: #FFF; border: 1px solid #9DB3C5; padding: 1px; width:90%;margin:20px auto; }
    .title h1 { line-height: 31px; text-align:center;  background: #2F589C url(th_bg2.gif); background-repeat: repeat-x; background-position: 0 0; color: #FFF; }
    .title th, .title td { border: 1px solid #CAD9EA; padding: 5px; }


    /*这个是借鉴一个论坛的样式*/
    table.t1{
        border:1px solid #cad9ea;
        color:#666;
    }
    table.t1 th {
        background-image: url(th_bg1.gif);
        background-repeat::repeat-x;
        height:30px;
    }
    table.t1 td,table.t1 th{
        border:1px solid #cad9ea;
        padding:0 1em 0;
    }
    table.t1 tr.a1{
        background-color:#f5fafe;
    }
    .button {
        display: inline-block;
        padding: 10px 15px;
        font-size: 24px;
        cursor: pointer;
        text-align: center;
        text-decoration: none;
        outline: none;
        color: #fff;
        background-color: #4CAF50;
        border: none;
        border-radius: 15px;
        box-shadow: 0 9px #999;
    }

    .button:hover {background-color: #3e8e41}

    .button:active {
        background-color: #3e8e41;
        box-shadow: 0 5px #666;
        transform: translateY(4px);
    }
    ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        border: 1px solid #e7e7e7;
        background-color: #f3f3f3;
    }

    li {
        float: left;
    }

    li a {
        display: block;
        color: #666;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    li a:hover:not(.active) {
        background-color: #ddd;
    }

    li a.active {
        color: white;
        background-color: #4CAF50;
    }
</style>
<head>
    <title>用户信息</title>
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
<body >

<%--导航栏--%>
<ul>
    <li><a  href="welcome.jsp">主页</a></li>
    <li><a href="DeptServlet?type=gotoList">部门信息</a></li>
    <li><a href="JobServlet?type=gotoList">职位信息</a></li>
    <li><a href="EmployeeServlet?type=gotoList">员工信息</a></li>
    <li><a href="#about">公告信息</a></li>
    <li><a class="active" href="#">管理员用户信息</a></li>
</ul>
<%--表的正式部分--%>
<h1 align="center" >管理员用户信息</h1>
<table width="90%" id="mytab"  border="1" class="t1">
    <thead>
    <th width="4">序号</th>
    <th width="10%">Id</th>
    <th width="15%">登录名</th>
    <th width="15%">用户名</th>
    <th width="15%">注册日期</th>
    <th width="15%">密码</th>
    <th width="8%">删除</th>
    <th width="8%">修改</th>
    </thead>
    <%
        List<User> userList = (List<User>) request.getAttribute("userList");
        for (int i = 0;i<userList.size();i++){
            User user = userList.get(i);
            if(i%2==0){
            %>
    <tr class="a1">
        <td class="SortCLASS"></td>
        <th><%=user.getId()%></th>
        <th><%=user.getLoginname()%></th>
        <th><%=user.getUsername()%></th>
        <th><%=user.getCreate_date()%></th>
        <th><%=user.getPassword()%></th>
        <th><a onclick="fn()" href="UserServlet?type=delete&id=<%=user.getId()%>">删除</a></th>
        <th><a href="UserServlet?type=gotoUpdate&id=<%=user.getId()%>">修改</a></th>
    </tr>
    <%
            }
            if (i%2!=0){%>
    <tr>
        <td class="SortCLASS"></td>
        <th><%=user.getId()%></th>
        <th><%=user.getLoginname()%></th>
        <th><%=user.getUsername()%></th>
        <th><%=user.getCreate_date()%></th>
        <th><%=user.getPassword()%></th>
        <th><a onclick="fn()" href="UserServlet?type=delete&id=<%=user.getId()%>">删除</a></th>
        <th><a href="UserServlet?type=gotoUpdate&id=<%=user.getId()%>">修改</a></th>
    </tr>
    <%
            }
        }
    %>
</table>
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
</body>
</html>
