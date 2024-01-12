package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {

    public static Connection con;

    public static Connection getConnection() {

        try {
            //create new connection only when con=null
            if (con == null) {
                //driver class load
                Class.forName("oracle.jdbc.driver.OracleDriver");

                //create a connection
                String jdbcUrl = "jdbc:oracle:thin:@//localhost:1521/orcl";
                String username = "system";
                String password = "Komal@oracle3125";
                con = DriverManager.getConnection(jdbcUrl, username, password);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
