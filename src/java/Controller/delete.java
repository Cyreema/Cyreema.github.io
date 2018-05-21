
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

public class delete extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String id=request.getParameter("cart_item_id");
        int cartitemid=Integer.parseInt(id);
        System.out.println(cartitemid+"*********************************");
        String pr=request.getParameter("price");
        int price=Integer.parseInt(pr);
        System.out.println(price+"*********************************");
        String cid=request.getParameter("cartid");
        int cartid=Integer.parseInt(cid);
        System.out.println(cartid+"*********************************");

        
        
        try
           {            
            Class.forName("org.h2.Driver");
            Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/Cyril","Admin","password");
            PreparedStatement ps=con.prepareStatement("delete from cart_item where cart_item_id = ?;");
            ps.setInt(1, cartitemid);
            System.out.println("deleted");
            int grandtotal=0;
            PreparedStatement ps1=con.prepareStatement("select grand_total from cart where cartid = ?;");
            ps1.setInt(1, cartid);
            ResultSet rs=ps1.executeQuery();
            
            while(rs.next())
            {
                grandtotal=rs.getInt(1);
            }
            System.out.println("retrived grand total: "+grandtotal);
            int status=ps.executeUpdate();
            //summary
            if(status>=0)
            {
                System.out.println("removed successfully");
                //
                grandtotal=grandtotal-price;
                PreparedStatement ps2=con.prepareStatement("update cart set grand_total=? where cartid = ?;");
                ps2.setInt(1, grandtotal);
                ps2.setInt(2, cartid);
                int status2=ps2.executeUpdate();
                System.out.println(grandtotal+"grandtotal updated"+status2);
                System.out.println("removed successfully");
                RequestDispatcher rd=request.getRequestDispatcher("viewcart.jsp");
                rd.include(request, response);
            }
            else
            {
                out.println("Remove From Cart Failed");
             RequestDispatcher rd=request.getRequestDispatcher("viewcart.jsp");
                rd.include(request, response);
            }
            
            
           }
        catch(IOException | ClassNotFoundException | SQLException | ServletException e)
        {
           System.out.println(e);
            out.println("Remove From Cart Failed");
             RequestDispatcher rd=request.getRequestDispatcher("viewcart.jsp");
                rd.include(request, response);
        }
    }

}