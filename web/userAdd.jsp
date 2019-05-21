<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/13
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户添加界面</title>
    <link href="css/demo.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <!--Framework-->
    <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <!--End Framework-->
    <script src="js/jquery.ffform.js" type="text/javascript"></script>
</head>
<body>

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
</body>
</html>
