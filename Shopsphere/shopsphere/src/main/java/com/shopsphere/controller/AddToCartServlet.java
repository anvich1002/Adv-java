package com.shopsphere.controller;

import com.shopsphere.model.Product;
import com.shopsphere.service.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(
                request.getParameter("id")
        );

        Product product = productService.getProductById(productId);

        HttpSession session = request.getSession();

        List<Product> cart =
                (List<Product>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        if (product != null) {
            cart.add(product);
        }

        session.setAttribute("cart", cart);

        response.sendRedirect(
                request.getContextPath() + "/cart"
        );
    }
}
