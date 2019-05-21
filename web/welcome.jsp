<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/11
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>

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
        font-size:40px;
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
    <title>人事管理系统</title>
</head>
<body background="image/timg.jpg">
<ul>
    <li><a class="active" href="#home">主页</a></li>
    <li><a href="DeptServlet?type=gotoList">部门信息</a></li>
    <li><a href="JobServlet?type=gotoList">职位信息</a></li>
    <li><a href="EmployeeServlet?type=gotoList">员工信息</a></li>
    <li><a href="#about">公告信息</a></li>
    <li><a href="UserServlet?type=gotoList">管理员用户信息</a></li>
      LTWO人事管理系统
</ul>
<h1 align="center">人事管理系统主界面</h1>
<font size="5" >项目简介：人事管理系统：由 用户管理、部门管理、职位管理、员工管理、公告管理、五个个模块构成,
    实现对小型公司的人事进行最基本的管理。由tomcat服务器+servlet知识+jsp知识完成第一版的构建。
    页面前端界面元素，从百度拔取的模块，组合而成</font></br>
<font size="4" ><strong>实现功能:</br>
    用户管理的功能包括：添加用户，查询用户，可以查询所有用户或根据用户名查询，删除用户，修改用户。</br>
    部门管理的功能包括：添加部门，查询部门，可以查询所有部门或根据部门名称进行查询，删除部门，修改部门</br>
    职位管理的功能包括：添加职位，查询职位，可以查询所有职位或根据职位名称进行查询，删除职位，修改职位</br>
    员工管理的功能包括：添加员工，查询员工，可以查询所有员工或根据员工姓名查询，删除员工，修改员工。</br>
    公告管理的功能包括：添加公告，查询公告，可以查询所有公告或根据公告编号查询，删除公告，修改公告。</strong></font></br>
<font size="6">项目的数据库设计还有很大缺陷，以及查询功能比较单一。各方面都存在问题。后续将通过不断的更新版本，将会对系统的功能进行优化。</font>
<form action="loginForm.jsp">
    <div style="text-align:center">
        <button  type="submit" class="button">退出登录</button>
    </div>
</form>
</body>
</html>
