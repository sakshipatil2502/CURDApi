package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.UserBean;
import com.dao.UserDao;

/**
 * Servlet implementation class OrderPaymentController
 */
@WebServlet("/OrderPaymentController")
public class OrderPaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderPaymentController() {
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
		String rname = request.getParameter("rname");
		String email = request.getParameter("email");		
		String accountno = request.getParameter("accountno");
		String ifsc = request.getParameter("ifsc");
		int total = Integer.parseInt(request.getParameter("total"));
		String status = "Pending";
		
		UserBean b = new UserBean();
		

		b.setFoodname(foodname);
		b.setPrice(price);;
		b.setQuantity(quantity);
		b.setRname(rname);		
		b.setEmail(email);
        b.setAccountno(accountno);
        b.setIfsc(ifsc);
        b.setTotal(total);
		b.setStatus(status);
		
		UserDao dao = new UserDao();

		
		if (dao.OrderPaymentData(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Successful')");
			out.println("location='Order.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('UnSuccessful')");
			out.println("location='Order.jsp';");
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
