

package com.shopsphere.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/shopsphere";

    private static final String USER = "root";

    private static final String PASSWORD = "Divya@11869";

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            System.out.println("ShopSphere Database Connected Successfully!");

            return con;

        } catch (ClassNotFoundException e) {

            System.out.println("MySQL JDBC Driver NOT FOUND!");
            e.printStackTrace();

        } catch (SQLException e) {

            System.out.println("MySQL Connection FAILED!");
            e.printStackTrace();
        }

        return null;
    }
}