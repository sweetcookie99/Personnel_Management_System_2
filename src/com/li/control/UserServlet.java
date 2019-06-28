package com.li.control;

import com.li.entil.User;
import com.li.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ref.ReferenceQueue;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/UserServlet")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String type = request.getParameter("type");
        UserService userService = new UserService();

        //根据Id删除管理员用户
        if (type.equals("delete")){
            int id = Integer.parseInt(request.getParameter("id"));
            boolean b = userService.deleteUserById(id);
            if (b){
                type="gotoList";
            }
        }

        //根据Id来更新管理员信息
        if (type.equals("update")){
            //获取更新用户的信息
            //id | loginname | username | create_date | password |
            String id = request.getParameter("id");
            String loginname = request.getParameter("loginName");
            String username = request.getParameter("userName");
            String pwd = request.getParameter("password");
            User user =new User(Integer.parseInt(id),loginname,username,"",pwd);
            boolean b = userService.updateUserById(user);
            if (b){
                type = "gotoList";
            }


        }

        //添加用户信息
        if (type.equals("gotoInsert")){
            //获取更新用户的信息
            //id | loginname | username | create_date | password |
            String id = request.getParameter("id");
            String loginname = request.getParameter("loginName");
            String username = request.getParameter("userName");
            String creatTime = request.getParameter("creatTime");
            String pwd = request.getParameter("password");
            User user =new User(Integer.parseInt(id),loginname,username,creatTime,pwd);
            boolean b = userService.addUser(user);
            if (b){
                type="gotoList";
            }

        }

        //去往管理员用户信息界面
        if (type.equals("gotoList")) {
            int pageNum = 1;
            if (request.getAttribute("pageNum")!=null){
                pageNum = (int) request.getAttribute("pageNum");
            }

            List<User> userList = userService.findAllUser();
            request.setAttribute("userList", userList);
            request.setAttribute("pageNum",pageNum);
            int total = userList.size();
            int pageCount = (total-1)/5+1;
            request.getRequestDispatcher("userList.jsp").forward(request, response);
        }

        //去修改用户的界面，并把用户的信息带过去
        if (type.equals("gotoUpdate")){
            int id = Integer.parseInt(request.getParameter("id"));
            User userById = userService.findUserById(id);
            request.setAttribute("user",userById);
            request.getRequestDispatcher("userUpdate.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        doPost(request, response);
    }
}