package com.li.service;

import com.li.entil.Notice;
import com.li.util.SqlHeple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: LTWO
 * @Date: 2019/7/6 20:34
 * @Version 1.0
 */
public class NoticeService {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    //删除公告
    public boolean deleteNotice(int id){
        boolean b = true;
        conn =SqlHeple.getConnection();
        String sql = "delete from notice_inf where id=?";
        try{
            ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            int i = ps.executeUpdate();
            if (i!=1){
                b = false;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return b;
    }
    //显示公告
    public List<Notice> findAllNotice(){
        List<Notice> list = new ArrayList<>();
        String sql = "select * from notice_inf";
        try{
            conn = SqlHeple.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                Notice notice = new Notice();
                notice.setId(rs.getInt(1));
                notice.setTitle(rs.getString(2));
                notice.setContext(rs.getString(3));
                notice.setCreateDate(rs.getString(4));
                notice.setUserId(rs.getString(5));
                list.add(notice);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                if (rs!=null) {
                    rs.close();
                }
                if (ps!=null) {
                    ps.close();
                }
                if (conn!=null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
    //添加公告
    public boolean addNotice(Notice notice){
        boolean b =true;
        String sql = "insert into notice_inf(title,context,create_date,user_id) values (?,?,?,?)";
        try {
            conn = SqlHeple.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,notice.getTitle());
            ps.setString(2,notice.getContext());
            ps.setString(3,notice.getCreateDate());
            ps.setString(4,notice.getUserId());
            int i = ps.executeUpdate();
            if (i!=1){
                b = false;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return b;
    }
}
