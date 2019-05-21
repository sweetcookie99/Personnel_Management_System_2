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
    public void insertDept(Dept dept) {
        conn = SqlHeple.getConnection();
        String sql = "";
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
