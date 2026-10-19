<%
    Integer orderId = (Integer) session.getAttribute("orderId");
    Double orderTotal = (Double) session.getAttribute("orderTotal");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Order Successful - ShopSphere</title>

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
            font-size: 25px;
            font-weight: bold;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 28px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 15px;
            transition: 0.2s;
        }

        .nav-links a:hover {
            color: #ff9f43;
        }


        /* SUCCESS SECTION */

        .success-container {
            min-height: calc(100vh - 70px);

            display: flex;
            justify-content: center;
            align-items: center;

            padding: 40px 20px;
        }

        .success-card {
            background: white;

            width: 500px;
            max-width: 100%;

            padding: 45px 40px;

            border-radius: 18px;

            text-align: center;

            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
        }


        /* CHECK ICON */

        .success-icon {
            width: 80px;
            height: 80px;

            margin: 0 auto 20px;

            border-radius: 50%;

            background: #e8f8ef;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 42px;

            color: #20a05a;
        }


        .success-card h1 {
            font-size: 30px;
            margin-bottom: 12px;
        }

        .success-message {
            color: #777;
            font-size: 16px;
            margin-bottom: 30px;
        }


        /* ORDER DETAILS */

        .order-box {
            background: #f8f8fa;

            border-radius: 12px;

            padding: 20px;

            text-align: left;

            margin-bottom: 30px;
        }

        .order-row {
            display: flex;
            justify-content: space-between;

            padding: 10px 0;

            border-bottom: 1px solid #e5e5e5;
        }

        .order-row:last-child {
            border-bottom: none;
        }

        .order-label {
            color: #777;
        }

        .order-value {
            font-weight: bold;
        }


        /* BUTTONS */

        .buttons {
            display: flex;
            gap: 12px;

            justify-content: center;
        }

        .btn {
            display: inline-block;

            padding: 12px 20px;

            border-radius: 8px;

            text-decoration: none;

            font-weight: bold;

            transition: 0.2s;
        }

        .btn-primary {
            background: #222;
            color: white;
        }

        .btn-primary:hover {
            background: #333;
        }

        .btn-secondary {
            background: #fff4e8;
            color: #d97706;

            border: 1px solid #ffd8a8;
        }

        .btn-secondary:hover {
            background: #ffe8cc;
        }


        /* MOBILE */

        @media (max-width: 600px) {

            .navbar {
                padding: 0 20px;
            }

            .nav-links {
                gap: 12px;
            }

            .nav-links a {
                font-size: 12px;
            }

            .success-card {
                padding: 35px 20px;
            }

            .buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
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


<!-- SUCCESS -->

<div class="success-container">

    <div class="success-card">


        <div class="success-icon">
            &#9989;
        </div>


        <h1>
            Order Placed Successfully!
        </h1>


        <p class="success-message">
            Thank you for shopping with ShopSphere.
            Your order has been successfully placed.
        </p>


        <!-- ORDER DETAILS -->

        <div class="order-box">

            <div class="order-row">

                <span class="order-label">
                    Order ID
                </span>

                <span class="order-value">
                   &#x23; <%= orderId %>
                </span>

            </div>


            <div class="order-row">

                <span class="order-label">
                    Total Amount
                </span>

                <span class="order-value">
                    &#8377;<%= orderTotal %>
                </span>

            </div>


            <div class="order-row">

                <span class="order-label">
                    Payment
                </span>

                <span class="order-value">
                    Cash / Selected Method
                </span>

            </div>


            <div class="order-row">

                <span class="order-label">
                    Status
                </span>

                <span class="order-value">
                    Placed
                </span>

            </div>

        </div>


        <!-- BUTTONS -->

        <div class="buttons">

            <a class="btn btn-primary"
               href="<%= request.getContextPath() %>/orders">
                View My Orders
            </a>

            <a class="btn btn-secondary"
               href="<%= request.getContextPath() %>/products">
                Continue Shopping
            </a>

        </div>


    </div>

</div>


</body>

</html>