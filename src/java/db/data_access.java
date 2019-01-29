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
    * method for running string insert statements
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
            
            //close connection
            c.close();
            
            return results;
        }catch(SQLException e){
            return null;
        }
    }
    
    /**
    * method for running string insert statements
    * 
    * @author deren vural
    * 
    * @param    statement
    * @param    ps_params
    * @return   results
    */
    public ResultSet run_statement(String statement, Object[] ps_params) {
        //
        try{
            PreparedStatement ps = c.prepareStatement(statement);
            
            //insert all parameters into statement
            for(int i=1;i<ps_params.length;i++){
                if(ps_params[i] instanceof ByteArrayInputStream){
                    ps.setBinaryStream(i, (ByteArrayInputStream) ps_params[i]);
                }else{
                    ps.setObject(i, ps_params[i]);
                }
            }
            
            //parse set of results
            ResultSet results = ps.executeQuery();
            
            //close connection
            c.close();
            
            return results;
        }catch(SQLException e){
            return null;
        }
    }
}
