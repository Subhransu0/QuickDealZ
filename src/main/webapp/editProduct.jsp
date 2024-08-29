<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="in.sonu.ServletModel.UploadModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product - QuikList</title>
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

        .form-group {
            margin-bottom: 20px;
        }

        .btn-submit {
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
        }

        .btn-submit:hover {
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
    <h1>Edit Product</h1>

    <% 
        UploadModel product = (UploadModel) request.getAttribute("product");
        if (product != null) { 
    %>
    <form action="updateeProduct" method="post" >

        <input type="hidden" name="id" value="<%= product.getId() %>">
        <% System.out.println("hello" + product.getId() ); %>

        <div class="form-group">
            <label for="brandName">Brand Name</label>
            <input type="text" id="brandName" name="brandName" class="form-control" value="<%= product.getBrandName() %>" required>
        </div>
         <% System.out.println("hello" + product.getBrandName() ); %>

        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" rows="4" required><%= product.getDescription() %></textarea>
        </div>

        <div class="form-group">
            <label for="price">Price</label>
            <input type="text" id="price" name="price" class="form-control" value="<%= product.getPrice() %>" required>
        </div>

        <div class="form-group">
            <label for="contact">Contact</label>
            <input type="text" id="contact" name="contact" class="form-control" value="<%= product.getContact() %>" required>
        </div>

        

        <input type="submit" class="btn-submit" value="Update Product">
    </form>

    <% } else { %>
        <p class="text-center">Product not found.</p>
    <% } %>
    
    <!-- Back Button -->
    <div class="text-center">
        <a href="ListOfAllProductsServlet" class="btn-home">Back to List Of Product</a>
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
