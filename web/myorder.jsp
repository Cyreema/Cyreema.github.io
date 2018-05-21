<%-- 
    Document   : viewcart
    Created on : 5 May, 2018, 4:44:17 PM
    Author     : cyril
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Order</title>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link type="text/css" rel="stylesheet" href="viewcart.css"/>
	<script type="text/javascript" src="jquery-3.2.1.js"></script>
	<script type="text/javascript" src="viewcart.js"></script>
    </head>
    <body>
        <div class="sidenav">
                        <a><img src="default_profile_icon.png" id="img"></a>
                        <a id="atag" class="atag"><%String s=session.getAttribute("user").toString();
                                                   out.println(s);
                                                 %>
                        </a>
                        <a id="btag" class="atag">Cart Id:<span><%String s1=session.getAttribute("cartId").toString();
                                                                              out.println(s1);
                                                                            %>
                        </span></a>
			<a class="atag" href="#"><li></li></a>
                        <a class="atag" href="#"><li><i class='fa fa-bolt' style="color: gold;">&nbsp;&nbsp;</i>Today's deals</li></a>
                        <a class="atag" href="#"><li><i class=''></i>Customer Supports</li></a>
                        <a class="atag" href="#"><li><i class='fa fa-truck'>&nbsp;&nbsp;</i>Service</li></a>
                        <a class="atag" href="#"><li><i class='fa fa-gift'>&nbsp;&nbsp;</i>Offers</li></a>
                        <a class="atag" href="#">Daily Deals</a>
								
		</div>
	<div class="header">
		<a href="#">
                    <i class="fa fa-bars"></i>
		</a>
            <a class='space' hidden="true">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
        <a class='space'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
        <a class='space'>&nbsp;</a>
        <div class="search">
      		<input type="search" id="search" placeholder="What are you looking for?" />
	  		<button id="srcbut"><span class="icon"><i class="fa fa-search"></i></span></button>
  		</div>
            
		
            <a href="LogHomepage.jsp" id="phome" style="width: 100px;">
                <i id="home" class="fa fa-home"></i>
            </a>
        <a href="viewcart.jsp" class="pcart" style="width: 100px;">
                <i id="cart" class="fa fa-shopping-cart"></i>
            </a>
        <a href="#" id="ploc" style="width: 100px;">
            <i class="fa fa-map-marker"></i>
        </a>

	</div>
                </br></br>
        
        <% 
            String cart=session.getAttribute("cartId").toString();
            int cartid=Integer.parseInt(cart);
            System.out.println(cartid+" cartid received from session");
            
            Class.forName("org.h2.Driver");
            Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/Cyril","Admin","password");
            
            PreparedStatement ps=con.prepareStatement("SELECT * FROM MY_ORDER where cart_id = ? orDER BY ORDERDATE  DESC ;");
            ps.setInt(1, cartid);
            ResultSet rs=ps.executeQuery();
            System.out.println(rs);
            
        %>
        <div class="cart">
            <table class="carttab" style="width:100%;">
                <%while(rs.next()){%>
                    <tr class="cartr">
                        <td class="cartc"></td>
                    </tr>
                    
                    <tr class="cartr">
                        <td style=" width: 60%; font-size: 15px; font-weight: bold; color: crimson"><%=rs.getString(3)%></td>
                    </tr>
                    <tr class="cartr">
                        <td style=" width: 60%; font-size: 12px;">Date of Purchase : <%=rs.getString(4)%></td>
                    </tr>
                    <tr class="cartr">
                        <td style=" width: 60%; font-size: 13px;">Purchase ID :<%=rs.getInt(6)%></td>
                    </tr>
                    <tr class="cartr">
                        <td style="font-size:14px; width: 60%;"><%=rs.getString(2)%></td>
                    </tr>
                    <tr class="cartr">
                        <td style="font-size: 13px; width: 60%;"><%=rs.getString(5)%></td>
                    </tr>
                    <tr>
                        <td><hr></td>
                    </tr>
                    
                <%}%>
                    <tr>
                        <td><a href="clearorder"><button style="border: none; cursor: pointer; background-color: hotpink; width: 30%; height: 30px;" type="submit">Clear list</button></a></td>
                    </tr>
            </table>
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
        <p style="font-size: x-small; text-align: center; font-family: sans-serif;">Copyright <span class="fa fa-copyright"></span> 2017 - 2018 E-kart All Right Reserved. </p>
    </footer>
    </body>
</html>