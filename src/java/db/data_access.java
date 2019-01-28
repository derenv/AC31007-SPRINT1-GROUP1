package db;
import java.sql.*;

/**
 *
 * @author deren
 */
public class data_access {
    
    Connection c;
    
    /**
    * constructor
    * 
    * @author deren vural
    */
    public data_access() {
	conn conn1 = new conn();
        c = conn1.connect();
    }
    
    /**
    *
    * @author deren vural
    * 
    * @param    statement
    * @return   results
    */
    public ResultSet run_statement(String statement) {
        //
        try{
            PreparedStatement ps = c.prepareStatement(statement);

            //parse set of results
            ResultSet results = ps.executeQuery();

            return results;
        }catch(SQLException e){
            //
        }

        return null;
    }
}
