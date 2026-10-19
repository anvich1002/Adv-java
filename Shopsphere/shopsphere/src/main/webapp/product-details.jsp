<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shopsphere.model.Product" %>
<%@ page import="com.shopsphere.model.Review" %>

<%
Product product =
        (Product) request.getAttribute("product");

List<Review> reviews =
        (List<Review>) request.getAttribute("reviews");

Boolean isWishlistedObject =
        (Boolean) request.getAttribute("isWishlisted");

boolean isWishlisted =
        isWishlistedObject != null &&
        isWishlistedObject;


/* ================= AVERAGE RATING ================= */

double averageRating = 0;

if (reviews != null && !reviews.isEmpty()) {

    double totalRating = 0;

    for (Review review : reviews) {
        totalRating += review.getRating();
    }

    averageRating =
            totalRating / reviews.size();
}

int roundedRating =
        (int) Math.round(averageRating);
%>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>
    <%= product != null ? product.getName() : "Product Details" %>
    - ShopSphere
</title>


<style>

/* =====================================================
   GENERAL
===================================================== */

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


/* =====================================================
   NAVBAR
===================================================== */

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


/* =====================================================
   MAIN CONTAINER
===================================================== */

.container {

    width: 86%;

    max-width: 1100px;

    margin: 40px auto;
}


/* =====================================================
   PRODUCT CARD
===================================================== */

.product-section {

    background: white;

    border-radius: 18px;

    padding: 35px;

    position: relative;

    border: 1px solid #eee;

    box-shadow:
        0 5px 20px rgba(0,0,0,0.06);

    margin-bottom: 30px;
}


.product-layout {
    display: flex;
    flex-direction: row;
    align-items: flex-start;
    justify-content: space-between;
    gap: 40px;
    width: 100%;
}

/* Details LEFT */
.product-info {
    flex: 1;
    min-width: 0;
    text-align: left;
}

/* Image RIGHT */
.product-image-box {
    flex: 0 0 380px;
    width: 300px;
    height: 300px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #fff;
    /* border: 1px solid #eee;
    border-radius: 15px; */
    padding: 15px;
    overflow: hidden;
}

.product-image {
    width: 100%;
    height: 100%;
    object-fit: contain;
    display: block;
}

@media (max-width: 750px) {
    .product-layout {
        flex-direction: column;
    }

    .product-info {
        width: 100%;
    }

    .product-image-box {
        width: 100%;
        max-width: 380px;
        height: 300px;
        flex-basis: auto;
        align-self: center;
    }
}

/* =====================================================
   WISHLIST HEART
===================================================== */

.wishlist-heart {

    position: absolute;

    top: 25px;

    right: 25px;

    width: 45px;

    height: 45px;

    border-radius: 50%;

    background: white;

    border: 1px solid #ddd;

    display: flex;

    align-items: center;

    justify-content: center;

    text-decoration: none;

    color: #999;

    font-size: 25px;

    transition: 0.2s;

    z-index: 2;
}

.wishlist-heart:hover {

    color: #e11d48;

    border-color: #e11d48;

    background: #fff1f2;

    transform: scale(1.08);
}


/* ACTIVE WISHLIST */

.wishlist-heart.active {

    color: #e11d48;

    background: #fff1f2;

    border-color: #fecdd3;
}


/* =====================================================
   PRODUCT INFORMATION
===================================================== */

.product-name {

    font-size: 32px;

    margin-bottom: 10px;

    padding-right: 70px;
}

.brand {

    color: #555;

    font-size: 15px;

    margin-bottom: 15px;
}

.description {

    color: #666;

    font-size: 15px;

    line-height: 1.6;

    margin-bottom: 20px;

    max-width: 750px;
}


/* =====================================================
   PRICE
===================================================== */

.price {

    font-size: 30px;

    font-weight: bold;

    margin-bottom: 10px;
}


/* =====================================================
   DISCOUNT
===================================================== */

.discount {

    display: inline-block;

    background: #e8f8ef;

    color: #16834b;

    padding: 6px 12px;

    border-radius: 15px;

    font-size: 13px;

    font-weight: bold;

    margin-bottom: 12px;
}


/* =====================================================
   STOCK
===================================================== */

.stock {

    color: #555;

    font-size: 14px;

    margin-bottom: 18px;
}


/* =====================================================
   RATING
===================================================== */

.rating-summary {

    display: flex;

    align-items: center;

    gap: 10px;

    margin-bottom: 25px;

    flex-wrap: wrap;
}

.stars {

    color: #f5a623;

    font-size: 22px;

    letter-spacing: 2px;
}

.rating-number {

    color: #555;

    font-size: 15px;
}


/* =====================================================
   PRODUCT BUTTONS
===================================================== */

