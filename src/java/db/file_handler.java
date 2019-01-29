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
            //get values & files to be added to database
            String newModuleCode = request.getParameter("ModuleCode");
            ByteArrayInputStream[] files = new ByteArrayInputStream[4];
            //Exam
            byte[] file_data = (request.getParameter("fname1")).getBytes();
            files[0] = new ByteArrayInputStream(file_data);
            //Solution
            file_data = (request.getParameter("fname2")).getBytes();
            files[1] = new ByteArrayInputStream(file_data);
            //Resit
            file_data = (request.getParameter("fname3")).getBytes();
            files[2] = new ByteArrayInputStream(file_data);
            //ResitSolution
            file_data = (request.getParameter("fname4")).getBytes();
            files[3] = new ByteArrayInputStream(file_data);
            //Edit
            String Edit = request.getParameter("Edit");
            Object[] paramater_list = {newModuleCode, files[0], files[1], files[2], files[3], Edit};
            
            //check if file exists
            if(file_exists(newModuleCode)){
                //update file and metadata on database
                (new data_access()).run_statement(
                    "UPDATE pdf(ModuleCode,Exam,Solution,Resit,ResitSolution,Edit) VALUES('?','?','?','?','?','?') WHERE ModuleCode="+newModuleCode,paramater_list
                );
            }else{
                //add file and metadata to database
                (new data_access()).run_statement(
                    "INSERT INTO pdf(ModuleCode,Exam,Solution,Resit,ResitSolution,Edit) VALUES('?','?','?','?','?','?')",paramater_list
                );
            }
        }catch(SQLException e){
            response.sendRedirect("dberror.jsp");
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
