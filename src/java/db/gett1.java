/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author sarahsmall
 */
public class gett1 {
    
    public String method1(){
        //
        try {
            Class.forName("com.mysql.jdbc.Driver");  //loads driver
            
            Connection c = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk/18agileteam1db", "18agileteam1", "7845.at1.5487");
          
            PreparedStatement ps = c.prepareStatement("SELECT * FROM users ");
            
            ResultSet rs = ps.executeQuery();
          
            while (rs.next()) {
               out.println( rs.getString("Module1"));
               return rs.getString("Module1");
             
            }
             
          
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            out.println("fail");
            e.printStackTrace();
        }
        return null;
    }
}
