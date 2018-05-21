
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegistrationServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();
        response.setContentType("text/html");

        //accessing from Registration form
        String Name=request.getParameter("name");
        String Email=request.getParameter("email");
        String Pass=request.getParameter("password");
        //adding session
        
        //database connection

        try
        {
            Class.forName("org.h2.Driver");
            Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/Cyril","Admin","password");
            PreparedStatement ps=con.prepareStatement("insert into customer values(?,?,?)");
            PreparedStatement ps1=con.prepareStatement("insert into cart(EMAIL,GRAND_TOTAL) values(?,?)");
            ps.setString(1, Name);
            ps.setString(2, Email);
            ps.setString(3, Pass);
            
            ps1.setString(1, Email);
            ps1.setInt(2, 0);
            int r1;
            int r;
            
            try{
                r1=ps1.executeUpdate();
                r=ps.executeUpdate();
            }catch(SQLException e){
                r=0;
                r1=0;
            }
            
            //summary
           // int r=;
            if(r>0 && r1>0)
            {
                HttpSession session=request.getSession();
                session.setAttribute("user", Email);
                request.setAttribute("signed", Email);
                con.close();
                RequestDispatcher rd=request.getRequestDispatcher("Login_page.html");
                rd.forward(request, response);
                
                
            }
            else
            {
                out.println("<h3>Registration Failed Please Try Again !!</h3>");
                con.close();
                RequestDispatcher rd=request.getRequestDispatcher("Regstration_page.html");
                rd.include(request, response);
                
            }
            
        }
        catch(IOException | ClassNotFoundException | SQLException | ServletException e)
        {
            System.out.println(e);
        }
    }



}
