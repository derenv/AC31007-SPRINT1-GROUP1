/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;

/**
 *
 * @author finntorbet
 */
public class login {

    Connection c;

    public login() {
        c = conn.connect();
    }

    /**
    *
    * @author deren vural
    */
    public String check_valid_details(String username, String password){
        try {
            //prepare statement
            PreparedStatement ps = c.prepareStatement("SELECT UserID FROM users where Username=? and Password=?");
            
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            
            //return value
            return rs.getString("UserID");
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }
    }
    
    public boolean login() throws SQLException {
        PreparedStatement pst = c.prepareStatement("Select UIsername from teachers");
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            System.out.println(rs.next());
            return true;
        } else {
            return false;
        }
    }
}
