<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Client Details</title>
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
    <%
    String clientName = request.getParameter("clientName");
    %>
    <%
    String url = "jdbc:mysql://localhost:3306/gym_Db";
    String user = "root";
    String pass = "root";

    try {
        out.println("showAll awaken 2");

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pass);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM customersdetail WHERE name='" + clientName + "'");
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String phone = rs.getString("phone");
            String email = rs.getString("email");
            String password = rs.getString("password");
            Date registration_date = rs.getDate("registration_date");
            String plan = rs.getString("plan");
            Date expiry_date = rs.getDate("expiry_date");
    %>

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
                    <th>Expiry Date</th>
                </tr>
                <tr>
                    <td><%= id %></td>
                    <td><%= name %></td>
                    <td><%= phone %></td>
                    <td><%= email %></td>
                    <td><%= password %></td>
                    <td><%= registration_date %></td>
                    <td><%= plan %></td>
                    <td><%= expiry_date %></td>
                </tr>
            </table>
            <a href="admin.jsp" class="back-link">Back</a>
    <%
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
</body>
</html>
