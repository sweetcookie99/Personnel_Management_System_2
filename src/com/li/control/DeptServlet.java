package com.li.control;

import com.li.entil.Dept;
import com.li.service.DeptService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeptServlet", urlPatterns = "/DeptServlet")
public class DeptServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        DeptService deptService = new DeptService();
        String type = request.getParameter("type");
        /**
         * 前往显示界面
         */
        if (type.equals("gotoList")){
            List<Dept> allDept = deptService.findAllDept();
            request.setAttribute("allDept",allDept);
            request.getRequestDispatcher("deptList.jsp").forward(request,response);
        }
        //处理删除请求
        if(type.equals("gotodelete")){
            String id =request.getParameter("id");
            boolean b = deptService.deleteDeptById(id);
            if (b){
                type = "gotoList";

            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        doPost(request, response);
    }
}