package formServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String doj = request.getParameter("doj");
		String plan = request.getParameter("plan");

		LocalDate date = LocalDate.parse(doj);
//		int month = date.getMonthValue();
		int packInt = Integer.parseInt(plan);
		LocalDate expiryDate = date.plusMonths(packInt);

		String url = "jdbc:mysql://localhost:3306/gym_db";
		String user = "root";
		String pass = "root";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, user, pass);

			
			 DatabaseMetaData metadata = con.getMetaData();
	            ResultSet rs = metadata.getColumns(null, null, "customersdetail", "expiry_date");
	            if (!rs.next()) {
	                // If expiry_date column doesn't exist, add it to the table
	                Statement stmt = con.createStatement();
	                stmt.executeUpdate("ALTER TABLE customersdetail ADD COLUMN expiry_date DATE");
	                stmt.close();
	            }
//			Statement stmt = con.createStatement();

//			 stmt.execute("ALTER TABLE db_t1 ADD COLUMN package VARCHAR(255)");
//	         stmt.execute("ALTER TABLE db_t1 ADD COLUMN doj DATE");
			System.out.print("This is = " + plan);

			PreparedStatement preparedStatement = con.prepareStatement(
					"INSERT INTO customersdetail (name, phone, email, password, registration_date, plan,expiry_date) VALUES (?, ?, ?, ?, ?, ?, ?)");
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, phone);
			preparedStatement.setString(3, email);
			preparedStatement.setString(4, password); // Set the password parameter
			preparedStatement.setString(5, doj);
			preparedStatement.setString(6, plan);
			preparedStatement.setString(7, expiryDate.toString());

			preparedStatement.executeUpdate();
			preparedStatement.close();
			con.close();
			response.sendRedirect("home.html");

		} catch (Exception e) {
			out.println(e.getMessage());
			e.printStackTrace();
		}
	}
}
