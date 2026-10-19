package com.shopsphere.service;

import com.shopsphere.dao.UserDAO;
import com.shopsphere.model.User;

public class UserService {

    private UserDAO userDAO;

    public UserService() {
        userDAO = new UserDAO();
    }

    // Register User
    public boolean registerUser(User user) {

        // Check duplicate email
        if (userDAO.emailExists(user.getEmail())) {
            return false;
        }

        // Default role
        if (user.getRole() == null || user.getRole().isEmpty()) {
            user.setRole("CUSTOMER");
        }

        // Default status
        user.setStatus(true);

        return userDAO.registerUser(user);
    }

    // Login User
    public User loginUser(String email, String password) {

        if (email == null || email.trim().isEmpty()) {
            return null;
        }

        if (password == null || password.trim().isEmpty()) {
            return null;
        }

        return userDAO.loginUser(email, password);
    }

    // Check email
    public boolean emailExists(String email) {

        if (email == null || email.trim().isEmpty()) {
            return false;
        }

        return userDAO.emailExists(email);
    }

    // Get User
    public User getUserById(int userId) {

        return userDAO.getUserById(userId);
    }
}
