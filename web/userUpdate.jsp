<%@ page import="com.li.entil.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/12
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>

    body,table{
        font-size:20px;
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
    <title>Title</title>
</head>
<body background="image/timg.jpg">
<%
    User user = (User) request.getAttribute("user");
%>
<form action="UserServlet?type=update" method="post">
    <table width="40%"   border="3" class="t1">
        <tr>
            <th>管理员用户信息修改</th>
        </tr>
        <tr>
            <th>Id:<input name="id" readonly value="<%=user.getId()%>" type="text"></th>
        </tr>
        <tr>
            <th>登录名:<input name="loginName" value="<%=user.getLoginname()%>" type="text"></th>
        </tr>
        <tr>
            <th>用户名:<input name="userName" value="<%=user.getUsername()%>" type="text"></th>
        </tr>
        <tr>
            <th>创建时间:<input name="creatTime" readonly value="<%=user.getCreate_date()%>" type="text"></th>
        </tr>
        <tr>
            <th>密码:<input name="password" value="<%=user.getPassword()%>" type="text"></th>
        </tr>
        <tr>
            <td><input type="submit" value="提交"><input type="reset" value="重置"></td>
        </tr>
    </table>
</form>

</body>
</html>
