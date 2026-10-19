<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="com.shopsphere.model.Product" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Shopping Cart - ShopSphere</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f8f4f8;
            color: #333;
        }

        /* ================= NAVBAR ================= */

        .navbar {
            background: #222;
            padding: 18px 45px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
        }

        .logo {
            color: white;
            font-size: 26px;
            font-weight: bold;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
        }

        .nav-links a:hover {
            color: #f0a04b;
        }

        /* ================= CONTAINER ================= */

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 45px auto;
        }

        .page-title {
            font-size: 32px;
            margin-bottom: 30px;
            color: #333;
        }

        /* ================= CART LAYOUT ================= */

        .cart-layout {
            display: flex;
            gap: 30px;
            align-items: flex-start;
        }

        .cart-items {
            flex: 1;
        }

        /* ================= PRODUCT CARD ================= */

        .cart-card {
            background: white;
            border-radius: 14px;
            padding: 24px;

            margin-bottom: 20px;

            box-shadow: 0 4px 15px rgba(0,0,0,0.08);

            transition: 0.2s;
        }

        .cart-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.12);
        }
      

        .product-name {
            font-size: 21px;
            margin: 0 0 8px;
            color: #333;
        }
          .product-image {
    width: 100%;
    height: 210px;
    object-fit: contain;
    border-radius: 12px;
    background: #f8f8f8;
    margin-bottom: 18px;
    display: block;
}

        .brand {
            color: #777;
            margin: 5px 0;
        }

        .price {
            font-size: 18px;
            font-weight: bold;
            margin-top: 15px;
        }

        /* ================= QUANTITY ================= */

        .quantity-section {
            margin-top: 18px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .quantity-label {
            font-weight: bold;
        }

        .qty-btn {
            display: inline-flex;

            width: 32px;
            height: 32px;

            align-items: center;
            justify-content: center;

            background: #f0a04b;
            color: white;

            text-decoration: none;

            border-radius: 6px;

            font-size: 20px;
            font-weight: bold;
        }

        .qty-btn:hover {
            background: #d97706;
        }

        .quantity {
            min-width: 30px;
            text-align: center;
            font-weight: bold;
            font-size: 17px;
        }

        /* ================= ITEM TOTAL ================= */

        .item-total {
            margin-top: 15px;
            font-weight: bold;
            font-size: 17px;
        }

        /* ================= REMOVE BUTTON ================= */

        .remove-btn {
            display: inline-block;

            margin-top: 15px;

            padding: 9px 14px;

            background: #fff1f2;
            color: #e11d48;

            border: 1px solid #fecdd3;

            border-radius: 6px;

            text-decoration: none;

            font-size: 14px;
        }

        .remove-btn:hover {
            background: #ffe4e6;
        }

        /* ================= SUMMARY ================= */

        .summary {
            width: 320px;

            background: white;

            padding: 25px;

            border-radius: 14px;

            box-shadow: 0 4px 15px rgba(0,0,0,0.08);

            position: sticky;
            top: 25px;
        }

        .summary h2 {
            margin-top: 0;
            margin-bottom: 25px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;

            margin: 15px 0;

            color: #555;
        }

        .summary-total {
            border-top: 1px solid #ddd;

            padding-top: 18px;

            display: flex;
            justify-content: space-between;

            font-size: 21px;
            font-weight: bold;
        }

        /* ================= CHECKOUT BUTTON ================= */

        .checkout-btn {
            display: block;

            width: 100%;

            margin-top: 25px;

            padding: 13px;

            background: #f0a04b;
            color: white;

            text-align: center;

            text-decoration: none;

            border-radius: 7px;

            font-weight: bold;
        }

        .checkout-btn:hover {
            background: #d97706;
        }

        /* ================= CONTINUE SHOPPING ================= */

        .continue-btn {
            display: block;

            width: 100%;

            margin-top: 12px;

            padding: 12px;

            background: #222;
            color: white;

            text-align: center;

            text-decoration: none;

            border-radius: 7px;
        }

        .continue-btn:hover {
            background: #444;
        }

        /* ================= EMPTY CART ================= */

        .empty-cart {
            background: white;

            padding: 60px 30px;

            text-align: center;

            border-radius: 14px;

            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .empty-cart-icon {
            font-size: 55px;
            margin-bottom: 15px;
        }

        .empty-cart h2 {
            margin-bottom: 10px;
        }

        .empty-cart p {
            color: #777;
        }

        .shop-btn {
            display: inline-block;

            margin-top: 20px;

            padding: 12px 22px;

            background: #f0a04b;
            color: white;

            text-decoration: none;

            border-radius: 7px;
        }

        .shop-btn:hover {
            background: #d97706;
        }

        /* ================= MOBILE ================= */

        @media (max-width: 800px) {

            .navbar {
                padding: 15px 20px;
                flex-direction: column;
                gap: 15px;
            }

            .nav-links {
                gap: 15px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .cart-layout {
                flex-direction: column;
            }

            .summary {
                width: 100%;
                position: static;
            }

            .container {
                width: 94%;
            }
        }

    </style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

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
            &#128722; Cart
        </a>

        <a href="<%= request.getContextPath() %>/wishlist">
            &#9825; Wishlist
        </a>

        <a href="<%= request.getContextPath() %>/orders">
            My Orders
        </a>

    </div>

</div>


<!-- ================= MAIN ================= -->

<div class="container">

    <h1 class="page-title">
        &#128722; Shopping Cart
    </h1>


<%

    List<Product> cart =
        (List<Product>) request.getAttribute("cart");


    if (cart != null && !cart.isEmpty()) {


        /*
         * Same product ko ek hi card me show karne ke liye
         * quantity calculate kar rahe hain.
         */

        Map<Integer, Product> uniqueProducts =
            new LinkedHashMap<>();

        Map<Integer, Integer> quantities =
            new LinkedHashMap<>();


        for (Product product : cart) {

            int id = product.getProductId();

            uniqueProducts.put(id, product);

            quantities.put(
                id,
                quantities.getOrDefault(id, 0) + 1
            );
        }


        double total = 0;


%>


<div class="cart-layout">


    <!-- ================= CART ITEMS ================= -->

    <div class="cart-items">


<%

        for (Integer id : uniqueProducts.keySet()) {

            Product product =
                uniqueProducts.get(id);

            int quantity =
                quantities.get(id);


            double itemTotal =
                product.getPrice() * quantity;


            total += itemTotal;

%>


        <div class="cart-card">


            <h2 class="product-name">

                <%= product.getName() %>

            </h2>
            <img class="product-image"
     src="<%= request.getContextPath() %>/<%= product.getImageUrl() %>"
     alt="<%= product.getName() %>">


            <p class="brand">

                Brand:
                <strong>
                    <%= product.getBrand() %>
                </strong>

            </p>


            <p class="price">

                Price:
                &#8377;<%= product.getPrice() %>
            </p>


            <!-- Quantity -->

            <div class="quantity-section">

                <span class="quantity-label">
                    Quantity:
                </span>


                <a
                    class="qty-btn"
                    href="<%= request.getContextPath() %>/update-cart?id=<%= id %>&action=minus">
                    -
                </a>


                <span class="quantity">
                    <%= quantity %>
                </span>


                <a
                    class="qty-btn"
                    href="<%= request.getContextPath() %>/update-cart?id=<%= id %>&action=plus">
                    +
                </a>

            </div>


            <!-- Item Total -->

            <p class="item-total">

                Item Total:
                &#8377;<%= itemTotal %>

            </p>


            <!-- Remove -->

            <a
                class="remove-btn"
                href="<%= request.getContextPath() %>/remove-from-cart?id=<%= id %>">

                Remove from Cart

            </a>


        </div>


<%

        }

%>


    </div>


    <!-- ================= ORDER SUMMARY ================= -->

    <div class="summary">


        <h2>
            Order Summary
        </h2>


        <div class="summary-row">

            <span>
                Items
            </span>

            <span>
                <%= cart.size() %>
            </span>

        </div>


        <div class="summary-row">

            <span>
                Subtotal
            </span>

            <span>
                &#8377;<%= total %>
            </span>

        </div>


        <div class="summary-row">

            <span>
                Delivery
            </span>

            <span>
                FREE
            </span>

        </div>


        <div class="summary-total">

            <span>
                Total
            </span>

            <span>
                &#8377;<%= total %>
            </span>

        </div>


        <!-- Checkout -->

        <a
            class="checkout-btn"
            href="<%= request.getContextPath() %>/checkout.jsp">

            Proceed to Checkout

        </a>


        <!-- Continue Shopping -->

        <a
            class="continue-btn"
            href="<%= request.getContextPath() %>/products">

            Continue Shopping

        </a>


    </div>


</div>


<%

    } else {

%>


<!-- ================= EMPTY CART ================= -->

<div class="empty-cart">

    <div class="empty-cart-icon">
        &#128722;
    </div>

    <h2>
        Your Cart is Empty
    </h2>

    <p>
        Looks like you haven't added anything to your cart yet.
    </p>


    <a
        class="shop-btn"
        href="<%= request.getContextPath() %>/products">

        Start Shopping

    </a>

</div>


<%

    }

%>


</div>

</body>

</html>