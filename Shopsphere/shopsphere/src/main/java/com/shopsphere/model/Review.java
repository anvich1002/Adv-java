package com.shopsphere.model;

public class Review {

    private int reviewId;
    private int userId;
    private int productId;
    private int rating;
    private String reviewText;
    private String userName;
    private String createdAt;

    public Review() {
    }

    public Review(int reviewId, int userId, int productId,
                  int rating, String reviewText,
                  String userName, String createdAt) {
        this.reviewId = reviewId;
        this.userId = userId;
        this.productId = productId;
        this.rating = rating;
        this.reviewText = reviewText;
        this.userName = userName;
        this.createdAt = createdAt;
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}