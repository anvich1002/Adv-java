package com.shopsphere.model;

public class CouponUsage {

    private int couponUsageId;
    private int couponId;
    private int userId;
    private int orderId;
    private String usedAt;

    public CouponUsage() {
    }

    public CouponUsage(int couponUsageId, int couponId,
                       int userId, int orderId, String usedAt) {
        this.couponUsageId = couponUsageId;
        this.couponId = couponId;
        this.userId = userId;
        this.orderId = orderId;
        this.usedAt = usedAt;
    }

    public int getCouponUsageId() {
        return couponUsageId;
    }

    public void setCouponUsageId(int couponUsageId) {
        this.couponUsageId = couponUsageId;
    }

    public int getCouponId() {
        return couponId;
    }

    public void setCouponId(int couponId) {
        this.couponId = couponId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getUsedAt() {
        return usedAt;
    }

    public void setUsedAt(String usedAt) {
        this.usedAt = usedAt;
    }
}