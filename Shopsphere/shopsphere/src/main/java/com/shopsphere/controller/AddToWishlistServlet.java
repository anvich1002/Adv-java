package com.shopsphere.controller;

import com.shopsphere.dao.WishlistDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/add-to-wishlist")
public class AddToWishlistServlet extends HttpServlet {

    private WishlistDAO wishlistDAO;

    @Override
    public void init() {
        wishlistDAO = new WishlistDAO();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Check login
        Object userIdObject =
                session.getAttribute("userId");

        if (userIdObject == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp"
            );

            return;
        }

        // Get product ID
        String id = request.getParameter("id");

        if (id == null || id.isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/products"
            );

            return;
        }

        int userId = (Integer) userIdObject;
        int productId = Integer.parseInt(id);

        // Add to wishlist
        wishlistDAO.addToWishlist(
                userId,
                productId
        );

        // Go back to products
        response.sendRedirect(
                request.getContextPath()
                        + "/products"
        );
    }
}