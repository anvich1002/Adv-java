package com.shopsphere.dao;

import com.shopsphere.model.OrderData;
import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    // ==========================================
    // CREATE ORDER
    // ==========================================

    public int createOrder(
            int userId,
            int addressId,
            double totalAmount,
            String paymentMethod) {

        String sql =
                "INSERT INTO orders " +
                "(user_id, address_id, total_amount, discount, " +
                "payment_method, payment_status, order_status) " +
                "VALUES (?, ?, ?, 0, ?, ?, ?)";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                            sql,
                            java.sql.Statement.RETURN_GENERATED_KEYS
                    );

            ps.setInt(1, userId);
            ps.setInt(2, addressId);
            ps.setDouble(3, totalAmount);
            ps.setString(4, paymentMethod);

            // Payment status
            ps.setString(5, "PENDING");

            // Order status
            ps.setString(6, "PLACED");

            int rows =
                    ps.executeUpdate();

            if (rows > 0) {

                ResultSet rs =
                        ps.getGeneratedKeys();

                if (rs.next()) {

                    int orderId =
                            rs.getInt(1);

                    rs.close();
                    ps.close();
                    con.close();

                    return orderId;
                }

                rs.close();
            }

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return 0;
    }


    // ==========================================
    // GET ORDERS BY USER ID
    // WITH PRODUCT IMAGE
    // ==========================================

    public List<OrderData> getOrdersByUserId(
            int userId) {

        List<OrderData> orders =
                new ArrayList<>();

        String sql =
                "SELECT o.order_id, " +
                "o.total_amount, " +
                "o.payment_method, " +
                "o.payment_status, " +
                "o.order_status, " +
                "o.created_at, " +

                "(SELECT p.image_url " +
                " FROM order_items oi " +
                " JOIN products p " +
                " ON oi.product_id = p.product_id " +
                " WHERE oi.order_id = o.order_id " +
                " LIMIT 1) AS image_url " +

                "FROM orders o " +

                "WHERE o.user_id = ? " +

                "ORDER BY o.created_at DESC";


        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs =
                    ps.executeQuery();


            while (rs.next()) {

                OrderData order =
                        new OrderData();


                // Order ID
                order.setOrderId(
                        rs.getInt("order_id")
                );


                // Total Amount
                order.setTotalAmount(
                        rs.getDouble("total_amount")
                );


                // Payment Method
                order.setPaymentMethod(
                        rs.getString("payment_method")
                );


                // Payment Status
                order.setPaymentStatus(
                        rs.getString("payment_status")
                );


                // Order Status
                order.setOrderStatus(
                        rs.getString("order_status")
                );


                // Created Date
                order.setCreatedAt(
                        rs.getString("created_at")
                );


                // Product Image
                order.setImageUrl(
                        rs.getString("image_url")
                );


                orders.add(order);
            }


            rs.close();
            ps.close();
            con.close();


        } catch (Exception e) {

            e.printStackTrace();
        }


        return orders;
    }
}