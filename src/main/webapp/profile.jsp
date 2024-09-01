<%@ page session="true" %>
<%@ page import="in.sonu.ServletModel.Register_LoginModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - QuikList</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
            background-color: rgba(0, 0, 0, 0.9);
            padding: 15px 30px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);
        }

        .navbar .navbar-brand {
            font-size: 2rem;
            font-weight: bold;
            color: #fff; /* Changed to white */
            letter-spacing: 2px;
        }

        .navbar .nav-link {
            color: #8dc6ff !important;
            font-weight: 500;
            margin-right: 15px;
            transition: color 0.3s ease;
        }

        .navbar .nav-link:hover {
            color: #fff !important;
        }

        .container {
            padding: 30px;
            margin-top: 50px;
        }

        .profile-card {
            background-color: rgba(0, 0, 0, 0.85);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.5);
            text-align: center;
            color: #fff;
            transition: transform 0.3s ease;
        }

        .profile-card:hover {
            transform: scale(1.02);
        }

        .profile-card h2 {
            font-size: 2.5rem;
            color: #fff; /* Changed to white */
            margin-bottom: 20px;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.3);
        }

        .profile-details {
            text-align: left;
            font-size: 1.3rem;
            color: #ccc;
            margin-bottom: 10px;
        }

        .profile-details strong {
            color: #8dc6ff;
        }

        .btn-home {
            background: linear-gradient(to right, #007bff, #0056b3);
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 8px;
            color: #fff;
            text-align: center;
            text-transform: uppercase;
            margin: 20px auto;
            display: inline-block;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        .btn-home:hover {
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
            .profile-card {
                padding: 20px;
            }

            .profile-card h2 {
                font-size: 2rem;
            }

            .profile-details {
                font-size: 1.1rem;
            }

            .btn-home {
                font-size: 0.9rem;
                padding: 8px 16px;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="home.jsp">QUICKdealZ</a>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="logoutServlet">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="profile-card">
        <% 
        Register_LoginModel profile = (Register_LoginModel) request.getAttribute("profile");
        if (profile != null) {
        %>
        <h2>Welcome, <%= profile.getNAME() %></h2>
        <div class="profile-details">
            <p><strong>Name:</strong> <%= profile.getNAME() %></p>
            <p><strong>Email:</strong> <%= profile.getGMAIL() %></p>
            <p><strong>Password:</strong> <%= profile.getPASSWORD() %></p>
        </div>
        <% 
        } else { 
        %>
        <p class="text-center">Profile information is not available at the moment.</p>
        <% 
        } 
        %>
    </div>
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
