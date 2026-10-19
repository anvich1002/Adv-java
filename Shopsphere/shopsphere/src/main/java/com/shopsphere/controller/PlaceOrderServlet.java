package com.shopsphere.controller;

import com.shopsphere.dao.AddressDAO;
import com.shopsphere.dao.OrderDAO;
import com.shopsphere.dao.OrderItemDAO;
import com.shopsphere.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/place-order")
public class PlaceOrderServlet extends HttpServlet {

    private AddressDAO addressDAO;
    private OrderDAO orderDAO;
    private OrderItemDAO orderItemDAO;

    @Override
    public void init() {
        addressDAO = new AddressDAO();
        orderDAO = new OrderDAO();
        orderItemDAO = new OrderItemDAO();
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Check whether user is logged in
        Object userIdObject = session.getAttribute("userId");

        if (userIdObject == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );

            return;
        }

        int userId = (Integer) userIdObject;

        // Get address details
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");

        // Get payment method
        String paymentMethod =
                request.getParameter("paymentMethod");

        // Get cart
        List<Product> cart =
                (List<Product>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {

            response.sendRedirect(
                    request.getContextPath() + "/cart"
            );

            return;
        }

        // Calculate total amount
        double totalAmount = 0;

        for (Product product : cart) {
            totalAmount += product.getPrice();
        }

        // Save address
        int addressId = addressDAO.saveAddress(
                userId,
                address,
                city,
                state,
                pincode
        );

        if (addressId == 0) {

            response.getWriter().println(
                    "Address could not be saved."
            );

            return;
        }

        // Create order
        int orderId = orderDAO.createOrder(
                userId,
                addressId,
                totalAmount,
                paymentMethod
        );

        if (orderId == 0) {

            response.getWriter().println(
                    "Order could not be created."
            );

            return;
        }

        // Save order items
        boolean itemsSaved =
                orderItemDAO.saveOrderItems(
                        orderId,
                        cart
                );

        if (!itemsSaved) {

            response.getWriter().println(
                    "Order items could not be saved."
            );

            return;
        }

        // Store order details in session
        session.setAttribute(
                "orderId",
                orderId
        );

        session.setAttribute(
                "orderTotal",
                totalAmount
        );

        // Clear cart
        session.removeAttribute("cart");

        // Redirect to success page
        response.sendRedirect(
                request.getContextPath()
                        + "/order-success.jsp"
        );
    }
}