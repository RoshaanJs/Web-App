<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<style>
.main {
	background-color: #FFFFFF;
	width: 800px;
	height: auto;
	margin: 10em auto;
	border-radius: 1.5em;
	box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
	text-align: center;
	margin-bottom: 60px
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
	margin-bottom: 0px;
	margin-top: 20px;
}

.content {
	margin-top: 20px;
}

.blocks, .showAll {
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
.paragraphs {
    display: none;
    margin-top: 20px;
    padding: 10px;
    background-color: #ecf0f1;
    border-radius: 5px;
    border: 1px solid #ccc; /* Add border for better visibility */
    box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* Add a subtle shadow */
}

/* Add hover effect for better user experience */
.paragraphs:hover {
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

/* Add padding to form elements for better spacing */
.paragraphs form label {
    margin-right: 10px;
}

.paragraphs form input[type="text"],
.paragraphs form input[type="submit"] {
    padding: 5px;
    margin-right: 10px;
    border: 1px solid #ccc;
    border-radius: 7px;
}

.paragraphs form input[type="submit"] {
    background-color: #FFEB3B;
    color: #000;
    cursor: pointer;
}

.paragraphs form input[type="submit"]:hover {
    background-color: #FFC107;
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
</style>

<script>
	/*   function showRemoveUserForm() {
	      var formDiv = document.getElementById("removeUserForm");
	      formDiv.style.display = "block"; // Show the form
	  }

	  function showUpdateUserForm(){
		var formDiv1 = document.getElementById("showUpdateUserForm");
		formDiv1.style.display = "block";
	      }
	 */

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
</head>
<body>
	<%
	String message = session.getAttribute("message") != null ? (String) session.getAttribute("message") : "";
	String name = request.getParameter("name");
	%>
	<%=message%>
	<div class="main">
		<div class="gym-title">
			WELCOME
			<%=name%></div>
		<img src="gym_logo.jpg" alt="Gym Logo">
		<div class="content">
			<a class="blocks" href="Registration.html">Add members</a> <a
				class="blocks" onclick="toggleParagraph('paragraph1')">Update
				DataBase</a> <a class="blocks" href="javascript:void(0);"
				onclick="toggleParagraph('paragraph2')">Remove User</a> <a
				class="showAll" href="showAll">Show Members</a> <br>
			

			<div id="paragraph1" class="paragraphs">
				<form action="UpdateDB" method="post">
					<label for="username">Enter User-Name:</label> <input type="text"
						id="username" name="username"> <label for="plan">Enter
						Updated plan</label> <input type="text" id="plan" name="plan"> <input
						type="submit" value="Update">
				</form>
			</div>
			<div id="paragraph2" class="paragraphs">
				<form action="RemoveUser" method="post">
					<label for="username">Enter User-Name:</label> <input type="text"
						id="username" name="username"> <input type="submit"
						value="Remove">
				</form>
			</div>

		</div>
		<br> <a class="blocks">Home</a>
	</div>
</body>
</html>