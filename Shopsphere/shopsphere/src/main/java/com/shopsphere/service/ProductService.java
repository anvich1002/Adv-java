package com.shopsphere.service;

import com.shopsphere.dao.ProductDAO;
import com.shopsphere.model.Product;

import java.util.List;

public class ProductService {

    private ProductDAO productDAO;

    public ProductService() {
        productDAO = new ProductDAO();
    }

    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    public Product getProductById(int productId) {
        return productDAO.getProductById(productId);
    }
}