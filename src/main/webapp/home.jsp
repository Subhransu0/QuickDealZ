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
	transition: color 0.3s ease, transform 0.3s ease;
}

.navbar .navbar-nav .nav-link:hover {
	color: #fff !important;
	transform: scale(1.05);
}

.content {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 50px 20px;
	flex-grow: 1;
	margin: 20px;
	border-radius: 10px;
	background: rgba(255, 255, 255, 0.1);
	box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.2);
	position: relative;
}

.content::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background:
		url('https://images.unsplash.com/photo-1601758123927-941ac9a32379?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDN8fHN0b3JlJTIwZnJvbnR8ZW58MHx8fHwxNjM5MTg2NTI1&ixlib=rb-1.2.1&q=80&w=1080')
		no-repeat center center/cover;
	opacity: 0.3;
	border-radius: 10px;
	z-index: 1;
}

.content-left, .content-right {
	z-index: 2;
}

.content-left h2 {
	font-size: 3rem;
	font-weight: 600;
	margin-bottom: 20px;
	color: #f7fafc;
}

.content-left p {
	font-size: 1.5rem;
	margin-bottom: 20px;
	color: #d1e8ff;
}

.content-right {
	display: flex;
	align-items: center;
	justify-content: flex-end;
}

.btn-sell {
	background: linear-gradient(to right, #007bff, #0056b3);
	color: #fff;
	font-size: 1.5rem;
	padding: 15px 30px;
	border-radius: 30px;
	text-decoration: none;
	box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.2);
	transition: all 0.3s ease, transform 0.2s ease;
}

.btn-sell:hover {
	background: linear-gradient(to right, #0056b3, #003f7f);
	color: #fff;
	box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.3);
	transform: translateY(-4px);
}

.footer {
	background-color: #111;
	color: #ddd;
	text-align: center;
	padding: 20px;
	font-size: 0.875rem;
	position: relative;
	z-index: 2;
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

@media ( max-width : 768px) {
	.content {
		flex-direction: column;
		text-align: center;
	}
	.content-right {
		justify-content: center;
		margin-top: 30px;
	}
	.navbar .navbar-nav .nav-link {
		margin-right: 0;
		margin-bottom: 10px;
	}
	.content-left h2 {
		font-size: 2.5rem;
	}
	.content-left p {
		font-size: 1.25rem;
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
        © 2024 QuikList. All Rights Reserved. | 
        <a href="#">Privacy Policy</a> | 
        <a href="#">Terms of Service</a>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
