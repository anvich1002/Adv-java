package com.shopsphere.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
        "jdbc:mysql://localhost:3306/shopsphere?useSSL=false&serverTimezone=UTC";

    private static final String USER = "root";

    // Yahan apna actual MySQL password likho
    private static final String PASSWORD = "Anaviya@1518";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found.", e);
        }

        Connection con = DriverManager.getConnection(
            URL, USER, PASSWORD
        );

        System.out.println("ShopSphere database connected successfully!");
        return con;
    }
}