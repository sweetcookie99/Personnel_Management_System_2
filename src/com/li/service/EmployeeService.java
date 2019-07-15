package com.li.service;

import com.li.entil.Employee;
import com.li.util.SqlHeple;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: LTWO
 * @Date: 2019/5/16 20:34
 * @Version 1.0
 */
public class EmployeeService {
    private Connection conn=null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    //查询所有职工的信息
    public List<Employee> findAllEmployee(){
        conn = SqlHeple.getConnection();
        List<Employee> list = new ArrayList<>();
        String sql = "select * from employee_inf";
        try {
            ps =conn.prepareStatement(sql);
            rs =ps.executeQuery();
            while (rs.next()){
                // *id | name | sex | phone | email | education | cred_id | job_id | dept_id | create_date |*/
                //第一次封装
                Employee employee = new Employee();
                employee.setId(rs.getInt(1));
                employee.setName(rs.getString(2));
                employee.setSex(rs.getString(3));
                employee.setPhone(rs.getString(4));
                employee.setEmail(rs.getString(5));
                employee.setEducation(rs.getString(6));
                employee.setCardId(rs.getString(7));
                employee.setJobId(rs.getString(8));
                employee.setDeptId(rs.getString(9));
                list.add(employee);
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
    //添加职工的信息
    public boolean addEmployee(Employee employee){
        boolean b = true;
        conn = SqlHeple.getConnection();
        String sql ="insert into employee_inf(name,sex,phone,email,education,cred_id,dept_id,create_date)" +
                "values(?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,employee.getName());
            ps.setString(2,employee.getSex());
            ps.setString(3,employee.getPhone());
            ps.setString(4,employee.getEmail());
            ps.setString(5,employee.getEducation());
            ps.setString(6,employee.getCardId());
            ps.setString(7,employee.getDeptId());
            ps.setString(8,employee.getCreateDate());
            int i = ps.executeUpdate();
            if (i!=1){
                b=false;
            }
        }catch(Exception e){
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
    //根据ID更新职工的信息
    public boolean updateEmployee(Employee employee){
        boolean b = true;
        conn = SqlHeple.getConnection();
        //name,sex,phone,email,education,cred_id,dept_id,create_date
        String sql = "update employee_inf set name=?,sex=?,phone=?,email=?,education=?,cred_id=?,dept_id=?,create_date=? where id=?";
        try{
            ps=conn.prepareStatement(sql);
            ps.setString(1,employee.getName());
            ps.setString(2,employee.getSex());
            ps.setString(3,employee.getPhone());
            ps.setString(4,employee.getEmail());
            ps.setString(5,employee.getEducation());
            ps.setString(6,employee.getCardId());
            ps.setString(7,employee.getDeptId());
            ps.setString(8,employee.getCreateDate());
            ps.setInt(9,employee.getId());
            int i = ps.executeUpdate();
            if (i!=1){
                b=false;
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

    //删除用户信息
    public boolean detleteEmployee(int id){
        boolean b = true;
        String sql = "delete from employee_inf where id=?";
        conn = SqlHeple.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            int i = ps.executeUpdate();
            if(1!=i){
                b = false;
            }
        }catch (Exception e){
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

    //根据用户姓名查询用户信息
    public Employee selectEmpolyeeByName(String EpName){
        Employee employee = new Employee();
        conn = SqlHeple.getConnection();
        String sql = "select * from employee_inf where name=?";
        try{
            ps = conn.prepareStatement(sql);
            ps.setString(1,EpName);
            rs = ps.executeQuery();
            while (rs.next()){
                employee.setId(rs.getInt(1));
                employee.setName(rs.getString(2));
                employee.setSex(rs.getString(3));
                employee.setPhone(rs.getString(4));
                employee.setEmail(rs.getString(5));
                employee.setEducation(rs.getString(6));
                employee.setCardId(rs.getString(7));
                employee.setJobId(rs.getString(8));
                employee.setDeptId(rs.getString(9));
            }
        }catch (Exception e){
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
        return employee;
    }
}
