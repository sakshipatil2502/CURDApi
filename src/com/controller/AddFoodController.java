package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bean.RestaurantBean;
import com.dao.RestaurantDao;

/**
 * Servlet implementation class AddFoodController
 */
@MultipartConfig
@WebServlet("/AddFoodController")
public class AddFoodController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	InputStream image=null;		
	String imageName="";
	String path=null;
	File upload=null;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFoodController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
			
		String foodname = request.getParameter("foodname");
		String price = request.getParameter("price");	
		String rname = request.getParameter("rname");	
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String status = "Active";
		
		RestaurantBean b = new RestaurantBean();
		RestaurantDao dao = new RestaurantDao();

        Part part=request.getPart("file");
		
		if(part!=null)
		{
			image=part.getInputStream();
			System.out.println("is size:"+image.available());
			
			imageName=dao.extractFileName(part);
			System.out.println("name:"+imageName);
		}
		
		b.setFoodname(foodname);
		b.setRname(rname);	
		b.setPrice(price);
		b.setEmail(email);
		b.setStatus(status);
		b.setImage(image);
		b.setImage_name(imageName);
		b.setAddress(address);
		
	
		if (dao.AddFoodData(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Food added successfully')");
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
