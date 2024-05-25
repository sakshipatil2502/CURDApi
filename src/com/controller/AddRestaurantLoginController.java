package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.RestaurantBean;
import com.bean.UserBean;
import com.dao.RestaurantDao;
import com.dao.UserDao;
import com.dao.createotp;

/**
 * Servlet implementation class AddRestaurantLoginController
 */
@WebServlet("/AddRestaurantLoginController")
public class AddRestaurantLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRestaurantLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		RestaurantDao dao=new RestaurantDao();
		
		//UserBean user;// = new UserBean();
		RestaurantBean user=dao.CheckRestaurent(email, password);
		
		if(user == null) {
			out.println("<script type=\"text/javascript\">");
			 out.println("alert('No Such User Present...')");
			 out.println("location='RestaurantLogin.jsp';");
			 out.println("</script>");
		}
		else if((user.getEmail()!=null && user.getEmail()!="") && (user.getPassword()!=null && user.getPassword()!=""))
		{
			if(user.getStatus().equals("Active"))
			{
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Login Successfully')");
		out.println("location='RestaurantHome.jsp';");
		out.println("</script>");
		out.print("welcome"+email);
			HttpSession session=request.getSession();  
	        session.setAttribute("rname",user.getRname());  
	        session.setAttribute("address", user.getAddress());
	        session.setAttribute("countrySelect", user.getCountrySelect());
	        session.setAttribute("citySelect", user.getCitySelect());
	        session.setAttribute("price", user.getPrice());
	        session.setAttribute("foodtype", user.getFoodtype());
	        session.setAttribute("restType", user.getRestType());
	        session.setAttribute("ownername", user.getOwnername());
	        session.setAttribute("mobileno", user.getMobileno());
	        session.setAttribute("email", user.getEmail());
	        
		    }
			else {
				request.setAttribute("ErrMsg", "Wait for activation of your account!...");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Wait For Activation')");
				out.println("location='RestaurantLogin.jsp';");
				out.println("</script>");
			}
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
