<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="com.shopsphere.model.OrderData" %>
<%@ page import="com.shopsphere.util.DBConnection" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Orders - ShopSphere</title>

<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: Arial, sans-serif;
    background: #f7f7f9;
    color: #222;
}

/* NAVBAR */

.navbar {
    height: 70px;
    background: #20202b;

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 0 7%;
}

.logo {
    color: white;
    text-decoration: none;
    font-size: 25px;
    font-weight: bold;
}

.nav-links {
    display: flex;
    gap: 28px;
}

.nav-links a {
    color: white;
    text-decoration: none;
    font-size: 15px;
}

.nav-links a:hover {
    color: #ff9f43;
}


/* CONTAINER */

.container {
    width: 86%;
    max-width: 1100px;

    margin: 40px auto;
}

.page-title {
    font-size: 30px;
    margin-bottom: 8px;
}

.page-subtitle {
    color: #777;
    margin-bottom: 30px;
}


/* ORDER CARD */

.order-card {

    background: white;

    border-radius: 15px;

    padding: 25px;

    margin-bottom: 22px;

    border: 1px solid #eee;

    box-shadow: 0 5px 20px rgba(0,0,0,0.06);

    transition: 0.25s;
}

.order-card:hover {

    transform: translateY(-3px);

    box-shadow: 0 10px 25px rgba(0,0,0,0.10);
}


/* ORDER HEADER */

.order-header {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 20px;

    padding-bottom: 15px;

    border-bottom: 1px solid #eee;
}

.order-id {

    font-size: 20px;

    font-weight: bold;
}

.order-date {

    color: #777;

    font-size: 13px;
}


/* ORDER CONTENT */

.order-content {

    display: flex;

    gap: 22px;

    align-items: center;
}


/* PRODUCT IMAGE */

.order-image {

    width: 100px;

    height: 100px;

    object-fit: contain;

    border-radius: 12px;

    border: 1px solid #eee;

    background: #fafafa;

    padding: 8px;

    flex-shrink: 0;
}


/* ORDER DETAILS */

.order-details {

    flex: 1;

    display: grid;

    grid-template-columns: repeat(4, 1fr);

    gap: 15px;
}

.detail-box {

    background: #fafafa;

    padding: 15px;

    border-radius: 10px;
}

.detail-title {

    font-size: 12px;

    color: #999;

    margin-bottom: 7px;
}

.detail-value {

    font-size: 16px;

    font-weight: bold;
}


/* STATUS */

.payment-status {

    color: #f0a04b;

    font-weight: bold;
}

.order-status {

    color: #16834b;

    font-weight: bold;
}


/* TOTAL */

.order-footer {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-top: 20px;

    padding-top: 15px;

    border-top: 1px solid #eee;
}

.payment-method {

    color: #666;

    font-size: 14px;
}

.total {

    font-size: 20px;

    font-weight: bold;
}


/* EMPTY */

.empty {

    background: white;

    padding: 65px 20px;

    text-align: center;

    border-radius: 15px;

    box-shadow: 0 5px 20px rgba(0,0,0,0.06);
}

.empty h2 {

    margin-bottom: 10px;
}

.empty p {

    color: #777;

    margin-bottom: 25px;
}

.shop-btn {

    display: inline-block;

    padding: 12px 22px;

    background: #f0a04b;

    color: white;

    text-decoration: none;

    border-radius: 8px;

    font-weight: bold;
}

.shop-btn:hover {

    background: #d97706;
}


/* MOBILE */

@media (max-width: 800px) {

    .navbar {

        padding: 0 20px;
    }

    .nav-links {

        gap: 12px;
    }

    .nav-links a {

        font-size: 12px;
    }

    .container {

        width: 92%;
    }

    .order-content {

        align-items: flex-start;
    }

    .order-details {

        grid-template-columns: repeat(2, 1fr);
    }

}

@media (max-width: 500px) {

    .order-content {

        flex-direction: column;
    }

    .order-image {

        width: 90px;

        height: 90px;
    }

    .order-details {

        width: 100%;

        grid-template-columns: 1fr;
    }

    .order-header {

        flex-direction: column;

        align-items: flex-start;

        gap: 8px;
    }

}

