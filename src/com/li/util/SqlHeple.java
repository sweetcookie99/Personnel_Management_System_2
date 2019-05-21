package com.li.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * 与数据库获得连接*/
public class SqlHeple {
    //与数据库取得连接
    public  static  Connection getConnection(){
        Connection connection = null;
        //加载驱动
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            //开始获得连接
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/management?useSSL=false","root","123456");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}
