package formServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
 * Servlet implementation class UpdateDB
 */
@WebServlet("/UpdateDB")
public class UpdateDB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateDB() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter out = response.getWriter();
		String Uname = request.getParameter("username");
		String Uplan = request.getParameter("plan");

		String url = "jdbc:mysql://localhost:3306/gym_Db";
		String user = "root";
		String pass = "root";
		try {
			System.out.println("Update started");

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();

			ResultSet rs = stmt
					.executeQuery("select expiry_date from customersdetail where name='" + Uname + "'");
			while (rs.next()) {
				String date = rs.getString("expiry_date");

				LocalDate dateToBeChange = LocalDate.parse(date);
				int planInt = Integer.parseInt(Uplan);
				LocalDate newDate = dateToBeChange.plusMonths(planInt);
				String updatedDate = newDate.toString();
				
				String sql = "Update customersdetail set expiry_date = ?,plan = ? where name = ?";
				PreparedStatement statement = con.prepareStatement(sql);
				statement.setString(1, updatedDate);
				statement.setString(2, Uplan);
				statement.setString(3, Uname);
				int rowsUpdated = statement.executeUpdate();
				if(rowsUpdated >0) {
					System.out.println("Date updated successfully.");
				}else {
	                System.out.println("No rows affected.");
	            }


			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NullPointerException e) {
			// Handle NullPointerException
			e.printStackTrace();
		} catch (NumberFormatException e) {
			// Handle NumberFormatException
			e.printStackTrace();
		} catch (Exception e) {
			// Catch any other unexpected exceptions
			e.printStackTrace();
		}
	}

}
