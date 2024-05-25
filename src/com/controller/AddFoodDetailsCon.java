package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.UserBean;
import com.dao.UserDao;

/**
 * Servlet implementation class AddFoodDetailsCon
 */
@WebServlet("/AddFoodDetailsCon")
public class AddFoodDetailsCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFoodDetailsCon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String foodname = request.getParameter("foodname");		
		int price = Integer.parseInt(request.getParameter("price"));		
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String email = request.getParameter("email");
		String rname = request.getParameter("rname");
		String address = request.getParameter("address");
		String time = request.getParameter("time");
		String status = "Pending";
		String statuss = "Pending";
		
		UserBean b = new UserBean();
		
		int total=price * quantity;
		 System.out.println("the result is "+ total);
			
		
		b.setFoodname(foodname);
		b.setPrice(price);
		b.setQuantity(quantity);
		b.setEmail(email);
		b.setStatus(status);
		b.setTotal(total);
		b.setRname(rname);
		b.setAddress(address);
		b.setTime(time);
		b.setStatuss(statuss);
		UserDao dao = new UserDao();

		if (dao.AddFoodDetailsData(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Food added to cart successfully')");
			out.println("location='UserHome.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('UnSuccessful')");
			out.println("location='FoodDetails.jsp';");
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
