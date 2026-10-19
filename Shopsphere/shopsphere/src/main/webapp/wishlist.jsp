<%@ page import="java.util.List" %>
<%@ page import="com.shopsphere.model.Product" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>My Wishlist - ShopSphere</title>

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


        /* ================= NAVBAR ================= */

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


        /* ================= CONTAINER ================= */

        .container {
            width: 86%;
            max-width: 1200px;
            margin: 40px auto;
        }

        .page-title {
            font-size: 30px;
            margin-bottom: 8px;
            color: #e11d48;
        }

        .page-subtitle {
            color: #777;
            margin-bottom: 30px;
        }


        /* ================= PRODUCTS ================= */

        .products {
            display: grid;

            grid-template-columns:
                repeat(auto-fill, minmax(240px, 1fr));

            gap: 25px;
        }


        /* ================= CARD ================= */

        .card {
            background: white;

            width: 100%;

            padding: 22px;

            border-radius: 15px;

            position: relative;

            border: 1px solid #eee;

            box-shadow:
                0 5px 20px rgba(0, 0, 0, 0.06);

            transition: 0.25s;
        }

        .card:hover {
            transform: translateY(-5px);

            box-shadow:
                0 10px 25px rgba(0, 0, 0, 0.10);
        }


        /* ================= HEART ================= */

        /* IMPORTANT:
           Heart is now only a display icon.
           It is NOT a link.
        */
        .product-image {
    width: 100%;
    height: 210px;
    object-fit: contain;
    border-radius: 12px;
    background: #f8f8f8;
    margin-bottom: 18px;
    display: block;
}

        .wishlist-heart {

            position: absolute;

            top: 18px;
            right: 18px;

            width: 38px;
            height: 38px;

            border-radius: 50%;

            background: #fff1f2;

            display: flex;
            align-items: center;
            justify-content: center;

            color: #e11d48;

            font-size: 21px;

            z-index: 2;

            pointer-events: none;
        }


        /* ================= PRODUCT ================= */

        .product-name {
            font-size: 20px;

            margin-bottom: 12px;

            padding-right: 50px;
        }

        .brand {
            color: #555;

            font-size: 14px;

            margin-bottom: 10px;
        }

        .description {
            color: #777;

            font-size: 14px;

            line-height: 1.5;

            min-height: 42px;

            margin-bottom: 15px;
        }

        .price {
            font-size: 20px;

            font-weight: bold;

            margin-bottom: 8px;
        }

        .discount {
            display: inline-block;

            background: #e8f8ef;

            color: #16834b;

            padding: 5px 9px;

            border-radius: 15px;

            font-size: 12px;

            font-weight: bold;

            margin-bottom: 8px;
        }

        .stock {
            color: #777;

            font-size: 13px;

            margin-bottom: 18px;
        }


        /* ================= BUTTON AREA ================= */

        .buttons {
            display: flex;

            gap: 8px;

            flex-wrap: wrap;
        }


        /* ================= SAME CART STYLE AS PRODUCTS JSP ================= */

        .btn {
            display: inline-block;

            padding: 10px 15px;

            text-decoration: none;

            border-radius: 6px;

            font-size: 13px;

            font-weight: bold;

            transition: 0.2s;
        }


        .btn-cart {

            background: #f7a23b;

            color: white;

            border: 1px solid #f7a23b;
        }

        .btn-cart:hover {

            background: #d97706;

            border-color: #d97706;
        }


        /* ================= REMOVE ================= */

        .btn-remove {

            background: #fff1f2;

            color: #e11d48;

            border: 1px solid #fecdd3;
        }

        .btn-remove:hover {

            background: #ffe4e6;
        }


        /* ================= EMPTY ================= */

        .empty {

            background: white;

            padding: 65px 20px;

            text-align: center;

            border-radius: 15px;

            box-shadow:
                0 5px 20px rgba(0, 0, 0, 0.06);
        }

        .empty-icon {

            font-size: 60px;

            color: #e11d48;

            margin-bottom: 15px;
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

            background: #222;

            color: white;

            text-decoration: none;

            border-radius: 8px;

            font-weight: bold;
        }

        .shop-btn:hover {
            background: #333;
        }


        /* ================= MOBILE ================= */

        @media (max-width: 700px) {

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
            &#10084; Wishlist
        </a>

        <a href="<%= request.getContextPath() %>/orders">
            My Orders
        </a>

    </div>

</div>


<!-- ================= MAIN ================= -->

<div class="container">

    <h1 class="page-title">
        &#10084; My Wishlist
    </h1>

    <p class="page-subtitle">
        Products you've saved for later
    </p>


<%
    List<Product> wishlistProducts =
        (List<Product>) request.getAttribute(
            "wishlistProducts"
        );

    if (wishlistProducts != null &&
        !wishlistProducts.isEmpty()) {
%>


<div class="products">


<%
    for (Product product : wishlistProducts) {
%>


<!-- ================= PRODUCT CARD ================= -->

<div class="card">


    <!-- HEART
         This is NOT clickable.
         Clicking it will NOT remove product.
    -->

    <div class="wishlist-heart">

        &#10084;
        
    </div>


    <!-- PRODUCT NAME -->

    <h2 class="product-name">

        <%= product.getName() %>

    </h2>
    <img class="product-image"
     src="<%= request.getContextPath() %>/<%= product.getImageUrl() %>"
     alt="<%= product.getName() %>">


    <!-- BRAND -->

    <p class="brand">

        <strong>Brand:</strong>
        <%= product.getBrand() %>

    </p>


    <!-- DESCRIPTION -->

    <p class="description">

        <%= product.getDescription() %>

    </p>


    <!-- PRICE -->

    <p class="price">

        &#8377;<%= product.getPrice() %>

    </p>


    <!-- DISCOUNT -->

    <span class="discount">

        <%= product.getDiscount() %>% OFF

    </span>


    <!-- STOCK -->

    <p class="stock">

        Stock:
        <%= product.getStock() %>

    </p>


    <!-- BUTTONS -->

    <div class="buttons">


        <!-- SAME CART BUTTON STYLE -->

        <a class="btn btn-cart"
           href="<%= request.getContextPath() %>/add-to-cart?id=<%= product.getProductId() %>">

            &#128722; Add 

        </a>


        <!-- ONLY THIS BUTTON REMOVES -->

        <a class="btn btn-remove"
           href="<%= request.getContextPath() %>/remove-from-wishlist?id=<%= product.getProductId() %>">

            &#128465; Remove

        </a>


    </div>


</div>


<%
    }
%>


</div>


<%
    } else {
%>


<!-- ================= EMPTY ================= -->

<div class="empty">

    <div class="empty-icon">
        ♡
    </div>

    <h2>
        Your Wishlist is Empty
    </h2>

    <p>
        Save products you love and find them here later.
    </p>

    <a class="shop-btn"
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