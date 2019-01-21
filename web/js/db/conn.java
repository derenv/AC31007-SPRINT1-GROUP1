/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package js.db;
import java.sql.*;
/**
 *
 * @author lewischristie
 */
public class conn {

       public static void connect() {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javademo?" + "user=root&password=");
            PreparedStatement pst = conn.prepareStatement("Select user,pass from login where user=? and pass=?");
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
               out.println("Valid login credentials");
            else
               out.println("Invalid login credentials");
}
       }
}
