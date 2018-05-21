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

public class deliveryservlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        String cart=session.getAttribute("cartId").toString();
        int cartid=Integer.parseInt(cart);
        System.out.println(cartid+" recived from session");
        //
        String name=request.getParameter("name");
        System.out.println(name+" name recived");
        String phnumber=request.getParameter("phnumber");
        System.out.println(phnumber+" phnumber recived");
        String address=request.getParameter("address");
        System.out.println("-- address recived");
        //
        int status=0;
        int status1=0;
        int status4=0;
        int status5=0;
        try{
            Class.forName("org.h2.Driver");
            Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/Cyril","Admin","password");
            //
            PreparedStatement ps=con.prepareStatement("SELECT * FROM TEMP_PROLIST WHERE ODATE =getDate();");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                String proname=rs.getString(1);
                int purchaseid=rs.getInt(2);
                PreparedStatement ps1=con.prepareStatement("insert into my_order(cart_id, name, proname , address, orderdate , purchaseid, phnumber) values(?,?,?,?,getDate(),?,?);");
                ps1.setInt(1, cartid);
                ps1.setString(2, name);
                ps1.setString(3, proname);
                ps1.setString(4,address);
                ps1.setInt(5, purchaseid);
                ps1.setString(6,phnumber);
                status=ps1.executeUpdate();
            }
//
            if(status>0)
            {
                System.out.println("truncate started");
                PreparedStatement ps2=con.prepareStatement("truncate table temp_prolist ;");
                status1=ps2.executeUpdate();
                System.out.println(status1+" status 1");
                //
                if(status1==0)
                {
                    System.out.println("truncated");
                    System.out.println("Delete Strated");
                    PreparedStatement ps4=con.prepareStatement("delete from cart_item where cart_id = ?;");
                    ps4.setInt(1, cartid);
                    System.out.println("deleted from cart item table");
                    status4=ps4.executeUpdate();
                    System.out.println(status4+" status");
                    System.out.println("deleted");
                    //
                    if(status4>0){
                    System.out.println("update started");
                    PreparedStatement ps5=con.prepareStatement("update cart set grand_total = 0 where cartid = ?;");
                    ps5.setInt(1, cartid);    
                    status5=ps5.executeUpdate();
                    System.out.println(status5+" status 1");
                    System.out.println("update completed");
                    }
                    //
                    if(status5>=0){
                    RequestDispatcher rd=request.getRequestDispatcher("payment.html");
                    rd.forward(request, response);
                    }                    
                    else{
                    System.out.println("failed");
                    RequestDispatcher rd1=request.getRequestDispatcher("purchaseaddress.jsp");
                    rd1.include(request, response);
            }
                }
                
                else{
                    System.out.println("failed");
                    RequestDispatcher rd=request.getRequestDispatcher("purchaseaddress.jsp");
                    rd.include(request, response);
                }
                }
            
            else{
                System.out.println("failed");
                RequestDispatcher rd=request.getRequestDispatcher("purchaseaddress.jsp");
                rd.include(request, response);
            }
            //
//            if(status4>=0 && status5>=0){
//                RequestDispatcher rd=request.getRequestDispatcher("payment.html");
//                rd.forward(request, response);
//            }
        }
        catch(Exception e){
                System.out.println("exception failed");
                System.out.println(e);
                RequestDispatcher rd=request.getRequestDispatcher("purchaseaddress.jsp");
                rd.include(request, response);
        }
    }

}
