package com.shopsphere.service;

import com.shopsphere.dao.ReviewDAO;
import com.shopsphere.model.Review;

import java.util.List;

public class ReviewService {

    private ReviewDAO reviewDAO;

    public ReviewService() {
        reviewDAO = new ReviewDAO();
    }

    // Add Review
    public boolean addReview(Review review) {
        return reviewDAO.addReview(review);
    }

    // Get Reviews of a Product
    public List<Review> getReviewsByProductId(int productId) {
        return reviewDAO.getReviewsByProductId(productId);
    }
}