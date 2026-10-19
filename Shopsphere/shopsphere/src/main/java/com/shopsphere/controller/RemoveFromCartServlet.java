package com.shopsphere.controller;

import com.shopsphere.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(
                request.getParameter("id")
        );

        HttpSession session = request.getSession();

        List<Product> cart =
                (List<Product>) session.getAttribute("cart");

        if (cart != null) {

            cart.removeIf(product ->
                    product.getProductId() == productId
            );

            session.setAttribute("cart", cart);
        }

        response.sendRedirect(
                request.getContextPath() + "/cart"
        );
    }
}