/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import db.conn;

/**
 *
 * @author finntorbet
 */
public class login {

    Connection c;

    public login() {
	conn conn1 = new conn();
        c = conn1.connect();
    }

    /**
    *
    * @author deren vural
    * 
    * @param    username
    * @param    password
    * @return   type
    */
    public String check_valid_details(String username, String password){
        try {
            //prepare statement
            PreparedStatement ps = c.prepareStatement("SELECT UserID FROM `18agileteam1db`.`users` where Username='?' and Password='?'");
            
            ps.setString(1, username);
            ps.setString(2, password);

	    return ps.toString();
	    
            //ResultSet rs = ps.executeQuery();
	    //if(rs.getString("UserID") == null){return "empty UserID";}else{return "working";}
	    //if(rs != null){if(rs.getStatement() != null){return "not null statement";}else{return "null statement";}}

	    //if(rs.getString("UserID") == null){return "column not found";}
	    
            //return value
	    //return rs.getString("UserID");
        }catch(SQLException e){
            e.printStackTrace();
            return "SQL Exception";
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
