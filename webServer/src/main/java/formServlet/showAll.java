package formServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class showAll
 */
@WebServlet("/showAll")
public class showAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
//		HttpSession session = request.getSession();
//		String Uname = request.getParameter("");

		String url = "jdbc:mysql://localhost:3306/gym_Db";
		String user = "root";
		String pass = "root";

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pass);
			String sql = "SELECT * FROM customersdetail";
			 Statement statement = con.createStatement();
	            ResultSet rs = statement.executeQuery(sql);
	    		


			List<DataObject> dataList = new ArrayList<>();
			while(rs.next()) {


				DataObject obj = new DataObject();
				obj.setId(rs.getInt("id"));
                obj.setName(rs.getString("name"));
                obj.setPhone(rs.getString("phone"));
                obj.setEmail(rs.getString("email"));
                obj.setPassword(rs.getString("password"));
                // Handle registration date
                obj.setRegistrationDate(rs.getDate("registration_date"));
                obj.setPlan(rs.getString("plan"));
                obj.setExpiryDate(rs.getString("expiry_date"));

                dataList.add(obj);

				}
			
			request.setAttribute("dataList", dataList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/displayDatajsp.jsp");
			dispatcher.forward(request, response);
			/*
			 * out.println("<html><body>"); out.println("<h2>All Members:</h2>");
			 * out.println("<ul>");
			 * 
			 * while(rs.next()) { String phone = rs.getString("phone"); String name =
			 * rs.getString("name"); String email = rs.getString("email");
			 * 
			 * out.println("<li>Name: " + name + ", Phone: " + phone + ", Email: " + email +
			 * "</li>"); }
			 * 
			 * out.println("</ul>"); out.println("</body></html>");
			 */

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (NullPointerException e) {
		    // Handle NullPointerException
		    e.printStackTrace();
		} catch (NumberFormatException e) {
		    // Handle NumberFormatException
		    e.printStackTrace();
		} catch (IOException e) {
		    // Handle IO exception
		    e.printStackTrace();
		} catch (Exception e) {
		    // Catch any other unexpected exceptions
		    e.printStackTrace();
		}

	}

}
