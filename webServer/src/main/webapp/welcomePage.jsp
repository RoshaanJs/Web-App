<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WELCOME TO MUSCLE FITNESS</title>
<style>
.main {
	background-color: #FFFFFF;
	width: 800px;
	height: auto;
	margin: 10em auto;
	border-radius: 1.5em;
	box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
	text-align: center;
}

.gym-title {
	font-family: 'Oswald', sans-serif;
	font-size: 3em;
	color: #000000;
	text-align: center;
	text-transform: uppercase;
	font-weight: 700;
	background: linear-gradient(to right, #FFEB3B, #FFC107);
	padding: 20px;
	border-radius: 20px;
	letter-spacing: 2px;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	transition: transform 0.2s ease-in-out;
	margin-bottom: 20px; /* Add some space below the title */
}

/* Adjusted image size */
.main img {
	width: 150px; /* Increase the width */
	height: 150px; /* Increase the height */
    text-align: center; /* Center the content horizontally */
    margin: 50px auto; /* Add space around the content */
    max-width: 600px; /* Optional: Set maximum width for better readability */
}

.content {
	margin-top: 20px;
	display: flex;
	justify-content: center; /* Centers horizontally */
	align-items: center; /* Centers vertically */
	
}

.blocks {
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
	margin-bottom: 20px;
}
.blocks:hover {
    color: blue; /* Change text color on hover */
}
.paragraphs {
	display: none;
	margin-top: 20px;
	padding: 10px;
	background-color: #ecf0f1;
	border-radius: 5px;
}

.logOut {
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
}

.buttonContainer {
	display: flex;
	justify-content: center;
}

.buttonContainer a {
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 5px;
	text-decoration: none;
}
.plan-today p {
    font-family: 'Arial', sans-serif; /* Example font-family */
    font-size: 1.2em;
    color: #FFEB3B;
    margin-bottom: 20px; /* Add margin below the paragraph */
}
h2 {
    font-family: 'Oswald', sans-serif;
    font-size: 1.5em;
    color: #666666;
    margin-bottom: 20px; /* Add margin below h2 */
}
h1 {
    font-family: 'Oswald', sans-serif;
    font-size: 2em;
    color: #333333;
    margin-bottom: 10px; /* Add margin below h1 */
}
</style>

</head>
<body>
	<%
	String cusName = request.getParameter("checkname");
	String dateString = request.getParameter("date");
	String pack = request.getParameter("pack");

	LocalDate date = LocalDate.parse(dateString);
	int month = date.getMonthValue();
	int packInt = Integer.parseInt(pack);
	int newdate = month + packInt;
	LocalDate expiryDate = date.plusMonths(newdate);
	%>
	<div class="main">
		<div class="gym-title">WELCOME TO MUSCLE FITNESS</div>
		<img src="gym_logo.jpg" alt="Gym Logo">
		<h1>
			Welcome
			<%=cusName%></h1>
		<h2>
			Plan Expiring on
			<%=expiryDate%>
		</h2>
		<div class="block">
				<p>What's Your plan Today</p>
			</div>
		<div class="content">

			<div class="block">
				<p class="blocks" onclick="toggleParagraph('paragraph1')">Diet
					plan</p>
			</div>
			<div class="block">
				<p class="blocks" onclick="toggleParagraph('paragraph2')">Package
					Details</p>
			</div>

		</div>

		<div id="paragraph1" class="paragraphs">This is the Diet plan
			paragraph.</div>
		<div id="paragraph2" class="paragraphs">This is the Package
			Details paragraph.</div>

		<div>
			<div class="buttonContainer">
				<a class="LogOut" href="home.html">Home</a>

			</div>
		</div>
	</div>


	<script>
		function toggleParagraph(paragraphId) {

			var correspondingParagraph = document.getElementById(paragraphId);

			var allPara = document.querySelectorAll(".paragraphs");

			allPara.forEach(function(paragraph) {
				if (paragraph !== correspondingParagraph) {
					paragraph.style.display = 'none';
				}
			});

			// Toggle the display of the paragraph
			if (correspondingParagraph.style.display === 'block'
					|| correspondingParagraph.style.display === '') {
				correspondingParagraph.style.display = 'none'; // If already visible or no inline style, hide it
			} else {
				correspondingParagraph.style.display = 'block'; // If hidden, show it
			}
		}
	</script>
</body>
</html>