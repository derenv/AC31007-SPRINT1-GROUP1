package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;

/**
 *
 * @author finntorbet
 */
public class login {

    /**
    *
    * @author deren vural
    * 
    * @param    username
    * @param    password
    * @return   type
    */
    public String check_valid_details(String username, String password){
        try{
            //prepare & run statement
            ResultSet rs = (new data_access()).run_statement("SELECT UserID FROM `18agileteam1db`.`users` where Username='"+username+"' and Password='"+password+"'");

	    //parse set of results
	    if(rs == null){
		//return error code for redirect
		return "no result";
	    }else{
		//get first in results and return type of user
		rs.next();
		
		return rs.getString("UserID");
	    }
        }catch(SQLException e){
            return(e.getMessage());
        }
    }
}
