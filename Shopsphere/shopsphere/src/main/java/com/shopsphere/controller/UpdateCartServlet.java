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

@WebServlet("/update-cart")
public class UpdateCartServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(
                request.getParameter("id")
        );

        String action = request.getParameter("action");

        HttpSession session = request.getSession();

        List<Product> cart =
                (List<Product>) session.getAttribute("cart");

        if (cart != null) {

            // Increase quantity
            if ("plus".equals(action)) {

                Product foundProduct = null;

                for (Product product : cart) {

                    if (product.getProductId() == productId) {
                        foundProduct = product;
                        break;
                    }
                }

                if (foundProduct != null) {
                    cart.add(foundProduct);
                }
            }

            // Decrease quantity
            else if ("minus".equals(action)) {

                for (int i = 0; i < cart.size(); i++) {

                    if (cart.get(i).getProductId() == productId) {

                        cart.remove(i);
                        break;
                    }
                }
            }

            session.setAttribute("cart", cart);
        }

        response.sendRedirect(
                request.getContextPath() + "/cart"
        );
    }
}