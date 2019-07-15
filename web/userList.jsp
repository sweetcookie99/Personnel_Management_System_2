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
    function base64 (content) {
        return window.btoa(unescape(encodeURIComponent(content)));
    }
    /*
    *@tableId: table的Id
    *@fileName: 要生成excel文件的名字（不包括后缀，可随意填写）
    */
    function tableToExcel(tableID,fileName){
        var table = document.getElementById(tableID);
        var excelContent = table.innerHTML;
        var excelFile = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:x='urn:schemas-microsoft-com:office:excel' xmlns='http://www.w3.org/TR/REC-html40'>";
        excelFile += "<head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head>";
        excelFile += "<body><table>";
        excelFile += excelContent;
        excelFile += "</table></body>";
        excelFile += "</html>";
        var link = "data:application/vnd.ms-excel;base64," + base64(excelFile);
        var a = document.createElement("a");
        a.download = fileName+".xls";
        a.href = link;
        a.click();
    }
</script>
<%--<script type="text/javascript">
    function method1(tableid) {//整个表格拷贝到EXCEL中
        var curTbl = document.getElementByIdx_x(tableid);
        var oXL = new ActiveXObject("Excel.Application");
        //创建AX对象excel
        var oWB = oXL.Workbooks.Add();
        //获取workbook对象
        var oSheet = oWB.ActiveSheet;
        //激活当前sheet
        var sel = document.body.createTextRange();
        sel.moveToElementText(curTbl);
        //把表格中的内容移到TextRange中
        sel.select();
        //全选TextRange中内容
        sel.execCommand("Copy");
        //复制TextRange中内容
        oSheet.Paste();
        //粘贴到活动的EXCEL中
        oXL.Visible = true;
        //设置excel可见属性
    }
</script>--%>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">LTWO人事管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">用户查询</a></li>
            <li class="layui-nav-item"><a href="">公告发布</a></li>
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
               <h1 align="center" >管理员用户信息</h1>
            </div>
            <div class="layui-col-md2">
            <a href="userAdd.jsp" class="layui-btn layui-btn-normal">添加管理员</a>
            </div>
        </div>
        <button type="button" onclick="tableToExcel('item','data')">导出</button>
        <table class="layui-table" id="item">

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
                <th><a onclick="return confirmAct();"  href="UserServlet?type=delete&id=<%=user.getId()%>">
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
                <th><a onclick="return confirmAct();" href="UserServlet?type=delete&id=<%=user.getId()%>">
                    <i class="layui-icon layui-icon-delete" style="font-size: 25px"></i></a></th>
                <th><a href="UserServlet?type=gotoUpdate&id=<%=user.getId()%>"><i class="layui-icon layui-icon-edit" style="font-size: 25px;"></i></a></th>
            </tr>
            <%
                    }
                }
            %>
        </table>
     <%--   <a href="showUser.jsp">点击导出通讯录</a>--%>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © LTWO.com - 底部固定区域
    </div>
</div>
</body>
</html>
