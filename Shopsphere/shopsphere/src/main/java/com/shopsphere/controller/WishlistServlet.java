package com.shopsphere.controller;

import com.shopsphere.dao.ProductDAO;
import com.shopsphere.dao.WishlistDAO;
import com.shopsphere.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {

    private WishlistDAO wishlistDAO;
    private ProductDAO productDAO;

    @Override
    public void init() {
        wishlistDAO = new WishlistDAO();
        productDAO = new ProductDAO();
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

        int userId = (Integer) userIdObject;

        // Get wishlist product IDs
        List<Integer> productIds =
                wishlistDAO.getWishlistProductIds(userId);

        // Get complete product details
        List<Product> wishlistProducts =
                new ArrayList<>();

        for (Integer productId : productIds) {

            Product product =
                    productDAO.getProductById(productId);

            if (product != null) {
                wishlistProducts.add(product);
            }
        }

        // Send products to JSP
        request.setAttribute(
                "wishlistProducts",
                wishlistProducts
        );

        request.getRequestDispatcher(
                "/wishlist.jsp"
        ).forward(request, response);
    }
}