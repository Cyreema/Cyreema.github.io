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
        <title>View cart</title>
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
        <a href="#" class="pcart" style="width: 100px;">
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
            Class.forName("org.h2.Driver");
            Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/Cyril","Admin","password");
            PreparedStatement ps=con.prepareStatement("select * from cart_item where cart_id = ? ;");
            PreparedStatement ps1=con.prepareStatement("select grand_total from cart where cartid = ? ;");
            
            ps.setInt(1, cartid);
            ps1.setInt(1, cartid);
            ResultSet rs=ps.executeQuery();
            ResultSet rs1=ps1.executeQuery();
            String RS="Rs.";
        %>
        
        <div class="cart">
            <table class="carttab">
                <tr class="cartr">
                    <th></th><th class="carth">Product Name</th><th class="carth">Price</th><th class="carth">Quantity</th><th class="carth">Total</th>
                </tr>
                <%while(rs.next()){%>
                    <tr class="cartr">
                        <td class="cartc"></td>
                        <td class="cartc"><%=rs.getString(3)%></td>
                        <td class="cartc"><%=RS%><%=rs.getInt(4)%></td>
                        <td class="cartc"><%=rs.getInt(5)%></td>
                        <td class="cartc"><%=rs.getInt(6)%></td>
                        <form action="delete" method="get">
                            <input hidden="true" name="proname" value="<%=rs.getString(3)%>" />
                            <input hidden="true" name="price" value="<%=rs.getString(4)%>" />
                            <input hidden="true" name="cart_item_id" value="<%=rs.getString(2)%>" />
                            <input hidden="true" name="cartid" value="<%=s1%>" />
                            <td id="cartc" class="cartc"><button type="submit" style="font-size:20px"><i class="fa fa-trash-o"></i></button></td>
                        </form>
                    </tr>
                    
                <%}%>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><span id="outofstock" style="text-align: center; color: red; font-size: 12px;"></span></td>
                </tr>
                <tr class="catrr">
                        <td class="cartc"></td>
                        <td class="cartc"></td>
                        <td class="cartc"></td>
                        <td class="cartc"></td>
                        <td class="cartc"></td>
                    </tr>
                    <tr class="cartr">
                        <td class="cartc"></td>
                        <td class="cartc"></td>
                        <td class="cartc"></td>
                        <td class="cartc"></td>
                        <td class="cartc"></td>
                    </tr>
                
            </table>
        </div>
                <div class="cartbottam">
                    <table class="carttab">
                        <tr>
                <%while(rs1.next()){%>
                        <th class="carth">Gross Total</th>
                        <th class="carth">&nbsp;</th>
                        <th class="carth">&nbsp;</th>
                        <th class="carth">&nbsp;</th>
                        <th class="carth">&nbsp;</th>
                        <th class="carth">&nbsp;</th>
                        <th class="carth">&nbsp;</th>
                        <th class="carth">&nbsp;</th>
                        <th class="catrh"><%=rs1.getInt(1)%></th>
                        
                <%}%>
                        </tr>
                        <tr>
                            <td></td><td></td>
                        </tr>
                <tr>
           <%
            Class.forName("org.h2.Driver");
            Connection con1=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/Cyril","Admin","password");
            PreparedStatement ps2=con1.prepareStatement("select * from cart_item where cart_id = ? ;");
            PreparedStatement ps3=con1.prepareStatement("select grand_total from cart where cartid = ? ;");
            
            ps2.setInt(1, cartid);
            ps3.setInt(1, cartid);
            ResultSet rs2=ps2.executeQuery();
            ResultSet rs3=ps3.executeQuery();
           %>
               <form action="checkout" method="post">
               <%while(rs2.next()){%>
               <input type="number" id="price" required="true" name="price" value="<%=rs2.getInt(4)%>" hidden="true"/>
               <!---->
               <c:forEach var="proname" items="rs2.getString(3)">
                   <input type="text" id="proname" required="true" name="proname" value="<%=rs2.getString(3)%>" hidden="true"/>
               </c:forEach>
               <!---->
               <input type="hidden" name="fno" value="1"/>
               <input type="number" id="cartitemid" required="true" name="cartitemid" value="<%=rs2.getInt(2)%>" hidden="true"/>
               <input type="number" id="quantity" required="true" name="quantity" value="<%=rs2.getInt(5)%>" hidden="true"/>
                    <%while(rs3.next()){%>
                    <input type="number" required="true" id="grandtotal" name="grandtotal" value="<%=rs3.getInt(1)%>" hidden="true"/>
                    <%}%>
                <%}%>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <a href="purchaseaddress.jsp"><input style="border: none; cursor: pointer; width: 100%; height: 30px; background-color: hotpink;" type="submit" id="send" value="Buy Now"/></a>
                </td>
                <span id="submitdata"></span>
            </tr>
                </form>
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