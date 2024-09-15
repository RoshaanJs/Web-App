package formServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RemoveUser
 */
@WebServlet("/RemoveUser")
public class RemoveUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String Uname = request.getParameter("username");
		
		String url = "jdbc:mysql://localhost:3306/gym_Db";
		String user = "root";
		String pass = "root";

		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pass);

			String sql = "DELETE FROM customersdetail WHERE name=?";
		    PreparedStatement stmt = con.prepareStatement(sql);
		    stmt.setString(1, Uname);
		    
		    int rowsDeleted = stmt.executeUpdate();
		    if (rowsDeleted > 0) {
		        out.println("User " + Uname + " deleted successfully.");
		        session.setAttribute("message", "User " + Uname + " deleted successfully.");
		        response.sendRedirect("admin.jsp");
		    } else {
		        out.println("User " + Uname + " not found.");
		    }
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
