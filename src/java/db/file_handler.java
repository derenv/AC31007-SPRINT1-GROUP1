package db;
import java.io.*;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.*;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.IOUtils;
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
     * @param   session
     * @throws  IOException
     */
    public void file_upload(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
        try{
            //get values & files to be added to database
            String newModuleCode = "";
            ArrayList<ByteArrayInputStream> files = new ArrayList<>();
            
            //get all files in multipart form request
            ServletFileUpload x = new ServletFileUpload();
            FileItemIterator items = x.getItemIterator(request);
            
            //iterate items
            while (items.hasNext()) {
                FileItemStream item = items.next();
                if (!item.isFormField()) {
                    InputStream stream = item.openStream();
                    byte[] file_data = IOUtils.toByteArray(stream);
                    files.add(new ByteArrayInputStream(file_data));
                }else{
                    String name = item.getFieldName();
                    if(name.equals("modCode")){
                        newModuleCode = Streams.asString(item.openStream());
                    }
                }
            }
            
            //form parameters for SQL command
            Object[] paramater_list = {newModuleCode, files.get(0), files.get(1), files.get(2), files.get(3)};
            
            if(file_exists(newModuleCode)){
                //update file and metadata on database
                response.sendRedirect("feerror.jsp");
            }else{
                //add file and metadata to database
                (new data_access()).run_statement(
                    "INSERT INTO pdf(ModuleCode,Exam,ExamSolution,Resit,ResitSolution) VALUES(?,?,?,?,?)",paramater_list
                );
                //set stage to 1
                (new data_access()).run_statement(
                    "UPDATE exams SET Stage = Stage+1 WHERE ModuleCode='"+newModuleCode+"'"
                );
                
                response.sendRedirect("viewExams.jsp");
            }
        }catch(SQLException e){
            session.setAttribute("state", e.getSQLState());
            session.setAttribute("code", e.getErrorCode());
            session.setAttribute("mess", e.getMessage());
            response.sendRedirect("error pages/dberror.jsp");
        } catch (FileUploadException ex) {
            response.sendRedirect("error pages/dberror.jsp");
        }catch (NullPointerException eq) {
            response.sendRedirect("error pages/dberror.jsp");
        }
    }
    
    /* 
     * upload file to server then upload file details to database
     * 
     * @param   request
     * @param   response
     * @param   session
     * @throws  IOException
     */
    public void file_update(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
        try{
            //get values & files to be added to database
            String newModuleCode = "";
            ArrayList<ByteArrayInputStream> files = new ArrayList<>();
            
            //get all files in multipart form request
            ServletFileUpload x = new ServletFileUpload();
            FileItemIterator items = x.getItemIterator(request);
            
            //iterate items
            while (items.hasNext()) {
                FileItemStream item = items.next();
                if (!item.isFormField()) {
                    InputStream stream = item.openStream();
                    byte[] file_data = IOUtils.toByteArray(stream);
                    files.add(new ByteArrayInputStream(file_data));
                }else{
                    String name = item.getFieldName();
                    if(name.equals("modCode")){
                        newModuleCode = Streams.asString(item.openStream());
                    }
                }
            }
            
            //form parameters for SQL command
            Object[] paramater_list = {newModuleCode, files.get(0), files.get(1), files.get(2), files.get(3)};
            
            if(newModuleCode == null){
                session.setAttribute("parameters", paramater_list);
                response.sendRedirect("error pages/feerror.jsp");
            }
            //check if file exists
            else if(file_exists(newModuleCode)){
                //update file and metadata on database
                Object[] new_paramater_list = {files.get(0), files.get(1), files.get(2), files.get(3)};
                (new data_access()).run_statement(
                    "UPDATE pdf(Exam,ExamSolution,Resit,ResitSolution) VALUES(?,?,?,?) WHERE ModuleCode="+newModuleCode,new_paramater_list
                );
                
                //set stage to 1
                (new data_access()).run_statement(
                    "UPDATE exams SET Stage=Stage+1 WHERE ModuleCode="+newModuleCode
                );
                
                response.sendRedirect("viewExams.jsp");
            }else{
                //redirect for non existant exam
                response.sendRedirect("error pages/error.jsp");
            }
        }catch(SQLException e){
            session.setAttribute("state", e.getSQLState());
            session.setAttribute("code", e.getErrorCode());
            session.setAttribute("mess", e.getMessage());
            response.sendRedirect("error pages/dberror.jsp");
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
    public void file_download(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
        //get parameters & validate
        String identifier = request.getParameter("modCode");
        String type = request.getParameter("type");
        if(type == null | identifier == null){
            session.setAttribute("message", "null user type or module identifier");
            throw new IOException("file error");
        }
        try{
            //check if file exists
            if(file_exists(identifier)){
                //get file from database & create input stream
                Object[] parameters = {type,identifier};
                ResultSet rs = (new data_access()).run_statement("SELECT ? FROM pdf WHERE ModuleCode=?",parameters);
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

                    //view pdf
                    int blobLength = (int) file_blob.length();  
                    byte[] file_bytes = file_blob.getBytes(1, blobLength);
                    ServletOutputStream output_stream = response.getOutputStream();
                    response.setContentType("Exams/pdf");
                    response.setHeader("Content-disposition","inline; filename=Exam.pdf" );
                    response.setHeader("Cache-Control","no-cache");
                    response.setHeader("Pragma","no-cache");
                    BufferedOutputStream bos = new BufferedOutputStream(output_stream);
                    bos.write(file_bytes);
                    bos.close();
                }
            }else{
                //error
                session.setAttribute("code", identifier);
                session.setAttribute("mess", "FILE DOES NOT EXIST");
                response.sendRedirect("error pages/dberror.jsp");//replace with invalid file error page
            }
        }catch(SQLException e){
            session.setAttribute("state", e.getSQLState());
            session.setAttribute("code", e.getErrorCode());
            session.setAttribute("mess", e.getMessage());
            response.sendRedirect("error pages/dberror.jsp");
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
        Object[] parameters = {identifier};
        ResultSet rs = (new data_access()).run_statement("SELECT Exam FROM pdf WHERE ModuleCode=?",parameters);
        if(!rs.next()){
            return false;
        }else{
            return true;
        }
    }
}
