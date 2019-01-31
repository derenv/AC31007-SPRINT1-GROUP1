package db;
import java.io.*;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
            
            if(newModuleCode == null){
                session.setAttribute("parameters", paramater_list);
                response.sendRedirect("ferror.jsp");
            }
            //check if file exists
            else if(file_exists(newModuleCode)){
                //update file and metadata on database
                response.sendRedirect("error.jsp");
            }else{
                //add file and metadata to database
                (new data_access()).run_statement(
                    "INSERT INTO pdf(ModuleCode,Exam,ExamSolution,Resit,ResitSolution) VALUES(?,?,?,?,?)",paramater_list
                );
                //set stage to 1
                (new data_access()).run_statement(
                    "UPDATE exams SET Stage=Stage+1 WHERE ModuleCode="+newModuleCode
                );
                
                response.sendRedirect("viewExams.jsp");
            }
        }catch(SQLException e){
            session.setAttribute("state", e.getSQLState());
            session.setAttribute("code", e.getErrorCode());
            session.setAttribute("mess", e.getMessage());
            response.sendRedirect("dberror.jsp");
        } catch (FileUploadException ex) {
            response.sendRedirect("dberror.jsp");
        }catch (NullPointerException eq) {
            response.sendRedirect("dberror.jsp");
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
                response.sendRedirect("ferror.jsp");
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
                response.sendRedirect("error.jsp");
            }
        }catch(SQLException e){
            session.setAttribute("state", e.getSQLState());
            session.setAttribute("code", e.getErrorCode());
            session.setAttribute("mess", e.getMessage());
            response.sendRedirect("dberror.jsp");
        } catch (FileUploadException ex) {
            Logger.getLogger(file_handler.class.getName()).log(Level.SEVERE, null, ex);
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
