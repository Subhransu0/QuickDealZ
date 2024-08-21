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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #000;
	font-family: 'Arial', sans-serif;
	color: #fff;
	padding: 50px;
}

.container {
	max-width: 600px;
	margin: auto;
	background-color: #111;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0px 8px 30px rgba(255, 255, 255, 0.1);
}

h2 {
	color: #fff; /* Changed to white */
	font-size: 2.5rem;
	font-weight: bold;
	text-align: center;
	margin-bottom: 20px;
	font-family: 'Arial', sans-serif; /* Changed to Arial */
}

.back-link {
	display: block;
	text-align: center;
	margin-bottom: 20px;
}

.back-link a {
	color: #8dc6ff; /* Link color */
	text-decoration: none;
	font-size: 1rem;
}

.back-link a:hover {
	text-decoration: underline;
}

.form-label {
	font-weight: bold;
	color: #fff; /* Changed to white */
	font-size: 1.1rem;
}

.form-control {
	background-color: #000;
	color: #fff;
	border-radius: 10px;
	padding: 12px 15px;
	border: 1px solid #555;
	box-shadow: inset 0 1px 5px rgba(255, 255, 255, 0.1);
	transition: all 0.3s ease;
	font-family: 'Arial', sans-serif;
	font-size: 1rem;
}

.form-control:focus {
	border-color: #8dc6ff;
	box-shadow: 0 0 8px rgba(141, 198, 255, 0.5);
}

.btn-primary {
	background-color: #8dc6ff;
	border: none;
	padding: 12px 25px;
	font-size: 1.25rem;
	border-radius: 50px;
	color: #000;
	box-shadow: 0px 6px 20px rgba(141, 198, 255, 0.3);
	transition: all 0.3s ease;
}

.btn-primary:hover {
	background-color: #73b1e7;
	color: #000;
	box-shadow: 0px 8px 25px rgba(115, 177, 231, 0.4);
	transform: translateY(-2px);
}

.file-upload-wrapper {
	position: relative;
	overflow: hidden;
	display: inline-block;
	width: 100%;
	background-color: #333;
	border-radius: 10px;
	padding: 20px;
	text-align: center;
	border: 2px dashed #8dc6ff;
	transition: background-color 0.3s ease;
}

.file-upload-wrapper:hover {
	background-color: #444;
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

.file-upload-wrapper .btn-upload {
	background-color: #8dc6ff;
	border: none;
	color: #000;
	font-size: 1rem;
	font-weight: bold;
	padding: 10px 20px;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.file-upload-wrapper .btn-upload:hover {
	background-color: #73b1e7;
}

.file-upload-wrapper label {
	color: #fff; /* Changed to white */
	font-size: 0.875rem; /* Smaller font size */
	cursor: pointer;
}

.form-text {
	color: #aaa;
	font-size: 0.9rem;
}

/* Center the success message */
.success-message {
	color: #8dc6ff; /* Change to desired success color */
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
		<div class="success-message"><%=mssg%></div>
		<%
		session.removeAttribute("msg");
		}
		%>

		<form action="uploadProduct" method="post"
			enctype="multipart/form-data" class="form-container">
			<div class="mb-3">
				<label for="brandName" class="form-label">Brand Name</label> <input
					type="text" class="form-control" id="brandName" name="brandName"
					required>
			</div>
			<div class="mb-3">
				<label for="description" class="form-label">Description</label>
				<textarea class="form-control" id="description" name="description"
					rows="4" required></textarea>
				<div class="form-text">Provide a detailed description of your
					product.</div>
			</div>
			<div class="mb-3">
				<label for="price" class="form-label">Price</label> <input
					type="text" class="form-control" id="price" name="price" required>
			</div>
			<div class="mb-3">
				<label for="contact" class="form-label">Seller Details</label> <input
					type="text" class="form-control" id="contact" name="contact"
					required>
			</div>
			<div class="mb-4 file-upload-wrapper">
				<input type="file" id="productImage" name="productImage" required>
				<label for="productImage" class="btn-upload">Upload image</label>
			</div>
			<button type="submit" class="btn btn-primary btn-block">POST</button>
		</form>
		<div class="back-link">
			<a href="home.jsp">Back to Home</a>
			<!-- Change the href to your actual home page URL -->
		</div>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
