<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ShopSphere - Register</title>

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


/* ================= REGISTER AREA ================= */

.register-container {

    min-height: calc(100vh - 70px);

    display: flex;

    justify-content: center;

    align-items: center;

    padding: 40px 20px;
}


/* ================= REGISTER CARD ================= */

.register-card {

    width: 450px;

    max-width: 100%;

    background: white;

    padding: 38px;

    border-radius: 18px;

    border: 1px solid #eee;

    box-shadow:
        0 8px 30px rgba(0,0,0,0.08);
}


/* ================= TITLE ================= */

.register-title {

    text-align: center;

    font-size: 28px;

    margin-bottom: 8px;
}

.register-subtitle {

    text-align: center;

    color: #777;

    font-size: 14px;

    margin-bottom: 28px;
}


/* ================= FORM ================= */

.form-group {

    margin-bottom: 18px;
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


/* ================= REGISTER BUTTON ================= */

.register-btn {

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

.register-btn:hover {

    background: #d97706;
}


/* ================= LOGIN LINK ================= */

.login-section {

    text-align: center;

    margin-top: 25px;

    padding-top: 20px;

    border-top: 1px solid #eee;

    font-size: 14px;

    color: #777;
}

.login-link {

    display: inline-block;

    margin-top: 8px;

    color: #d97706;

    text-decoration: none;

    font-weight: bold;
}

.login-link:hover {

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

    .register-card {

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
            href="<%= request.getContextPath() %>/login.jsp">

            Login

        </a>

    </div>

</div>



<!-- ================= REGISTER ================= -->

<div class="register-container">


    <div class="register-card">


        <h1 class="register-title">

            Create Account

        </h1>


        <p class="register-subtitle">

            Join ShopSphere and start shopping

        </p>



        <form
            action="<%= request.getContextPath() %>/register"
            method="post">


            <!-- NAME -->

            <div class="form-group">

                <label for="name">

                    Full Name

                </label>


                <input
                    type="text"
                    id="name"
                    name="name"
                    class="form-input"
                    placeholder="Enter your name"
                    required>

            </div>



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
                    placeholder="Create a password"
                    required>

            </div>



            <!-- MOBILE -->

            <div class="form-group">

                <label for="mobile">

                    Mobile Number

                </label>


                <input
                    type="text"
                    id="mobile"
                    name="mobile"
                    class="form-input"
                    placeholder="Enter your mobile number"
                    required>

            </div>



            <!-- REGISTER BUTTON -->

            <button
                type="submit"
                class="register-btn">

                Create Account

            </button>


        </form>



        <!-- LOGIN -->

        <div class="login-section">

            <p>

                Already have an account?

            </p>


            <a
                class="login-link"
                href="<%= request.getContextPath() %>/login.jsp">

                Login to ShopSphere

            </a>

        </div>


    </div>

</div>


</body>

</html>