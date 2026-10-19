<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Checkout - ShopSphere</title>

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
            text-decoration: none;
            font-size: 26px;
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
            color: #f0a04b;
        }

        /* ================= CONTAINER ================= */

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 45px auto;
        }

        .page-title {
            font-size: 32px;
            margin-bottom: 30px;
        }

        /* ================= CHECKOUT LAYOUT ================= */

        .checkout-layout {
            display: flex;
            gap: 30px;
            align-items: flex-start;
        }

        .checkout-card {
            flex: 1;
            background: white;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .summary {
            width: 300px;
            background: white;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        /* ================= SECTION ================= */

        .section-title {
            font-size: 21px;
            margin-top: 0;
            margin-bottom: 20px;
        }

        .section {
            margin-bottom: 35px;
        }

        /* ================= FORM ================= */

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: 600;
        }

        input,
        textarea {
            width: 100%;
            padding: 12px;

            border: 1px solid #ddd;
            border-radius: 7px;

            font-size: 15px;
            outline: none;
        }

        input:focus,
        textarea:focus {
            border-color: #f0a04b;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        /* ================= PAYMENT ================= */

        .payment-option {
            display: flex;
            align-items: center;

            padding: 14px;

            margin-bottom: 12px;

            border: 1px solid #ddd;
            border-radius: 8px;

            cursor: pointer;
        }

        .payment-option:hover {
            border-color: #f0a04b;
            background: #fffaf5;
        }

        .payment-option input {
            width: auto;
            margin-right: 12px;
        }

        .payment-name {
            font-weight: bold;
        }

        /* ================= SUMMARY ================= */

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

        .total {
            border-top: 1px solid #ddd;
            padding-top: 18px;

            display: flex;
            justify-content: space-between;

            font-size: 21px;
            font-weight: bold;
        }

        /* ================= BUTTON ================= */

        .place-order-btn {
            width: 100%;

            padding: 14px;

            border: none;
            border-radius: 7px;

            background: #f0a04b;
            color: white;

            font-size: 16px;
            font-weight: bold;

            cursor: pointer;
        }

        .place-order-btn:hover {
            background: #d97706;
        }

        .back-cart {
            display: inline-block;

            margin-top: 20px;

            color: #555;
            text-decoration: none;
        }

        .back-cart:hover {
            color: #f0a04b;
        }

        /* ================= MOBILE ================= */

        @media (max-width: 800px) {

            .navbar {
                flex-direction: column;
                gap: 15px;
                padding: 15px 20px;
            }

            .nav-links {
                gap: 15px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .checkout-layout {
                flex-direction: column;
            }

            .summary {
                width: 100%;
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

    <a
        class="logo"
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
        Checkout
    </h1>


    <div class="checkout-layout">


        <!-- ================= FORM ================= -->

        <div class="checkout-card">

            <form
                action="<%= request.getContextPath() %>/place-order"
                method="post">


                <!-- DELIVERY ADDRESS -->

                <div class="section">

                    <h2 class="section-title">
                        Delivery Address
                    </h2>


                    <div class="form-group">

                        <label>
                            Complete Address
                        </label>

                        <textarea
                            name="address"
                            placeholder="Enter your complete address"
                            required></textarea>

                    </div>


                    <div class="form-group">

                        <label>
                            City
                        </label>

                        <input
                            type="text"
                            name="city"
                            placeholder="Enter city"
                            required>

                    </div>


                    <div class="form-group">

                        <label>
                            State
                        </label>

                        <input
                            type="text"
                            name="state"
                            placeholder="Enter state"
                            required>

                    </div>


                    <div class="form-group">

                        <label>
                            PIN Code
                        </label>

                        <input
                            type="text"
                            name="pincode"
                            placeholder="Enter PIN code"
                            required>

                    </div>

                </div>


                <!-- PAYMENT -->

                <div class="section">

                    <h2 class="section-title">
                        Payment Method
                    </h2>


                    <label class="payment-option">

                        <input
                            type="radio"
                            name="paymentMethod"
                            value="COD"
                            checked>

                        <span class="payment-name">
                            Cash on Delivery
                        </span>

                    </label>


                    <label class="payment-option">

                        <input
                            type="radio"
                            name="paymentMethod"
                            value="UPI">

                        <span class="payment-name">
                            UPI
                        </span>

                    </label>


                    <label class="payment-option">

                        <input
                            type="radio"
                            name="paymentMethod"
                            value="CARD">

                        <span class="payment-name">
                            Card
                        </span>

                    </label>

                </div>


                <!-- BUTTON -->

                <button
                    type="submit"
                    class="place-order-btn">

                    Place Order

                </button>


            </form>


            <a
                class="back-cart"
                href="<%= request.getContextPath() %>/cart">

                &#x2190; Back to Cart

            </a>

        </div>


        <!-- ================= SUMMARY ================= -->

        <div class="summary">

            <h2>
                Order Summary
            </h2>


            <div class="summary-row">

                <span>
                    Items
                </span>

                <span>
                    Cart
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


            <div class="total">

                <span>
                    Total
                </span>

                <span>
                    Pay at checkout
                </span>

            </div>

        </div>


    </div>

</div>

</body>

</html>