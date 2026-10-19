package com.shopsphere.controller;

import com.shopsphere.dao.WishlistDAO;
import com.shopsphere.model.Product;
import com.shopsphere.service.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductsServlet extends HttpServlet {

    private ProductService productService;
    private WishlistDAO wishlistDAO;

    @Override
    public void init() {

        productService = new ProductService();
        wishlistDAO = new WishlistDAO();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get all products
        List<Product> products =
                productService.getAllProducts();

        request.setAttribute(
                "products",
                products
        );

        // Get logged-in user's wishlist
        HttpSession session =
                request.getSession();

        Object userIdObject =
                session.getAttribute("userId");

        if (userIdObject != null) {

            int userId =
                    (Integer) userIdObject;

            List<Integer> wishlistIds =
                    wishlistDAO.getWishlistProductIds(
                            userId
                    );

            request.setAttribute(
                    "wishlistIds",
                    wishlistIds
            );
        }

        // Open products.jsp
        request.getRequestDispatcher(
                "/products.jsp"
        ).forward(request, response);
    }
}