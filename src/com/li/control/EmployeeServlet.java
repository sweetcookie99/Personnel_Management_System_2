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

        System.out.println(type);
        //处理删除请求
       if(type.equals("gotodelete")){
            String id =request.getParameter("id");
            boolean b = employeeService.detleteEmployee(Integer.parseInt(id));
            if (b){
                type = "gotoList";

            }
        }

        //处理添加请求
        if (type.equals("gotoAdd")){
            String deptId = request.getParameter("deptId");
            String jobId = request.getParameter("jobId");
            String name = request.getParameter("name");
            String sex = request.getParameter("sex");
            String number = request.getParameter("number");
            String email = request.getParameter("email");
            String education = request.getParameter("education");
            String card = request.getParameter("card");
            String creatTime = request.getParameter("creatTime");
            Employee ep = new Employee(name,sex,number,email,education,card,jobId,deptId,creatTime);
            boolean b = employeeService.addEmployee(ep);
            System.out.println(ep);
            if (b){
                type="gotoList";

            }
        }

        //处理修改请求
        if (type.equals("gotoUpdate")){
            String deptId = request.getParameter("deptId");
            String jobId = request.getParameter("jobId");
            String name = request.getParameter("name");
            String sex = request.getParameter("sex");
            String number = request.getParameter("number");
            String email = request.getParameter("email");
            String education = request.getParameter("education");
            String card = request.getParameter("card");
            Employee ep = new Employee(name,sex,number,email,education,card,jobId,deptId);
            boolean b = employeeService.updateEmployee(ep);
            if (b){
                type = "gotoList";
            }

        }

        //处理查询请求
        if(type.equals("selectEmployee")){
            Employee ep = new Employee();
            String epName = request.getParameter("epName");

            Employee employee = employeeService.selectEmpolyeeByName(epName);

            request.setAttribute("employee",employee);

             if (employee.getName()==null){
                    request.getRequestDispatcher("employeeSelectEr.jsp").forward(request,response);
                }
            request.getRequestDispatcher("employeeSelectRs.jsp").forward(request,response);
        }
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