package com.shopsphere.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = {
        "/products",
        "/product-details",
        "/cart",
        "/wishlist",
        "/orders",
        "/checkout.jsp",
        "/place-order",
        "/add-to-cart",
        "/add-to-wishlist",
        "/remove-from-wishlist",
        "/remove-from-cart",
        "/update-cart",
        "/add-review"
})
public class LoginFilter implements Filter {

    @Override
    public void doFilter(
            ServletRequest request,
            ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req =
                (HttpServletRequest) request;

        HttpServletResponse res =
                (HttpServletResponse) response;

        HttpSession session =
                req.getSession(false);

        boolean loggedIn =
                session != null &&
                session.getAttribute("userId") != null;

        if (loggedIn) {

            chain.doFilter(request, response);

        } else {

            res.sendRedirect(
                    req.getContextPath() + "/login.jsp"
            );
        }
    }
}