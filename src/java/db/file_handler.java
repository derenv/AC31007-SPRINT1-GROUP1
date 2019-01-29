package db;
import java.io.*;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.*;

/**
 *
 * @author deren vural
 */
public class file_handler {
    
    /* 
     * constructor
     * 
     */
    public file_handler(){
        //
    }
    
    /* 
     * upload file to server then upload file details to database
     * 
     * @param   request
     * @param   response
     * @throws  IOException
     */
    public void file_upload(HttpServletRequest request, HttpServletResponse response) throws IOException{
        try{
            //convert request to byte array input stream
            InputStream file_stream = request.getInputStream();
            ByteArrayInputStream stream = (ByteArrayInputStream) file_stream;
            
            //get module code, current stage and boolean edit values
            //module code
            //edit boolean
            Object[] paramater_list = {stream, null, null, null};
            
            //CHECK IF FILE IN DATABASE
            //if(file_exists(identifier)){
                //UPDATE
                //add file and metadata to database
                //(new data_access()).run_statement(
                //    "UPDATE pdf(file,Mod_code,Current_Stage,Edit) VALUES('?','?','?','?') WHERE X="+identifier,paramater_list
                //);
            //}else{
                //add file and metadata to database
                (new data_access()).run_statement("INSERT INTO pdf(file,Mod_code,Current_Stage,Edit) VALUES('?','?','?','?')",paramater_list);
            //}
        }catch(IOException e){
            response.sendRedirect("error.jsp");
        }
    }
    
    /* 
     * download file (if it exists) to users downloads directory from database
     * 
     * source:
     * https://www.codejava.net/java-se/jdbc/read-file-data-from-database-using-jdbc
     * 
     * @param   identifier
     * @return   q
     * @throws  IOException
     */
    public void file_download(HttpServletRequest request, HttpServletResponse response) throws IOException{
        //check if file exists
        try{
            String identifier = request.getParameter("name");
            if(file_exists(identifier)){
                //get file from database & create input stream
                ResultSet rs = (new data_access()).run_statement("SELECT file FROM pdf WHERE X="+identifier);
                Blob file_blob = rs.getBlob(1);
                InputStream inputStream = file_blob.getBinaryStream();
                
                //create file location & output stream
                String home = System.getProperty("user.home");
                String file_name = "TEST";
                File file = new File(home+"/Downloads/" + file_name + ".pdf");
                OutputStream outputStream = new FileOutputStream(file);
                
                //write to file
                int bytesRead = -1;
                byte[] buffer = new byte[2048];
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
 
                //end write
                inputStream.close();
                outputStream.close();
            }else{
                //error
                response.sendRedirect("error.jsp");
            }
        }catch(IOException | SQLException e){
            response.sendRedirect("error.jsp");
        }
    }
    
    /* 
     * checks wether file with given identifier exists in database
     * 
     * @param   identifier
     * @return   q
     */
    public boolean file_exists(String identifier){
        //check if passed file exists
        return (new data_access()).run_statement("SELECT * FROM pdf WHERE ID="+identifier) != null;
    }
}
