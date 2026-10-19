<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    /*
     * If user is already logged in,
     * don't show Login page again.
     */
    if (session.getAttribute("userId") != null) {

        response.sendRedirect(
            request.getContextPath() + "/products"
        );

        return;
    }

    String error = request.getParameter("error");
    String success = request.getParameter("success");
%>


<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - Login</title>


    <style>

        /* ================= GENERAL ================= */

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {

            font-family: Arial, sans-serif;

            background: #f7f7f9;

            color: #222;

            min-height: 100vh;
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


        /* ================= LOGIN AREA ================= */

        .login-container {

            min-height: calc(100vh - 70px);

            display: flex;

            justify-content: center;

            align-items: center;

            padding: 40px 20px;
        }


        /* ================= LOGIN CARD ================= */

        .login-card {

            width: 430px;

            max-width: 100%;

            background: white;

            padding: 38px;

            border-radius: 18px;

            border: 1px solid #eee;

            box-shadow:
                0 8px 30px rgba(0,0,0,0.08);
        }


        /* ================= TITLE ================= */

        .login-title {

            text-align: center;

            font-size: 29px;

            margin-bottom: 8px;
        }


        .login-subtitle {

            text-align: center;

            color: #777;

            font-size: 14px;

            margin-bottom: 28px;
        }


        /* ================= MESSAGE ================= */

        .error-message {

            background: #fff1f2;

            color: #e11d48;

            border: 1px solid #fecdd3;

            padding: 11px;

            border-radius: 7px;

            text-align: center;

            font-size: 14px;

            margin-bottom: 18px;
        }


        .success-message {

            background: #e8f8ef;

            color: #16834b;

            border: 1px solid #b7ebc6;

            padding: 11px;

            border-radius: 7px;

            text-align: center;

            font-size: 14px;

            margin-bottom: 18px;
        }


        /* ================= FORM ================= */

        .form-group {

            margin-bottom: 19px;
        }


        .form-group label {

            display: block;

            font-size: 14px;

            font-weight: bold;

            margin-bottom: 8px;
        }


        .form-input {

            width: 100%;

            padding: 12px 13px;

            border: 1px solid #ddd;

            border-radius: 8px;

            font-size: 14px;

            outline: none;

            transition: 0.2s;
        }


        .form-input:focus {

            border-color: #f7a23b;

            box-shadow:
                0 0 0 3px rgba(247,162,59,0.12);
        }


        /* ================= LOGIN BUTTON ================= */

        .login-btn {

            width: 100%;

            padding: 13px;

            background: #f7a23b;

            color: white;

            border: none;

            border-radius: 8px;

            font-size: 15px;

            font-weight: bold;

            cursor: pointer;

            transition: 0.2s;

            margin-top: 5px;
        }


        .login-btn:hover {

            background: #d97706;
        }


        /* ================= REGISTER ================= */

        .register-section {

            text-align: center;

            margin-top: 25px;

            padding-top: 20px;

            border-top: 1px solid #eee;

            font-size: 14px;

            color: #777;
        }


        .register-link {

            display: inline-block;

            margin-top: 8px;

            color: #d97706;

            text-decoration: none;

            font-weight: bold;
        }


        .register-link:hover {

            text-decoration: underline;
        }


        /* ================= RESPONSIVE ================= */

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


            .login-card {

                padding: 28px 22px;
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
            href="<%= request.getContextPath() %>/register.jsp">

            Register

        </a>


    </div>

</div>



<!-- ================= LOGIN ================= -->

<div class="login-container">


    <div class="login-card">


        <h1 class="login-title">

            Welcome Back

        </h1>


        <p class="login-subtitle">

            Login to your ShopSphere account

        </p>



        <!-- ERROR MESSAGE -->

        <% if ("invalid".equals(error)) { %>

            <div class="error-message">

                Invalid email or password!

            </div>

        <% } %>



        <!-- SUCCESS MESSAGE -->

        <% if ("registered".equals(success)) { %>

            <div class="success-message">

                Registration successful! Please login.

            </div>

        <% } %>



        <!-- LOGIN FORM -->

        <form
            action="<%= request.getContextPath() %>/login"
            method="post">


            <!-- EMAIL -->

            <div class="form-group">

                <label for="email">

                    Email

                </label>


                <input
                    type="email"
                    id="email"
                    name="email"
                    class="form-input"
                    placeholder="Enter your email"
                    required>

            </div>



            <!-- PASSWORD -->

            <div class="form-group">

                <label for="password">

                    Password

                </label>


                <input
                    type="password"
                    id="password"
                    name="password"
                    class="form-input"
                    placeholder="Enter your password"
                    required>

            </div>



            <!-- LOGIN BUTTON -->

            <button
                type="submit"
                class="login-btn">

                Login

            </button>


        </form>



        <!-- REGISTER LINK -->

        <div class="register-section">

            <p>

                Don't have an account?

            </p>


            <a
                class="register-link"
                href="<%= request.getContextPath() %>/register.jsp">

                Create New Account

            </a>

        </div>


    </div>

</div>


</body>

</html>