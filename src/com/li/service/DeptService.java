package com.li.service;

import com.li.entil.Dept;
import com.li.util.SqlHeple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: LTWO
 * @Date: 2019/5/15 20:10
 * @Version 1.0
 */
public class DeptService {
    private Connection conn=null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    //查询所有部门信息
    public List<Dept> findAllDept(){
        conn = SqlHeple.getConnection();
        List<Dept> list = new ArrayList<>();
        String sql = "select * from dept_inf";
        try {
            ps =conn.prepareStatement(sql);
            rs =ps.executeQuery();
            while (rs.next()){
                //第一次封装
                Dept dept =new Dept();
                dept.setId(rs.getString(1));
                dept.setName(rs.getString(2));
                dept.setRemark(rs.getString(3));
                //第二次封装
                list.add(dept);
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
    //根据添加部门信息
    public boolean addDept(Dept dept) {
        boolean b = true;
        conn = SqlHeple.getConnection();
        String sql = "insert into dept_inf values(?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,dept.getId());
            ps.setString(2,dept.getName());
            ps.setString(3,dept.getRemark());
            int i = ps.executeUpdate();
            if (i!=1){
                b = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                if(rs!=null){
                    rs.close();}
                if (ps!=null){
                    ps.close();}
                if (conn!=null){
                    conn.close();}
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return b;
    }
    //根据id更新部门信息
    public boolean updateDept(Dept dept){
        boolean b = true;
        //获得连接
        conn = SqlHeple.getConnection();
        String sql = "update dept_inf set name=?,remark=? where id=?";
        try{
            ps = conn.prepareStatement(sql);
            ps.setString(1,dept.getName());
            ps.setString(2,dept.getRemark());
            ps.setString(3,dept.getId());
            int i = ps.executeUpdate();
            if (i!=1){
                b = false;
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
        return b;
    }
    //删除部门信息
    public boolean deleteDeptById(String id){
        boolean b = true;
        conn = SqlHeple.getConnection();
        String sql = "delete from dept_inf where id=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,id);
            int i=ps.executeUpdate();
            if (i!=1){
                b = false;
            }
        }catch (Exception e){
            e.printStackTrace();
        }try {
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

        return b;
    }
}
