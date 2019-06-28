package com.li.control;

import com.li.entil.Employee;
import com.li.service.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String type =request.getParameter("type");
        EmployeeService employeeService = new EmployeeService();
        if (type.equals("gotoList")){
            int pageNum = 1;
            if (request.getParameter("pageNum")!=null){
                pageNum = Integer.parseInt(request.getParameter("pageNum"));
            }
            System.out.println(pageNum);
            List<Employee> allEmployee = employeeService.findAllEmployee();
            request.setAttribute("pageNum",pageNum);
            request.setAttribute("allEmployee",allEmployee);
            request.getRequestDispatcher("employeeList.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        doPost(request, response);
    }
}