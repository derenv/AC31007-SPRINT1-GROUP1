/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ListFileServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get the menu
        String appPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String uploadFilePath = appPath + File.separator + "pdf";
        //String uploadFilePath = ("\\\\silva.computing.dundee.ac.uk\\webapps\\2018-agileteam1");
        //save file name
        Map<String,String> fileNameMap = new HashMap<String,String>();
        //save file names to map collection
        listfile(new File(uploadFilePath),fileNameMap);//File can be either a file or a menu
        //send map to listfile.jsp to show
        request.setAttribute("fileNameMap", fileNameMap);
        request.getRequestDispatcher("/WebApplication1/listfile.jsp").forward(request, response);
    }
    
 
    public void listfile(File file,Map<String,String> map){
        //if file is a menu
        if(!file.isFile()){
            
            File files[] = file.listFiles();
           
            for(File f : files){
             
                listfile(f,map);
            }
        }else{
        
            String realName = file.getName().substring(file.getName().indexOf("_")+1);
         
            map.put(file.getName(), realName);
        }
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}