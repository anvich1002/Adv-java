package com.shopsphere.controller;

import com.shopsphere.dao.OrderDAO;
import com.shopsphere.model.OrderData;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/orders")
public class OrdersServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Check login
        Object userIdObject = session.getAttribute("userId");

        if (userIdObject == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );

            return;
        }

        int userId = (Integer) userIdObject;

        // Get user's orders
        List<OrderData> orders =
                orderDAO.getOrdersByUserId(userId);

        // Send orders to JSP
        request.setAttribute("orders", orders);

        request.getRequestDispatcher("/orders.jsp")
                .forward(request, response);
    }
}