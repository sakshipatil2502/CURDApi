package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.bean.RestaurantBean;
import com.bean.UserBean;
import com.connection.DBConnection;

public class UserDao {
	
	Connection connection=null;
	Boolean resultStatus=Boolean.FALSE;
	PreparedStatement ps;
	ResultSet rs;
    Statement st=null;
    String sql;
    boolean flag = false;

	public boolean InsertUserData(UserBean b) {
		sql = "insert into user(name,address,email,mobileno,dob,password,status) values(?,?,?,?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getName());
			ps.setString(2, b.getAddress());
			ps.setString(3, b.getEmail());
			ps.setString(4, b.getMobileno());
			ps.setString(5, b.getDob());
			ps.setString(6, b.getPassword());
			ps.setString(7, b.getStatus());
			

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

	public UserBean CheckUser(String email, String password) {
		UserBean bean=new UserBean();
		sql = "select * from user where email='" + email + "' and password='" + password + "' ";
		int flag = 0;
		try {
			Statement stmt = DBConnection.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				flag = 1;
				bean.setId(rs.getInt(1));
				bean.setName(rs.getString(2));					
				bean.setAddress(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setMobileno(rs.getString(5));
				bean.setDob(rs.getString(6));
				bean.setPassword(rs.getString(7));
				bean.setStatus(rs.getString(8));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		if(flag ==1)
			return bean;
		else 
			return null;
	}

	public boolean DeleteUser(int id) {
		String sql="delete from user where id='"+id+"'";
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

	public boolean UpdateUserData(UserBean b) {
		sql = "update user set name = ?,address =?,email= ?,mobileno= ?,dob= ?,password= ? where id = ?";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getName());
			ps.setString(2, b.getAddress());
			ps.setString(3, b.getEmail());
			ps.setString(4, b.getMobileno());
			ps.setString(5, b.getDob());
			ps.setString(6, b.getPassword());
			/*ps.setString(7, b.getStatus());*/
			ps.setInt(7, b.getId());
			

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

	public boolean UpdateUserPassword(String oldpass, String newpass) {
    
		sql="update user set password=? where password='"+oldpass+"'";
		
		Connection con = DBConnection.getConnection();
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, newpass);
			
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

	public boolean AddFoodDetailsData(UserBean b) {
		sql = "insert into cart(foodname,price,quantity,email,status,total,rname,address,time,statuss) values(?,?,?,?,?,?,?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getFoodname());
			ps.setInt(2, b.getPrice());
			ps.setInt(3, b.getQuantity());
			ps.setString(4, b.getEmail());
			ps.setString(5, b.getStatus());
			ps.setInt(6, b.getTotal());
			ps.setString(7, b.getRname());
			ps.setString(8, b.getAddress());
			ps.setString(9, b.getTime());
			ps.setString(10, b.getStatuss());
			

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

	public boolean alreadyUser(String email) throws SQLException {
		String sql="select * from user where email=?";
		connection=DBConnection.getConnection();
		ps=connection.prepareStatement(sql);
		ps.setString(1, email);
		rs=ps.executeQuery();
		if(rs.next())
		{
			resultStatus=true;
		}
		return resultStatus;
	}

	public boolean OrderPaymentData(UserBean b) {
		sql = "insert into order(foodname,price,quantity,rname,email,accountno,ifsc,total,status) values(?,?,?,?,?,?,?,?,?)";
		
		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getFoodname());
			ps.setInt(2, b.getPrice());
			ps.setInt(3, b.getQuantity());			
			ps.setString(4, b.getRname());
			ps.setString(5, b.getEmail());
			ps.setString(6, b.getAccountno());
			ps.setString(7, b.getIfsc());			
			ps.setInt(8, b.getTotal());
			ps.setString(9, b.getStatus());
			
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

	public boolean InsertOrderData(UserBean b) {
		sql = "insert into order(foodname,price,quantity,rname,email,accountno,ifsc,total,status) values(?,?,?,?,?,?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getFoodname());
			ps.setInt(2, b.getPrice());
			ps.setInt(3, b.getQuantity());
			ps.setString(4, b.getRname());
			ps.setString(5, b.getEmail());
			ps.setString(6, b.getAccountno());
			ps.setString(7, b.getIfsc());
			ps.setInt(8, b.getTotal());
			ps.setString(9, b.getStatus());
			

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

	public boolean FoodPaymentData(UserBean b) {
		sql = "insert into payment(accountno,ifsc,payment,email,deliveryaddress,status) values(?,?,?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getAccountno());
			ps.setString(2, b.getIfsc());
			ps.setString(3, b.getPayment());
			ps.setString(4, b.getEmail());
			ps.setString(5, b.getDeliveryaddress());
			ps.setString(6, b.getStatus());
			

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

	public boolean SendNotification(RestaurantBean b) {
		sql = "insert into notification(notification,rname,email,status) values(?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getMessage());
			ps.setString(2, b.getRname());
			ps.setString(3, b.getEmail());
			ps.setString(4, b.getStatus());
			

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

	public boolean UpdateCancelOrderStatus(int id, String statuss) {
		if(statuss.equalsIgnoreCase("Cancel"))
			statuss="Pending";
		else
			statuss="Cancel";
		
		String sql="update cart set statuss=? where id=?";
		
		try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			ps.setString(1, statuss);
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

	public ResultSet SelectCancelOrder() {
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
	


