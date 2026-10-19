package com.shopsphere.controller;

import com.shopsphere.model.Review;
import com.shopsphere.service.ReviewService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/add-review")
public class AddReviewServlet extends HttpServlet {

    private ReviewService reviewService;

    @Override
    public void init() {
        reviewService = new ReviewService();
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer userId =
                (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );
            return;
        }

        int productId = Integer.parseInt(
                request.getParameter("productId")
        );

        int rating = Integer.parseInt(
                request.getParameter("rating")
        );

        String reviewText =
                request.getParameter("reviewText");

        Review review = new Review();

        review.setUserId(userId);
        review.setProductId(productId);
        review.setRating(rating);
        review.setReviewText(reviewText);

        reviewService.addReview(review);

        response.sendRedirect(
                request.getContextPath()
                + "/product-details?id="
                + productId
        );
    }
}