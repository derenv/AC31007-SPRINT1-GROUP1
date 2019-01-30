package db;
import java.io.*;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.*;
import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

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
            //get values & files to be added to database
            String newModuleCode = request.getParameter("ModuleCode");
            ArrayList<ByteArrayInputStream> files = new ArrayList<>();
            
            
            ServletFileUpload x = new ServletFileUpload();
            FileItemIterator items = x.getItemIterator(request);
            // iterate items
            while (items.hasNext()) {
                FileItemStream item = items.next();
                if (!item.isFormField()) {
                    InputStream stream = item.openStream();
                    byte[] file_data = IOUtils.toByteArray(stream);
                    files.add(new ByteArrayInputStream(file_data));
                }
            }
            
            //form parameters for SQL command
            Object[] paramater_list = {newModuleCode, files.get(0), files.get(1), files.get(2), files.get(3)};
            
            //check if file exists
            if(file_exists(newModuleCode)){
                //update file and metadata on database
                (new data_access()).run_statement(
                    "UPDATE pdf(ModuleCode,Exam,Solution,Resit,ResitSolution) VALUES('?','?','?','?','?') WHERE ModuleCode="+newModuleCode,paramater_list
                );
            }else{
                //add file and metadata to database
                (new data_access()).run_statement(
                    "INSERT INTO pdf(ModuleCode,Exam,Solution,Resit,ResitSolution) VALUES('?','?','?','?','?')",paramater_list
                );
            }
        }catch(SQLException e){
            response.sendRedirect("dberror.jsp");
        } catch (FileUploadException ex) {
            Logger.getLogger(file_handler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /* 
     * download file (if it exists) to users downloads directory from database
     * NEEDS REWORK FOR 4 FILES
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
            String identifier = request.getParameter("ModuleCode");
            if(file_exists(identifier)){
                //get file from database & create input stream
                ResultSet rs = (new data_access()).run_statement("SELECT Exam FROM pdf WHERE ModuleCode="+identifier);
                //FOR EACH FILE
                for(int i=0;i<4;i++){
                    Blob file_blob = rs.getBlob(i);
                    InputStream inputStream = file_blob.getBinaryStream();

                    //create file location & output stream
                    String home = System.getProperty("user.home");
                    String file_name = identifier+"_"+Integer.toString(i)+".pdf";
                    File file = new File(home+"/Downloads/" + file_name);
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
                }//END OF LOOP
            }else{
                //error
                response.sendRedirect("dberror.jsp");//replace with invalid file error page
            }
        }catch(IOException | SQLException e){
            response.sendRedirect("dberror.jsp");
        }
    }
    
    /* 
     * checks wether file with given identifier exists in database
     * 
     * @param   identifier
     * @return   q
     */
    public boolean file_exists(String identifier) throws SQLException{
        //check if passed file exists
        return (new data_access()).run_statement("SELECT * FROM pdf WHERE ModuleCode="+identifier) != null;
    }
}
