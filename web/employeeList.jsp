<%@ page import="com.li.entil.Employee" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/17
  Time: 0:39
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
    function confirmAct()
    {
        if(confirm('确定要执行此操作吗?'))
        {
            return tableToExcel('item','data') ;

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

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">LTWO人事管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">用户查询</a></li>
            <li class="layui-nav-item"><a href="">文件上传</a></li>
            <li class="layui-nav-item">

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
        <div class="layui-row">
            <div class="layui-col-md10">
                <h1 align="center" >员工用户信息</h1>
            </div>
            <div class="layui-col-md2">
                <a href="employeeAdd.jsp" class="layui-btn layui-btn-normal">添加职员</a>
            </div>
        </div>
        <button type="button" onclick="return confirmAct();tableToExcel('item','data')">导出</button>
        <table  class="layui-table" id="item">
            <thead>
            <th >序号</th>
            <th >员工Id</th>
            <th >部门编号</th>
            <th >职位编号</th>
            <th >姓名</th>
            <th >性别</th>
            <th >手机号码</th>
            <th >邮箱</th>
            <th >学历</th>
            <th >身份证号码</th>
            <th >删除</th>
            <th >编辑</th>
            </thead>
            <%
                List<Employee> userList = (List<Employee>) request.getAttribute("allEmployee");
                int pageSize = 8;
                int pageNum = (int) request.getAttribute("pageNum");
                int total = userList.size();
                int pageCount = (total-1)/pageSize+1;
                int n=pageNum*pageSize;
                if (n>total)
                    n=total;
                for (int i = pageSize*(pageNum-1);i<n;i++){
                    Employee user = userList.get(i);

            %>
            <tr class="a1">
                <td class="SortCLASS"></td>
                <th><%=user.getId()%></th>
                <th><%=user.getDeptId()%></th>
                <th><%=user.getJobId()%></th>
                <th><%=user.getName()%></th>
                <th><%=user.getSex()%></th>
                <th><%=user.getPhone()%></th>
                <th><%=user.getEmail()%></th>
                <th><%=user.getEducation()%></th>
                <th><%=user.getCardId()%></th>
                <th><a onclick="return confirmAct();" href="EmployeeServlet?type=gotodelete&id=<%=user.getId()%>">
                    <i class="layui-icon layui-icon-delete" style="font-size: 25px"></i>
                </a></th>
                <th><a href="UserServlet?type=gotoUpdate&id=<%=user.getId()%>">
                    <i class="layui-icon layui-icon-edit" style="font-size: 25px"></i>
                </a></th>
            </tr>
            <%
                }%>

        </table>
        <div class="layui-row">
        <div  class="layui-col-md4 layui-col-md-offset7">
            当前页：<%=pageNum%>
             <%
                 if (pageNum!=1){
                     %>
                      <a href="EmployeeServlet?type=gotoList&&pageNum=<%=pageNum-1%>"><button class="layui-btn layui-btn-sm layui-btn-primary">上一页</button></a>
                 <%}
            for (int i=1;i<pageCount+1;i++)
            {
        %>
            <a href="EmployeeServlet?type=gotoList&&pageNum=<%=i%>"><button class="layui-btn layui-btn-sm layui-btn-primary"><%=i%></button></a>
            <%
                }
            if (pageNum!=pageCount){
                %>
            <a href="EmployeeServlet?type=gotoList&&pageNum=<%=pageNum+1%>"><button class="layui-btn layui-btn-sm layui-btn-primary">下一页</button></a>
            <%
            }
            %>
        </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © LTWO.com -
    </div>
</div>
</body>
</html>