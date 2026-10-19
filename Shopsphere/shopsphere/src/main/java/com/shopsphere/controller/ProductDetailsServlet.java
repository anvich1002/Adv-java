package com.shopsphere.controller;

import com.shopsphere.dao.WishlistDAO;
import com.shopsphere.model.Product;
import com.shopsphere.model.Review;
import com.shopsphere.service.ProductService;
import com.shopsphere.service.ReviewService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/product-details")
public class ProductDetailsServlet extends HttpServlet {

    private ProductService productService;
    private ReviewService reviewService;
    private WishlistDAO wishlistDAO;

    @Override
    public void init() {

        productService = new ProductService();
        reviewService = new ReviewService();
        wishlistDAO = new WishlistDAO();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(
                request.getParameter("id")
        );

        // Get product
        Product product =
                productService.getProductById(productId);

        // Get reviews
        List<Review> reviews =
                reviewService.getReviewsByProductId(productId);

        request.setAttribute(
                "product",
                product
        );

        request.setAttribute(
                "reviews",
                reviews
        );


        // Check wishlist status
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

            boolean isWishlisted =
                    wishlistIds.contains(productId);

            request.setAttribute(
                    "isWishlisted",
                    isWishlisted
            );
        }


        // Open product details page
        request.getRequestDispatcher(
                "/product-details.jsp"
        ).forward(request, response);
    }
}