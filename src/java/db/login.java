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
    * @throws   SQLException
    */
    public String check_valid_details(String username, String password) throws SQLException{
        //prepare & run statement
        Object[] params = {username,password};
        data_access accessor = new data_access();
        ResultSet rs = accessor.run_statement("SELECT UserID FROM users where Username='?' and Password='?'",params);
        accessor.close();
        
        //parse set of results
        if(rs == null){
            //return error code for redirect
            return "no result";
        }else{
            //get first in results and return type of user
            rs.next();

            return rs.getString("UserID");
        }
    }
}
