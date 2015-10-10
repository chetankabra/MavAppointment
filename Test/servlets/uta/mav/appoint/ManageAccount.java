package uta.mav.appoint;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uta.mav.appoint.beans.GetSet;
import uta.mav.appoint.db.DatabaseManager;
import uta.mav.appoint.login.LoginUser;

/**
 * Servlet implementation class ManageAccount
 */
@WebServlet("/ManageAccount")
public class ManageAccount extends HttpServlet {
	HttpSession session;
	String header;
	String email;
	String newemail;
	String password;
	String rpassword;
	String username;
	String role;

	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		session = request.getSession();
		LoginUser user = (LoginUser)session.getAttribute("user");
		if (user == null){
			user = new LoginUser();
			session.setAttribute("user", user);
		}
		header = "templates/" + user.getHeader() + ".jsp";
		request.setAttribute("includeHeader", header);
		request.setAttribute("emailAddress", user.getEmail());
		request.getRequestDispatcher("manage.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		email = request.getParameter("emailAddress");
		password = request.getParameter("password");
		newemail = request.getParameter("newemail");
		rpassword = request.getParameter("repeatPassword");
		username = request.getParameter("username");
		role = "student";
		//need to add check for maverick email address
		//need to add check that both passwords match
		//need to redirect back to register with correct error message
		GetSet set = new GetSet();
		set.setEmailAddress(email);
		set.setPassword(password);
		set.setRole(role);
		set.setnewemail(newemail);
		set.setusername(username);
		try{
			DatabaseManager dbm = new DatabaseManager();
			int check = dbm.updateuser(set);
			if (check == 1){
				//if adduser successful, log in as added user and redirect
				//back to start
				//
				GetSet sets = new GetSet();
				sets.setEmailAddress(newemail);
				sets.setPassword(password);
				
				LoginUser user = dbm.checkUser(sets);
				if(user != null){
					session = request.getSession();
					session.setAttribute("user", user);
					//response.sendRedirect("index");
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Account Information updated');");
					out.println("location='index';");
					out.println("</script>");
				}
			}
			else{
				//if unable to log in, add error message and redirect back to register
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Information not updated ');");
				request.getRequestDispatcher("register.jsp").forward(request,response);
			}
	}
		catch(Exception e){
			System.out.println(e);
		}
	}

}
