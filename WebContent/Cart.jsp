<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>FoodOrderingSystem</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,600,600i,700,700i|Satisfy|Comic+Neue:300,300i,400,400i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Delicious
  * Updated: May 30 2023 with Bootstrap v5.3.0
  * Template URL: https://bootstrapmade.com/delicious-free-restaurant-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center header-transparent" style="background-color:#444444;">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <div class="logo me-auto">
        <h1><a href="Home.jsp">FoodOrderingSystem</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto" href="UserHome.jsp">Home</a></li>
           <li><a class="nav-link scrollto active" href="Cart.jsp">Cart</a></li>
          
          <li class="dropdown"><a href="#"><span>Welcome<%response.setContentType("text/html");  
				 HttpSession sessio=request.getSession(true);  
	               if(session!=null){  
	               String name=(String)session.getAttribute("name");  
	                out.print(" "+name+""); }   %></span> <i class="bi bi-chevron-down"></i></a>
            <ul>     
                <li><a href="ViewProfile.jsp">View Profile</a></li>            
           <!--    <li><a href="ChangePassword.jsp">Change Password</a></li> -->
              <li><a href="LogoutController">Logout</a></li>  
            </ul>
          </li> 
         <!--  <li><a class="nav-link scrollto" href="#contact">Contact</a></li> -->
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      
    </div>
  </header><!-- End Header -->
<br><br><br>
<!-- ======= Whu Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container">

        <div class="section-title">
          <h2>Your <span>Cart </span></h2>
          <p></p>
        </div>

        <div class="row">
        <%-- 
<%
                try{
                	
                	 HttpSession ss=request.getSession();
         			String email=(String)ss.getAttribute("email");
                	Connection con=DBConnection.getConnection();
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from user where email='"+email+"'");
                    
                    
                   /*  ResultSet rs=st.executeQuery("select addcategoryauction.id,addcategoryauction.categoryname,addsubcategoryauction.subcategoryname,addsessiondateauction.date,addsessiontimeauction.time,addcategoryauction.status from addcategoryauction inner join addsubcategoryauction on addcategoryauction.cat=addsubcategoryauction.cat inner join addsessiondateauction on addcategoryauction.cat=addsessiondateauction.cat inner join addsessiontimeauction on addcategoryauction.cat=addsessiontimeauction.cat");
                     */
                    //while(rs.next())
                    	
                    while(rs.next()) {
                   	%>
                   	 <div class="col-lg-12">
         
            <div class="box">
            <form action="OrderCon" method="post">
              <span>
            <h4>User Details</h4> 
</span>

              <h4> <input type="text" name="name" class="form-control" id="name" value="<%=rs.getString(2)%>" required></h4>
              <h4><input type="text" name="address" class="form-control" id="address" value="<%=rs.getString(3)%>" required></h4>
              <h4><input type="text" name="mobileno" class="form-control" id="mobileno" value="<%=rs.getString(5)%>" required></h4>
              <h4><input type="text" name="email" class="form-control" id="email" value="<%=rs.getString(4)%>" required></h4>
								
              <p> 
              
              	<% 
                   	}
                }catch(Exception e)
                {
                	
                	
                }
                %>
 --%>              <table class="table table-bordered">
							<tr class="danger">
								
								<!--  <th>Restaurant Name</th>
								<th>Restaurant Address</th>
								 -->
								<th>Food Name</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Restaurant Name</th>
								<th>Email</th>
							<!-- 	 <th>Order</th> -->
							 <th>Cancel</th>
								 <th>Remove</th>
								
								
							</tr>
							<%-- <%
							HttpSession ss1=request.getSession();
							String email=(String)ss1.getAttribute("email");
								Connection con1 = DBConnection.getConnection();
								Statement st1 = con1.createStatement();
								ResultSet rs1 = st1.executeQuery
								("select * from cart  where email='"+email+"'");
								while (rs1.next()) {
							%> --%>
							  <%
                try{
                	
                	HttpSession ss1=request.getSession();
					String email=(String)ss1.getAttribute("email");
					
					
						Connection con1 = DBConnection.getConnection();
						Statement st1 = con1.createStatement();
						ResultSet rs1 = st1.executeQuery("select * from cart  where email='"+email+"' && statuss='Pending' ");
                	/* Connection con=DBConnection.getConnection();
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from addproduct");  */ 
                   /*  ResultSet rs=st.executeQuery("select addcategoryauction.id,addcategoryauction.categoryname,addsubcategoryauction.subcategoryname,addsessiondateauction.date,addsessiontimeauction.time,addcategoryauction.status from addcategoryauction inner join addsubcategoryauction on addcategoryauction.cat=addsubcategoryauction.cat inner join addsessiondateauction on addcategoryauction.cat=addsessiondateauction.cat inner join addsessiontimeauction on addcategoryauction.cat=addsessiontimeauction.cat");
                     */
                    //while(rs.next())
                    	
                    while(rs1.next()) {
                   	%>
							<TR>
							  <%--   <td><%=rs1.getString(8)%></td>	
								<td><%=rs1.getString(9)%></td> --%>
								<td> <input type="text" name="foodname" class="form-control" id="foodname" value="<%=rs1.getString(2)%>" readonly></td>
								<td><input type="text" name="total" class="form-control" id="total" value="<%=rs1.getString(7)%>" readonly></td>
								<td><input type="text" name="quantity" class="form-control" id="quantity" value="<%=rs1.getString(4)%>" readonly></td>
								<td><input type="text" name="rname" class="form-control" id="rname" value="<%=rs1.getString(8)%>" readonly></td>
								<td><input type="email" name="email" class="form-control" id="email" value="<%=rs1.getString(5)%>" readonly></td>
								<%-- <td><button type="submit" style="background-color:green; color:white;"><a href="Order.jsp?foodname=<%=rs1.getString(2) %>">Order</a></button></td>
							 --%>
							<%--  <th><a href="UpdateUserRegistrationStatusCon?id=<%=rs.getInt(1)%>&statuss=<%=rs.getString(9)%>" style="color:green;"><%=rs.getString(9)%></a></th>
							 --%>
							 <th><a style="color:green;" href="UpdateCancelOrderController?id=<%=rs1.getInt(1)%>&statuss=<%=rs1.getString(11)%>"><%=rs1.getString(11)%></a></th> 
                    	
							<td><a href="DeleteCartCon?id=<%=rs1.getInt(1)%>" style="color:red;"><b>Delete</b></a></td>
							
							 
							</TR>

	<% 
                   	}
                }catch(Exception e)
                {
                	
                	
                }
                %>

						<%-- <%
							}
						%> --%>
						</table>
						
