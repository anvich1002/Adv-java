package com.shopsphere.controller;

import com.shopsphere.model.User;
import com.shopsphere.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() {
        userService = new UserService();
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userService.loginUser(email, password);

        if (user != null) {

            HttpSession session = request.getSession();

            // Store logged-in user
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userName", user.getName());
            session.setAttribute("role", user.getRole());

            // Go to Products page
            response.sendRedirect(
                    request.getContextPath() + "/products"
            );

        } else {

            // Login failed
            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp?error=invalid"
            );
        }
    }
}