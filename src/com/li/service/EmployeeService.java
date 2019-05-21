package com.li.service;

import com.li.entil.Employee;
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
                employee.setId(rs.getString(1));
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
}
