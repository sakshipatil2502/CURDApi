package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.Part;

import com.bean.RestaurantBean;
import com.bean.UserBean;
import com.connection.DBConnection;

public class RestaurantDao {

	Connection connection=null;
	Boolean resultStatus=Boolean.FALSE;
	PreparedStatement ps;
	ResultSet rs;
    Statement st=null;
    String sql;
    boolean flag = false;
	Boolean resultStatus=Boolean.FALSE;
    
    public boolean AddRestaurantData(RestaurantBean b) {
		sql = "insert into addrestaurant(rname,address,countrySelect,citySelect,price,foodtype,restType,ownername,mobileno,email,password,status) values(?,?,?,?,?,?,?,?,?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getRname());
			ps.setString(2, b.getAddress());
			ps.setString(3, b.getCountrySelect());
			ps.setString(4, b.getCitySelect());
			ps.setString(5, b.getPrice());
			ps.setString(6, b.getFoodtype());
			ps.setString(7, b.getRestType());
			ps.setString(8, b.getOwnername());
			ps.setString(9, b.getMobileno());
			ps.setString(10, b.getEmail());
			ps.setString(11, b.getPassword());
			ps.setString(12, b.getStatus());
			
			int index = ps.executeUpdate();

			if (index > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return flag;
	}

	
	


	public RestaurantBean CheckRestaurent(String email, String password) {
		RestaurantBean bean=new RestaurantBean();
		sql = "select * from addrestaurant where email='" + email + "' and password='" + password + "' ";
		int flag = 0;
		try {
			Statement stmt = DBConnection.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				flag = 1;
				bean.setId(rs.getInt(1));
				bean.setRname(rs.getString(2));					
				bean.setAddress(rs.getString(3));
				bean.setCountrySelect(rs.getString(4));
				bean.setCitySelect(rs.getString(5));
				bean.setPrice(rs.getString(6));
				bean.setFoodtype(rs.getString(7));
				bean.setRestType(rs.getString(8));
				bean.setOwnername(rs.getString(9));
				bean.setMobileno(rs.getString(10));
				bean.setEmail(rs.getString(11));
				bean.setPassword(rs.getString(12));		
				bean.setStatus(rs.getString(13));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		if(flag ==1)
			return bean;
		else 
			return null;
	}


	public boolean update1(String email, String generatedotp) {
		// TODO Auto-generated method stub
		return false;
	}





	public boolean DeleteRestaurant(int id) {
		String sql="delete from addrestaurant where id='"+id+"'";
		 Connection con=DBConnection.getConnection();
		 try {
			ps=con.prepareStatement(sql);
			int index =ps.executeUpdate();
			if(index>0)
			{
				flag=true;
			}
			else
			{
				flag=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
			return flag;
	}





	public String extractFileName(Part part) {
		final String partHeader = part.getHeader("content-disposition");
	    for (String content : part.getHeader("content-disposition").split(";")) {
	        if (content.trim().startsWith("filename")) {
	            return content.substring(
	                    content.indexOf('=') + 1).trim().replace("\"", "");
	        }
	    }
		return null;
	}





	public boolean AddRestaurantImageData(RestaurantBean b) {
		sql = "insert into addrestaurantimg(rname,address,countrySelect,citySelect,price,foodtype,restType,ownername,mobileno,email,image,imagename,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getRname());
			ps.setString(2, b.getAddress());
			ps.setString(3, b.getCountrySelect());
			ps.setString(4, b.getCitySelect());
			ps.setString(5, b.getPrice());
			ps.setString(6, b.getFoodtype());
			ps.setString(7, b.getRestType());
			ps.setString(8, b.getOwnername());
			ps.setString(9, b.getMobileno());
			ps.setString(10, b.getEmail());			
			ps.setBlob(11, b.getImage());
			ps.setString(12, b.getImage_name());			
			ps.setString(13, b.getStatus());
			
			int index = ps.executeUpdate();

			if (index > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return flag;
	}





	public boolean AddFoodData(RestaurantBean b) {
		sql = "insert into addfood(foodname,rname,price,email,image,imagename,status,address) values(?,?,?,?,?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, b.getFoodname());
			ps.setString(2, b.getRname());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getEmail());			
			ps.setBlob(5, b.getImage());
			ps.setString(6, b.getImage_name());			
			ps.setString(7, b.getStatus());
			ps.setString(8, b.getAddress());
			
			int index = ps.executeUpdate();

			if (index > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return flag;
	}





	public boolean DeleteRestaurantImg(int id) {
		String sql="delete from addrestaurantimg where id='"+id+"'";
		 Connection con=DBConnection.getConnection();
		 try {
			ps=con.prepareStatement(sql);
			int index =ps.executeUpdate();
			if(index>0)
			{
				flag=true;
			}
			else
			{
				flag=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
			return flag;
	}





	public boolean DeleteFood(int id) {
		String sql="delete from addfood where id='"+id+"'";
		 Connection con=DBConnection.getConnection();
		 try {
			ps=con.prepareStatement(sql);
			int index =ps.executeUpdate();
			if(index>0)
			{
				flag=true;
			}
			else
			{
				flag=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
			return flag;
	}





	public boolean DeleteCart(int id) {
		String sql="delete from cart where id='"+id+"'";
		 Connection con=DBConnection.getConnection();
		 try {
			ps=con.prepareStatement(sql);
			int index =ps.executeUpdate();
			if(index>0)
			{
				flag=true;
			}
			else
			{
				flag=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
			return flag;
	}





	public boolean DeleteCustomer(int id) {
		String sql="delete from payment where id='"+id+"'";
		 Connection con=DBConnection.getConnection();
		 try {
			ps=con.prepareStatement(sql);
			int index =ps.executeUpdate();
			if(index>0)
			{
				flag=true;
			}
			else
			{
				flag=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
			return flag;
	}





	public boolean UpdateFoodOrderStatus(int id, String status) {
		if(status.equalsIgnoreCase("Accepted"))
			status="Pending";
		else
			status="Accepted";
		
		String sql="update cart set status=? where id=?";
		
		try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			ps.setString(1, status);
			ps.setInt(2, id);
			
			int index=ps.executeUpdate();
			if(index>0)
			{
				flag=true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return flag;
	}





	public ResultSet SelectFoodOrder() {
		ResultSet rs= null;
		String sql ="Select * from cart";
		try {
			PreparedStatement pstmt = DBConnection.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return rs;
	}

}
