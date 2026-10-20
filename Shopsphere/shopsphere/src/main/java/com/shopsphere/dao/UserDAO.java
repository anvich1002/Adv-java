package com.shopsphere.dao;

import com.shopsphere.model.User;
import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    // Register new user
    public boolean registerUser(User user) {

        String sql = "INSERT INTO users "
                + "(name, email, password, mobile, role, status) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getMobile());
            ps.setString(5, user.getRole());
            ps.setBoolean(6, user.isStatus());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Registration failed:");
            e.printStackTrace();
            return false;
        }
    }

    // Login user
 public User loginUser(String email, String password) {

    String sql = "SELECT * FROM users "
            + "WHERE email = ? AND password = ? AND status = TRUE";

    try (Connection con = DBConnection.getConnection()) {

        if (con == null) {
            throw new SQLException("Database connection is null!");
        }

        try (PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapUser(rs);
                }
            }
        }

    } catch (SQLException e) {
        System.err.println("Login failed: " + e.getMessage());
        e.printStackTrace();
    }

    return null;
}

    // Check email
    public boolean emailExists(String email) {

        String sql = "SELECT user_id FROM users WHERE email = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }

        } catch (SQLException e) {
            System.err.println("Email check failed:");
            e.printStackTrace();
            return false;
        }
    }

    // Get user by ID
    public User getUserById(int userId) {

        String sql = "SELECT * FROM users WHERE user_id = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapUser(rs);
                }
            }

        } catch (SQLException e) {
            System.err.println("Get user failed:");
            e.printStackTrace();
        }

        return null;
    }

    // Get a valid database connection
    private Connection getConnection() throws SQLException {
        Connection con = DBConnection.getConnection();

        if (con == null) {
            throw new SQLException(
                    "Database connection is null. Check DBConnection settings."
            );
        }

        return con;
    }

    // Convert database row into User object
    private User mapUser(ResultSet rs) throws SQLException {

        User user = new User();

        user.setUserId(rs.getInt("user_id"));
        user.setName(rs.getString("name"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setMobile(rs.getString("mobile"));
        user.setRole(rs.getString("role"));
        user.setStatus(rs.getBoolean("status"));

        return user;
    }
}