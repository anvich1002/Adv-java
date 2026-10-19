package com.shopsphere.controller;

import com.shopsphere.dao.WishlistDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/remove-from-wishlist")
public class RemoveFromWishlistServlet extends HttpServlet {

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

        String id = request.getParameter("id");

        if (id == null || id.isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/wishlist"
            );

            return;
        }

        int userId = (Integer) userIdObject;
        int productId = Integer.parseInt(id);

        // Remove product
        wishlistDAO.removeFromWishlist(
                userId,
                productId
        );

        // Back to wishlist
        response.sendRedirect(
                request.getContextPath()
                        + "/wishlist"
        );
    }
}