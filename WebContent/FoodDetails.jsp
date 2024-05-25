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
  
  <script>
  function d()
  {
  	
  	
  	document.f1.price.value = +(document.f1.singleprice.value) + +(document.f1.quantity.value);

  	}

</script>
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
          <!-- <li><a class="nav-link scrollto" href="#about">About</a></li>
          -->
          <li class="dropdown"><a href="#"><span>Welcome<%response.setContentType("text/html");  
				 HttpSession sessio=request.getSession(true);  
	               if(session!=null){  
	               String name=(String)session.getAttribute("name");  
	                out.print(" "+name+""); }   %></span> <i class="bi bi-chevron-down"></i></a>
            <ul>     
                <li><a href="ViewProfile.jsp">View Profile</a></li>            
              <!-- <li><a href="ChangePassword.jsp">Change Password</a></li> -->
              <li><a href="LogoutController">Logout</a></li>  
            </ul>
          </li> 
         <!--  <li><a class="nav-link scrollto" href="#contact">Contact</a></li> -->
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
<!-- 
      <a href="SearchRestaurants.jsp" class="book-a-table-btn scrollto"><i class="bi bi-search"></i> Search</a>
 -->
    </div>
  </header><!-- End Header -->
<br><br><br>
<!-- ======= Menu Section ======= -->
    <section id="menu" class="menu">
      <div class="container">

        <div class="section-title">
          <h2>Add <span>To</span> Cart</h2>
        </div>

        <!-- <div class="row">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="menu-flters">
              <li data-filter="*" class="filter-active">Show All</li>
              <li data-filter=".filter-starters">Starters</li>
              <li data-filter=".filter-salads">Salads</li>
              <li data-filter=".filter-specialty">Specialty</li>
            </ul>
          </div>
        </div> -->

        <div class="row menu-container">

<%


                try{
                	
                String foodname=request.getParameter("foodname");
                String rname=request.getParameter("rname");
                	Connection con=DBConnection.getConnection();
                    Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery("select * from addfood where foodname='"+foodname+"'"); 
                     while(rs.next()) {
                        	%>
                        	
          <div class="col-lg-6 menu-item filter-starters">
            <div class="menu-content">
             <form action="AddFoodDetailsCon" method="post">
              <a style="color:black;" href="#">
             
             Food Name: <input type="text" name="foodname" value="<%=rs.getString(2)%>" readonly><br>
              Food Price: <input type="text" name="price" value="<%=rs.getString(4)%>" readonly><br>
              
             
              Quantity: <input type="number" name="quantity" placeholder="Enter Quantity" ><br>
              
                      Email:   <input type="email" name="email" value="${email }" readonly><br>
                       Restaurant Name:   <input type="text" name="rname" value="<%=rs.getString(3)%>" readonly><br>
                       Restaurant Address:   <input type="text" name="address" value="<%=rs.getString(9)%>" readonly><br>
                       Time Slot:   <input type="time" name="time" placeholder="time" required>
	</a><span>
             
     <br><br>
             <button type="submit" style="background-color:green; color:white;"> ADD TO CART</button>
             
              </span>
             </form>
            </div>
            <div class="menu-ingredients">
             
            </div>
          </div>


            
         <div class="col-lg-6 menu-item filter-specialty">
            <div class="menu-content">
              <a href="#"></a><span></span>
            </div>
            <div class="menu-ingredients">
             <img alt="Profile Pic" src="foodpic.jsp?id=<%=rs.getInt(1) %>"  width="260px" height="260px" />

            <%--   <input type="text" name="address" value="${address }"> --%>
            
          <% 
               	}
            }catch(Exception e)
            {
            	
            	
            }
            %>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Menu Section -->


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