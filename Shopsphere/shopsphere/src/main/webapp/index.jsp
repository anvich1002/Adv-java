<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - Home</title>

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


        /* ================= HERO ================= */

        .hero {
            min-height: 500px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 60px 20px;

            background:
                linear-gradient(
                    135deg,
                    #20202b,
                    #343445
                );

            color: white;
        }

        .hero-content {
            max-width: 750px;
        }

        .hero h1 {
            font-size: 52px;
            margin-bottom: 18px;
        }

        .hero h1 span {
            color: #f7a23b;
        }

        .hero p {
            font-size: 19px;
            color: #ddd;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .shop-btn {
            display: inline-block;
            padding: 14px 28px;
            background: #f7a23b;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            transition: 0.2s;
        }

        .shop-btn:hover {
            background: #d97706;
            transform: translateY(-2px);
        }


        /* ================= FEATURES ================= */

        .features {
            width: 86%;
            max-width: 1100px;
            margin: 50px auto;

            display: grid;
            grid-template-columns:
                repeat(3, 1fr);

            gap: 25px;
        }

        .feature-card {
            background: white;
            padding: 30px;
            text-align: center;
            border-radius: 15px;
            border: 1px solid #eee;

            box-shadow:
                0 5px 20px rgba(0,0,0,0.06);

            transition: 0.25s;
        }

        .feature-card:hover {
            transform: translateY(-5px);

            box-shadow:
                0 10px 25px rgba(0,0,0,0.10);
        }

        .feature-icon {
            font-size: 35px;
            margin-bottom: 15px;
        }

        .feature-card h3 {
            margin-bottom: 10px;
        }

        .feature-card p {
            color: #777;
            font-size: 14px;
            line-height: 1.5;
        }


        /* ================= QUICK LINKS ================= */

        .quick-section {
            width: 86%;
            max-width: 1100px;
            margin: 60px auto;
            text-align: center;
        }

        .quick-section h2 {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .quick-section > p {
            color: #777;
            margin-bottom: 30px;
        }

        .quick-links {
            display: grid;
            grid-template-columns:
                repeat(4, 1fr);

            gap: 20px;
        }

        .quick-card {
            background: white;
            padding: 25px;
            border-radius: 12px;

            border: 1px solid #eee;

            text-decoration: none;
            color: #222;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.06);

            transition: 0.2s;
        }

        .quick-card:hover {
            transform: translateY(-4px);
            border-color: #f7a23b;
        }

        .quick-card h3 {
            margin-bottom: 8px;
        }

        .quick-card p {
            color: #777;
            font-size: 13px;
        }


        /* ================= FOOTER ================= */

        .footer {
            background: #20202b;
            color: #aaa;
            text-align: center;
            padding: 25px;
            margin-top: 60px;
            font-size: 14px;
        }


        /* ================= RESPONSIVE ================= */

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

            .hero h1 {
                font-size: 38px;
            }

            .hero p {
                font-size: 16px;
            }

            .features {
                grid-template-columns: 1fr;
            }

            .quick-links {
                grid-template-columns: 1fr 1fr;
            }
        }


        @media (max-width: 500px) {

            .quick-links {
                grid-template-columns: 1fr;
            }

        }

    </style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<div class="navbar">

    <a
        class="logo"
        href="<%= request.getContextPath() %>/">

        ShopSphere

    </a>


    <div class="nav-links">

        <a
            href="<%= request.getContextPath() %>/products">

            Products

        </a>

        <a
            href="<%= request.getContextPath() %>/cart">

            Cart

        </a>

        <a
            href="<%= request.getContextPath() %>/wishlist">

            Wishlist

        </a>

        <a
            href="<%= request.getContextPath() %>/orders">

            My Orders

        </a>

        <a
            href="<%= request.getContextPath() %>/login.jsp">

            Login

        </a>

    </div>

</div>



<!-- ================= HERO ================= -->

<section class="hero">

    <div class="hero-content">

        <h1>
            Welcome to
            <span>ShopSphere</span>
        </h1>

        <p>
            Discover amazing products, add your favorites
            to wishlist, and enjoy a simple shopping experience.
        </p>

        <a
            class="shop-btn"
            href="<%= request.getContextPath() %>/login.jsp">

            Start Shopping

        </a>

    </div>

</section>



<!-- ================= FEATURES ================= -->

<div class="features">


    <div class="feature-card">

        <div class="feature-icon">
            &#128722;
        </div>

        <h3>
            Easy Shopping
        </h3>

        <p>
            Browse products and add them
            to your cart easily.
        </p>

    </div>



    <div class="feature-card">

        <div class="feature-icon">
            &#10084;
        </div>

        <h3>
            Wishlist
        </h3>

        <p>
            Save your favorite products
            for later.
        </p>

    </div>



    <div class="feature-card">

        <div class="feature-icon">
            &#128230;
        </div>

        <h3>
            Track Orders
        </h3>

        <p>
            View your previous orders
            from the My Orders section.
        </p>

    </div>

</div>



<!-- ================= QUICK LINKS ================= -->

<section class="quick-section">

    <h2>
        Explore ShopSphere
    </h2>

    <p>
        Everything you need in one place.
    </p>


    <div class="quick-links">


        <a
            class="quick-card"
            href="<%= request.getContextPath() %>/products">

            <h3>
                Products
            </h3>

            <p>
                Explore our latest products
            </p>

        </a>



        <a
            class="quick-card"
            href="<%= request.getContextPath() %>/cart">

            <h3>
                Shopping Cart
            </h3>

            <p>
                View and manage your cart
            </p>

        </a>



        <a
            class="quick-card"
            href="<%= request.getContextPath() %>/wishlist">

            <h3>
                Wishlist
            </h3>

            <p>
                View your saved products
            </p>

        </a>



        <a
            class="quick-card"
            href="<%= request.getContextPath() %>/orders">

            <h3>
                My Orders
            </h3>

            <p>
                Check your order history
            </p>

        </a>

    </div>

</section>



<!-- ================= FOOTER ================= -->

<div class="footer">

    <p>
        &copy; 2026 ShopSphere. All rights reserved.
    </p>

</div>


</body>

</html>