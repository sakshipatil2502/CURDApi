<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
       
          <li class="dropdown"><a href="#"><span>Welcome<%response.setContentType("text/html");  
				 HttpSession sessio=request.getSession(true);  
	               if(session!=null){  
	               String name=(String)session.getAttribute("name");  
	                out.print(" "+name+""); }   %></span> <i class="bi bi-chevron-down"></i></a>
            <ul>     
                <li><a href="ViewProfile.jsp">View Profile</a></li>            
            <!--   <li><a href="ChangePassword.jsp">Change Password</a></li> -->
              <li><a href="LogoutController">Logout</a></li>  
            </ul>
          </li> 
         <!--  <li><a class="nav-link scrollto" href="#contact">Contact</a></li> -->
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

     <!--  <a href="SearchRestaurants.jsp" class="book-a-table-btn scrollto"><i class="bi bi-search"></i> Search</a>
 -->
    </div>
  </header><!-- End Header -->
  
  
  <br> <br> <br>
 <section id="contact" class="contact">
      <div class="container">

  <div class="section-title">
          <h2><span>User</span> Profile</h2>
              </div>
      </div>
  <%
                     Connection con=DBConnection.getConnection();
                     Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery("select * from addrestaurant");
                     //while(rs.next())
                     if(rs.next() == false) {
                    	%>
									<h4 style="text-align: right; margin-right: 70px">
										<b>No Users Present</b>
									</h4>
									<%
                     }
                    else{
                    	int count=0;
                    	do{	 
                    	 if(count == 0) {	
                    	 %>
			
    
         <center><div class="row gutters-sm">
            
            <div class="padding">
           <!--  <div class="container center_div"> -->
            <div class="col-md-8" align="center">
              <div class="card mb-3">
                <div class="card-body">
                  
                  <div class="row">
                    <div class="col-sm-3">
                      <label class="mb-0">Name</label>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <%response.setContentType("text/html");  
                      if(session!=null){  
	                String std_name=(String)session.getAttribute("name"); 	          
	                out.print(" "+std_name+""); }   %>
                    </div>
                  </div>
                  <hr>
                  
                  <div class="row">
                    <div class="col-sm-3">
                      <label class="mb-0">Address</label>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <%response.setContentType("text/html");  
                      if(session!=null){  
	                String std_address=(String)session.getAttribute("address"); 	          
	                out.print(" "+std_address+""); }   %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <label class="mb-0">Mobile No</label>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <%response.setContentType("text/html");  
                      if(session!=null){  
	                String std_mobileno=(String)session.getAttribute("mobileno"); 	          
	                out.print(" "+std_mobileno+""); }   %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <label class="mb-0">Date of Birth</label>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <%response.setContentType("text/html");  
                      if(session!=null){  
	                String std_dob=(String)session.getAttribute("dob"); 	          
	                out.print(" "+std_dob+""); }   %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <label class="mb-0">Email</label>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <%response.setContentType("text/html");  
                      if(session!=null){  
	                String email=(String)session.getAttribute("email"); 	          
	                out.print(" "+email+""); }   %>
                    </div>
                  </div>
                  
                 
                </div>
              </div><%}%><%count++; }while(rs.next());}%>
 

      </div>
    </section><!-- End About Us Section -->


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