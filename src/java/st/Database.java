/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package st;
import java.sql.Connection;
import java.sql.DriverManager;
import sun.security.util.Password;
      

/**
 *
 * @author balaji
 */
public class Database {

    
    public static Connection getConnection()
    {
       
        String username="hr";
       Connection con=null;
       final String password="hr";
       
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
             con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE",username,password);
            System.out.println("Conneccted ");
            
        }
        catch(Exception ex)
        {
            System.out.println("Database Error : "+ex);
            return null;
        }
        return con;
    }
}
