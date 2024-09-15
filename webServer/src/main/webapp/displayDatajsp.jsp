<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Display Data</title>
<style>
/* CSS styles */
body {
	font-family: 'Ubuntu', sans-serif;
	background-color: #FFFFFF; /* Match home page background color */
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
.name{
text-decoration: none;
color: #000000;
}
.container {
	width: 80%;
	margin: 50px auto;
	background-color: #FFFFFF; /* Match home page background color */
	padding: 20px;
	border-radius: 1.5em;
	box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
}

h1 {
	font-family: 'Oswald', sans-serif;
	font-size: 3em;
	color: #000000; /* Match home page title color */
	text-align: center;
	text-transform: uppercase;
	font-weight: 700;
	background: linear-gradient(to right, #FFEB3B, #FFC107);
	/* Match home page title gradient */
	padding: 20px;
	border-radius: 20px;
	letter-spacing: 2px;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	transition: transform 0.2s ease-in-out;
	margin-bottom: 20px; /* Add some space below the title */
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid rgba(0, 0, 0, 0.05);
	/* Match home page input border color */
}

th {
	background-color: rgba(136, 126, 126, 0.04);
	/* Match home page input background color */
	font-weight: bold;
}

tr:hover {
	background-color: rgba(136, 126, 126, 0.04);
	/* Match home page input background color */
}

.back-link {
          cursor: pointer;
	border-radius: 5em;
	background: linear-gradient(to right, #FFEB3B, #FFC107);
	border: 0;
	padding: 10px 40px;
	font-family: 'Ubuntu', sans-serif;
	font-size: 13px;
	box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
	margin-top: 20px;
	text-decoration: none;
	width: 100px;
	text-align: center;
}
        
        .back-link:hover {
            text-decoration: underline;
        }
</style>
</head>
<body>
	<div class="container">
		<h1>Client Details</h1>
		<table>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Phone</th>
				<th>Email</th>
				<th>Password</th>
				<th>Registration Date</th>
				<th>Plan</th>
				<th>Expire Date</th>
			</tr>
			<c:forEach var="item" items="${dataList}">
				<tr>
					<td>${item.id}</td>
					<td><a class="name" href="clientDetails.jsp?clientName=${item.name}">${item.name}</a></td>
					<td>${item.phone}</td>
					<td>${item.email}</td>
					<td>${item.password}</td>
					<td>${item.registrationDate}</td>
					<td>${item.plan}</td>
					<td>${item.expiryDate}</td>
				</tr>
			</c:forEach>
		</table>
		<a href="admin.jsp" class="back-link">Back</a>
	</div>
</body>
</html>
