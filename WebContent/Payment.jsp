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
          <h2>Pay <span>Now </span></h2>
          <p></p>
        </div>

        <div class="row">
        
       <form action="PaymentController" method="post" class="userform">
          <div class="row">
          
           
            <div class="col-md-6 form-group mt-3 mt-md-0">
            <label><b>Account No</b></label>
              <input type="text" class="form-control" name="accountno" id="accountno" placeholder="Enter Account No." required>
            </div>
            <div class="col-md-6 form-group mt-3 mt-md-0">
              <label><b>IFSC code</b></label>
              <input type="text" class="form-control" name="ifsc" id="ifsc" placeholder="Enter IFSC Code" required>
            </div><br><br>
            <div class="col-md-6 form-group mt-3 mt-md-0">
             <label><b>Payment</b></label>
              <input type="text" class="form-control" name="payment" id="payment" placeholder="payment" required>
            </div>
              
          <div class="col-md-6 form-group">
           <label><b>Email</b></label>
              <input type="email" name="email" class="form-control" id="email" value="${email }" readonly>
            </div>    <br><br>                                                                     
            <div class="col-md-6 form-group">
             <label><b>Delivery Address</b></label>
              <textarea  name="deliveryaddress" class="form-control" id="deliveryaddress" required></textarea>
            </div> 
            
            		<%-- 	  <%
                try{
                	
                	HttpSession ss1=request.getSession();
					String rname=request.getParameter("rname");
					
					
						Connection con1 = DBConnection.getConnection();
						Statement st1 = con1.createStatement();
						ResultSet rs1 = st1.executeQuery("select * from cart  where rname='"+rname+"'");
                	/* Connection con=DBConnection.getConnection();
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from addproduct");  */ 
                   /*  ResultSet rs=st.executeQuery("select addcategoryauction.id,addcategoryauction.categoryname,addsubcategoryauction.subcategoryname,addsessiondateauction.date,addsessiontimeauction.time,addcategoryauction.status from addcategoryauction inner join addsubcategoryauction on addcategoryauction.cat=addsubcategoryauction.cat inner join addsessiondateauction on addcategoryauction.cat=addsessiondateauction.cat inner join addsessiontimeauction on addcategoryauction.cat=addsessiontimeauction.cat");
                     */
                    //while(rs.next())
                    	
                    while(rs1.next()) {
                   	%>
                   	<td><input type="email" name="email" class="form-control" id="email" value="<%=rs1.getString(5)%>" readonly></td>
								<% 
                   	}
                }catch(Exception e)
                {
                	
                	
                }
                %> --%>
          </div>
        
          <br>
          <div class="text-center"><button style="background-color:green; color:white;" type="submit">Submit</button>
           </div>
          
        </form>
      
                
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