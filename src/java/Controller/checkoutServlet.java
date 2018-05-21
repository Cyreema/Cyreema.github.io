
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class checkoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NumberFormatException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        System.out.println("started");
        //
        String s=session.getAttribute("cartId").toString();
        int cartid=Integer.parseInt(s);
        System.out.println(cartid+" recived from session");
        //
        int stock=0;
        //
        int cartitemid=0;
        try{
        cartitemid=Integer.parseInt(request.getParameter("cartitemid"));
        System.out.println(cartitemid+" received");
        }
         catch(NumberFormatException nfe){
            System.out.println(nfe);
            RequestDispatcher rd=request.getRequestDispatcher("viewcart.jsp");
            rd.include(request, response);
        }
        //
        int price=0;
        try{
        price=Integer.parseInt(request.getParameter("price"));
        System.out.println(price+" received");
        }
         catch(NumberFormatException nfe){
            System.out.println(nfe);
        }
        //
        int grandtotal=0;
        try{
        grandtotal=Integer.parseInt(request.getParameter("grandtotal"));
        System.out.println(grandtotal+" received");
        }
         catch(NumberFormatException nfe){
            System.out.println(nfe);
        }
        //
        int status2=0;
        int status4=0;
//
        String [] proname=request.getParameterValues("proname");
        for(String name : proname){
        System.out.println(name+" product name");
        System.out.println("--------------------------------------------------------------------------------------");
        
        try{
            Class.forName("org.h2.Driver");
            Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/Cyril","Admin","password");
//            int stock=0;
            System.out.println(stock+" before retriving"); 
            PreparedStatement ps3=con.prepareStatement("select product_quantity from products where proname in (?)");
            ps3.setString(1, name);
            ResultSet rs=ps3.executeQuery();
            while(rs.next()){
                stock=rs.getInt(1);
                System.out.println(stock+" after retriving and before updating");
            }
            if(stock > 0){
            int quanti=0;
            try{
            quanti=Integer.parseInt(request.getParameter("quantity"));
            System.out.println(quanti+" from form");
            }
             catch(NumberFormatException nfe){
            System.out.println(nfe);
            }
            stock=stock - quanti;
            System.out.println(stock+" after retrive and update outside DB");
            PreparedStatement ps2=con.prepareStatement("update products set product_quantity =? where proname = ?");
            ps2.setInt(1, stock);
            ps2.setString(2, name);
            status2=ps2.executeUpdate();
            System.out.println(status2+" status 2");
            //
            System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
            System.out.println("inserting to temp tab started");
            PreparedStatement ps4=con.prepareStatement("insert into temp_prolist ( proname , odate ) values ( ?,getDate());");
            ps4.setString(1, name);
            status4=ps4.executeUpdate();
            System.out.println(status4+" status 4");
            System.out.println("inserting to temp tab finished");
            //
            System.out.println("<-----------------------------------------><--------------------------------------------->");
            
            //
            }
            
        }
        
        catch(Exception e){
                 System.out.println(e);
        }
             
            }
        if(status2>=0 && status4>=0 && stock>0)
            {
                RequestDispatcher rd=request.getRequestDispatcher("purchaseaddress.jsp");
                rd.include(request, response);
                System.out.println("Successfully completed");
            }
             else{
                System.out.println("Failed");
                if(stock==0){
                    out.println("<span id=\"outofstock\" style=\"text-align: center; color: red; font-size: 12px;\">!!out of stock..</span>");
                    RequestDispatcher rd=request.getRequestDispatcher("viewcart.jsp");
                    rd.include(request, response);
                }
            
        }
        
    }
}