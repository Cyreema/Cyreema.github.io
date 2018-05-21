
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cyril
 */
public class addtocart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        String cart=session.getAttribute("cartId").toString();
        int cartid=Integer.parseInt(cart);
        System.out.println(cartid);
        String proname=request.getParameter("product_name");
        int price=Integer.parseInt(request.getParameter("price"));
        session.setAttribute("price", price);
        request.setAttribute("proprice", price);
        System.out.println(price);
        int quantity=1;
        System.out.println(quantity);
        int total=price*quantity;
        System.out.println(total+"this is my total price after *");
        try{        
            Class.forName("org.h2.Driver");
            Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/Cyril","Admin","password");
            
            //to get the grandtotal before adding a product to cart
            int grandtotal=0;
            PreparedStatement ps3=con.prepareStatement("select grand_total from cart where cartid = ?;");
            ps3.setInt(1,cartid);
            ResultSet rs1=ps3.executeQuery();
            while(rs1.next())  
            {  
                grandtotal = rs1.getInt(1);
                System.out.println("grandtotal before adding product to cart:"+grandtotal);

            }  
            
            
            
            
            //adding a product to cart
            PreparedStatement ps=con.prepareStatement("insert into cart_item (cart_id, product_name, price, quantity, total) values (?,?,?,?,?);");
            ps.setInt(1, cartid);
            ps.setString(2, proname);
            ps.setInt(3, price);
            ps.setInt(4,quantity);
            ps.setInt(5, total);
            int status=ps.executeUpdate();
            if(status==1)
            {
                System.out.println(status+"product added to cart");


                grandtotal=grandtotal+total;
                PreparedStatement ps2=con.prepareStatement("update cart set grand_total=? where cartid = ?;");
              
                    ps2.setInt(1,grandtotal);
                    ps2.setInt(2, cartid);
                    int status2=ps2.executeUpdate();
                    System.out.println(grandtotal+"grandtotal updated"+status2);
                    System.out.println("Product Added To Cart Successfully");
                    RequestDispatcher rd=request.getRequestDispatcher("LogHomepage.jsp");
                    rd.include(request, response);
               
            }
            else{
                out.println("No Product Added To Cart Successfully");
             RequestDispatcher rd=request.getRequestDispatcher("LogHomepage.jsp");
                rd.include(request, response);   
            }
            
        }
        catch(IOException | ClassNotFoundException | SQLException | ServletException e){
            System.out.println(e);
            out.println("no Product Added To Cart Successfully");
             RequestDispatcher rd=request.getRequestDispatcher("LogHomepage.jsp");
                rd.include(request, response);   
        }
        
        
        
    }
}

