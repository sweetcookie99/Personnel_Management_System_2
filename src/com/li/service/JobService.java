package com.li.service;

import com.li.entil.Dept;
import com.li.entil.Job;
import com.li.util.SqlHeple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: LTWO
 * @Date: 2019/5/16 20:33
 * @Version 1.0
 */
public class JobService {
    private Connection conn=null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    //查询所有职位信息
    public List<Job> findAllJob(){
        conn = SqlHeple.getConnection();
        List<Job> list = new ArrayList<>();
        String sql = "select * from job_inf";
        try {
            ps =conn.prepareStatement(sql);
            rs =ps.executeQuery();
            while (rs.next()){
                //第一次封装
                Job dept =new Job();
                dept.setId(rs.getString(1));
                dept.setDeptId(rs.getString(2));
                dept.setName(rs.getString(3));
                dept.setRemark(rs.getString(4));
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
    //添加职位
    public boolean addJob(Job job){
        //取得连接
        boolean b = true;
        Connection conn = SqlHeple.getConnection();
        String sql = "insert into job_inf values(?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,job.getId());
            ps.setString(2,job.getDeptId());
            ps.setString(3,job.getName());
            ps.setString(4,job.getRemark());
            ps.executeUpdate();

        } catch (SQLException e) {
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

    //修改职位
    public boolean updateJobById(Job job){
        boolean b = true;
        conn = SqlHeple.getConnection();
        String sql = "update job_inf set name=?, remark=? where id=?";
        try{
            ps=conn.prepareStatement(sql);
            ps.setString(1,job.getName());
            ps.setString(2,job.getRemark());
            ps.setString(3,job.getId());
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
    
    //删除职位信息
    public boolean deleteJob(String id){
        boolean b = true;
        conn = SqlHeple.getConnection();
        String sql = "delete from job_inf where id=?";
        try{
            ps = conn.prepareStatement(sql);
            ps.setString(1,id);
            int i =ps.executeUpdate();
            if(i!=1) {
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
}
