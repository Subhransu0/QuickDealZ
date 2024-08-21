<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="in.sonu.ServletModel.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List - QuikList</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #000;
            color: #fff;
            font-family: 'Helvetica', 'Arial', 'Roboto', 'Tahoma', 'Georgia', sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .container {
            padding: 40px;
        }

        h1 {
            font-size: 2.5rem;
            color: #8dc6ff;
            margin-bottom: 40px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .product-card {
            background-color: #222;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.7);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.9);
        }

        .product-image {
            width: 100%;
            height: auto;
            max-height: 300px;
            object-fit: contain;
            background-color: #fff;
        }

        .product-details {
            padding: 20px;
        }

        .product-title {
            font-size: 1.5rem;
            color: #8dc6ff;
            margin-bottom: 10px;
            text-transform: capitalize;
        }

        .product-description {
            font-size: 1rem;
            color: #ccc;
            margin-bottom: 10px;
            line-height: 1.5;
        }

        .product-price {
            font-size: 1.4rem;
            font-weight: bold;
            color: white;
            margin-bottom: 15px;
        }

        .product-contact {
            font-size: 1rem;
            color: #8dc6ff;
            margin-bottom: 20px;
        }

        .btn-buy {
            background-color: #8dc6ff;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 8px;
            color: #000;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            text-decoration: none;
            display: block;
            width: 100%;
        }

        .btn-buy:hover {
            background-color: #73b1e7;
            transform: translateY(-2px);
        }

        .btn-home {
            background-color: #007bff;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 8px;
            color: #fff;
            text-align: center;
            margin: 40px auto 20px;
            display: inline-block;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .btn-home:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .footer {
            text-align: center;
            padding: 15px;
            background-color: #111;
            color: #aaa;
            margin-top: auto;
            font-size: 0.9rem;
        }

    </style>
</head>
<body>

<div class="container">
    <h1>Product List</h1>

    <div class="product-grid">
        <% 
        List<in.sonu.ServletModel.UploadModel> productList = (List<in.sonu.ServletModel.UploadModel>)session.getAttribute("list");
        if (productList != null && !productList.isEmpty()) {
            for (in.sonu.ServletModel.UploadModel product : productList) { 
        %>
        <div class="product-card">
            <img src="Image/<%= product.getProductImage() %>" alt="<%= product.getBrandName() %>" class="product-image">
            <div class="product-details">
                <h2 class="product-title"><%= product.getBrandName() %></h2>
                <p class="product-description"><%= product.getDescription() %></p>
                <p class="product-price">Rs. <%= product.getPrice() %></p>
                <p class="product-contact">Contact: <%= product.getContact() %></p>
                <a href="#" class="btn-buy">Contact Seller</a>
            </div>
        </div>
        <% 
            } 
        } else { 
        %>
        <p class="text-center">No products available at the moment.</p>
        <% } %>
    </div>
    
    <!-- Home Button -->
    <div class="text-center">
        <a href="home.jsp" class="btn-home">Back to Home</a>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    © 2024 QuikList. All Rights Reserved.
</footer>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
