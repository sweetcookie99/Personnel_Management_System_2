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

@WebServlet(name = "loginServlet", urlPatterns = "/loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String loginname = request.getParameter("loginname");
        String password = request.getParameter("password");
        UserService userService = new UserService();
        User user =new User();
        user.setLoginname(loginname);
        user.setPassword(password);
        boolean checklogin = userService.checklogin(user);
        if (checklogin){
            request.getRequestDispatcher("welcome.jsp").forward(request,response);
        }else {
            String erro = "您的密码或用户名有误！请重新输入";
            request.setAttribute("erro",erro);
            request.getRequestDispatcher("loginForm.jsp").forward(request,response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        doPost(request, response);
    }
}