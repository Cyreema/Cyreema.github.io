package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out=response.getWriter();
        //accessing data from form for login
        
        String Email=request.getParameter("email");
        String Pass=request.getParameter("password");
        
        
        if(LoginValidate.validate(Email, Pass))
        {
            //Adding HTTP session
            HttpSession session=request.getSession();
            session.setAttribute("user", Email);
            int status=LoginValidate.getcartId(Email);
            System.out.println(status);
            session.setAttribute("cartId", status);
            if(Email.equalsIgnoreCase("admin@gmail.com")){
                RequestDispatcher rd=request.getRequestDispatcher("adminlogpage.jsp");
            rd.forward(request, response);
            request.setAttribute("signed", Email);
            
            out.close();
            }
            else{
            RequestDispatcher rd=request.getRequestDispatcher("LogHomepage.jsp");
            rd.forward(request, response);
//            request.setAttribute("signed", Email);
//            request.setAttribute("cartId", session.getAttribute("cartId"));
            
            out.close();}
        }
        else
        {
            RequestDispatcher rd=request.getRequestDispatcher("Login_page.html");
            rd.include(request, response);
            out.println("<h3 class ="+"errorlog"+">Login Failed Please Try Again !!</h3>");
            out.close();
        }
    }


}
