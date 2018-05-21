
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logoutservlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out=res.getWriter();
        //adding request dispatcher
        RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
        rd.forward(req, res);
        //deactivating session
        HttpSession S=req.getSession(false);
        S.invalidate();
        //logout msg
        System.out.println("You Have Successfully Logged Out..");
    }

}
