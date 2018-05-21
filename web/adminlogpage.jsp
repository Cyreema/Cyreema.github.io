<%-- 
    Document   : LogHomepage
    Created on : 2 May, 2018, 12:49:51 AM
    Author     : cyril
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>--%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Online shopping site</title>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link type="text/css" rel="stylesheet" href="Style_Home.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="jquery-3.2.1.js"></script>
	<script type="text/javascript" src="LogHomepage.js"></script>
</head>

<body>

    <%
   String user = session.getAttribute("user").toString();
   if(user == null) {
      response.sendRedirect("index.jsp");
   }
%>
<div class="header">
    <a class="bars" href="#">
			<i class="fa fa-bars"></i>
		</a>
    <a class='space' style="cursor: default; visibility: hidden;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                <a class='space' style="cursor: default; visibility: hidden;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                <a class='space' style="cursor: default; visibility: hidden;">&nbsp;</a>

        <div class="search">
      		<input type="search" id="search" placeholder="What are you looking for?" />
	  		<button id="srcbut"><span class="icon"><i class="fa fa-search"></i></span></button>
  		</div>
            
		
            <a href="adminlogpage.jsp" class="phome" style="width: 100px;">
                <i id="home" class="fa fa-home"></i>
            </a>
        <a href="adminviewcart.jsp" class="pcart" style="width: 100px;">
                <i id="cart" class="fa fa-shopping-cart"></i>
            </a>
        <a href="#" class="ploc" style="width: 100px;">
            <i class="fa fa-map-marker"></i>
        </a>
		
	</div>
    
		<div class="sidenav">
                        <a><img src="default_profile_icon.png" id="img"></a>
                        <a id="atag" class="atag"><% try{String s=session.getAttribute("user").toString();
                                                     out.println(s);}
                                                     catch(NullPointerException npe){}
                                                  %>
                        </a>
                        <a id="btag" class="atag">Cart Id:<span><%try{String s1=session.getAttribute("cartId").toString();
                                                                              out.println(s1);}
                                                                  catch(NullPointerException npe){}
                                                                %>
                        </span></a>
			<a class="atag" href="#"><li></li></a>
			<a class="atag" href="#"><li></li></a>
                        <a class="atag" href="#"><li><i class='fa fa-bolt' style="color: gold;">&nbsp;&nbsp;</i>Today's deals</li></a>
                        <a class="atag" href="#"><li><i class=''></i>Customer Supports</li></a>
                        <a class="atag" href="#"><li><i class='fa fa-truck'>&nbsp;&nbsp;</i>Service</li></a>
                        <a class="atag" href="#"><li><i class='fa fa-gift'>&nbsp;&nbsp;</i>Offers</li></a>
                        <a class="atag" href="addproduct.jsp"><li>Add products</li></a>
                        <a class="atag" href="LogOut"><li><i class="fa fa-sign-out"></i>&nbsp;&nbsp;LogOut</li></a>
								
		</div>
