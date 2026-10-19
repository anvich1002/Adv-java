<%@ page import="java.util.List" %>
<%@ page import="com.shopsphere.model.Product" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Products - ShopSphere</title>

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
}

.page-subtitle {
    color: #777;
    margin-bottom: 30px;
}


/* ================= PRODUCTS GRID ================= */

.products {
    display: grid;

    grid-template-columns:
        repeat(auto-fill, minmax(240px, 1fr));

    gap: 25px;
}


/* ================= PRODUCT CARD ================= */

.card {
    background: white;

    width: 100%;

    padding: 22px;

    border-radius: 15px;

    position: relative;

    border: 1px solid #eee;

    box-shadow:
        0 5px 20px rgba(0,0,0,0.06);

    transition: 0.25s;
}

.card:hover {

    transform: translateY(-5px);

    box-shadow:
        0 10px 25px rgba(0,0,0,0.10);
}


/* ================= WISHLIST HEART ================= */

.wishlist-heart {

    position: absolute;

    top: 18px;
    right: 18px;

    width: 38px;
    height: 38px;

    border-radius: 50%;

    background: white;

    display: flex;

    align-items: center;
    justify-content: center;

    color: #999;

    font-size: 21px;

    text-decoration: none;

    border: 1px solid #ddd;

    transition: 0.2s;

    z-index: 2;
}


/* Hover */

.wishlist-heart:hover {

    color: #e11d48;

    border-color: #e11d48;

    transform: scale(1.08);
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


/* Wishlist mein added product */

.wishlist-heart.active {

    color: #e11d48;

    background: #fff1f2;

    border-color: #fecdd3;
}


/* ================= PRODUCT NAME ================= */

.product-name {

    font-size: 20px;

    margin-bottom: 12px;

    padding-right: 50px;
}


/* ================= BRAND ================= */

.brand {

    color: #555;

    font-size: 14px;

    margin-bottom: 10px;
}


/* ================= DESCRIPTION ================= */

.description {

    color: #777;

    font-size: 14px;

    line-height: 1.5;

    min-height: 42px;

    margin-bottom: 15px;
}


/* ================= PRICE ================= */

.price {

    font-size: 20px;

    font-weight: bold;

    margin-bottom: 8px;
}


/* ================= DISCOUNT ================= */

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


/* ================= STOCK ================= */

.stock {

    color: #777;

    font-size: 13px;

    margin-bottom: 18px;
}


/* ================= BUTTONS ================= */

.buttons {

    display: flex;

    gap: 8px;

    flex-wrap: wrap;
}

.btn {

    display: inline-block;

    padding: 10px 13px;

    border-radius: 7px;

    text-decoration: none;

    font-size: 13px;

    font-weight: bold;

    transition: 0.2s;
}


/* View Details */

.btn-details {

    background: #222;

    color: white;
}

.btn-details:hover {

    background: #333;
}


/* Add To Cart */

.btn-cart {

    background: #f7a23b;

    color: white;

    border: 1px solid #f7a23b;
}

.btn-cart:hover {

    background: #d97706;

    border-color: #d97706;
}


/* ================= EMPTY ================= */

.empty {

    background: white;

    padding: 65px 20px;

    text-align: center;

    border-radius: 15px;

    box-shadow:
        0 5px 20px rgba(0,0,0,0.06);
}

.empty h2 {

    margin-bottom: 10px;
}

.empty p {

    color: #777;
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

    .container {

        width: 92%;
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
            &#128722; Cart
        </a>

        <a
            href="<%= request.getContextPath() %>/wishlist">
             &#9825; Wishlist
        </a>

        <a
            href="<%= request.getContextPath() %>/orders">
            My Orders
        </a>
        <a href="<%= request.getContextPath() %>/logout">
            Logout
        </a>

    </div>

</div>


<!-- ================= MAIN CONTAINER ================= -->

<div class="container">


    <h1 class="page-title">
        ShopSphere Products
    </h1>

    <p class="page-subtitle">
        Explore our latest products
    </p>


<%

List<Product> products =
    (List<Product>)
    request.getAttribute("products");


List<Integer> wishlistIds =
    (List<Integer>)
    request.getAttribute("wishlistIds");


if (products != null && !products.isEmpty()) {

%>


<!-- ================= PRODUCTS ================= -->

<div class="products">


<%

for (Product product : products) {


    boolean isWishlisted =
        wishlistIds != null &&
        wishlistIds.contains(
            product.getProductId()
        );

%>


<!-- ================= PRODUCT CARD ================= -->

<div class="card">


    <!-- HEART -->

    <a
        class="wishlist-heart <%= isWishlisted ? "active" : "" %>"
        href="<%= request.getContextPath() %>/add-to-wishlist?id=<%= product.getProductId() %>"
        title="Add to Wishlist">

        &#10084;
        
    </a>


    <!-- PRODUCT IMAGE -->

    <img
    class="product-image"
    src="<%= request.getContextPath() %>/<%= product.getImageUrl() %>"
    alt="<%= product.getName() %>">
    <!-- PRODUCT NAME -->

    <h2 class="product-name">

        <%= product.getName() %>

    </h2>


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

        Stock: <%= product.getStock() %>

    </p>


    <!-- BUTTONS -->

    <div class="buttons">


        <!-- VIEW DETAILS -->

        <a
            class="btn btn-details"
            href="<%= request.getContextPath() %>/product-details?id=<%= product.getProductId() %>">

            View Details

        </a>


        <!-- ADD TO CART -->

        <a
            class="btn btn-cart"
            href="<%= request.getContextPath() %>/add-to-cart?id=<%= product.getProductId() %>">

            &#128722; Add 

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

    <h2>
        No Products Available
    </h2>

    <p>
        Please check back later.
    </p>

</div>


<%

}

%>


</div>


</body>

</html>