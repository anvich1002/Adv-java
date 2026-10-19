package com.shopsphere.dao;

import com.shopsphere.model.Product;
import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

public class OrderItemDAO {

    public boolean saveOrderItems(
            int orderId,
            List<Product> cart) {

        String sql =
                "INSERT INTO order_items " +
                "(order_id, product_id, quantity, price) " +
                "VALUES (?, ?, ?, ?)";

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                System.out.println("Database connection is NULL");
                return false;
            }

            PreparedStatement ps =
                    con.prepareStatement(sql);

            for (Product product : cart) {

                System.out.println(
                        "Saving Order Item: "
                        + "orderId=" + orderId
                        + ", productId=" + product.getProductId()
                        + ", price=" + product.getPrice()
                );

                ps.setInt(1, orderId);
                ps.setInt(2, product.getProductId());
                ps.setInt(3, 1);
                ps.setDouble(4, product.getPrice());

                ps.addBatch();
            }

            ps.executeBatch();

            ps.close();
            con.close();

            System.out.println("Order items saved successfully!");

            return true;

        } catch (Exception e) {

    e.printStackTrace();

    throw new RuntimeException(
        "OrderItemDAO Error: " + e.getMessage(),
        e
    );
}
    }
}