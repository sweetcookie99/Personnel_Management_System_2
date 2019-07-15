package com.li.control;

import com.li.entil.Notice;
import com.li.service.NoticeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "NoticeServlet", urlPatterns = "/NoticeServlet")
public class NoticeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String type = request.getParameter("type");
        System.out.println(type);
        //删除功能
        if (type.equals("delete")){
            int id = Integer.parseInt(request.getParameter("id"));
            NoticeService noticeService = new NoticeService();
            boolean b = noticeService.deleteNotice(id);
            if ( b){
                type = "gotoList";
            }

        }
        //添加功能
        if (type.equals("addNotice")){
            Notice notice = new Notice();
            String title = request.getParameter("title");
            String createTime = request.getParameter("creatTime");
            String context = request.getParameter("context");
            String userId = request.getParameter("userId");
            notice.setTitle(title);
            notice.setContext(context);
            notice.setCreateDate(createTime);
            notice.setUserId(userId);
            NoticeService noticeService = new NoticeService();
            boolean b = noticeService.addNotice(notice);
            if (b){
                type="gotoList";
            }

        }
        if (type.equals("gotoList")){
            NoticeService noticeService = new NoticeService();
            List<Notice> allNotice = noticeService.findAllNotice();
            request.setAttribute("allNotice",allNotice);
            request.getRequestDispatcher("noticeList.jsp").forward(request,response);
        }
        //查询公告信息

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        doPost(request, response);
    }
}