package com.shopsphere.dao;

import com.shopsphere.model.Review;
import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    // Add Review
    public boolean addReview(Review review) {

        String sql = "INSERT INTO reviews " +
                     "(user_id, product_id, rating, review_text) " +
                     "VALUES (?, ?, ?, ?)";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, review.getUserId());
            ps.setInt(2, review.getProductId());
            ps.setInt(3, review.getRating());
            ps.setString(4, review.getReviewText());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Get Reviews of a Product
    public List<Review> getReviewsByProductId(int productId) {

        List<Review> reviews = new ArrayList<>();

        String sql = "SELECT * FROM reviews " +
                     "WHERE product_id = ? " +
                     "ORDER BY created_at DESC";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, productId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Review review = new Review();

                review.setReviewId(
                    rs.getInt("review_id")
                );

                review.setUserId(
                    rs.getInt("user_id")
                );

                review.setProductId(
                    rs.getInt("product_id")
                );

                review.setRating(
                    rs.getInt("rating")
                );

                review.setReviewText(
                    rs.getString("review_text")
                );

                review.setCreatedAt(
                    rs.getString("created_at")
                );

                reviews.add(review);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return reviews;
    }
}