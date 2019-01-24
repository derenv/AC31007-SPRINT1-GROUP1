
package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class DownLoadServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get filename
        String fileName = request.getParameter("filename"); 
        fileName = new String(fileName.getBytes("iso8859-1"),"UTF-8");
       
        String fileSaveRootPath=("\\\\silva.computing.dundee.ac.uk\\webapps\\2018-agileteam1");
        //find file path through file name
        String path = findFileSavePathByFileName(fileName,fileSaveRootPath);
        //get files to be downloaded
        File file = new File(path + "\\" + fileName);
        //if not exist
        if(!file.exists()){
            request.setAttribute("message", "documents been cancelled！！");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        }
        //execute filename
        String realname = fileName.substring(fileName.indexOf("_")+1);
        //make browser download the file
        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
        
        FileInputStream in = new FileInputStream(path + "\\" + fileName);
        
        OutputStream out = response.getOutputStream();
        //create buffer
        byte buffer[] = new byte[1024];
        int len = 0;
      
        while((len=in.read(buffer))>0){
            out.write(buffer, 0, len);
        }
       
        in.close();
      
        out.close();
    }
    

    
    public String findFileSavePathByFileName(String filename,String saveRootPath){
        int hashcode = filename.hashCode();
      
        String dir = saveRootPath ;
        File file = new File(dir);
        if(!file.exists()){
           
            file.mkdirs();
        }
        return dir;
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}