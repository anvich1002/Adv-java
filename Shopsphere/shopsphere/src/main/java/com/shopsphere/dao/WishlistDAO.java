
package com.shopsphere.dao;

import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class WishlistDAO {

    // Add product to wishlist
    public boolean addToWishlist(int userId, int productId) {

        String checkSql =
                "SELECT wishlist_id FROM wishlist " +
                "WHERE user_id = ? AND product_id = ?";

        String insertSql =
                "INSERT INTO wishlist (user_id, product_id) " +
                "VALUES (?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement checkPs =
                     con.prepareStatement(checkSql)) {

            checkPs.setInt(1, userId);
            checkPs.setInt(2, productId);

            ResultSet rs = checkPs.executeQuery();

            // Already exists
            if (rs.next()) {
                return false;
            }

            try (PreparedStatement insertPs =
                         con.prepareStatement(insertSql)) {

                insertPs.setInt(1, userId);
                insertPs.setInt(2, productId);

                return insertPs.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Get wishlist product IDs
    public List<Integer> getWishlistProductIds(int userId) {

        List<Integer> productIds = new ArrayList<>();

        String sql =
                "SELECT product_id FROM wishlist " +
                "WHERE user_id = ? " +
                "ORDER BY created_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps =
                     con.prepareStatement(sql)) {

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                productIds.add(
                        rs.getInt("product_id")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return productIds;
    }


    // Remove product from wishlist
    public boolean removeFromWishlist(
            int userId,
            int productId) {

        String sql =
                "DELETE FROM wishlist " +
                "WHERE user_id = ? AND product_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps =
                     con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
