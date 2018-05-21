
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class clearorder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html");
            HttpSession session=request.getSession();
            String cart=session.getAttribute("cartId").toString();
            int cartid=Integer.parseInt(cart);
            System.out.println(cartid+" cartid received from session");
        try{                     
            Class.forName("org.h2.Driver");
            Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/Cyril","Admin","password");
            PreparedStatement ps=con.prepareStatement("delete from my_order where cart_id = ? ;");
            ps.setInt(1, cartid);
            System.out.println("Deleted");
            int status=ps.executeUpdate();
            if(status>=0){
                System.out.println("Success");
                RequestDispatcher rd=request.getRequestDispatcher("myorder.jsp");
                rd.include(request, response);
            }
            else{
                System.out.println("failed");
                RequestDispatcher rd=request.getRequestDispatcher("LogHomepage.jsp");
                rd.include(request, response);
            }
        }
        catch(Exception e){
            System.out.println(e);
        }
    }

}
