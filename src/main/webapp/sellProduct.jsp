<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="in.sonu.ServletModel.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Product - QuikList</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #f0f4f8, #cfd9e5);
            color: #333;
            font-family: 'Roboto', sans-serif;
            padding: 50px 20px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            font-size: 2.5rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 20px;
            font-family: 'Merriweather', serif;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #007bff;
            text-decoration: none;
            font-size: 1rem;
            transition: color 0.3s ease;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        .form-label {
            font-weight: 500;
            color: #555;
            font-size: 1.1rem;
        }

        .form-control {
            background-color: #f9f9f9;
            color: #333;
            border-radius: 8px;
            padding: 12px 15px;
            border: 1px solid #ddd;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 12px 25px;
            font-size: 1.25rem;
            border-radius: 50px;
            color: #ffffff;
            box-shadow: 0px 6px 15px rgba(0, 123, 255, 0.2);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            box-shadow: 0px 8px 20px rgba(0, 86, 179, 0.3);
            transform: translateY(-2px);
        }

        .file-upload-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
            width: 100%;
            background-color: #f7f7f7;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            border: 2px dashed #007bff;
            transition: background-color 0.3s ease;
        }

        .file-upload-wrapper:hover {
            background-color: #e8e8e8;
        }

        .file-upload-wrapper input[type="file"] {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }

        .file-upload-wrapper label {
            background-color: #007bff;
            color: #fff;
            font-size: 1rem;
            font-weight: 500;
            padding: 10px 20px;
            border-radius: 5px;
            display: inline-block;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .file-upload-wrapper label:hover {
            background-color: #0056b3;
        }

        .form-text {
            color: #888;
            font-size: 0.9rem;
        }

        .success-message {
            color: #28a745;
            text-align: center;
            font-size: 1.25rem;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Sell Your Product</h2>

        <% 
        String mssg = (String) session.getAttribute("msg");
        if (mssg != null) {
        %>
        <div class="success-message"><%= mssg %></div>
        <% 
        session.removeAttribute("msg");
        } 
        %>

        <form action="uploadProduct" method="post" enctype="multipart/form-data" class="form-container">
            <div class="mb-3">
                <label for="brandName" class="form-label">Brand Name</label>
                <input type="text" class="form-control" id="brandName" name="brandName" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                <div class="form-text">Provide a detailed description of your product.</div>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="text" class="form-control" id="price" name="price" required>
            </div>
            <div class="mb-3">
                <label for="contact" class="form-label">Seller Details</label>
                <input type="text" class="form-control" id="contact" name="contact" required>
            </div>
            <div class="mb-4 file-upload-wrapper">
                <input type="file" id="productImage" name="productImage" required>
                <label for="productImage">Upload Image</label>
            </div>
            <button type="submit" class="btn btn-primary btn-block">POST</button>
        </form>
        <div class="back-link">
            <a href="home.jsp">Back to Home</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
