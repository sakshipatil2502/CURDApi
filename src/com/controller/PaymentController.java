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
 * Servlet implementation class PaymentController
 */
@WebServlet("/PaymentController")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String accountno = request.getParameter("accountno");		
		String ifsc = request.getParameter("ifsc");		
		String payment = request.getParameter("payment");
		String email = request.getParameter("email");		
		String deliveryaddress = request.getParameter("deliveryaddress");
		String status = "Active";
		
		UserBean b = new UserBean();
		

		b.setAccountno(accountno);		
		b.setIfsc(ifsc);
		b.setPayment(payment);
		b.setEmail(email);
		b.setDeliveryaddress(deliveryaddress);
		b.setStatus(status);
		
		UserDao dao = new UserDao();

		
		if (dao.FoodPaymentData(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Payment Send Successfully..')");
			out.println("location='UserHome.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('UnSuccessful')");
			out.println("location='UserHome.jsp';");
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
