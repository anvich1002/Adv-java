package com.shopsphere.dao;

import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AddressDAO {

    public int saveAddress(
            int userId,
            String addressLine,
            String city,
            String state,
            String pincode) {

        int addressId = 0;

        String sql = """
                INSERT INTO addresses
                (user_id, address_line, city, state, pincode, address_type)
                VALUES (?, ?, ?, ?, ?, ?)
                """;

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                            sql,
                            java.sql.Statement.RETURN_GENERATED_KEYS
                    );

            ps.setInt(1, userId);
            ps.setString(2, addressLine);
            ps.setString(3, city);
            ps.setString(4, state);
            ps.setString(5, pincode);
            ps.setString(6, "HOME");

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();

            if (rs.next()) {
                addressId = rs.getInt(1);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return addressId;
    }
}