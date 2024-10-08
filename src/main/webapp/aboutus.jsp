<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - QuikList</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
        }

        .navbar {
            background: rgba(0, 0, 0, 0.8);
            padding: 15px 30px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
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

        .navbar .navbar-nav .nav-link.active {
            color: #fff !important;
            border-bottom: 2px solid #8dc6ff;
        }

        .navbar .navbar-nav .nav-link:hover {
            color: #fff !important;
        }

        .container {
            padding: 60px 20px;
        }

        h1 {
            font-size: 2.5rem;
            color: #f7fafc;
            margin-bottom: 20px;
            text-align: center;
        }

        .content {
            text-align: center;
        }

        .content p {
            font-size: 1.2rem;
            color: #d1e8ff;
            margin-bottom: 20px;
        }

        .content a {
            color: #8dc6ff;
            text-decoration: none;
            font-weight: 600;
        }

        .content a:hover {
            text-decoration: underline;
        }

        .social-links {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }

        .social-links a {
            color: #8dc6ff;
            margin: 0 10px;
        }

        .social-links a:hover {
            color: #fff;
        }

        .footer {
            background-color: #111;
            color: #ddd;
            text-align: center;
            padding: 20px;
            font-size: 0.875rem;
            margin-top: auto;
        }

        .footer a {
            color: #ddd;
            margin: 0 10px;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer a:hover {
            color: #fff;
        }

        .footer .developer-credit {
            font-size: 0.9rem;
            color: #ccc;
            margin-top: 15px;
        }

        @media (max-width: 768px) {
            .navbar .navbar-nav .nav-link {
                margin-right: 0;
                margin-bottom: 10px;
            }

            .container {
                padding: 40px 10px;
            }
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
                    <a class="nav-link" href="home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ListOfAllProductsServlet">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="profileServletIt">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="aboutus.jsp">About Us</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Content -->
    <div class="container">
        <h1>About Us</h1>
        <div class="content">
            <p>Welcome to QuikList! We are dedicated to providing a simple and efficient platform for buying and selling products. Our mission is to make online transactions smoother and more reliable for everyone.</p>
            <p>Our team consists of passionate individuals who are committed to bringing you the best experience possible. Whether you are looking to sell your product or find a great deal, we are here to help!</p>
            <p>Connect with us:</p>
            <div class="social-links">
                <a href="https://github.com/Subhransu0" target="_blank" title="GitHub"><i class="fab fa-github"></i></a>
                <a href="https://www.linkedin.com/in/subhransu-mohan-das-40a9392b9/" target="_blank" title="LinkedIn"><i class="fab fa-linkedin"></i></a>
            </div>
            <p>Check out my CV: <a href="https://drive.google.com/file/d/1wQSn7EbKWHY69EHbWrPrDy-HXWrUOHK0/view?usp=sharing" target="_blank">Download CV</a></p>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="developer-credit">
            Developed by Subhransu Mohan Das
        </div>
        <div>
            © 2024 QuikList. All Rights Reserved. | 
            <a href="#">Privacy Policy</a> | 
            <a href="#">Terms of Service</a>
        </div>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
