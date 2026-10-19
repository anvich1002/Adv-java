package com.shopsphere.dao;

import com.shopsphere.model.Product;
import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<Product> getAllProducts() {

        List<Product> products = new ArrayList<>();

        String sql = "SELECT product_id, category_id, name, brand, " +
                    "description, price, discount, stock, image_url " +
                    "FROM products WHERE status = TRUE";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Product product = new Product();

                product.setProductId(rs.getInt("product_id"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setName(rs.getString("name"));
                product.setBrand(rs.getString("brand"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                product.setStock(rs.getInt("stock"));
                product.setImageUrl(rs.getString("image_url"));

                products.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }
        public Product getProductById(int productId) {

    Product product = null;

    String sql = "SELECT * FROM products WHERE product_id = ?";

    try {
        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, productId);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            product = new Product();

            product.setProductId(rs.getInt("product_id"));
            product.setCategoryId(rs.getInt("category_id"));
            product.setName(rs.getString("name"));
            product.setBrand(rs.getString("brand"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getDouble("price"));
            product.setDiscount(rs.getDouble("discount"));
            product.setStock(rs.getInt("stock"));
            product.setImageUrl(rs.getString("image_url"));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return product;
}
    }
