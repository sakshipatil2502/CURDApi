package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.annotation.Repeatable;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.RestaurantBean;
import com.bean.UserBean;
import com.dao.UserDao;

/**
 * Servlet implementation class SendNotificationController
 */
@WebServlet("/SendNotificationController")
public class SendNotificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendNotificationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String message = request.getParameter("message");		
		String rname = request.getParameter("rname");		
		String email = request.getParameter("email");
		String status = "Active";
		
		RestaurantBean b = new RestaurantBean();
		

		b.setMessage(message);
		b.setRname(rname);
		b.setEmail(email);
		b.setStatus(status);
		
		UserDao dao = new UserDao();

		
		if (dao.SendNotification(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Notification Send Successfully')");
			out.println("location='RestaurantHome.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('UnSuccessful')");
			out.println("location='RestaurantHome.jsp';");
			out.println("</script>");
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