<!--Slide show-->                  
<div class="container" style="z-index: 0;"> 
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="formenforwomen.jpg" style="width:100%;" alt="for men for women"/>
      </div>

      <div class="item">
        <img src="category-men.png" alt="Chicago" style="width:100%;">
      </div>
        
      <div class="item">
          <img src="kidsoffer.jpg" alt="kids" style="width: 100%;">
      </div>
      <div class="item">
          <img src="PROMO_BANNERS.jpg" alt="promo banner" style="width: 100%;">
      </div>
        <div class="item">
            <img src="Flipkart-Watches-Exchange-Offers.jpg" style="width: 100%;" alt="flip cart watch exchange"/>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
        <% 
            Class.forName("org.h2.Driver");
                Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/Cyril","Admin","password");
                PreparedStatement ps=con.prepareStatement("SELECT * FROM PRODUCTS order BY PRODUCT_CATEGORY ;");
                ResultSet rs=ps.executeQuery();
                String pr="Rs.";
                
        %>
        <div class="containers">
            <ul>
                     <%while(rs.next()){%>
                     
                     <li>
                         <div class="imgph">
                             <img alt="not supported" src="images/<%=rs.getString(7)%>" width="200" height="200"/>
                         </div>
                         <a class="productname" href="#"><%=rs.getString(2)%></a></br>
                         <a class="price"><%=pr%><%=rs.getInt(4)%></a>
                             <form action='addtocart' method='post'>
                                 <input type="text" name="product_name" value="<%=rs.getString(2)%>" hidden="true"/>
                                  <input type="text" name="price" value="<%=rs.getString(4)%>" hidden="true"/>
                                   
                                  <button class="cartbut" type="submit"><i class="fa fa-shopping-cart"></i></button>
                             </form>
                    </li>
                     <%}%>
            </ul>
        </div>
              
     <footer class="footer" style="padding: 2%; overflow: hidden;">
        <table class="footertab" style="width: 100%; font-family: sans-serif; font-size: small; font-weight: bold; text-align: center; padding: 20px 20px 20px 120px;">
            <tr>
                <th class="ftbh">CUSTOMER SERVICE</th>
                <th class="ftbh">PAYMENT & SHIPPING</th>
                <th class="ftbh">PARTNERSHIP AND PROGRAMS</th>
            </tr>
            <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
            <tr>
                <td class="ftbd" style="padding: 5px auto;">
                    <li class="ftba" href="#">Our Guarantees</li>
                    <li>&nbsp;</li>
                    <li class="ftba" href="#">Order Tracking</li>
                    <li>&nbsp;</li>
                    <li class="ftba" href="#">Point & coupons</li>
                    <li>&nbsp;</li>
                    <li class="ftba" href="#">New User Guide</li>
                    <li>&nbsp;</li>
                    <li class="ftba" href="#">Frequently Add Question</li>
                    <li>&nbsp;</li>
                </td>
                <td>
                    <li class="ftba">Payment Method</li>
                    <li>&nbsp;</li>
                    <li class="ftba">Shipping Guide</li>
                    <li>&nbsp;</li>
                    <li class="ftba">Location We Ship To</li>
                    <li>&nbsp;</li>
                    <li class="ftba">Estimated Delivery Time</li>
                    <li>&nbsp;</li>
                    <li>&nbsp;</li>
                    <li>&nbsp;</li> 
                </td>
                <td>
                    <li class="ftba">Affiliate Program</li>
                    <li>&nbsp;</li>
                    <li class="ftba">Drop Shipping</li>
                    <li>&nbsp;</li>
                    <li class="ftba">Wholesale</li>
                    <li>&nbsp;</li>
                    <li class="ftba">Fashion Blogger Program</li>
                    <li>&nbsp;</li> 
                    <li>&nbsp;</li> 
                    <li>&nbsp;</li> 
                    
                </td>
            </tr>
        </table>
        <hr class="divider" style="width: 100%;">
        <table style="width: 100%; text-align: center;">
            <tr style="height: 50px;">
                <td style="font-size: 12px;"><a class="tab2a" href="#">About Us</a></td>
                <td style="font-size: 12px;"><a class="tab2a" href="#">Privacy Policy</a></td>
                <td style="font-size: 12px;"><a class="tab2a" href="#">Terms And Conditions</a></td>
                <td style="font-size: 12px;"><a class="tab2a" href="#">Intellectual Property Claims</a></td>
                <td style="font-size: 12px;"><a class="tab2a" href="#">Site Map</a></td>
                <td style="font-size: 12px;"><a class="tab2a" href="#">Contact Us</a></td>
                <td style="font-size: 12px;"><a class="tab2a" href="#">Newsletter</a></td>
                <td style="font-size: 18px;">
                    <a href="#" style="text-decoration: none; color: darkslategray; text-align: center;" class="fa fa-facebook-square">
                    </a>
                </td>
                <td style="font-size: 18px;">
                    <a href="#" style="text-decoration: none; color: darkslategray; text-align: center;" class="fa fa-twitter-square">
                    </a>
                </td>
                <td style="font-size: 18px;">
                    <a href="#" style="text-decoration: none; color: darkslategray; text-align: center;" class="fa fa-youtube-square">
                    </a>
                </td>
                <td style="font-size: 18px;">
                    <a href="#" style="text-decoration: none; color: darkslategray; text-align: center;" class="fa fa-instagram">
                    </a>
                </td>
            </tr>
        </table>
        <hr class="divider" style="width: 100%;">
        <p style="font-size: x-small; text-align: center; font-family: sans-serif;">Copyright <span class="fa fa-copyright"></span> 2017 - 2018 e-Kart All Right Reserved. </p>
    </footer>
</body>
</html>

