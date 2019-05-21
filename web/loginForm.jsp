<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/11
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<div class="htmleaf-container">
    <div class="wrapper">
        <div class="container">
            <h1>Welcome</h1>

            <form class="form" action="loginServlet" method="post">
                <input type="text" placeholder="Username" name="loginname">
                <input type="password" placeholder="Password" name="password">
                <input type="submit" id="login-button" value="Login">
            </form>
            <%
                String erro = (String) request.getAttribute("erro");
                if (erro!=null){
            %><h2 align="center"><%=erro%></h2>
            <%
                }
            %>
        </div>
        </div>
</div>

<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script>
    $('#login-button').click(function (event) {
        $('form').fadeOut(500);
        $('.wrapper').addClass('form-success');
    });
</script>
        <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
            <h1>人事管理系统</h1>
        </div>
</body>
</html>
