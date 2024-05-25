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
  <style>
  .specials .userform button[type=submit] {
  background: #ffb03b;
  border: 0;
  padding: 10px 24px;
  color: #fff;
  transition: 0.4s;
  border-radius: 50px;
}
  input[type=text], input[type=password], input[type=date],input[id=select],select[id=countrySelect],select[id=citySelect],input[type=file]{
  
  width: 100%;
  padding: 2px 2px;
  margin: 2px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
  /* align:center; */
}
  
  </style>
  
 
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
          <li><a class="nav-link scrollto" href="ViewOrders.jsp">View Orders</a></li>
          <li><a class="nav-link scrollto" href="SendNotification.jsp">Send Notification</a></li>
          
           <li class="dropdown"><a href="#"><span>Welcome<%response.setContentType("text/html");  
				 HttpSession sessio=request.getSession(true);  
	               if(session!=null){  
	               String rname=(String)session.getAttribute("rname");  
	                out.print(" "+rname+""); }   %></span> <i class="bi bi-chevron-down"></i></a>
            <ul>     
                <!-- <li><a href="ViewProfileRestaurant.jsp">View Profile</a></li>            
              <li><a href="ChangePasswordRestaurant.jsp">Change Password</a></li> -->
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
 <!-- ======= Specials Section ======= -->
    <section id="specials" class="specials">
      <div class="container">

        <div class="section-title">
          <h2>Dash<span>Board</span></h2>
          <hr>
          <p></p>
        </div>

        <div class="row">
          <div class="col-lg-3">
            <ul class="nav nav-tabs flex-column">
              <li class="nav-item">
                <a class="nav-link active show" data-bs-toggle="tab" href="#tab-1">Add Rastaurant</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-2">View Rastaurants</a>
              </li>
              
             <!--   <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-3">View Rastaurant Image</a>
              </li> -->
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-4">Add Food</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-5">View Added Food</a>
              </li> 
            </ul>
          </div>
          <div class="col-lg-9 mt-4 mt-lg-0">
            <div class="tab-content">
              <div class="tab-pane active show" id="tab-1">
                <div class="row">
                  <div class="col-lg-12 details order-2 order-lg-1">
                    <h3>Add Rastaurant Image</h3>
                    <!-- <p class="fst-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                    --> 
                    <p>
                     <form action="AddImageController" method="post" class="userform" enctype="multipart/form-data">
          <div class="row">
            <div class="col-md-6 form-group">
              <input type="text" name="rname" class="form-control" id="rname" value="${rname}" readonly>
            </div>
            <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="address" rows="1" id="address" value="${address}" readonly>
            </div>
            
            <div class="col-md-6 form-group mt-3 mt-md-0">
        <input type="text" class="form-control" name="countrySelect" rows="1" id="countrySelect" value="${countrySelect}" readonly>
            </div>
           <div class="col-md-6 form-group">
          <input type="text" class="form-control" name="citySelect" rows="1" id="citySelect" value="${citySelect}" readonly>
            </div>
            <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="price" id="price" value="${price}"  readonly>
            </div>
             <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="foodtype" id="foodtype" value="${foodtype}"  readonly>
            </div>
             <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="restType" id="restType" value="${restType}"  readonly>
            </div>
            
            <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="ownername" id="ownername" value="${ownername}"  readonly>
            </div>
            <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="mobileno" id="mobileno" value="${mobileno}"  readonly>
            </div>
            <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="email" class="form-control" name="email" id="email" value="${email}"  readonly>
            </div>
            <div class="col-md-6 form-group mt-3 mt-md-0">
           
            </div>
            <div class="col-md-6 form-group">
              <input type="file" name="file" class="form-control" id="file" required>
            </div>
          </div>
        
          <br>
          <div class="text-center"><button type="submit">Submit</button>
          </div>
          
        </form>
                    
                    
                    
                    </p>
                  </div>
                <!--   <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="assets/img/specials-1.jpg" alt="" class="img-fluid">
                  </div> -->
                </div>
              </div>
              <div class="tab-pane" id="tab-2">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>View Restaurant</h3>
                    <p>
                    
                    <table class="table table-bordered" style="color:black">
                    
                     <%
                     HttpSession ss=request.getSession();
            			String email=(String)ss.getAttribute("email");
                     Connection con=DBConnection.getConnection();
                     Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery("select * from addrestaurant where email='"+email+"'");
                     //while(rs.next())
                     if(rs.next() == false) {
                    	%>
                    	<h4><b>No Restaurant Present</b></h4>
                    	<%
                     }
                    else{
                    	int count=0;
                    	do{	 
                    	 if(count == 0) {	
                    	 %>
                    	 <tr  class="danger" style="color:black">
                    	 <th>Restaurant Name</th>
		                    <th>address</th>
		                    <th>countrySelect</th>		                    
		                     <th>citySelect</th>		                     
		                      <th>price</th>
		                     <th>foodtype</th>
		                     <!-- <th>restType</th>
		                     <th>ownername</th>
		                     <th>mobileno</th>
		                     --> <th>Status</th>
		                    <!--  <th>Action</th> -->
		                  </tr>
		                  <%}%>
                    	 <TR>
                    	 <td style="color:black"><%=rs.getString(2) %></td>
                    	 <td style="color:black"><%=rs.getString(3) %></td> 
                    	 <td style="color:black"><%=rs.getString(4) %></td>
                    	 <td style="color:black"><%=rs.getString(5) %></td>
                    	 <td style="color:black"><%=rs.getString(6) %></td>
                    	 <td style="color:black"><%=rs.getString(7) %></td>
                    	
                    	<%-- <th><a href="UserStatusController?id=<%=rs.getInt(1)%>&status=<%=rs.getString(9)%>"><%=rs.getString(9)%></a></th> --%>
                    	 <td><a href="DeleteRestaurantCon?id=<%=rs.getInt(1)%>"><b>Delete</b></a></td>
                    	 </TR>                    	 
                    <%count++; }while(rs.next());}%> 
                   
                    </table> >
					</div>
				</div>
			</div>
		
              <div class="tab-pane" id="tab-3">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>View Restaurant Image</h3>
                     <p>
                     
                       
                    <table class="table table-bordered" style="color:black">
                    
                     <%
                     HttpSession ss1=request.getSession();
         			/* String email=(String)ss1.getAttribute("email"); */
                     Connection con1=DBConnection.getConnection();
                     Statement st1=con1.createStatement();
                     ResultSet rs1=st1.executeQuery("select * from addrestaurantimg where email='"+email+"'");
                     //while(rs.next())
                     if(rs1.next() == false) {
                    	%>
                    	<h4><b>No Restaurant Present</b></h4>
                    	<%
                     }
                    else{
                    	int count=0;
                    	do{	 
                    	 if(count == 0) {	
                    	 %>
                    	 <tr  class="danger" style="color:black">
                    	 <th>Restaurant Image</th>
                    	 <th>Restaurant Name</th>
		                    <th>address</th>
		                   
		                     <th>Status</th>
		                    <!--  <th>Action</th> -->
		                  </tr>
		                  <%}%>
                    	 <TR>
                    	 <td><img alt="Profile Pic" class="img-circle" src="restaurantpic.jsp?id=<%=rs1.getInt(1) %>"  width="100px" height="50px"/></td>
                    	 
                    	 <td style="color:black"><%=rs1.getString(2) %></td>
                    	 <td style="color:black"><%=rs1.getString(3) %></td> 
                    	
                    	<%-- <th><a href="UserStatusController?id=<%=rs.getInt(1)%>&status=<%=rs.getString(9)%>"><%=rs.getString(9)%></a></th> --%>
                    	 <td><a href="DeleteRestaurantImageCon?id=<%=rs1.getInt(1)%>"><b>Delete</b></a></td>
                    	 </TR>                    	 
                    <%count++; }while(rs.next());}%> 
                   
                    </table> 
                     
                     </p> </div>
                 
                </div>
              </div>
              <div class="tab-pane" id="tab-4">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Add Food</h3>
                    <p>
                      <form action="AddFoodController" method="post" class="userform" enctype="multipart/form-data">
          <div class="row">
            <div class="col-md-6 form-group">
             
              <input type="text" class="form-control" name="foodname" id="foodname" placeholder="Enter Food Name" required>
            </div>
            <div class="col-md-6 form-group mt-3 mt-md-0">
               <input type="text" class="form-control" name="price" id="price" placeholder="Enter Price"  required>
            </div>
            
            <div class="col-md-6 form-group mt-3 mt-md-0">
            <input type="file" name="file" class="form-control" id="file" required>
            </div>
           <div class="col-md-6 form-group">
          <input type="text" name="rname" class="form-control" id="rname" value="${rname}" readonly>
            </div>
             <div class="col-md-6 form-group">
          <input type="text" name="address" class="form-control" id="address" value="${address}" readonly>
            </div>
             <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="email" class="form-control" name="email" id="email" value="${email}"  readonly>
            </div>
           <%--   <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="foodtype" id="foodtype" value="${foodtype}"  readonly>
            </div>
             <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="restType" id="restType" value="${restType}"  readonly>
            </div>
            
            <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="ownername" id="ownername" value="${ownername}"  readonly>
            </div>
            <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="mobileno" id="mobileno" value="${mobileno}"  readonly>
            </div>
            <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="email" class="form-control" name="email" id="email" value="${email}"  readonly>
            </div>
            <div class="col-md-6 form-group mt-3 mt-md-0">
           
            </div>
            <div class="col-md-6 form-group">
              <input type="file" name="file" class="form-control" id="file" required>
            </div>  --%>
          </div>
        
          <br>
          <div class="text-center"><button type="submit">Submit</button>
          </div>
          
        </form>
                    
                    </p>
                     </div>
                 
                </div>
              </div>
              <div class="tab-pane" id="tab-5">
                <div class="row">
                  <div class="col-lg-12 details order-2 order-lg-1">
                    <h3>View Foods</h3>
                    <p>
                     <table class="table table-bordered" style="color:black">
                    
                     <%
                     HttpSession ss2=request.getSession();
         			/* String email=(String)ss.getAttribute("email"); */
                     Connection con2=DBConnection.getConnection();
                     Statement st2=con2.createStatement();
                     ResultSet rs2=st2.executeQuery("select * from addfood where email='"+email+"'");
                     //while(rs.next())
                     if(rs2.next() == false) {
                    	%>
                    	<h4><b>No Restaurant Present</b></h4>
                    	<%
                     }
                    else{
                    	int count=0;
                    	do{	 
                    	 if(count == 0) {	
                    	 %>
                    	 <tr  class="danger" style="color:black">
                    	
                    	 <th>Food Image</th>
                    	 <th>Food Name</th>
                    	 <th>Restaurant Name</th>
		                    <th>Price</th>
		                   
		                     <th>Status</th>
		                    <!--  <th>Action</th> -->
		                  </tr>
		                  <%}%>
                    	 <TR>
                    	 <td><img alt="Profile Pic" class="img-circle" src="foodpic.jsp?id=<%=rs2.getInt(1) %>"  width="100px" height="50px"/></td>
                    	 
                    	 <td style="color:black"><%=rs2.getString(2) %></td>
                    	 <td style="color:black"><%=rs2.getString(3) %></td> 
                    	 <td style="color:black"><%=rs2.getString(4) %></td> 
                    	
                    	<%-- <th><a href="UserStatusController?id=<%=rs.getInt(1)%>&status=<%=rs.getString(9)%>"><%=rs.getString(9)%></a></th> --%>
                    	 <td><a href="DeleteFoodCon?id=<%=rs2.getInt(1)%>"><b>Delete</b></a></td>
                    	 </TR>                    	 
                    <%count++; }while(rs.next());}%> 
                   
                    </table> 
                    </p>
                    </div>
                 
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Specials Section -->

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