.product-buttons {

    display: flex;

    gap: 10px;

    flex-wrap: wrap;
}

.btn {

    display: inline-block;

    padding: 12px 18px;

    border-radius: 8px;

    text-decoration: none;

    font-size: 14px;

    font-weight: bold;

    transition: 0.2s;
}


/* ADD TO CART */

.btn-cart {

    background: #f7a23b;

    color: white;

    border: 1px solid #f7a23b;
}

.btn-cart:hover {

    background: #d97706;

    border-color: #d97706;
}


/* WISHLIST BUTTON */

.btn-wishlist {

    background: #fff1f2;

    color: #e11d48;

    border: 1px solid #fecdd3;
}

.btn-wishlist:hover {

    background: #ffe4e6;
}


/* =====================================================
   REVIEWS SECTION
===================================================== */

.reviews-section {

    background: white;

    border-radius: 18px;

    padding: 35px;

    border: 1px solid #eee;

    box-shadow:
        0 5px 20px rgba(0,0,0,0.06);
}

.section-title {

    font-size: 25px;

    margin-bottom: 25px;
}


/* =====================================================
   AVERAGE RATING BOX
===================================================== */

.average-rating {

    background: #f8f8fa;

    border-radius: 12px;

    padding: 20px;

    margin-bottom: 25px;
}

.average-row {

    display: flex;

    align-items: center;

    gap: 12px;

    flex-wrap: wrap;
}

.average-number {

    font-size: 18px;

    font-weight: bold;
}

.review-count {

    color: #777;

    font-size: 14px;
}


/* =====================================================
   REVIEW CARD
===================================================== */

.review-card {

    background: #fafafa;

    border: 1px solid #eee;

    border-radius: 12px;

    padding: 18px;

    margin-bottom: 15px;
}

.review-rating {

    color: #f5a623;

    font-size: 18px;

    letter-spacing: 2px;

    margin-bottom: 8px;
}

.review-text {

    color: #444;

    font-size: 15px;

    line-height: 1.5;

    margin-bottom: 8px;
}

.review-date {

    color: #999;

    font-size: 12px;
}


/* =====================================================
   NO REVIEWS
===================================================== */

.no-reviews {

    background: #fafafa;

    border: 1px dashed #ddd;

    padding: 25px;

    text-align: center;

    border-radius: 10px;

    color: #777;
}


/* =====================================================
   WRITE REVIEW
===================================================== */

.write-review {

    background: #f8f8fa;

    border-radius: 14px;

    padding: 25px;

    margin-top: 30px;
}

.write-review h2 {

    font-size: 22px;

    margin-bottom: 18px;
}

.rating-label {

    display: block;

    font-size: 14px;

    font-weight: bold;

    margin-bottom: 10px;
}


/* =====================================================
   STAR INPUT
===================================================== */

.star-rating {

    display: flex;

    flex-direction: row-reverse;

    justify-content: flex-end;

    gap: 5px;

    margin-bottom: 20px;
}

.star-rating input {

    display: none;
}

.star-rating label {

    font-size: 30px;

    color: #ccc;

    cursor: pointer;

    transition: 0.2s;
}

.star-rating label:hover,
.star-rating label:hover ~ label,
.star-rating input:checked ~ label {

    color: #f5a623;
}


/* =====================================================
   REVIEW TEXTAREA
===================================================== */

.review-textarea {

    width: 100%;

    min-height: 100px;

    padding: 12px;

    border: 1px solid #ddd;

    border-radius: 8px;

    resize: vertical;

    font-family: Arial, sans-serif;

    font-size: 14px;

    outline: none;

    margin-bottom: 15px;
}

.review-textarea:focus {

    border-color: #f7a23b;
}


/* =====================================================
   SUBMIT BUTTON
===================================================== */

.submit-review {

    background: #222;

    color: white;

    border: none;

    padding: 11px 20px;

    border-radius: 8px;

    font-weight: bold;

    cursor: pointer;

    transition: 0.2s;
}

.submit-review:hover {

    background: #333;
}


/* =====================================================
   RESPONSIVE
===================================================== */

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

    .product-section,
    .reviews-section {

        padding: 22px;

    }

    .product-name {

        font-size: 25px;

    }

    .price {

        font-size: 25px;

    }

    .product-buttons {

        flex-direction: column;

    }

    .btn {

        width: 100%;

        text-align: center;

    }

}

</style>

</head>


<body>


<!-- =====================================================
     NAVBAR
===================================================== -->

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


    </div>

</div>



<div class="container">


<!-- =====================================================
     PRODUCT DETAILS
===================================================== -->

