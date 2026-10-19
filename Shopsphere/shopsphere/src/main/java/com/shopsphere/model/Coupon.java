package com.shopsphere.model;

public class Coupon {

    private int couponId;
    private String code;
    private String description;
    private double discountValue;
    private String discountType;
    private double minimumOrderAmount;
    private boolean status;
    private String expiryDate;

    public Coupon() {
    }

    public Coupon(int couponId, String code, String description,
                  double discountValue, String discountType,
                  double minimumOrderAmount, boolean status,
                  String expiryDate) {
        this.couponId = couponId;
        this.code = code;
        this.description = description;
        this.discountValue = discountValue;
        this.discountType = discountType;
        this.minimumOrderAmount = minimumOrderAmount;
        this.status = status;
        this.expiryDate = expiryDate;
    }

    public int getCouponId() {
        return couponId;
    }

    public void setCouponId(int couponId) {
        this.couponId = couponId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(double discountValue) {
        this.discountValue = discountValue;
    }

    public String getDiscountType() {
        return discountType;
    }

    public void setDiscountType(String discountType) {
        this.discountType = discountType;
    }

    public double getMinimumOrderAmount() {
        return minimumOrderAmount;
    }

    public void setMinimumOrderAmount(double minimumOrderAmount) {
        this.minimumOrderAmount = minimumOrderAmount;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }
}