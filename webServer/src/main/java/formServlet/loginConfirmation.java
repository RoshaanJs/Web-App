package formServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginConfirmation
 */
@WebServlet("/loginConfirmation")
public class loginConfirmation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
        
		String password = request.getParameter("password");
		
		
		out.println(name+":->"+password);
		
		String url = "jdbc:mysql://localhost:3306/gym_db";
		String user = "root";
		String pass = "root";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,user,pass);

			Statement stmt = con.createStatement();
			
			
			ResultSet rs = stmt.executeQuery("Select * from customersdetail where name='"+name+"'");
			System.out.println("Query executed");
			out.println(name+"2:->"+password);
			
			if(rs.next()) {
				 System.out.println("ResultSet has next");
				String checkname = rs.getString("name");
				String checkPass = rs.getString("password");
				String date = rs.getString("registration_date");
				String pack = rs.getString("plan");
				out.println(name+"3:->"+password);
				if(name.equals("Admin") && password.equals("Admin")){
					response.sendRedirect("admin.jsp?name="+name+"&password="+password);
				}else if(name.equalsIgnoreCase(checkname) && password.equals(checkPass)) {
					response.sendRedirect("welcomePage.jsp?checkname="+checkname+"&checkpass="+checkPass+"&date="+date+"&pack="+pack);
				}
				else {
					response.sendRedirect("home.html?invalid=true");
				}
			}else {
				 System.out.println("ResultSet has no next");
				response.sendRedirect("home.html?invalid=true");
			}
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
