package db;
import java.io.ByteArrayInputStream;
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
    * close connection
    * 
    * @author deren vural
    * @throws   SQLException
    */
    public void close() throws SQLException{
	c.close();
    }
    
    /**
    * method for running string insert statements
    * 
    * @author deren vural
    * 
    * @param    statement
    * @return   results
    * @throws   SQLException
    */
    public ResultSet run_statement(String statement) throws SQLException {
        //
        PreparedStatement ps = c.prepareStatement(statement);

        //parse set of results
        ResultSet results = ps.executeQuery();

        return results;
    }
    
    /**
    * method for running string insert statements
    * 
    * @author deren vural
    * 
    * @param    statement
    * @param    ps_params
    * @return   results
    * @throws   SQLException
    */
    public ResultSet run_statement(String statement, Object[] ps_params) throws SQLException {
        PreparedStatement ps = c.prepareStatement(statement);
        
        //insert all parameters into statement
        for(int i=0;i<ps_params.length;i++){
            if(ps_params[i] instanceof ByteArrayInputStream){
                ps.setBinaryStream(i+1, (ByteArrayInputStream) ps_params[i]);
            }else if(ps_params[i] instanceof String){
                ps.setString(i+1, (String) ps_params[i]);
            }else{
                ps.setObject(i+1, ps_params[i]);
            }
        }

        //parse set of results
        ResultSet results = ps.executeQuery();

        return results;
    }
}
