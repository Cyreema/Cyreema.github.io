<%-- 
    Document   : addproduct
    Created on : 2 May, 2018, 9:43:19 PM
    Author     : cyril
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Add product</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="addproduct.css"/>
        <script type="text/javascript" src="jquery-3.2.1.js"></script>
        <script type="text/javascript" src="addproduct.js"></script>
    </head>
    <body>
        <%
           String user = session.getAttribute("user").toString();
           if(user == null) {
              response.sendRedirect("index.jsp");
           }
        %>
        
	<div class="sidenav">
                        <a><img src="default_profile_icon.png" id="img"></a>
                        <a id="atag" class="atag">
                            <%
                                String s=session.getAttribute("user").toString();
                                out.println(s);
                            %>
                        </a>
                        <a id="btag" class="atag">Cart Id:<span>
                                <%
                                    String s1=session.getAttribute("cartId").toString();
                                    out.println(s1);
                                %>
                                                          </span>
                        </a>
			<a class="atag" href="#"><li><i class='fa fa-bolt' style="color: gold;">&nbsp;&nbsp;</i>Today's deals</li></a>
                        <a class="atag" href="#"><li><i class=''></i>Customer Supports</li></a>
                        <a class="atag" href="#"><li><i class='fa fa-truck'>&nbsp;&nbsp;</i>Service</li></a>
                        <a class="atag" href="#"><li><i class='fa fa-gift'>&nbsp;&nbsp;</i>Offers</li></a>
                        <a class="atag" href="LogOut"><li><i class="fa fa-sign-out"></i>&nbsp;&nbsp;LogOut</li></a>
                        <a class="atag" href="addproduct.jsp"><li><i class="fa fa-shopping-bag"></i>&nbsp;&nbsp;Add products</li></a>
								
        </div>
	
	<div class="header">
            <a href="#">
		<i class="fa fa-bars"></i>
            </a>
            <a class='space' style="cursor: default; visibility: hidden;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            <a class='space' style="cursor: default; visibility: hidden;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            <a class='space' style="cursor: default; visibility: hidden;">&nbsp;</a>
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
	
        <div class="addproduct">
            <h2 id="proh">ADD PRODUCTS</h2>
            <form id="addproform" action="addproduct" method="post" enctype="multipart/form-data">
                <p>Product ID:</p>
                <input type="text" id="id" required name="id" autofocus="true" placeholder="Enter product Id"/>
                <p>Product Name:</p>
                <input type="text" id="name" required name="name" placeholder="Enter product name"/>
                <p>Description</p>
                <input type="text" id="description" required placeholder="Description of product"  name="description" />
                <p>Price</p>
                <input type="number" id="price" required placeholder="Price of product"  name="price" />
                <p>Product category</p>
                <input type="text" id="category" required placeholder="Category"  name="category" />
                <p>Image Upload</p>
                <input type="file" id="image" name="link"/>
                <p>Quantity</p>
                <input type="number" id="Quantity" required placeholder="Enter the quntity"  name="quantity" />
                </br></br></br>
                <button id="send" type="submit">ADD PRODUCT</button>
            </form>
        </div>
    </body>
</html>

