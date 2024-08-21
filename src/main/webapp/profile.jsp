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
            color: white;
        }

        .container {
            padding: 20px;
            margin-top: 50px;
        }

        .profile-card {
            background-color: #111;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            text-align: center;
            color: #fff;
        }

        .profile-card h2 {
            font-size: 2rem;
            color: #8dc6ff;
            margin-bottom: 20px;
        }

        .profile-details {
            text-align: left;
            font-size: 1.2rem;
            color: #aaa;
            margin-bottom: 10px;
        }

        .profile-details strong {
            color: #8dc6ff;
        }

        .footer {
            text-align: center;
            padding: 15px;
            background-color: #111;
            color: #aaa;
            margin-top: auto;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar">
    <a class="navbar-brand" href="home.jsp">QuikList</a>
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
