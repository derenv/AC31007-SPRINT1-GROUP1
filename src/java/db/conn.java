/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author finntorbet
 */
public class conn {


    public Connection connect() {

        String db = "18agileteam1db";
        String user = "18agileteam1"; // assumes database name is the same as username
        try {
            java.sql.Connection DBcon;
            try {
                Class.forName("org.gjt.mm.mysql.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(conn.class.getName()).log(Level.SEVERE, null, ex);
                 
                
                
                return null;
            }
            DBcon = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk/" + db, user, "7845.at1.5487");
            System.out.println(db + " database successfully opened.");
          
            
            return DBcon;
        } catch (SQLException e) {
            System.out.println("SQLException caught: " + e.getMessage());
            return null;
        }
    }
}



    

