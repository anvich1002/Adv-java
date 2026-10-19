package com.shopsphere.model;

public class WishlistItem {

    private int wishlistId;
    private int userId;
    private int productId;
    private Product product;
    private String createdAt;

    public WishlistItem() {
    }

    public WishlistItem(int wishlistId, int userId, int productId,
                        Product product, String createdAt) {
        this.wishlistId = wishlistId;
        this.userId = userId;
        this.productId = productId;
        this.product = product;
        this.createdAt = createdAt;
    }

    public int getWishlistId() {
        return wishlistId;
    }

    public void setWishlistId(int wishlistId) {
        this.wishlistId = wishlistId;
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

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}