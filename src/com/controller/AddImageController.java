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
 * Servlet implementation class AddImageController
 */
@MultipartConfig
@WebServlet("/AddImageController")
public class AddImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	InputStream image=null;		
	String imageName="";
	String path=null;
	File upload=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddImageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String rname = request.getParameter("rname");		
		String address = request.getParameter("address");		
		String countrySelect = request.getParameter("countrySelect");
		String citySelect = request.getParameter("citySelect");
		String price = request.getParameter("price");		
		String foodtype = request.getParameter("foodtype");			
		String restType = request.getParameter("restType");
		String ownername = request.getParameter("ownername");			
		String mobileno = request.getParameter("mobileno");
		String email = request.getParameter("email");
		String status = "Pending";
		
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
		b.setRname(rname);	
		b.setAddress(address);
		b.setCountrySelect(countrySelect);
		b.setCitySelect(citySelect);
		b.setPrice(price);
		b.setFoodtype(foodtype);
		b.setRestType(restType);
		b.setOwnername(ownername);
		b.setMobileno(mobileno);
		b.setEmail(email);
		b.setStatus(status);
		b.setImage(image);
		b.setImage_name(imageName);
		
	
		if (dao.AddRestaurantImageData(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Image added successfully')");
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
