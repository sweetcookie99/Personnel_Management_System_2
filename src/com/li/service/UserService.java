package com.li.service;

import com.li.entil.User;
import com.li.util.SqlHeple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    private Connection conn=null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    //验证用户登录方法
    public boolean checklogin(User user){
        boolean b = false;
        String sql = "select * from user_inf where loginname=? and password=?";
        conn = SqlHeple.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,user.getLoginname());
            ps.setString(2,user.getPassword());
            rs =ps.executeQuery();
            if (rs.next()){
                b= true;
            }
        } catch (SQLException e) {
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
        return b;
    }

    //查询所有管理员用户信息表
    public List<User> findAllUser(){
        List<User> userList = new ArrayList<>();
        String sql ="select * from user_inf";
        conn = SqlHeple.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            rs =ps.executeQuery();
            while (rs.next()){
                //第一次封装
                User user = new User();
                user.setId(rs.getInt(1));
                user.setLoginname(rs.getString(2));
                user.setUsername(rs.getString(3));
                user.setCreate_date(rs.getString(4));
                user.setPassword(rs.getString(5));
                userList.add(user);
            }

        } catch (SQLException e) {
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
        return userList;
    }

    //根据Id删除管理用户
    public boolean deleteUserById(int id){
        boolean b = true;
        //获取连接
        conn =SqlHeple.getConnection();
        //写SQL语句
        String sql = "delete from user_inf where id=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            int i = ps.executeUpdate();
            if (i!=1){
                b=false;
            }

        } catch (SQLException e) {
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
        return b;
    }

    //根据Id查询用户信息
    public User findUserById(int id){
        String sql ="select * from user_inf where id=?";
        conn = SqlHeple.getConnection();
        User user = new User();
        try {

            ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            rs =ps.executeQuery();
            while (rs.next()){
                //第一次封装
                user.setId(rs.getInt(1));
                user.setLoginname(rs.getString(2));
                user.setUsername(rs.getString(3));
                user.setCreate_date(rs.getString(4));
                user.setPassword(rs.getString(5));
            }
        } catch (SQLException e) {
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
        return user;
    }

    //更新用户信息
    public boolean updateUserById(User user){
        boolean b = true;
        conn = SqlHeple.getConnection();
        //id | loginname | username | create_date | password |
        String sql = "update user_inf set loginname=?,username=?,password=? where id=?";
        try {
            ps =conn.prepareStatement(sql);
            ps.setString(1,user.getLoginname());
            ps.setString(2,user.getUsername());
            ps.setString(3,user.getPassword());
            ps.setInt(4,user.getId());
            int i = ps.executeUpdate();
            if (i!=1){
                b=false;
            }
        } catch (SQLException e) {
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
        return b;
    }

    //添加用户信息
    public boolean addUser(User user){
        boolean b =true;
        conn =SqlHeple.getConnection();
        //id | loginname | username | create_date | password |
        String sql = "insert into user_inf values(?,?,?,?,?)";
        try {
            ps =conn.prepareStatement(sql);
            ps.setInt(1,user.getId());
            ps.setString(2,user.getLoginname());
            ps.setString(3,user.getUsername());
            ps.setString(4,user.getCreate_date());
            ps.setString(5,user.getPassword());
            int i = ps.executeUpdate();
            if (i!=1){
                b=false;
            }
        } catch (SQLException e) {
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
        return true;
    }
}
