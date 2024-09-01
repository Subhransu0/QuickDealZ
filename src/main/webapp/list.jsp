<%@ page session="true" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuikList - Product Listing</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #4b79a1, #283e51);
            color: #fff;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }

        /* Navigation Bar */
        .navbar {
            background: rgba(0, 0, 0, 0.8);
            padding: 15px 30px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            position: sticky;
            top: 0;
            width: 100%;
        }

        .navbar .navbar-brand {
            font-size: 1.75rem;
            font-weight: 600;
            color: #fff;
            letter-spacing: 1px;
        }

        .navbar .navbar-nav .nav-link {
            color: #ddd !important;
            font-size: 1.1rem;
            font-weight: 500;
            margin-right: 15px;
            transition: color 0.3s ease;
        }

        .navbar .navbar-nav .nav-link:hover {
            color: #fff !important;
        }

        .container {
            padding: 40px;
        }

        h1 {
            font-size: 2.5rem;
            color: #f7fafc;
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
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
            position: relative;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }

        .product-card .dropdown {
            position: absolute;
            top: 10px;
            right: 10px;
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
            color: #f7fafc;
            margin-bottom: 10px;
            text-transform: capitalize;
        }

        .product-description {
            font-size: 1rem;
            color: #d1e8ff;
            margin-bottom: 10px;
            line-height: 1.5;
        }

        .product-price {
            font-size: 1.4rem;
            font-weight: bold;
            color: #fff;
            margin-bottom: 15px;
        }

        .product-contact {
            font-size: 1rem;
            color: #f7fafc;
            margin-bottom: 20px;
        }

        .btn-buy {
            background: linear-gradient(to right, #007bff, #0056b3);
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 8px;
            color: #fff;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            text-decoration: none;
            display: block;
            width: 100%;
        }

        .btn-buy:hover {
            background: linear-gradient(to right, #0056b3, #003f7f);
            transform: translateY(-2px);
        }

        .footer {
            background-color: #111;
            color: #ddd;
            text-align: center;
            padding: 20px;
            font-size: 0.875rem;
            margin-top: auto;
        }

        @media (max-width: 768px) {
            .navbar .navbar-nav .nav-link {
                margin-right: 0;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="#">QUICKdealZ</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ListOfAllProductsServlet">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="profileServletIt">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="aboutus.jsp">About Us</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <h1>Product List</h1>

        <%
        String msg1 = (String) session.getAttribute("mssg");
        if (msg1 != null) {
        %>
        <div class="alert alert-warning" role="alert">
            <%=msg1%>
        </div>
        <%
        session.removeAttribute("mssg");
        }
        %>

        <%
        String msg = (String) session.getAttribute("msg");
        if (msg != null) {
        %>
        <div class="alert alert-success" role="alert">
            <%=msg%>
        </div>
        <%
        session.removeAttribute("msg");
        }
        %>

        <div class="product-grid">
            <%
            List<in.sonu.ServletModel.UploadModel> productList = (List<in.sonu.ServletModel.UploadModel>) request.getAttribute("list");
            if (productList != null && !productList.isEmpty()) {
                for (in.sonu.ServletModel.UploadModel product : productList) {
            %>
            <div class="product-card">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">...</button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <li><a class="dropdown-item" href="editProduct?id=<%=product.getId()%>">Edit</a></li>
                        <li><a class="dropdown-item" href="deleteProduct?id=<%=product.getId()%>" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a></li>
                    </ul>
                </div>
                <img src="Image/<%=product.getProductImage()%>" alt="<%=product.getBrandName()%>" class="product-image">
                <div class="product-details">
                    <h2 class="product-title"><%=product.getBrandName()%></h2>
                    <p class="product-description"><%=product.getDescription()%></p>
                    <p class="product-price">Rs. <%=product.getPrice()%></p>
                    <p class="product-contact">Contact: <%=product.getContact()%></p>
                    <a href="#" class="btn-buy">Contact Seller</a>
                </div>
            </div>
            <%
            }
            } else {
            %>
            <p class="text-center">No products available at the moment.</p>
            <%
            }
            %>
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

