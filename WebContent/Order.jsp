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
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
           <li><a class="nav-link scrollto" href="Cart.jsp">Cart</a></li>
          
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

      <a href="SearchRestaurants.jsp" class="book-a-table-btn scrollto"><i class="bi bi-search"></i> Search</a>

    </div>
  </header><!-- End Header -->
<br><br><br>
<!-- ======= Whu Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container">

        <div class="section-title">
          <h2> <span>Order </span></h2>
          <p></p>
        </div>

         <div class="row">
      
         <form action="OrderPaymentCon" method="post" class="userform">
          <div class="row"> 
           <%


                try{
                	
                	HttpSession ss1=request.getSession();
					 String email=(String)ss1.getAttribute("email"); 
					String foodname=request.getParameter("foodname");
						Connection con = DBConnection.getConnection();
						Statement st= con.createStatement();
						/* ResultSet rs1 = st1.executeQuery("select * from cart  where email='"+email+"'"); */
						 ResultSet rs=st.executeQuery("select * from cart where foodname='"+foodname+"' && email='"+email+"'");
                    while(rs.next()) {
                   	%>
            <label><b>Food Details</b></label><br>
            <div class="col-md-4 form-group">
             <label>Food Name</label>
              <input type="text" name="foodname" class="form-control" id="foodname" value="<%=rs.getString(2)%>" readonly>
            </div>
            <div class="col-md-4 form-group mt-3 mt-md-0">
             <label>Price</label>
              <input type="text" class="form-control" name="price" id="price" value="<%=rs.getString(7)%>" readonly>
            </div>
            <div class="col-md-4 form-group mt-3 mt-md-0">
             <label>Quantity</label>
              <input type="text" class="form-control" name="quantity" id="quantity" value="<%=rs.getString(4)%>" readonly>
            </div>
            <div class="col-md-4 form-group mt-3 mt-md-0">
             <label>Restaurant Name</label>
              <input type="text" class="form-control" name="rname" id="rname" value="<%=rs.getString(8)%>" readonly>
            </div>
           <div class="col-md-4 form-group">
            <label>Email</label>
              <input type="email" name="email" class="form-control" id="email" value="<%=rs.getString(5)%>" readonly>
            </div>
            <br>
            <label><b>Payment Details</b></label><br>
            <div class="col-md-4 form-group">
            <label>Account No</label>
              <input type="text" name="accountno" class="form-control" id="accountno" placeholder="Enter account No." required>
            </div>
            <div class="col-md-4 form-group">
            <label>IFSC No.</label>
              <input type="text" name="ifsc" class="form-control" id="ifsc" placeholder="Enter ifsc No." required>
            </div>
            <div class="col-md-4 form-group">
            <label>Payment</label>
              <input type="text" name="total" class="form-control" id="total" value="<%=rs.getString(7)%>" readonly>
            </div>
            	<% 
                   	}
                }catch(Exception e)
                {
                	
                	
                }
                %>
          </div>
        
          <br>
          <div class="text-center"><button type="submit">Submit</button>
         
          </div>
          
        </form>
         
          

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