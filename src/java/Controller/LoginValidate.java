
package Controller;

import java.sql.*;
import java.sql.DriverManager;

public class LoginValidate
{
    public static boolean validate(String email, String password)
    {
        boolean status=false;
            try
            {
                Class.forName("org.h2.Driver");
                Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/Cyril","Admin","password");
                PreparedStatement ps=con.prepareStatement("select * from customer where email=? and password=?");
                
                ps.setString(1, email);
                ps.setString(2, password);
                
                ResultSet rs=ps.executeQuery();
                
                status=rs.next();
                con.close();
            }
            catch(ClassNotFoundException | SQLException e)
            {
                System.out.println(e);
            }
        return status;
    }
    
    public static int getcartId(String email){
        int status=0;
         try
            {
                Class.forName("org.h2.Driver");
                Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/Cyril","Admin","password");
                PreparedStatement ps=con.prepareStatement("select cartid from cart where email=?");
                
                ps.setString(1, email);
                ResultSet rs=ps.executeQuery();
               
               
              while(rs.next())  
{  
     status = rs.getInt(1);
System.out.println(status+"cart id recieved from table");  
                  
}  
                con.close();
            }
         catch(ClassNotFoundException | SQLException e){
              System.out.println(e);
         }
         return status;
    }
}
