package com.li.util;

import java.sql.Connection;
import java.sql.SQLException;

import static org.junit.Assert.*;

public class SqlHepleTest {

    @org.junit.Test
    public void getConnection() throws SQLException {
        Connection connection = SqlHeple.getConnection();
        connection.close();

    }
}