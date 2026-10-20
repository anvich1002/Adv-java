package com.shopsphere.util;

import java.sql.Connection;
import java.sql.SQLException;

public class TestConnection {

    public static void main(String[] args) {

        try (Connection con = DBConnection.getConnection()) {

            if (con != null && !con.isClosed()) {
                System.out.println("ShopSphere Database Connected Successfully!");
            } else {
                System.out.println("Connection Failed!");
            }

        } catch (SQLException e) {
            System.out.println("Database Connection Error!");
            e.printStackTrace();
        }
    }
}