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
	    String statement = "SELECT UserID FROM `18agileteam1db`.`users` where Username='"+username+"' and Password='"+password+"'";
            PreparedStatement ps = c.prepareStatement(statement);

	    //parse set of results
            ResultSet rs = ps.executeQuery();
	    if(rs == null){
		//return error code for redirect
		return "no result";
	    }else{
		//get first in results and return type of user
		rs.next();

		//close database connection
		conn conn1 = new conn();
		conn1.close(c);
		
		return rs.getString("UserID");
	    }
        }catch(SQLException e){
            return(e.getMessage());
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