<table class="table table-bordered">
							<tr class="danger">
								
								<!--  <th>Restaurant Name</th>
								<th>Restaurant Address</th>
								 -->
								
								<th>Total</th>
								 
								
							</tr>
							<%
							HttpSession ss4=request.getSession();
							String email=(String)ss4.getAttribute("email");
								Connection con2 = DBConnection.getConnection();
								Statement st2 = con2.createStatement();
								ResultSet rs2 = st2.executeQuery("SELECT SUM(total) AS result FROM cart where email='"+email+"' && statuss='Pending'");
								while (rs2.next()) {
							%>
							<TR>
							  <!-- <td></td> -->
							<td> <% int sum = rs2.getInt("result");
							
            
            // Display the result on the JSP page
            out.println(" " + sum); %></td>
							</TR>


						
						</table>	
              
              <center><a href="Payment.jsp?total=<%=rs2.getString(1) %>"><button type="submit" style="background-color:green; color:white;">Order</button></a>
             <%
							}
						%>
              </form>
            </div>
          </div>
           
                
                
                
    	 	<%-- <%
								Connection con1 = DBConnection.getConnection();
								Statement st1 = con1.createStatement();
								ResultSet rs1 = st1.executeQuery("select * from cart");
								while (rs1.next()) {
							%>
    	 <div class="col-lg-6">
    	
                      
    	 <div class="box">
              
              <h4><%=rs1.getString(8)%></h4>
               <h4><%=rs1.getString(9)%></h4>
                <h4><%=rs1.getString(2)%></h4><h8><%=rs1.getString(3)%></h8><h6><%=rs1.getString(4)%></h6>
              
              
              <p> <center><button style="background-color:green;"><a style="color:white;" href="RestaurantDetails.jsp?rname=<%=rs1.getString(2)%>"> View Menu</a></button>
              </center>
              </p>
            </div>
    	 </div><%
							}
						%>
        --%>
<!-- <div class="col-lg-6">

						


						
</div> -->


              </center>
      </div>

      </div>
    </section><!-- End Whu Us Section -->


  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>