</style>

</head>


<body>


<!-- NAVBAR -->

<div class="navbar">

    <a class="logo"
       href="<%= request.getContextPath() %>/">

        ShopSphere

    </a>


    <div class="nav-links">

        <a href="<%= request.getContextPath() %>/products">
            Products
        </a>

        <a href="<%= request.getContextPath() %>/cart">
            Cart
        </a>

        <a href="<%= request.getContextPath() %>/wishlist">
            Wishlist
        </a>

        <a href="<%= request.getContextPath() %>/orders">
            My Orders
        </a>

    </div>

</div>



<!-- MAIN -->

<div class="container">

    <h1 class="page-title">
        My Orders
    </h1>

    <p class="page-subtitle">
        View your recent orders and payment details
    </p>


<%

List<OrderData> orders =
    (List<OrderData>) request.getAttribute("orders");


if (orders != null && !orders.isEmpty()) {

    for (OrderData order : orders) {

        String imageUrl = null;

        /*
         * Get first product image of this order
         */

        String sql =
            "SELECT p.image_url " +
            "FROM order_items oi " +
            "JOIN products p " +
            "ON oi.product_id = p.product_id " +
            "WHERE oi.order_id = ? " +
            "LIMIT 1";

        try {

            Connection con =
                DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, order.getOrderId());

            ResultSet rs =
                ps.executeQuery();

            if (rs.next()) {

                imageUrl =
                    rs.getString("image_url");

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

%>


<!-- ORDER CARD -->

<div class="order-card">


    <!-- HEADER -->

    <div class="order-header">

        <div class="order-id">

            Order #<%= order.getOrderId() %>

        </div>


        <div class="order-date">

            <%= order.getCreatedAt() %>

        </div>

    </div>



    <!-- CONTENT -->

    <div class="order-content">


        <!-- PRODUCT IMAGE -->

        <%

        if (imageUrl != null && !imageUrl.trim().isEmpty()) {

        %>

            <img
                class="order-image"
                src="<%= request.getContextPath() %>/<%= imageUrl %>"
                alt="Product Image"
            >

        <%

        } else {

        %>

            <div
                class="order-image"
                style="
                    display:flex;
                    align-items:center;
                    justify-content:center;
                    color:#999;
                    font-size:13px;
                "
            >

                No Image

            </div>

        <%

        }

        %>



        <!-- DETAILS -->

        <div class="order-details">


            <div class="detail-box">

                <div class="detail-title">
                    Total Amount
                </div>

                <div class="detail-value">
                    &#8377;<%= order.getTotalAmount() %>
                </div>

            </div>



            <div class="detail-box">

                <div class="detail-title">
                    Payment Method
                </div>

                <div class="detail-value">

                    <%= order.getPaymentMethod() %>

                </div>

            </div>



            <div class="detail-box">

                <div class="detail-title">
                    Payment Status
                </div>

                <div class="detail-value payment-status">

                    <%= order.getPaymentStatus() %>

                </div>

            </div>



            <div class="detail-box">

                <div class="detail-title">
                    Order Status
                </div>

                <div class="detail-value order-status">

                    <%= order.getOrderStatus() %>

                </div>

            </div>


        </div>

    </div>



    <!-- FOOTER -->

    <div class="order-footer">


        <div class="payment-method">

            Payment:
            <strong>
                <%= order.getPaymentMethod() %>
            </strong>

        </div>


        <div class="total">

            Total:
            &#8377;<%= order.getTotalAmount() %>

        </div>


    </div>


</div>


<%

    }

} else {

%>


<!-- EMPTY ORDERS -->

<div class="empty">

    <h2>
        No Orders Yet
    </h2>

    <p>
        You haven't placed any orders yet.
    </p>

    <a
        class="shop-btn"
        href="<%= request.getContextPath() %>/products"
    >
        Start Shopping
    </a>

</div>


<%

}

%>


</div>

</body>

</html>