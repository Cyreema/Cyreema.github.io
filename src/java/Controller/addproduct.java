
package Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024*1024*2,
maxFileSize = 1024*1024*10,
maxRequestSize = 1024*1024*50)
public class addproduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        response.setContentType("text/html");
        //accessing from addproduct.html
        String id=request.getParameter("id");
        String pname=request.getParameter("name");
        String description=request.getParameter("description");
        int p=0;
        try{
        String price=request.getParameter("price");
        p=Integer.parseInt(price);
        }
         catch(NumberFormatException nfe){
            System.out.println(nfe);
        }
            String category=request.getParameter("category");
            Part part=request.getPart("link");
            String filename=extractFileName(part);
            System.out.println(filename);
		
            String savePath = "D:\\netbeans_project\\PGPJAVAPRO\\web\\images"+ File.separator + filename;
            File fileSaveDir = new File(savePath);
		
            part.write(savePath+File.separator);
            int q=0;
            try{
            String quantity=request.getParameter("quantity");
            q=Integer.parseInt(quantity);
            }
             catch(NumberFormatException nfe){
            System.out.println(nfe);
        }
        
        try
        {
            Class.forName("org.h2.Driver");
            Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/Cyril","Admin","password");
            PreparedStatement ps=con.prepareStatement("insert into products ( proid , proname , description , product_price , product_category , product_quantity , file_name, path ) values(?,?,?,?,?,?,?,?)");
            ps.setString(1,id );
            ps.setString(2, pname);
            ps.setString(3, description);
            ps.setInt(4, p);
            ps.setString(5, category);
            ps.setInt(6, q);
            ps.setString(7,filename);
            ps.setString(8, savePath);
            int r;
            try{
                r=ps.executeUpdate();
            }catch(SQLException e){
                r=0;
            }
            
            //summary
           // int r=;
            if(r>0)
            {
                out.println("<h4 class='successmsg'>Product Added Successfully</h4>");
                out.println("<h4 class='successmsg2'> Add More</h4>");
                RequestDispatcher rd=request.getRequestDispatcher("addproduct.jsp");
                rd.include(request, response);
                con.close();
                
            }
            else
            {
                out.println("<h4 class='successmsg'>Product Submission Failed Please Try Again !!</h4>");
                RequestDispatcher rd=request.getRequestDispatcher("addproduct.jsp");
                rd.include(request, response);
                con.close();
            }
            
        }
        catch(IOException | ClassNotFoundException | SQLException | ServletException e)
        {
            RequestDispatcher rd=request.getRequestDispatcher("addproduct.jsp");
            rd.forward(request, response);
        }
    }
    
    private String extractFileName(Part part) {
		String contentDisp=part.getHeader("content-disposition");
		String [] items=contentDisp.split(";");
		for(String s : items) {
			if(s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2,s.length()-1);
			}
		}
		return "";

    }
}