<div class="product-section">


    <!-- TOP RIGHT HEART -->

    <a
        class="wishlist-heart <%= isWishlisted ? "active" : "" %>"
        href="<%= request.getContextPath() %>/add-to-wishlist?id=<%= product.getProductId() %>"
        title="Add to Wishlist">

        &#10084;

    </a>


    <!-- PRODUCT NAME -->

    <h1 class="product-name">

        <%= product.getName() %>

    </h1>
    <div class="product-layout">
        <div class="product-info">
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

        Stock Available:

        <strong>
            <%= product.getStock() %>
        </strong>

    </p>


            <p class="brand">

                <strong>Brand:</strong>

                <%= product.getBrand() %>

            </p>


              <!-- RATING -->




        <span class="stars">


        <%

        for (int i = 1; i <= 5; i++) {

            if (i <= roundedRating) {

        %>

                &#9733;

        <%

            } else {

        %>

                &#9734;

        <%

            }

        }

        %>


        </span>


        <span class="rating-number">

            <%= String.format("%.1f", averageRating) %>
            / 5

            (<%= reviews != null ? reviews.size() : 0 %>
            Reviews)

        </span>
        <br>
        <br>

        <!-- ADD TO CART -->

        <a
            class="btn btn-cart"
            href="<%= request.getContextPath() %>/add-to-cart?id=<%= product.getProductId() %>">

            &#128722; Add 

        </a>
</div>
        

    <!-- Product Image -->
<div class="product-image-box">
    <img
        class="product-image"
        src="<%= request.getContextPath() %>/<%= product.getImageUrl() %>"
        alt="<%= product.getName() %>"
        onerror="this.style.display='none';">
</div>
</div>
</div>

   


<!-- =====================================================
     CUSTOMER REVIEWS
===================================================== -->

<div class="reviews-section">


    <h2 class="section-title">

        Customer Reviews

    </h2>


    <!-- AVERAGE RATING -->

    <div class="average-rating">


        <div class="average-row">


            <span class="average-number">

                <%= String.format("%.1f", averageRating) %>
                / 5

            </span>


            <span class="stars">


            <%

            for (int i = 1; i <= 5; i++) {

                if (i <= roundedRating) {

            %>

                    &#9733;

            <%

                } else {

            %>

                    &#9734;

            <%

                }

            }

            %>


            </span>


            <span class="review-count">

                <%= reviews != null ? reviews.size() : 0 %>
                Customer Reviews

            </span>


        </div>


    </div>



    <!-- =================================================
         EXISTING REVIEWS
    ================================================= -->

    <%

    if (reviews != null && !reviews.isEmpty()) {

        for (Review review : reviews) {

    %>


    <div class="review-card">


        <div class="review-rating">


        <%

        for (int i = 1; i <= 5; i++) {

            if (i <= review.getRating()) {

        %>

                &#9733;

        <%

            } else {

        %>

                &#9734;

        <%

            }

        }

        %>


        </div>


        <p class="review-text">

            <%= review.getReviewText() %>

        </p>


        <p class="review-date">

            <%= review.getCreatedAt() %>

        </p>


    </div>


    <%

        }

    } else {

    %>


    <div class="no-reviews">

        No reviews yet.
        Be the first to review this product!

    </div>


    <%

    }

    %>



    <!-- =================================================
         WRITE REVIEW
    ================================================= -->

    <div class="write-review">


        <h2>

            Write a Review

        </h2>


        <form
            action="<%= request.getContextPath() %>/add-review"
            method="post">


            <!-- PRODUCT ID -->

            <input
                type="hidden"
                name="productId"
                value="<%= product.getProductId() %>">


            <!-- RATING -->

            <span class="rating-label">

                Rating

            </span>


            <div class="star-rating">


                <input
                    type="radio"
                    id="star5"
                    name="rating"
                    value="5"
                    required>

                <label for="star5">

                    &#9733;

                </label>


                <input
                    type="radio"
                    id="star4"
                    name="rating"
                    value="4">

                <label for="star4">

                    &#9733;

                </label>


                <input
                    type="radio"
                    id="star3"
                    name="rating"
                    value="3">

                <label for="star3">

                    &#9733;

                </label>


                <input
                    type="radio"
                    id="star2"
                    name="rating"
                    value="2">

                <label for="star2">

                    &#9733;

                </label>


                <input
                    type="radio"
                    id="star1"
                    name="rating"
                    value="1">

                <label for="star1">

                    &#9733;

                </label>


            </div>


            <!-- REVIEW TEXT -->

            <textarea
                class="review-textarea"
                name="reviewText"
                placeholder="Write your review..."
                required></textarea>


            <!-- SUBMIT -->

            <button
                type="submit"
                class="submit-review">

                Submit Review

            </button>


        </form>


    </div>


</div>


</div>


</body>

</html>