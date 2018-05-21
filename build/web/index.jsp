<%-- 
    Document   : index
    Created on : 15 May, 2018, 10:14:33 PM
    Author     : cyril
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Home Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link type="text/css" rel="stylesheet" href="index.css"/>
	<script type="text/javascript" src="jquery-3.2.1.js"></script>
	<script type="text/javascript" src="index.js"></script>
</head>

<body>
    
    
    <div class="header">
        <a style="padding-top: 30px;" href="#">
                    <i class="fa fa-bars" ></i>
        </a>
        <a style="font-size: 45px; font-family: sans-serif; color: white; outline: #666666;"><img src="cart-icon-28346.png" style="height: 60px; width: 65px;" alt="logo"/>&nbsp;e-Kart</a>
        <a>&nbsp;</a>
        <div style="padding-top: 15px;" class="search">
      		<input type="search" id="search" placeholder="What are you looking for?" />
	  		<button id="srcbut"><span class="icon"><i class="fa fa-search"></i></span></button>
  		</div>
            
		
            <a style="padding-top: 28px;" href="index.jsp" id="phome">
                <i id="home" class="fa fa-home"></i>
            </a>
        <a style="padding-top: 25px;" href="emptycart.html" class="pcart">
                <i id="cart" class="fa fa-shopping-cart"></i>
            </a>
        <a style="padding-top: 25px;" href="#" id="ploc">
            <i class="fa fa-map-marker"></i>
        </a>
        <a style="padding-top: 25px;" class="login" href="Login_page.html">Sign-In &nbsp;<i class="fa fa-sign-in"></i></a>
                <a style="padding-top: 25px;" class="register" href="Regstration_page.html">Register &nbsp;<i class="fa fa-user-plus"></i></a>
		
	</div>
		<div class="sidenav">
			<a class="atag" href="#"><li></li></a>
                        <a class="atag" href="#"><li><i class='fa fa-bolt' style="color: gold;">&nbsp;&nbsp;</i>Today's deals</li></a>
                        <a class="atag" href="#"><li><i class=''></i>Customer Supports</li></a>
                        <a class="atag" href="#"><li><i class='fa fa-truck'>&nbsp;&nbsp;</i>Service</li></a>
                        <a class="atag" href="#"><li><i class='fa fa-gift'>&nbsp;&nbsp;</i>Offers</li></a>
								
		</div>
    <div id="signcart">
        <img id="signcartimg" style="width: 100%; padding-top: 60px;padding-left: 5px; padding-right: 5px;" alt="not support" src="cover page.jpg">
	</div>
     <% 
            Class.forName("org.h2.Driver");
                Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/Cyril","Admin","password");
                PreparedStatement ps=con.prepareStatement("select * from Products;");
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
                             <form action='emptyaddcart.html' >
                                 <input type="text" name="product_name" value="<%=rs.getString(2)%>" hidden="true"/>
                                  <input type="text" name="price" value="<%=rs.getString(4)%>" hidden="true"/>
                                   
                                  <button class="cartbut" type="submit"><i class="fa fa-shopping-cart"></i></button>
                             </form>
                    </li>
                     <%}%>
            </ul>
        </div>
            <% 
                PreparedStatement ps1=con.prepareStatement("select * from Products where product_category = 'men accessories';");
                ResultSet rs1=ps1.executeQuery();
                
                String pr1="Rs.";
                
        %>
        <div class="containers1">
            <ul>
                     <%while(rs1.next()){%>
                     
                     <li>
                         <div class="imgph">
                             <img alt="not supported" src="images/<%=rs1.getString(7)%>" width="200" height="200"/>
                         </div>
                         <a class="productname" href="#"><%=rs1.getString(2)%></a></br>
                         <a class="price"><%=pr1%><%=rs1.getInt(4)%></a>
                             <form action='emptyaddcart.html' >
                                 <input type="text" name="product_name" value="<%=rs1.getString(2)%>" hidden="true"/>
                                  <input type="text" name="price" value="<%=rs1.getString(4)%>" hidden="true"/>
                                   
                                  <button class="cartbut" type="submit"><i class="fa fa-shopping-cart"></i></button>
                             </form>
                    </li>
                     <%}%>
            </ul>
        </div>
    <footer class="footer" style="padding: 2%;">
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

