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

        String sql = "INSERT INTO users " +
                     "(name, email, password, mobile, role, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getMobile());
            ps.setString(5, user.getRole());
            ps.setBoolean(6, user.isStatus());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }

    // Login user
    public User loginUser(String email, String password) {

        String sql = "SELECT * FROM users " +
                     "WHERE email = ? AND password = ? AND status = TRUE";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

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

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }

    // Check whether email already exists
    public boolean emailExists(String email) {

        String sql = "SELECT user_id FROM users WHERE email = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            return rs.next();

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }

    // Get user by ID
    public User getUserById(int userId) {

        String sql = "SELECT * FROM users WHERE user_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

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

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }
}