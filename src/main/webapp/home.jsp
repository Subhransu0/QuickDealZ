<%@ page session="true" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuikList - Sell Your Product</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #1e1e1e;                                              
            color: #fff;
            font-family: 'Helvetica', 'Arial', 'Roboto', 'Tahoma', 'Georgia', sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: #111;
            padding: 15px 30px;
        }

        .navbar .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .navbar .navbar-nav .nav-link {
            color: #fff !important;
            font-size: 1.1rem;
        }

        .content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
            flex-grow: 1;
        }

        .content-left {
            flex: 1;
            text-align: left;
        }

        .content-left h2 {
            font-size: 3rem;
            margin-bottom: 20px;
            color: #8dc6ff; /* Updated color */
        }

        .content-left p {
            font-size: 1.5rem;
            margin-bottom: 20px;
            color: #8dc6ff; /* Updated color */
        }

        .content-right {
            flex: 1;
            text-align: right;
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }

        .btn-sell {
            background-color: #007bff;
            color: #fff;
            font-size: 1.5rem;
            padding: 15px 30px;
            border-radius: 50px;
            text-decoration: none;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .btn-sell:hover {
            background-color: #0056b3;
            color: #fff;
            box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.15);
            transform: translateY(-3px);
        }

        .footer {
            text-align: center;
            padding: 15px;
            background-color: #111;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">QUICKdealZ</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
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

    <!-- Content -->
    <div class="content container">
        <div class="content-left">
            <h2>Sell Your Product</h2>
            <p>Discover a variety of products and sell yours easily with QUICKdealZ!</p>
        </div>
        <div class="content-right">
            <a href="sellProduct.jsp" class="btn-sell">Sell Your Product Now</a>
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
