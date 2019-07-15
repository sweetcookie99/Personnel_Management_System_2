<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/2
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>职员添加界面</title>
    <link href="css/demo.css" rel="stylesheet" type="text/css">
    <script language="javascript" type="text/javascript" src="static/layui-v2.5.4/layui/layui.js"></script>
    <script language="javascript" type="text/javascript" src="static/layui-v2.5.4/layui/layui.all.js"></script>
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
                <a href="javascript:">其它系统</a>
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
                <li class="layui-nav-item">

                </li>
                <li class="layui-nav-item"><a href="#">百度</a></li>
                <li class="layui-nav-item"><a href="">谷歌</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->

            <div class="container" style="border-bottom: 0;">
                <h1>
                    <span>请添加管理员用户信息</span>
                </h1>
            </div>
            <div class="container">
                <form class="layui-form" method="post" action="EmployeeServlet?type=gotoAdd"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input type="text" name="name" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择部门ID</label>
                        <div class="layui-input-block">
                            <select name="deptId" lay-filter="aihao">
                                <option value="0">请选择</option>
                                <option value="CS">CS</option>
                                <option value="CW">CW</option>
                                <option value="PP">PP</option>
                                <option value="PLZY">PLZY</option>
                                <option value="SJ">SJ</option>
                                <option value="WLGG">WLGG</option>
                                <option value="XS">XS</option>
                                <option value="XXCB">XXCB</option>
                                <option value="XZ">XZ</option>
                                <option value="YF">YF</option>
                                <option value="YXCH">YXCH</option>
                                <option value="ZX">ZX</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择职位ID</label>
                        <div class="layui-input-block">
                            <select name="jobId" lay-filter="aihao">
                                <option value="0">请选择</option>
                                <option value="CS01">CS01</option>
                                <option value="CS02">CS02</option>
                                <option value="CS03">CS03</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">学历</label>
                        <div class="layui-input-block">
                            <select name="education" lay-filter="aihao">
                                <option value="0">请选择</option>
                                <option value="专科">专科</option>
                                <option value="本科">本科</option>
                                <option value="研究生">研究生</option>
                                <option value="博士">博士</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">请选择性别</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="男" title="男">
                            <input type="radio" name="sex" value="女" title="女" checked>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">电话</label>
                        <div class="layui-input-block">
                            <input type="text" name="number" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input type="text" name="email" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">身份证号</label>
                        <div class="layui-input-block">
                            <input type="text" name="card" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">请输入创建时间</label>
                        <div class="layui-input-block">
                            <input type="text" name="creatTime" placeholder="创建时间" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">请填写兴趣爱好</label>
                        <div class="layui-input-block">
                            <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" type="submit">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                    <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
                </form>

                <div id="validation">
                </div>
            </div>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © LTWO.com - 底部固定区域
    </div>
</div>
<script src="static/layui-v2.5.4/layui/layui.js"></script>
<script>
    layui.use('form', function(){
        var form = layui.form;
        //各种基于事件的操作，下面会有进一步介绍
    });
</script>
</body>
</html>
